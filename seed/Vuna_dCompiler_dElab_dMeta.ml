open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = { f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName : string; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity : int }

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel ec v -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__5; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__7) }, ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor metas -> (if ((Base_dList.v_Base_dList_dlength metas) = (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)))))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true)) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9) -> (if dtb__9 then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (if (dtb__12 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair dtb__16) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans mc0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec depth expected actual -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf ec) actual) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__19) dtb__18)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf ec) expected) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__20) dtb__18)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__21) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__21))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining stop sols -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i stop sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (if (dtb__23 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__24))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__25, dtb__26, dtb__27) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__25)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__27)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__28) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__29) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__30) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__31) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__32, dtb__33) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__32)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__33))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__34)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__39)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__44, dtb__45) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__45)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__46, dtb__47) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__48, dtb__49) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__49)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__50, dtb__51, dtb__52) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__50)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__51))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__53, dtb__54, dtb__55) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__55)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__59)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__60))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__61) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__62) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__63, dtb__64, dtb__65) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__66) -> (Base_dList.C_Base_dList_dList_Cons (dtb__66, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__67, dtb__68, dtb__69) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__67)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__68)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__69)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__70) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__71) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__72) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__73) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__74, dtb__75) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__74)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__75))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__76)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__80))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__81)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__86, dtb__87) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf p)) then Base_dList.C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dfirstOf p))))) dtb__87)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__88, dtb__89) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf p)) then Base_dList.C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dfirstOf p))))) dtb__89)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__90, dtb__91) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf p)) then Base_dList.C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dfirstOf p))))) dtb__91)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__92, dtb__93, dtb__94) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__94) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__92) else ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__92)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__93)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__95, dtb__96, dtb__97) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__97)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__101)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__102))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__103) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__104) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__105, dtb__106, dtb__107) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__108) -> (Base_dList.C_Base_dList_dList_Cons (dtb__108, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dsecondOf d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__109 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__111; Base_dPair.f_Base_dPair_dPair_second = dtb__112 } -> (if (mc0 = dtb__111) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__110))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name globals ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf = (fun globals -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) globals) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__116; Base_dPair.f_Base_dPair_dPair_second = dtb__117 } -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__116) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig _uctx0) dtb__115) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (match dtb__118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__120; Base_dPair.f_Base_dPair_dPair_second = dtb__121 } -> (if (dtb__120 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__119))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__124, dtb__125, dtb__126, dtb__127) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__124) dtb__125) dtb__126) dtb__127) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__128, dtb__129, dtb__130) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__128) Base_dList.C_Base_dList_dList_Nil) dtb__129) dtb__130) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__131, dtb__132, dtb__133, dtb__134) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__131) Base_dList.C_Base_dList_dList_Nil) dtb__133) dtb__134) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__135, dtb__136, dtb__137, dtb__138) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__156, dtb__157, dtb__158, dtb__159) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__123)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__160, dtb__161, dtb__162, dtb__163) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned preludeBanned seen acc name ctx ty sp rest -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (name))) name) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) seen) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DuplicateSignature (name))) name) else (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) name) true) seen)) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ctx; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ((((((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) ctx) ty) sp); Base_dPair.f_Base_dPair_dPair_second = sp } } }, acc))) rest))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) decls)) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__164 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__165) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__174 }, mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__165) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__182 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__165) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match dtb__183 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> (Base_dList.C_Base_dList_dList_Cons (dtb__185, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__184)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> (Base_dList.C_Base_dList_dList_Cons (dtb__194, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__184)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__184)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__202, dtb__203) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__207) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__208) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__209) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__209) >= 0)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__210) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__210) >= 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__214) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__215) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__216; Base_dPair.f_Base_dPair_dPair_second = dtb__218 }, (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__220)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__221) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__222))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__223) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__224))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__225)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__226)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals ec name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__230)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

