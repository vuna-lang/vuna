open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel ec v -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, (Base_dPair.v_Base_dPair_dsecondOf dtb__7))), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor metas -> (if ((Base_dList.v_Base_dList_dlength metas) = (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)))))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (if dtb__9 then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec depth expected actual -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__10))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__11))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining stop sols -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i stop sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (dtb__13 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__14))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__15, dtb__16, dtb__17) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__15)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__16)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__17)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__18) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__19) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__20) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__21, dtb__22) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__21)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__22))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__23, dtb__24) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__24)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__25, dtb__26, dtb__27) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__25)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__28, dtb__29, dtb__30) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__30)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__34)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__35))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__36) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__37) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__38, dtb__39) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__40) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__40, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__41, dtb__42, dtb__43) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__41)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__42)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__43)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__44) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__45) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__46) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__47, dtb__48) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__47)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__48))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__49, dtb__50) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf p)) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dfirstOf p))))) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__51, dtb__52, dtb__53) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__53) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__51) else ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__51)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__52)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__54, dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__56)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__60)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__61))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__62) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__63) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__64, dtb__65) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__66) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__66, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dsecondOf d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (if (mc0 = dtb__69) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__68))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name globals ec -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__85
  | _ -> failwith "DT: impossible branch"
) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (match dtb__90 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__92) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig _uctx0) dtb__91) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__94 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> (if (dtb__96 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__100, dtb__101, dtb__102, dtb__103) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__100) dtb__101) dtb__102) dtb__103) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__104, dtb__105, dtb__106) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__104) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__105) dtb__106) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__107, dtb__108, dtb__109, dtb__110) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__107) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__109) dtb__110) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__111, dtb__112, dtb__113, dtb__114) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__127) "DT: internal: record was not desugared")
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__128, dtb__129, dtb__130, dtb__131) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__132, dtb__133, dtb__134, dtb__135) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__99)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned preludeBanned seen acc name ctx ty sp rest -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (name))) name) else (if ((Base_dHashMap.v_Base_dHashMap_dmember name) seen) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateSignature (name))) name) else (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (((Base_dHashMap.v_Base_dHashMap_dinsert name) true) seen)) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (name, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ctx, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) ctx) ty) sp), sp)))))), acc))) rest))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil) decls)) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned Base_dList.C_Base_dList_dList_Base_dList_dNil))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (match dtb__136 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__137) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__144)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__137) mc1)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (match dtb__145 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__147, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__146)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__146)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> true
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__159) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__160) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__161) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__161) >= 0)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__162) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__162) >= 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__166) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__167) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__170)), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__172)))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__173) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__174))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__175) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__176))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__177)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__178)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> dtb__195
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__199) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals ec name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__200)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__201) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__201))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__202) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__202))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> ((fun v -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, dtb__205)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__207) (Base_dList.C_Base_dList_dList_Base_dList_dCons (v, mc1)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__203, (Base_dList.v_Base_dList_dlength mc1), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__208) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__209, dtb__210, dtb__211) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__209) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, ((Base_dList.v_Base_dList_dappend dtb__213) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__210, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Base_dList.C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__218)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__219, dtb__220, dtb__221) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__219) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__220)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__221))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__222, dtb__223) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__222) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__223))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__224, dtb__225) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__225)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__226, dtb__227, dtb__228) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__226) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__227))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__229, dtb__230, dtb__231) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__231)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__235) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__236))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__237, dtb__238) -> (dtb__238 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__239, dtb__240) -> (match dtb__239 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__241) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__240))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> (match dtb__243 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__245, dtb__246, dtb__247) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__247) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel ec depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__248) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__248) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__249) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__249))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__250, dtb__251, dtb__252, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__253), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__254)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__255, dtb__256, dtb__257) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__255, dtb__256, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__257)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__258, dtb__259, dtb__260) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__258), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__259), dtb__260))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__261, dtb__262) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__261, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__262)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__263, dtb__264) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__263), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__264)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__265, dtb__266, dtb__267) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__265), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__266), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__267)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel ec depth alt0 -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", Base_dList.C_Base_dList_dList_Base_dList_dNil, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (0)))) else (match alt0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__268, dtb__269, dtb__270) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__268, dtb__269, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (Base_dList.v_Base_dList_dlength dtb__269))) dtb__270)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec depth t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec depth alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__271, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__275) mc1) mc2), mc2))
  | _ -> mc1
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__280)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__281, dtb__282) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__281), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__281))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__282)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__283, dtb__284) -> (if ((match dtb__283 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__285, dtb__286, dtb__287) -> dtb__285
  | _ -> failwith "DT: impossible branch"
) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__283 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__288, dtb__289, dtb__290) -> dtb__289
  | _ -> failwith "DT: impossible branch"
), (match dtb__283 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__291, dtb__292, dtb__293) -> dtb__293
  | _ -> failwith "DT: impossible branch"
))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__284))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ("Dict_" ^ cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ("MkDict_" ^ cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__294, dtb__295) -> (match dtb__294 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__296, dtb__297, dtb__298, dtb__299) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__295) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__299)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__295) mc1)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__300, dtb__301) -> (match dtb__300 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__302, dtb__303, dtb__304, dtb__305) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__301) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__300, dtb__305)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__301) mc1)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__306, dtb__307) -> dtb__306
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__308, dtb__309) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)))), dtb__308)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__309) mc1) (mc2 + 1)) mc3)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__310, dtb__311) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (("x" ^ (bi_strFromInt mc1)), dtb__310, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__311) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ("f" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), acc)))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n i acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__312, dtb__313) -> (match (Base_dPair.v_Base_dPair_dfirstOf dtb__312) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__314, dtb__315) -> (if (if (dtb__315 >= 0) then (dtb__315 < mc0) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs mc0) dtb__313) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname arg ty -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark = "#linclos"

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureName = (fun sp depth name -> (String.concat "" [v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark; (bi_strFromInt (match sp with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__316, dtb__317, dtb__318, dtb__319, dtb__320) -> dtb__317
  | _ -> failwith "DT: impossible branch"
)); "_"; (bi_strFromInt (match sp with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__321, dtb__322, dtb__323, dtb__324, dtb__325) -> dtb__323
  | _ -> failwith "DT: impossible branch"
)); "_"; (bi_strFromInt depth); ":"; name]))

