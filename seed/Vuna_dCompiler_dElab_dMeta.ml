open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = { f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName : string; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity : int }

# 31 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 28 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

# 76 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__7) }, ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun (ctor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) (metas : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength metas) = (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)))))

# 83 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun (name : string) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTrueCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolFalseCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 87 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> (if dtb__9 then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

# 121 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair = (fun (mc0 : int) (mc1 : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (if (dtb__12 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair dtb__16) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans mc0))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 125 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (expected : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (actual : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf ec) actual) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__19) dtb__18)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf ec) expected) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__20) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__20) dtb__18)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__21) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__21))))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun (remaining : int) (stop : int) (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (remaining <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 138 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun (i : int) (stop : int) (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

# 152 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__24))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__25, dtb__26, dtb__27) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__25)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__27)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__28) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__29) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__30) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__31) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__32, dtb__33) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__32)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__33))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__34)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__39)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__44, dtb__45) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__45)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__46, dtb__47) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__48, dtb__49) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__49)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__50, dtb__51, dtb__52) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__50)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__51))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> ((fun tys -> ((Base_dData_dList.v_Base_dData_dList_dappend tys) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__57))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (match dtb__58 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__59; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__60 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAllMaybe dtb__59)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAllMaybe dtb__60))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) dtb__55))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__64)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__65))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__66) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__67) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__68, dtb__69, dtb__70) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__71) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 218 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dtermMetasAllMaybe = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__72)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__73, dtb__74, dtb__75) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__73)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__74)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__75)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__76) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__77) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__78) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__79) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__80, dtb__81) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__80)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__81))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__82)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__86))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__87)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__92, dtb__93) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__93)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__94, dtb__95) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__95)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__96, dtb__97) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__97)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__98, dtb__99, dtb__100) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__100) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__98) else ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__98)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__99)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__105)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__109)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__110))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__111) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__112) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__113, dtb__114, dtb__115) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__116) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dsecondOf d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

# 222 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 225 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (if (mc0 = dtb__119) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__120)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun (name : string) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) globals) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 248 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__124; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__125 } -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__124) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig _uctx0) dtb__123) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (match dtb__126 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__128; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__129 } -> (if (dtb__128 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__132, dtb__133, dtb__134, dtb__135) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__132) dtb__133) dtb__134) dtb__135) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__136, dtb__137, dtb__138) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__136) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__137) dtb__138) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__139, dtb__140, dtb__141, dtb__142) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__139) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__141) dtb__142) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__143, dtb__144, dtb__145, dtb__146) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__169, dtb__170, dtb__171, dtb__172) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun (banned : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (preludeBanned : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (paramKinds : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (seen : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (acc : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (name : string) (ctx : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (ty : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (name))) name) else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) seen) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DuplicateSignature (name))) name) else ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) paramKinds) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) name) true) seen)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = name; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ctx; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCachedKinds (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) paramKinds) ctx) ty) sp); Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp } } }, acc))) rest))))

# 256 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl decls)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil) decls)) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

# 306 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__174) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__173; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 }, mc1)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__174) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__173; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__191 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__174) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__193)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__193)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__193)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, dtb__212) -> true
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__216) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__217) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__218) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__218) >= 0)
  | _ -> true
))

# 337 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__219) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__219) >= 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__223) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__224) else false)
  | _ -> false
))

# 350 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__225; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__227 }, (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__229)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 354 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__230) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__231))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__232) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__232)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__233))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__234)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__236) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__236))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__235)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__237) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__237))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decCtorIndexComplete ec) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__238) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__239) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__239)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

# 410 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf = (fun (name : string) -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 414 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf fam) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name)) then (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__240) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (fam))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name))))

# 427 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (target : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) target) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__241) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__241)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__246) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_over", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__247) -> (match dtb__247 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__248, dtb__249) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__248))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 434 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel 64) ec) v))

# 449 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText = (fun (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dString.v_Base_dData_dString_djoin ", ") ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName) targets)))