let v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor = (fun ec name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__231; Base_dPair.f_Base_dPair_dPair_second = dtb__232 } -> ((fun fam -> (if (fam = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf fam) = dtb__232) then (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__233) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (fam))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__231))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf = (fun ec target -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) target) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__234)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel = (fun fuel ec v -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__239) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_over", 0, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__240) -> (match dtb__240 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__241, dtb__242) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel 64) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText = (fun targets -> ((Base_dString.v_Base_dString_djoin ", ") ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName) targets)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__243) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245) -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__245)) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__245))) else (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__244))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__244)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs = (fun ec target fam -> (match ((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) target) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> (dtb__246 = fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__247) -> ((Base_dList.v_Base_dList_dfilter (fun t -> (((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs mc0) t) dtb__247))) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (match dtb__249 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__248))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
)
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
))

let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__250) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__251))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)) (((v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily mc0) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__250))) mc4))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__253) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__253)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals ec name -> (((v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__254) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__254))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__255) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__255))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> ((fun v -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__256; Base_dPair.f_Base_dPair_dPair_second = dtb__258 }, ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__260) (Base_dList.C_Base_dList_dList_Cons (v, mc1)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__256, (Base_dList.v_Base_dList_dlength mc1), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__261) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__262, dtb__263) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__262; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__263) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__264, dtb__265, dtb__266) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__264) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__268) (Base_dList.C_Base_dList_dList_Cons (dtb__265, Base_dList.C_Base_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__273)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__274, dtb__275, dtb__276) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__274) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__275)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__276))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__277, dtb__278) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__277) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__278))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__279, dtb__280) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__280)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__281, dtb__282) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__282)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__283, dtb__284, dtb__285) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__283) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__284))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__286, dtb__287, dtb__288) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__288)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__292) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__293))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__294, dtb__295, dtb__296) -> (dtb__295 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__297, dtb__298) -> (match dtb__297 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__299; Base_dPair.f_Base_dPair_dPair_second = dtb__300 } -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__299) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__298))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__301, dtb__302) -> (match dtb__301 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__303; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__304; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__305 } -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__305) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__302))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel ec depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__306) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__306) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__307) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__307))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__308, dtb__309, dtb__310, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__311), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__312)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__313, dtb__314, dtb__315) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__313, dtb__314, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__315)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__316, dtb__317, dtb__318) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__316), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__317), dtb__318))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__319, dtb__320) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__319, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__320)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__321, dtb__322) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__321, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__322)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__323, dtb__324) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__323), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__324)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__325, dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__325), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__326), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__327)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel ec depth alt0 -> (if (fuel <= 0) then { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ""; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (0)) } else (match alt0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__328; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__329; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__330 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__328; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__329; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (Base_dList.v_Base_dList_dlength dtb__329))) dtb__330) }
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec depth t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec depth alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> (match dtb__334 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__336) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__331, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__335) mc1) mc2), mc2))
  | _ -> mc1
)
  | _ -> mc1
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__341)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__342); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__342) }, (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__343)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__344, dtb__345) -> (if ((dtb__344).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__344).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind; Base_dPair.f_Base_dPair_dPair_second = (dtb__344).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity })) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__345))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ("Dict_" ^ cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ("MkDict_" ^ cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (match dtb__346 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__348, dtb__349, dtb__350, dtb__351) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__347) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__346; Base_dPair.f_Base_dPair_dPair_second = dtb__351 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__347) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__352, dtb__353) -> (match dtb__352 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__354, dtb__355, dtb__356, dtb__357) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__353) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__352; Base_dPair.f_Base_dPair_dPair_second = dtb__357 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__353) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__358, dtb__359) -> dtb__358
  | Base_dList.C_Base_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__360, dtb__361) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = dtb__360 }, ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__361) mc1) (mc2 + 1)) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__362, dtb__363) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (("x" ^ (bi_strFromInt mc1)), dtb__362, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__363) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ("_f" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, acc)))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n i acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__364, dtb__365) -> (match (Base_dPair.v_Base_dPair_dfirstOf dtb__364) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__366, dtb__367, dtb__368) -> (if (if (dtb__367 >= 0) then (dtb__367 < mc0) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs mc0) dtb__365) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead = (fun n head -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__369) -> (match dtb__369 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__370; Base_dPair.f_Base_dPair_dPair_second = dtb__371 } -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__371) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs n) dtb__371) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp head))))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInst = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__372; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__373; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__374; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__375; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__376 } -> ((v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength dtb__373)) dtb__375)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname arg ty -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark = "#linclos"

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureName = (fun sp depth name -> (String.concat "" [v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark; (bi_strFromInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine); "_"; (bi_strFromInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol); "_"; (bi_strFromInt depth); ":"; name]))