let v_Vuna_dCompiler_dElab_dMeta_disLinClosureName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark) name))

let rec v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__326, dtb__327) -> (if (dtb__326 = 58) then (Base_dList.dtp_pack dtb__327) else (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo dtb__327))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName = (fun name -> (if (v_Vuna_dCompiler_dElab_dMeta_disLinClosureName name) then (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo (Base_dList.dtp_unpack name)) else name))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__328) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__329, dtb__330, dtb__331) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__332) -> (match dtb__332 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__333, dtb__334) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__333, ((Base_dList.v_Base_dList_dappend dtb__334) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__329))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead = (fun n head -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__335) -> (match dtb__335 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__337) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs n) dtb__337) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp head))))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInst = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__338, dtb__339, dtb__340, dtb__341) -> ((v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength dtb__339)) dtb__341)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__342, dtb__343) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__342)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__343))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx ec lvl -> ((fun d -> ((fun idx -> (if (lvl < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (idx < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__344, dtb__345) -> dtb__344
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__346) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (Base_dPair.v_Base_dPair_dsecondOf dtb__346))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

let v_Vuna_dCompiler_dElab_dMeta_drigOfQty = (fun implicit isTypeDom qty -> (if (if implicit then true else isTypeDom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__347) -> (match dtb__347 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ1 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ0 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc = (fun ec name -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name)) else false))

let v_Vuna_dCompiler_dElab_dMeta_disUniverseValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__348) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_disUniverseValue dtb__352)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__353) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__349, 0, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel 64) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeishValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__354, dtb__355) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__356) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__357, dtb__358, dtb__359, dtb__360, dtb__361) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__362) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__363, dtb__364) -> (if (dtb__363 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel mc0) dtb__364))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo = (fun fuel outerNVar headOpaque depth famLevels v -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__365) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__366, dtb__367) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__368) -> (match dtb__368 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__369, dtb__370, dtb__371) -> (if (dtb__370 < depth) then (outerNVar dtb__370) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel dtb__370) famLevels) then true else false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__372, dtb__373) -> (if (headOpaque dtb__372) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__373))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__374, dtb__375, dtb__376, dtb__377, dtb__378) -> ((fun fam2 -> (if ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__377) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__378) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__374, depth, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))) (if (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__377) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (depth, famLevels)) else famLevels))
  | _ -> true
)))
and v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine = (fun fuel outerNVar headOpaque depth famLevels sp -> (if (fuel <= 0) then true else (match sp with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__379, dtb__380) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disTypeishValue dtb__379) then ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__379) else false) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__380))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped = (fun outerNVar headOpaque depth famLevels v -> ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

let v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx = (fun ctx lvl -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__381) -> (match dtb__381 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__383))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__384, dtb__385) -> dtb__384
  | _ -> failwith "DT: impossible branch"
))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - 1) - lvl)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn = (fun ec ctx v -> (((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx ctx)) (v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly ec) v)))

let v_Vuna_dCompiler_dElab_dMeta_dcastErased = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName)), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar = (fun depth idxs name i -> (if (i < depth) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, i)) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel (i - depth)) idxs) then (v_Vuna_dCompiler_dElab_dMeta_dcastErased (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, i))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, i)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel = (fun fuel depth idxs t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__386, dtb__387) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar depth) idxs) dtb__386) dtb__387)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__388) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__388))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__389) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__389))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__390) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__390))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__391) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__391))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__392) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__392))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__393) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__393))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__394, dtb__395, dtb__396, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__397), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__398)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__399, dtb__400, dtb__401) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__399, dtb__400, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__401)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__402, dtb__403, dtb__404) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__402), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__403), dtb__404))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__405, dtb__406) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__405, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__406)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__407, dtb__408) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__407), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__408)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__409, dtb__410, dtb__411) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__409), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__410), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__411)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__412, dtb__413, dtb__414) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__412, dtb__413, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (Base_dList.v_Base_dList_dlength dtb__413))) mc2) dtb__414)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses = (fun idxs t -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel 512) 0) idxs) t))