# 453 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__250) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252) -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__252)) = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__252))) else (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__251))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (target : string) (fam : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) target) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__253) -> (dtb__253 = fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__254) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (t : string) -> (((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs mc0) t) dtb__254))) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc2 : string) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__255, dtb__256) -> (match dtb__256 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__255))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
))

# 488 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc2 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc3 : string) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__257) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__258))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)) (((v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__257))) mc4))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__260) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__260)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (((v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name))

# 530 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__261) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__261))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__262) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__262))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> ((fun v -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__263; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 }, ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__267) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, mc1)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__263, (Base_dData_dList.v_Base_dData_dList_dlength mc1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 541 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 552 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__268) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__269, dtb__270) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__269; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__270) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__271, dtb__272, dtb__273) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__271) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__275 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__275) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__272, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ""; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 560 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__280)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

# 624 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t))

# 580 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__281) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__281) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__282) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__282))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__283, dtb__284, dtb__285, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__286), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__287)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> ((fun slot2 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__288, dtb__289, slot2, dtb__291, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__292)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__293) -> (match dtb__293 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__294; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamTyOf ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth)) dtb__294)) ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1))) dtb__295))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__290))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__296, dtb__297, dtb__298) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__296), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__297), dtb__298))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__299, dtb__300) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__299, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__300)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__301, dtb__302) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__301, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__302)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__303, dtb__304) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__303), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__304)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__305, dtb__306, dtb__307) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__305), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__306), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__307)))
  | _ -> t
)))
# 613 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (alt0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (if (fuel <= 0) then alt0 else (match alt0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__308; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__309; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__310 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__308; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__309; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (Base_dData_dList.v_Base_dData_dList_dlength dtb__309))) dtb__310) }
  | _ -> failwith "DT: impossible branch"
)))

# 577 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

# 608 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

# 627 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs args))

# 630 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun (alts : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts alts))

# 638 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (match dtb__314 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__316) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__311, true, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "Type"), mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__315) mc1) mc2), mc2))
  | _ -> mc1
)
  | _ -> mc1
))

# 647 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__321)
  | _ -> mc0
))

# 651 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__322, dtb__323) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__322); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__322) }, (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__323)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 661 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dElab_dMeta_dDataHead Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__324, dtb__325) -> (if ((dtb__324).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__324).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__324).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity })) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__325))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 677 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun (cname : string) -> ("Dict_" ^ cname))

# 680 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun (cname : string) -> ("MkDict_" ^ cname))

# 684 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (match dtb__326 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__327) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__326; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__332 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__327) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__333, dtb__334) -> (match dtb__333 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__335, dtb__336, dtb__337, dtb__338) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__334) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__333; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__338 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__334) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 699 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__339, dtb__340) -> dtb__339
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 707 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__341, dtb__342) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__341 }, ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__342) mc1) (mc2 + 1)) mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 704 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun (rigs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dData_dList.t_Base_dData_dList_dList) (nFields : int) -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (Base_dData_dList.v_Base_dData_dList_dlength rigs)))

# 714 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__343, dtb__344) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (("x" ^ (bi_strFromInt mc1)), dtb__343, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__344) (mc1 + 1)) mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun (i : int) -> ("_f" ^ (bi_strFromInt i)))

# 731 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun (remaining : int) (n : int) (acc : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (remaining <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, acc)))))

# 728 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun (n : int) (i : int) (acc : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

# 725 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun (n : int) -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 761 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__345, dtb__346) -> (match (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__345) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__347, dtb__348, dtb__349) -> (if (if (dtb__348 >= 0) then (dtb__348 < mc0) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs mc0) dtb__346) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 752 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead = (fun (n : int) (head : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__350) -> (match dtb__350 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__351; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__352 } -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__352) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs n) dtb__352) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp head))))

# 768 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBlanketInst = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) -> (match mc0 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__356; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__357 } -> ((v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dData_dList.v_Base_dData_dList_dlength dtb__354)) dtb__356)
  | _ -> failwith "DT: impossible branch"
))

# 774 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun (pname : string) (arg : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

# 787 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark = "#linclos"

# 790 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureName = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (depth : int) (name : string) -> (String.concat "" [v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark; (bi_strFromInt (sp).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine); "_"; (bi_strFromInt (sp).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol); "_"; (bi_strFromInt depth); ":"; name]))

