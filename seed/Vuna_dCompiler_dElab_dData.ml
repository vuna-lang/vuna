open Vuna_runtime
# 65 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__0) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__5)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 87 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__9, dtb__10) -> (if (dtb__9 = "->") then (match dtb__7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__13))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__19))
  | _ -> 0
))

# 93 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__25))
  | _ -> 0
))

# 97 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__26, dtb__27, dtb__28) -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__29, dtb__30) -> (if (dtb__29 = "->") then (match dtb__27 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (match dtb__34 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__31) dtb__33)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__35) dtb__38) dtb__39)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
))
# 104 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals ctx ec pos arity famLevel cname csp name dom cod -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__41; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__42 } -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__43; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__44 } -> ((fun ctx2 -> (if (pos < arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__43) famLevel) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__43) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), msg))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) msg)) (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__43)); ", above the family level Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))]))) (pos - arity))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__41) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 76 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals ctx ec arity famLevel cname csp tyPis tyExpr -> ((fun surfacePis -> (if (surfacePis <> tyPis) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))

# 25 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals fam arity famLevel ec c -> (match c with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__45; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__46; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__47; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__48 } -> ((fun famKind -> ((fun tyExpr2 -> ((fun gl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType gl) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__49; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 } -> (match dtb__50 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__51; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 } -> ((fun tyTerm -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> (if (dtb__53 <> fam) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorDoesNotReturn ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__54) <> arity) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorWrongIndices ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts gl) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__52) arity) famLevel) dtb__45) dtb__48) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__45; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = fam; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = tyTerm; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__48)) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 }))))))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__52) 0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) ((Base_dData_dList.v_Base_dData_dList_dappend globals) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__46) then dtb__46 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__46) dtb__48)))) (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> dtb__55
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__56)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__58; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__59 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__59) dtb__57)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__60; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__61 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__60)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__61 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals ec ds -> (match ds with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__62; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 } -> (match dtb__62 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__64) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__72) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__64))) dtb__64) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__66)) (fun pk -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__73; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 } -> (match dtb__74 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__75; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__76 } -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__72) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__64; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__64; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fullKind }, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__76 } })))) (Base_dData_dList.v_Base_dData_dList_dlength tele))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__65) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__76) 0) dtb__73)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__77) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__84) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__77))) dtb__77) else ((fun fullKind -> ((fun arity -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__84) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__77; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fullKind }, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__78))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__78) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__63) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__87) -> (match dtb__87 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__88; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 } -> (match dtb__89 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__90; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__91 } -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__86) ((Base_dData_dList.v_Base_dData_dList_dappend mc1) dtb__90)) dtb__91) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__86) mc1) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, mc4)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc1) mc2) dtb__85))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc0) mc1) dtb__93) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__95) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__95))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__96) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel pending globals ec heads -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "data head registration fuel exhausted") else (match pending with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse heads); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = globals; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__98 } -> (match dtb__98 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> (match dtb__100 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse dtb__97); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__101 } }))
  | _ -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__102) = (Base_dData_dList.v_Base_dData_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__102) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel (fuel - 1)) dtb__102) dtb__99) dtb__101) dtb__97))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) Base_dData_dList.C_Base_dData_dList_dList_Nil))
)))

# 158 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending globals ec heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads))

# 189 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dskipParamPis = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (if (mc0 <= 0) then mc1 else ((v_Vuna_dCompiler_dElab_dData_dskipParamPis (mc0 - 1)) dtb__107))
  | _ -> mc1
))

# 193 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = (dtb__108).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = mc1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (0 - mc1)) dtb__113) }, (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo dtb__109) (mc1 + 1)) dtb__114)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord = (fun records dname arity ctors -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dname) records) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo (dtb__115).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields) 0) ((v_Vuna_dCompiler_dElab_dData_dskipParamPis arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__116)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) ctors)
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected actual -> ((fun norm -> (if ((Base_dData_dList.v_Base_dData_dList_dlength expected) = (Base_dData_dList.v_Base_dData_dList_dlength actual)) then ((Base_dData_dList.v_Base_dData_dList_dallMem (norm expected)) (norm actual)) else false)) (Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey)))

