open Vuna_runtime
# 58 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__0) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__5)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 80 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__9, dtb__10) -> (if (dtb__9 = "->") then (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__13))
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

# 86 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__25))
  | _ -> 0
))

# 90 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__26, dtb__27, dtb__28) -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__29, dtb__30) -> (if (dtb__29 = "->") then (match dtb__27 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Nil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__31) dtb__33)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__35) dtb__38) dtb__39)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
))
# 97 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals ctx ec pos arity famLevel cname csp name dom cod -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } -> ((fun ctx2 -> (if (pos < arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__43) famLevel) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__43) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), msg))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) msg)) (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__43)); ", above the family level Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))]))) (pos - arity))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__41) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 69 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals ctx ec arity famLevel cname csp tyPis tyExpr -> ((fun surfacePis -> (if (surfacePis <> tyPis) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))

# 23 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals fam arity famLevel ec c -> (match c with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__45; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__46; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__47; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__48 } -> ((fun famKind -> ((fun tyExpr2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType ((Base_dList.v_Base_dList_dappend globals) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__49; Base_dPair.f_Base_dPair_dPair_second = dtb__50 } -> (match dtb__50 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__51; Base_dPair.f_Base_dPair_dPair_second = dtb__52 } -> ((fun tyTerm -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__53; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } -> (if (dtb__53 <> fam) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorDoesNotReturn ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else (if ((Base_dList.v_Base_dList_dlength dtb__54) <> arity) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorWrongIndices ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts ((Base_dList.v_Base_dList_dappend globals) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__52)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__52) arity) famLevel) dtb__45) dtb__48) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__45; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = fam; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = tyTerm; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48)) }; Base_dPair.f_Base_dPair_dPair_second = dtb__52 }))))))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__52) 0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__46) then dtb__46 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__46) dtb__48)))) (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> dtb__55
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__56)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = dtb__59 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__59) dtb__57)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__60)); Base_dPair.f_Base_dPair_dPair_second = dtb__61 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals ec ds -> (match ds with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> (match dtb__62 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (if ((Base_dList.v_Base_dList_dmemName dtb__64) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__72) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__64))) dtb__64) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__66)) (fun pk -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__73; Base_dPair.f_Base_dPair_dPair_second = dtb__74 } -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 } -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__72) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__64; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__64; Base_dPair.f_Base_dPair_dPair_second = fullKind }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = dtb__76 } })))) (Base_dList.v_Base_dList_dlength tele))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__65) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__76) 0) dtb__73)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if ((Base_dList.v_Base_dList_dmemName dtb__77) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__84) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__77))) dtb__77) else ((fun fullKind -> ((fun arity -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__84) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__77; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__77; Base_dPair.f_Base_dPair_dPair_second = fullKind }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = ec } })))) (Base_dList.v_Base_dList_dlength dtb__78))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__78) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__63) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__87) -> (match dtb__87 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = dtb__89 } -> (match dtb__89 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__86) ((Base_dList.v_Base_dList_dappend mc1) dtb__90)) dtb__91) (Base_dList.C_Base_dList_dList_Cons (dtb__88, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__92) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__86) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons (dtb__85, mc4)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc1) mc2) dtb__85))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc3; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc0) mc1) dtb__93) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__95) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__95))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__96) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel pending globals ec heads -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "data head registration fuel exhausted") else (match pending with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse heads); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = globals; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = dtb__98 } -> (match dtb__98 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> (match dtb__100 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__97); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__101 } }))
  | _ -> (if ((Base_dList.v_Base_dList_dlength dtb__102) = (Base_dList.v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__102) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel (fuel - 1)) dtb__102) dtb__99) dtb__101) dtb__97))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) Base_dList.C_Base_dList_dList_Nil))
)))

# 150 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending globals ec heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads))

# 181 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dskipParamPis = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (if (mc0 <= 0) then mc1 else ((v_Vuna_dCompiler_dElab_dData_dskipParamPis (mc0 - 1)) dtb__107))
  | _ -> mc1
))