# 797 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinClosureName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark) name))

# 803 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__358, dtb__359) -> (if (dtb__358 = 58) then (Base_dData_dList.dtp_pack dtb__359) else (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo dtb__359))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 800 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName = (fun (name : string) -> (if (v_Vuna_dCompiler_dElab_dMeta_disLinClosureName name) then (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo (Base_dData_dList.dtp_unpack name)) else name))

# 808 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun (tyName : string) -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

# 850 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__360) -> (match dtb__360 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__361, dtb__362) -> (match dtb__362 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__361 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 856 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))

# 919 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__363, dtb__364) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__363)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__364))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 868 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (lvl : int) -> ((fun d -> ((fun idx -> (if (lvl < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (idx < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__365) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__365))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

# 945 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigOfQty = (fun (implicit : bool) (isTypeDom : bool) (qty : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (if implicit then true else isTypeDom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__366) -> (match dtb__366 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

# 968 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)) then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName name)) else false))

# 984 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disUniverseValue = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__367) -> true
  | _ -> false
))

# 975 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_disUniverseValue dtb__371)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__372) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__368, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | _ -> false
)))

# 972 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel 64) v))

# 1001 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPiFuel = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> (if dtb__374 then true else ((v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPiFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__377) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__373, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | _ -> false
)))

# 998 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPi = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPiFuel 64) v))

# 1043 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeishValue = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__378, dtb__379) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__380) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__386) -> true
  | _ -> false
))

# 1050 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemLevel = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__387, dtb__388) -> (if (dtb__387 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel mc0) dtb__388))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1010 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int Base_dData_dList.t_Base_dData_dList_dList) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__389) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__390, dtb__391) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__392) -> (match dtb__392 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__393, dtb__394, dtb__395) -> (if (dtb__394 < depth) then (outerNVar dtb__394) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel dtb__394) famLevels) then true else false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__396, dtb__397) -> (if (headOpaque dtb__396) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__397))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> ((fun fam2 -> (if ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__401) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__402) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__398, depth, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) (if (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__401) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (depth, famLevels)) else famLevels))
  | _ -> true
)))
# 1032 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then true else (match sp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__403, dtb__404) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disTypeishValue dtb__403) then ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__403) else false) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__404))
  | _ -> failwith "DT: impossible branch"
)))

# 992 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped = (fun (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int Base_dData_dList.t_Base_dData_dList_dList) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

# 1055 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (lvl : int) -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__405) -> (match dtb__405 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__406; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__407 } -> (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__407))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - 1) - lvl)))

# 1068 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 1071 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx ctx)) (v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly ec) v)))

# 1080 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcastErased = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEraseName)), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1120 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar = (fun (depth : int) (idxs : int Base_dData_dList.t_Base_dData_dList_dList) (name : string) (i : int) -> (if (i < depth) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel (i - depth)) idxs) then (v_Vuna_dCompiler_dElab_dMeta_dcastErased (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))))

# 1089 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel = (fun (fuel : int) (depth : int) (idxs : int Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__408, dtb__409, dtb__410) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar depth) idxs) dtb__408) dtb__409)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__411) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__411))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__412) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__412))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__413) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__413))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__414) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__414))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__415) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__415))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__416) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__416))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__417) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__417))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__418, dtb__419, dtb__420, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__421), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__422)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> ((fun slot2 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__423, dtb__424, slot2, dtb__426, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__427)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__428) -> (match dtb__428 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__429; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__430 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamTyOf ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs)) dtb__429)) ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs)) dtb__430))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__425))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__431, dtb__432, dtb__433) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__431), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__432), dtb__433))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__434, dtb__435) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__434, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__435)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__436, dtb__437) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__436, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__437)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__438, dtb__439) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__438, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__439)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__440), dtb__441, dtb__442, dtb__443, dtb__444))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__445), dtb__446, dtb__447, dtb__448, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + (Base_dData_dList.v_Base_dData_dList_dlength dtb__447))) idxs) dtb__449)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__450, dtb__451) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__450), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__451)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__452, dtb__453, dtb__454) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__452), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__453), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__454)))
  | _ -> failwith "DT: impossible branch"
)))
# 1129 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel = (fun (mc0 : int) (mc1 : int) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__455; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__456; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__457 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__455; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__456; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__456))) mc2) dtb__457) }
  | _ -> failwith "DT: impossible branch"
))