# 201 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls heads globals ec acc records -> (match decls with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = globals; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__121 } -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__131) -> (match dtb__131 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__132; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 } -> ((fun tele -> ((fun famLevel -> (if dtb__127 then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__130) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__122) dtb__133) famLevel) ec) dtb__125)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__134; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 } -> ((fun viaClasses -> ((fun fields -> ((fun dd -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalCtorsFor dtb__122) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__136) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__136) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__134)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__119) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__134))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__135) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__130) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__122))) dtb__122))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__119) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__134))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__135) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__122; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__134; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__132; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__129; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__128; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fields; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__122) (Base_dData_dList.v_Base_dData_dList_dlength tele)) dtb__134))) (if dtb__127 then dtb__126 else Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__132) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__137) -> dtb__137
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__130) ("DT: internal: missing data head for " ^ dtb__122))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__122) heads))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> ((fun tele -> ((fun famLevel -> ((fun ctorExpr -> ((fun ctorAst -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__138) dtb__148) famLevel) ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (ctorAst, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__149; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 } -> ((fun viaClasses -> ((fun fieldsMeta -> ((fun dd -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalCtorsFor dtb__138) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__151) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__151) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__149)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__119) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__149))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__150) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__145) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__138))) dtb__138))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__119) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__149))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__150) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__138; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__149; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__147; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__144; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__143; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fieldsMeta; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = true })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__138) (Base_dData_dList.v_Base_dData_dList_dlength tele)) dtb__149))) (if dtb__142 then dtb__141 else Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__138; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ctorExpr; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = (Base_dData_dList.v_Base_dData_dList_dlength dtb__140); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__145 })) ((((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordCtorType dtb__139) dtb__140) (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__138) dtb__139) dtb__145)) dtb__145))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__147) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__152) -> dtb__152
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__147))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__145) ("DT: internal: missing data head for " ^ dtb__138))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__138) heads))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__119) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dreprIsAlias = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> true
  | _ -> false
))

# 316 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith = (fun dname datas fams info -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dname) fams) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> (match dtb__153 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dname) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156) -> (dtb__155 = (Base_dData_dList.v_Base_dData_dList_dlength (dtb__156).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo dname) info)) else false))

# 300 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaFieldOk = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith mc1) mc2) mc3) mc4)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__159; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__160 } -> (match dtb__159 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (if dtb__166 then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__169) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__167) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__161) mc2)) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__169) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__158) mc1) mc2) mc3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__175) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__170) mc2)) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__177) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else (if dtb__174 then (if (((((v_Vuna_dCompiler_dElab_dData_dviaFieldOk dtb__175) dtb__170) mc1) mc2) mc3) then ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__158) mc1) mc2) mc3) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__177) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaUnboxedRequired)) else ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__158) mc1) mc2) mc3)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__158) mc1) mc2) mc3)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls = (fun decls datas -> ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo decls) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

# 313 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaShapeOk = (fun dname datas -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith dname) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

# 326 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls records globals ec -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun p -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__178; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__179 } -> (match dtb__179 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__180; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__181 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__178) dtb__180) dtb__181) Base_dData_dList.C_Base_dData_dList_dList_Nil) records)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls decls) dtb__182)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 365 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo (mc0 - 1)) dtb__188) mc2) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__188) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, mc2))))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
))

# 362 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 377 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__189, dtb__190, dtb__191) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__189) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__190)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__191))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__192) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__193) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__194) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__195) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__196, dtb__197) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__196) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__197))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__198) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__200))) dtb__202))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__203)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__209)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__210, dtb__211) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__211)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__212, dtb__213) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__213)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__214, dtb__215, dtb__216) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__214) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__215))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__217, dtb__218, dtb__219, dtb__220) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__220)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__224) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__225))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__226) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__227) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__228) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__229, dtb__230, dtb__231) -> (dtb__230 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 400 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__234; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__235 } -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__234) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__233))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 404 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__236)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__236)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__237))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__238, dtb__239) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__238) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__239))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i arity k ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo (k + arity)) ts))

# 358 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i arity c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))

# 354 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__240) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__241))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (Base_dData_dList.v_Base_dData_dList_dlength (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

# 346 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__242, dtb__243) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__243) (mc2 + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 417 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__244, dtb__245) -> (match dtb__244 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__246; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__247 } -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> (if dtb__248 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__245) dtb__249))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__245) dtb__249))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)) })

# 410 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__250), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__251)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