let v_Vuna_dCompiler_dElab_dMeta_disLinClosureName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark) name))

let rec v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__377, dtb__378) -> (if (dtb__377 = 58) then (Base_dList.dtp_pack dtb__378) else (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo dtb__378))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName = (fun name -> (if (v_Vuna_dCompiler_dElab_dMeta_disLinClosureName name) then (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo (Base_dList.dtp_unpack name)) else name))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

let v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__379) -> (match dtb__379 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__380, dtb__381) -> (match dtb__381 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__380 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__382, dtb__383) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__382)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__383))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx ec lvl -> ((fun d -> ((fun idx -> (if (lvl < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (idx < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__384) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (Base_dPair.v_Base_dPair_dsecondOf dtb__384))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

let v_Vuna_dCompiler_dElab_dMeta_drigOfQty = (fun implicit isTypeDom qty -> (if (if implicit then true else isTypeDom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__385) -> (match dtb__385 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc = (fun ec name -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name)) else false))

let v_Vuna_dCompiler_dElab_dMeta_disUniverseValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__386) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_disUniverseValue dtb__390)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__391) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__387, 0, Base_dList.C_Base_dList_dList_Nil)))))))
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel 64) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeishValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__392, dtb__393) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__394) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__400) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__401, dtb__402) -> (if (dtb__401 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel mc0) dtb__402))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo = (fun fuel outerNVar headOpaque depth famLevels v -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__403) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__404, dtb__405) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__406) -> (match dtb__406 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__407, dtb__408, dtb__409) -> (if (dtb__408 < depth) then (outerNVar dtb__408) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel dtb__408) famLevels) then true else false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__410, dtb__411) -> (if (headOpaque dtb__410) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__411))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> ((fun fam2 -> (if ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__415) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__416) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__412, depth, Base_dList.C_Base_dList_dList_Nil)))))))) (if (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__415) then (Base_dList.C_Base_dList_dList_Cons (depth, famLevels)) else famLevels))
  | _ -> true
)))
and v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine = (fun fuel outerNVar headOpaque depth famLevels sp -> (if (fuel <= 0) then true else (match sp with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__417, dtb__418) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disTypeishValue dtb__417) then ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__417) else false) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__418))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped = (fun outerNVar headOpaque depth famLevels v -> ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

let v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx = (fun ctx lvl -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__419) -> (match dtb__419 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = dtb__421 } -> (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__421))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - 1) - lvl)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn = (fun ec ctx v -> (((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx ctx)) (v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly ec) v)))

let v_Vuna_dCompiler_dElab_dMeta_dcastErased = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName)), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar = (fun depth idxs name i -> (if (i < depth) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel (i - depth)) idxs) then (v_Vuna_dCompiler_dElab_dMeta_dcastErased (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))))