# 1086 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses = (fun (idxs : int Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel 512) 0) idxs) t))

# 1154 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddataLinearName = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (g : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__458) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__458)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1160 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorLinearName = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (c : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__459) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__459))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1137 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__460) -> (match dtb__460 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__461, dtb__462) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) dtb__461)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__463, dtb__464, dtb__465) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__466, dtb__467) -> ((v_Vuna_dCompiler_dElab_dMeta_dctorLinearName ec) dtb__466)
  | _ -> false
)))

# 1134 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinearType = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decHasLinear ec) then (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel 64) ec) v) else false))

# 1150 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyLinearVals = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__468, dtb__469) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel mc0) mc1) dtb__468) then true else (((v_Vuna_dCompiler_dElab_dMeta_danyLinearVals mc0) mc1) dtb__469))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1167 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (name : string) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (rig))))

# 1177 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigCaseField = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else rig))

# 1181 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))

# 1188 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__470, dtb__471) -> (match dtb__470 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__472; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__473 } -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc3) dtb__473)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) mc1) dtb__471) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1185 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__474; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__475; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__476; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__477 } -> ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__474; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__475; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__476; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__477 }) dtb__474) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_douterScan = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__478, dtb__479, dtb__480) -> (if (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__478) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__479)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__480))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__481, dtb__482) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__481) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__482))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__483) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__485))) dtb__487))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__488, dtb__489) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__489)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__490, dtb__491, dtb__492, dtb__493, dtb__494) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__490)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__495, dtb__496) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__496)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__497, dtb__498) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__498)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__499, dtb__500, dtb__501) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__499) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__500))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + 1)) dtb__506)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__512, dtb__513, dtb__514) -> (if (dtb__513 > mc2) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__515) -> (match dtb__515 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__516; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__517 } -> ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) (dtb__513 - mc2)) dtb__517))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (dtb__513 - mc2)) (mc1).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)) else false)
  | _ -> false
))
# 1220 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_douterScanArgs = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__518, dtb__519) -> (match dtb__518 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__520; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__521 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__520) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__519))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1225 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_douterScanAlts = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__522, dtb__523) -> (match dtb__522 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__524; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__525; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__526 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__525))) dtb__526) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__523))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1195 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan ec) ctx) 0) t))

# 1233 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__527) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__531) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__532) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__528, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else false)
  | _ -> false
)))

# 1230 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

# 938 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

# 941 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun (implicit : bool) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

# 1243 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__533) -> (match dtb__533 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__534, dtb__535) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__534) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__536) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 814 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 861 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (lvl : int) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__537) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__537)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 900 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun (fuel : int) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__538) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__543) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("ty", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__544) -> (match dtb__544 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__545, dtb__546, dtb__547) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__546) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__548) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__548)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__549, dtb__550) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__551, dtb__552) -> true
  | _ -> false
)))

# 887 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun (fuel : int) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__553) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__554, dtb__555, dtb__556, dtb__557, dtb__558) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__557) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__558) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("kind", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else false)
  | _ -> false
)))

# 884 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

# 829 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__559, dtb__560, dtb__561, dtb__562, dtb__563) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__564) -> (match dtb__564 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__565, dtb__566) -> (match dtb__566 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__565 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> (match dtb__564 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__567, dtb__568, dtb__569) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__568)
  | _ -> false
)
)
  | _ -> (match dtb__564 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__570, dtb__571, dtb__572) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__571)
  | _ -> false
)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__573, dtb__574) -> true
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 48 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun (fuel : int) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__575, dtb__576, dtb__577, dtb__578, dtb__579) -> (if dtb__576 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__578) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__580; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__581 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__581) ctx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__579) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__580)))) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__582; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__583 } -> (match dtb__583 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__584; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__585 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__582; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__580, dtb__584)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__585 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 45 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