let v_Vuna_dCompiler_dElab_dMeta_ddataLinearName = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__415) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__415)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorLinearName = (fun ec c -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__416) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__416))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel = (fun fuel ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__417) -> (match dtb__417 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__418, dtb__419) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) dtb__418)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__420, dtb__421, dtb__422) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__423, dtb__424) -> ((v_Vuna_dCompiler_dElab_dMeta_dctorLinearName ec) dtb__423)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disLinearType = (fun ec v -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decHasLinear ec) then (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel 64) ec) v) else false))

let rec v_Vuna_dCompiler_dElab_dMeta_danyLinearVals = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__425, dtb__426) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel mc0) mc1) dtb__425) then true else (((v_Vuna_dCompiler_dElab_dMeta_danyLinearVals mc0) mc1) dtb__426))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain = (fun ec sp name rig dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLinearValueNeedsLinearBinder (name))) name)
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (rig))))

let v_Vuna_dCompiler_dElab_dMeta_drigCaseField = (fun ec dom rig -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 else rig))

let v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__427, dtb__428) -> (match dtb__427 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__429, dtb__430) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc3) dtb__430)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) mc1) dtb__428) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__431, dtb__432) -> ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__431, dtb__432))) dtb__431) 0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_douterScan = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__433, dtb__434, dtb__435) -> (if (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__433) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__434)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__435))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__436, dtb__437) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__436) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__437))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__438, dtb__439) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__439)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__440, dtb__441, dtb__442) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__440) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__441))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__443, dtb__444, dtb__445) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + 1)) dtb__445)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__451, dtb__452) -> (if (dtb__452 > mc2) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__453) -> (match dtb__453 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__454, dtb__455) -> ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) (dtb__452 - mc2)) dtb__455))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (dtb__452 - mc2)) (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__456, dtb__457) -> dtb__456
  | _ -> failwith "DT: impossible branch"
))) else false)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanArgs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__458, dtb__459) -> (match dtb__458 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__460, dtb__461) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__460) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__459))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanAlts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__462, dtb__463) -> (match dtb__462 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__464, dtb__465, dtb__466) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__465))) dtb__466) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__463))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear = (fun ec ctx t -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan ec) ctx) 0) t))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__467) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__468, dtb__469, dtb__470, dtb__471, dtb__472) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__471) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__472) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__468, 0, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit dom -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__473) -> (match dtb__473 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__474, dtb__475) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__474) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__476) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx ec lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__477) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__477)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__478) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__483) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("ty", 0, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__484) -> (match dtb__484 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__485, dtb__486, dtb__487) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__486) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__488) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__488)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__489, dtb__490) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__491, dtb__492) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__493) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__497) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__498) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("kind", 0, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx ec v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__499, dtb__500) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__501) -> (match dtb__501 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__502, dtb__503, dtb__504) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__503)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel ec ctx v -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, ec)))))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__510, dtb__511, dtb__512, dtb__513, dtb__514) -> (if dtb__511 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__513) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__515, dtb__516) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__516) ctx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__514) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__515)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, dtb__518) -> (match dtb__518 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__515, dtb__519)), dtb__520))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, ec))))))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, ec)))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, ec))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec ctx v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__521, dtb__522) -> dtb__521
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__523, dtb__524, dtb__525) -> dtb__523
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__526) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__526))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__527) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__528, dtb__529) -> (match dtb__528 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__530, dtb__531) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__530), dtb__531)), ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__529)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__532, dtb__533) -> (match dtb__532 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__534, dtb__535) -> ((fun binder -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (binder, dtb__535, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__533) ((Base_dList.v_Base_dList_dappend mc3) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (binder, (Base_dList.v_Base_dList_dlength dtb__533))), dtb__535)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__536, dtb__537) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__537)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (Base_dList.v_Base_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (Base_dList.v_Base_dList_dlength args)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__538) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__538)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__538)) else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__538)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__538) Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec ctx name tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__539) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__539)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__539)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__540) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__540))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__541) -> (match dtb__541 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__542, dtb__543) -> (match dtb__543 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__544, dtb__545) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__539) dtb__544), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__542, dtb__545))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) tyTerm)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__546, dtb__547) -> (match dtb__546 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__548, dtb__549) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__548, dtb__549))) dtb__547)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__550) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__550) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__551) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__551)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__550) else (if ((Base_dList.v_Base_dList_dlength mc2) >= (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__551))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__550, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__551) mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__550))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557) -> (dtb__552 <> "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__558, dtb__559) -> dtb__559
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__560, dtb__561) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__560)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__560)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__561))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__562, dtb__563) -> (match dtb__562 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__564, dtb__565) -> (match dtb__564 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__566, dtb__567, dtb__568) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__563)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__565))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