let rec v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel = (fun fuel depth idxs t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__422, dtb__423, dtb__424) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar depth) idxs) dtb__422) dtb__423)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__425) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__425))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__426) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__426))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__427) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__427))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__428) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__428))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__429) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__429))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__430) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__430))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__431) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__431))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__432, dtb__433, dtb__434, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__435), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__436)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__437, dtb__438, dtb__439) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__437, dtb__438, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__439)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__440, dtb__441, dtb__442) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__440), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__441), dtb__442))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__443, dtb__444) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__443, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__444)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__445, dtb__446) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__445, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__446)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__447, dtb__448) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__447, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__448)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__449), dtb__450, dtb__451, dtb__452, dtb__453))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__454, dtb__455, dtb__456, dtb__457, dtb__458) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__454), dtb__455, dtb__456, dtb__457, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + (Base_dList.v_Base_dList_dlength dtb__456))) idxs) dtb__458)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__459, dtb__460) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__459), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__460)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__461, dtb__462, dtb__463) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__461), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__462), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__463)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__464; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__465; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__466 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__464; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__465; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (Base_dList.v_Base_dList_dlength dtb__465))) mc2) dtb__466) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses = (fun idxs t -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel 512) 0) idxs) t))

let v_Vuna_dCompiler_dElab_dMeta_ddataLinearName = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__467)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorLinearName = (fun ec c -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__468) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__468))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel = (fun fuel ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__469) -> (match dtb__469 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__470, dtb__471) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) dtb__470)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__472, dtb__473, dtb__474) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__475, dtb__476) -> ((v_Vuna_dCompiler_dElab_dMeta_dctorLinearName ec) dtb__475)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disLinearType = (fun ec v -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decHasLinear ec) then (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel 64) ec) v) else false))

let rec v_Vuna_dCompiler_dElab_dMeta_danyLinearVals = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__477, dtb__478) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel mc0) mc1) dtb__477) then true else (((v_Vuna_dCompiler_dElab_dMeta_danyLinearVals mc0) mc1) dtb__478))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain = (fun ec sp name rig dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (rig))))

let v_Vuna_dCompiler_dElab_dMeta_drigCaseField = (fun ec dom rig -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else rig))