# 1253 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun (name : string) (level : int) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 1264 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__586, dtb__587) -> dtb__586
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__588, dtb__589, dtb__590) -> dtb__588
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun (name : string) -> (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical name))

# 1260 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__591) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__591))
  | _ -> false
))

# 1273 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__592) -> true
  | _ -> false
))

# 477 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc3 : string) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__593) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal mc0) dtb__593) then (match (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc3) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__594) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__594))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__593)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__593)) mc3) mc4))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1338 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (ctor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) (g : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__595) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__595) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (g, args)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__596, dtb__597) -> (match dtb__596 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__598; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__599 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__598); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__599 }, ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__597)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1370 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun (mc0 : string) (mc1 : int) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__600, dtb__601) -> (match dtb__600 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__602; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__603 } -> ((fun binder -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binder, dtb__603, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__601) ((Base_dData_dList.v_Base_dData_dList_dappend mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (binder, (Base_dData_dList.v_Base_dData_dList_dlength dtb__601), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__603 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1383 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun (n : int) xs -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__604, dtb__605) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__605)
  | _ -> failwith "DT: impossible branch"
)))

# 1353 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun (ctor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (Base_dData_dList.v_Base_dData_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (Base_dData_dList.v_Base_dData_dList_dlength args)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

# 1286 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (name : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__606) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__606)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__606)) else (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__606)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__606) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (name : string) (tyTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__607) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__607)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__607)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__608) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__608))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__609) -> (match dtb__609 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__610; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__611 } -> (match dtb__611 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__612; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__613 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__607) dtb__612); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__610; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__613 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc ec) name); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ctorTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc ec) name); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1295 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__614) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__614)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__614)) else (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__614)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__614) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 1392 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__615, dtb__616) -> (match dtb__615 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__617; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__618 } -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__617, dtb__618))) dtb__616)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1309 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__619) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__619) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__620) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__620)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__619) else (if ((Base_dData_dList.v_Base_dData_dList_dlength mc2) >= (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__620))) then ((((v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas mc0)) dtb__620) dtb__619) mc2) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__620) mc2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__619))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

# 1322 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__621) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__621) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__622) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__622)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__621) else (if ((Base_dData_dList.v_Base_dData_dList_dlength mc2) >= (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__622))) then ((((v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm mc0) dtb__622) dtb__621) mc2) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__622) mc2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__621))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

# 1408 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disSortExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__623, dtb__624, dtb__625) -> (match dtb__623 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__626, dtb__627) -> (match dtb__626 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__628) -> (if (dtb__628 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__629, dtb__630) -> (match dtb__629 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__631) -> (if (dtb__631 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1403 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637) -> (if (dtb__632 <> "_") then (v_Vuna_dCompiler_dElab_dMeta_disSortExpr dtb__635) else false)
  | _ -> false
))

# 1414 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun (name : string) -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 740 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__638, dtb__639) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__638)) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__638)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__639))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1421 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__640, dtb__641, dtb__642, dtb__643, dtb__644) -> (if dtb__641 then (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity dtb__644) else (1 + (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity dtb__644)))
  | _ -> 0
))

# 1449 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropPis = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__645, dtb__646, dtb__647, dtb__648, dtb__649) -> (v_Vuna_dCompiler_dElab_dMeta_ddropPis dtb__649)
  | _ -> mc0
))

# 1453 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__650, dtb__651) -> (match dtb__650 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__652, dtb__653, dtb__654) -> (v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg dtb__651)
  | _ -> true
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1444 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorResultIndexed = (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dMeta_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__655; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__656 } -> (v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg dtb__656)
  | _ -> failwith "DT: impossible branch"
))

# 1440 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__657, dtb__658) -> (if (v_Vuna_dCompiler_dElab_dMeta_dctorResultIndexed dtb__657) then true else (v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed dtb__658))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1437 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfamilyIndexed = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 1428 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_dfamilyIndexed d)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

# 1461 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__659, dtb__660) -> (match dtb__659 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__661; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__662 } -> (match dtb__661 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__663, dtb__664, dtb__665) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__660)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__662))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