# 185 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = (dtb__108).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = mc1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (0 - mc1)) dtb__113) }, (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo dtb__109) (mc1 + 1)) dtb__114)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord = (fun records dname arity ctors -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dname) records) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo (dtb__115).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields) 0) ((v_Vuna_dCompiler_dElab_dData_dskipParamPis arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__116)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) ctors)
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (if ((Base_dList.v_Base_dList_dmemName dtb__118) mc1) then ((v_Vuna_dCompiler_dElab_dData_dallIn dtb__119) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected actual -> (if ((Base_dList.v_Base_dList_dlength expected) = (Base_dList.v_Base_dList_dlength actual)) then ((v_Vuna_dCompiler_dElab_dData_dallIn expected) actual) else false))

# 193 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls heads globals ec acc records -> (match decls with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = globals; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__120 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__122; Base_dPair.f_Base_dPair_dPair_second = dtb__123 } -> (match dtb__122 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> (match dtb__133 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__134; Base_dPair.f_Base_dPair_dPair_second = dtb__135 } -> ((fun tele -> ((fun famLevel -> (if dtb__129 then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__132) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__124) dtb__135) famLevel) ec) dtb__127)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> ((fun viaClasses -> ((fun fields -> ((fun dd -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__124) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__138) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__136)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__136))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__137) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc))) records) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__132) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__124))) dtb__124))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__136))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__137) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__124; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__136; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__134; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__131; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__130; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fields; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__124) (Base_dList.v_Base_dList_dlength tele)) dtb__136))) (if dtb__129 then dtb__128 else Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__134) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139) -> dtb__139
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__132) ("DT: internal: missing data head for " ^ dtb__124))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__124) heads))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__148) -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> ((fun tele -> ((fun famLevel -> ((fun ctorExpr -> ((fun ctorAst -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__140) dtb__150) famLevel) ec) (Base_dList.C_Base_dList_dList_Cons (ctorAst, Base_dList.C_Base_dList_dList_Nil)))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__151; Base_dPair.f_Base_dPair_dPair_second = dtb__152 } -> ((fun viaClasses -> ((fun fieldsMeta -> ((fun dd -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__140) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__153) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__151)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__151))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__152) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc))) records) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__147) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__140))) dtb__140))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__151))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__152) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__140; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__151; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__149; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__146; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__145; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fieldsMeta; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = true })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__140) (Base_dList.v_Base_dList_dlength tele)) dtb__151))) (if dtb__144 then dtb__143 else Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__140; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ctorExpr; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = (Base_dList.v_Base_dList_dlength dtb__142); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__147 })) ((((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordCtorType dtb__141) dtb__142) (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__140) dtb__141) dtb__147)) dtb__147))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__149) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> dtb__154
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__149))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__147) ("DT: internal: missing data head for " ^ dtb__140))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__140) heads))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dreprIsAlias = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> true
  | _ -> false
))

# 297 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaShapeOk = (fun dname datas -> (if ((Base_dList.v_Base_dList_dmemName dname) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (match dtb__155 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__156; Base_dPair.f_Base_dPair_dPair_second = dtb__157 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dname) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> (dtb__157 = (Base_dList.v_Base_dList_dlength (dtb__158).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo dname) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas))) else false))

# 284 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaFieldOk = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ((v_Vuna_dCompiler_dElab_dData_dviaShapeOk mc1) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> ((v_Vuna_dCompiler_dElab_dData_dviaShapeOk mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (match dtb__159 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> (match dtb__161 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (if dtb__168 then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__171) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__169) then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName dtb__163) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet mc1))) else false) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__171) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__160) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__177) then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName dtb__172) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet mc1))) else false) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__179) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else (if dtb__176 then (if (((v_Vuna_dCompiler_dElab_dData_dviaFieldOk dtb__177) dtb__172) mc1) then ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__160) mc1) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__179) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DerivingViaUnboxedRequired)) else ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__160) mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__160) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls records globals ec -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) Base_dList.C_Base_dList_dList_Nil)) (fun p -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__180; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } -> (match dtb__181 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__180) dtb__182) dtb__183) Base_dList.C_Base_dList_dList_Nil) records)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls decls) dtb__184)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 346 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo (mc0 - 1)) dtb__190) mc2) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__190) (Base_dList.C_Base_dList_dList_Cons (dtb__189, mc2))))
  | _ -> (Base_dList.v_Base_dList_dreverse mc2)
))

# 343 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) Base_dList.C_Base_dList_dList_Nil))

# 358 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__191, dtb__192, dtb__193) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__191) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__192)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__193))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__194) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__195) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__196) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__197) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__198, dtb__199) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__198) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__199))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__200) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__202))) dtb__204))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__205)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__210, dtb__211) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__211)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__212, dtb__213) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__213)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__214, dtb__215) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__215)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__216, dtb__217, dtb__218) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__216) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__217))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__219, dtb__220, dtb__221) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__221)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__225) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__226))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__227) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__228) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__229) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__230, dtb__231, dtb__232) -> (dtb__231 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 381 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> (match dtb__233 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__235) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__234))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 385 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__237)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__237)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__238))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__239) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__240))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i arity k ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo (k + arity)) ts))

# 339 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i arity c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))

# 335 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__241) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__242))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (Base_dList.v_Base_dList_dlength (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

# 327 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__244) (mc2 + 1)) (Base_dList.C_Base_dList_dList_Cons ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0) Base_dList.C_Base_dList_dList_Nil))

# 398 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 } -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (if dtb__249 then (Base_dList.C_Base_dList_dList_Cons (dtb__247, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__246) dtb__250))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__246) dtb__250))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)) })

# 391 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__251), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__252)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