let v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__479, dtb__480) -> (match dtb__479 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__481; Base_dPair.f_Base_dPair_dPair_second = dtb__482 } -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc3) dtb__482)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) mc1) dtb__480) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__483; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__484 } -> ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__483; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__484 }) dtb__483) 0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_douterScan = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__485, dtb__486, dtb__487) -> (if (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__485) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__486)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__487))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__488, dtb__489) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__488) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__489))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__490, dtb__491) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__491)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__492, dtb__493) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__493)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__494, dtb__495, dtb__496) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__494) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__495))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__497, dtb__498, dtb__499) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + 1)) dtb__499)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__505, dtb__506, dtb__507) -> (if (dtb__506 > mc2) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (match dtb__508 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__509; Base_dPair.f_Base_dPair_dPair_second = dtb__510 } -> ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) (dtb__506 - mc2)) dtb__510))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (dtb__506 - mc2)) (mc1).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)) else false)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanArgs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__511, dtb__512) -> (match dtb__511 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__513; Base_dPair.f_Base_dPair_dPair_second = dtb__514 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__513) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__512))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanAlts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__515, dtb__516) -> (match dtb__515 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__517; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__518; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__519 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__518))) dtb__519) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__516))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear = (fun ec ctx t -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan ec) ctx) 0) t))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__520) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__524) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__525) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__521, 0, Base_dList.C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit dom -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__526) -> (match dtb__526 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__527, dtb__528) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__527) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__529) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx ec lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__530) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__530)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__531) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__532, dtb__533, dtb__534, dtb__535, dtb__536) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__536) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("ty", 0, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__537) -> (match dtb__537 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__538, dtb__539, dtb__540) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__539) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__541) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__541)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__542, dtb__543) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__544, dtb__545) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__546) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__550) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__551) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("kind", 0, Base_dList.C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx ec v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__552, dtb__553, dtb__554, dtb__555, dtb__556) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__557) -> (match dtb__557 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__558, dtb__559) -> (match dtb__559 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__558 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)
  | _ -> (match dtb__557 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__560, dtb__561, dtb__562) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__561)
  | _ -> false
)
)
  | _ -> (match dtb__557 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__563, dtb__564, dtb__565) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__564)
  | _ -> false
)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__566, dtb__567) -> true
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel ec ctx v -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = ec } })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__568, dtb__569, dtb__570, dtb__571, dtb__572) -> (if dtb__569 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__571) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__573; Base_dPair.f_Base_dPair_dPair_second = dtb__574 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__574) ctx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__572) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__573)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__575; Base_dPair.f_Base_dPair_dPair_second = dtb__576 } -> (match dtb__576 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__577; Base_dPair.f_Base_dPair_dPair_second = dtb__578 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__575; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__573, dtb__577)); Base_dPair.f_Base_dPair_dPair_second = dtb__578 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = ec } }))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = ec } })))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = ec } }))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec ctx v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__579, dtb__580) -> dtb__579
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__581, dtb__582, dtb__583) -> dtb__581
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__584) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__584))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__585) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__586) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal mc0) dtb__586) then (match (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc3) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__587) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__587))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__586)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__586)) mc3) mc4))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm = (fun datas ctor g args -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__588) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__588) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (g, args)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__589, dtb__590) -> (match dtb__589 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__591; Base_dPair.f_Base_dPair_dPair_second = dtb__592 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__591); Base_dPair.f_Base_dPair_dPair_second = dtb__592 }, ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__590)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__593, dtb__594) -> (match dtb__593 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__595; Base_dPair.f_Base_dPair_dPair_second = dtb__596 } -> ((fun binder -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binder, dtb__596, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__594) ((Base_dList.v_Base_dList_dappend mc3) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (binder, (Base_dList.v_Base_dList_dlength dtb__594), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = dtb__596 }, Base_dList.C_Base_dList_dList_Nil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__597, dtb__598) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__598)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (Base_dList.v_Base_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (Base_dList.v_Base_dList_dlength args)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__599) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__599)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__599)) else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__599)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dList.C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__599) Base_dList.C_Base_dList_dList_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec ctx name tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__600) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__600)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__600)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } })) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__601) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__601))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__602) -> (match dtb__602 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__603; Base_dPair.f_Base_dPair_dPair_second = dtb__604 } -> (match dtb__604 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__605; Base_dPair.f_Base_dPair_dPair_second = dtb__606 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__600) dtb__605); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__603; Base_dPair.f_Base_dPair_dPair_second = dtb__606 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ctorTy; Base_dPair.f_Base_dPair_dPair_second = ec } })))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__607, dtb__608) -> (match dtb__607 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__609; Base_dPair.f_Base_dPair_dPair_second = dtb__610 } -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__609, dtb__610))) dtb__608)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__611) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__611) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__612) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__612)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__611) else (if ((Base_dList.v_Base_dList_dlength mc2) >= (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__612))) then ((((v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm mc0) dtb__612) dtb__611) mc2) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__612) mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__611))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

let v_Vuna_dCompiler_dElab_dMeta_disSortExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__613, dtb__614, dtb__615) -> (match dtb__613 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__616, dtb__617) -> (if (dtb__616 = "Type") then true else false)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__618, dtb__619) -> (if (dtb__618 = "Type") then true else false)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624, dtb__625) -> (if (dtb__620 <> "_") then (v_Vuna_dCompiler_dElab_dMeta_disSortExpr dtb__623) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__626; Base_dPair.f_Base_dPair_dPair_second = dtb__627 } -> dtb__627
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__628, dtb__629) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__628)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__628)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__629))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__630, dtb__631) -> (match dtb__630 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__632; Base_dPair.f_Base_dPair_dPair_second = dtb__633 } -> (match dtb__632 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__634, dtb__635, dtb__636) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__631)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__633))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
