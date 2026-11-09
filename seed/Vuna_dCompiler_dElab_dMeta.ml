open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_DataHead of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel ec v -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__5, (Base_dPair.v_Base_dPair_dsecondOf dtb__7))), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
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

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec depth expected actual -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__10) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__10))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__11) -> (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__11))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining stop sols -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i stop sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (dtb__13 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__14))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__15, dtb__16, dtb__17) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__15)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__16)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__17)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__18) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__19) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__20) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__21) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__22, dtb__23) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__22)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__23))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__24, dtb__25) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__25)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__26, dtb__27, dtb__28) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__27))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__29, dtb__30, dtb__31) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__31)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__35)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__36))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__37) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__38) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__39, dtb__40) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__41) -> (Base_dList.C_Base_dList_dList_Cons (dtb__41, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__42, dtb__43, dtb__44) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__42)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__43)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__44)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__45) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__46) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__47) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__48) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__49, dtb__50) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__49)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__50))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__51, dtb__52) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf p)) then Base_dList.C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dfirstOf p))))) dtb__52)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__53, dtb__54, dtb__55) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__55) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__53) else ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__53)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__54)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__56, dtb__57, dtb__58) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__58)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__62)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__63))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__64) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__65) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__66, dtb__67) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__68) -> (Base_dList.C_Base_dList_dList_Cons (dtb__68, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dPair.v_Base_dPair_dsecondOf d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__71, dtb__72) -> (if (mc0 = dtb__71) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name globals ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> dtb__87
  | _ -> failwith "DT: impossible branch"
) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf = (fun globals -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) globals) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__94, dtb__95) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__94) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig _uctx0) dtb__93) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__96 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__98, dtb__99) -> (if (dtb__98 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__97))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__102, dtb__103, dtb__104, dtb__105) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__102) dtb__103) dtb__104) dtb__105) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__106, dtb__107, dtb__108) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__106) Base_dList.C_Base_dList_dList_Nil) dtb__107) dtb__108) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__109, dtb__110, dtb__111, dtb__112) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__109) Base_dList.C_Base_dList_dList_Nil) dtb__111) dtb__112) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__113, dtb__114, dtb__115, dtb__116) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__131) "DT: internal: record was not desugared")
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__132, dtb__133, dtb__134, dtb__135) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__136, dtb__137, dtb__138, dtb__139) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__101)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned preludeBanned seen acc name ctx ty sp rest -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (name))) name) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) seen) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DuplicateSignature (name))) name) else (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) name) true) seen)) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (name, (Base_dPair.C_Base_dPair_dPair_Pair (ctx, (Base_dPair.C_Base_dPair_dPair_Pair (((((((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) ctx) ty) sp), sp)))))), acc))) rest))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) decls)) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__140 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__141) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__140, dtb__149)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__141) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__150 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> (Base_dList.C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__151)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__151)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__165) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__166) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__167) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__167) >= 0)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__168) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__168) >= 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__172) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__173) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__174, dtb__176)), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__178)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__179) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__180))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__181) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__182))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__183)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__184)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__201
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals ec name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__206)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

let v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor = (fun ec name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__207, dtb__208) -> ((fun fam -> (if (fam = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf fam) = dtb__208) then (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (fam))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__207))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf = (fun ec target -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) target) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__210)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel = (fun fuel ec v -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__215) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_over", 0, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__216) -> (match dtb__216 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__217, dtb__218) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__217))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel 64) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText = (fun targets -> ((Base_dString.v_Base_dString_djoin ", ") ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName) targets)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__219) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__221)) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__221))) else (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__220))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__220)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs = (fun ec target fam -> (match ((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) target) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> (dtb__222 = fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> ((Base_dList.v_Base_dList_dfilter (fun t -> (((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs mc0) t) dtb__223))) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlistCtorTarget = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__224, dtb__225) -> (if (((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs mc0) dtb__224) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224)) else ((v_Vuna_dCompiler_dElab_dMeta_dlistCtorTarget mc0) dtb__225))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver = (fun ec sp short targets -> (match ((v_Vuna_dCompiler_dElab_dMeta_dlistCtorTarget ec) targets) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__226))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__227))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (short, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText targets)))) short) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText targets))
)
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (short, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText targets)))) short) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText targets))
)) targets)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (match dtb__231 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__230))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)) (((v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily mc0) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229))) mc4))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__232)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals ec name -> (((v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__233) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__233))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__234))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> ((fun v -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__235, dtb__237)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__239) (Base_dList.C_Base_dList_dList_Cons (v, mc1)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__235, (Base_dList.v_Base_dList_dlength mc1), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__240) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__240, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__241, dtb__242, dtb__243) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__241) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__244, dtb__245) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__244, ((Base_dList.v_Base_dList_dappend dtb__245) (Base_dList.C_Base_dList_dList_Cons (dtb__242, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair ("", Base_dList.C_Base_dList_dList_Nil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__250)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__251, dtb__252, dtb__253) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__251) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__252)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__253))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__254, dtb__255) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__254) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__255))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__256, dtb__257) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__257)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__258, dtb__259, dtb__260) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__258) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__259))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__261, dtb__262, dtb__263) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__263)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__264, dtb__265, dtb__266, dtb__267, dtb__268) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__267) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__268))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__269, dtb__270) -> (dtb__270 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match dtb__271 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__273, dtb__274) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__273) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__272))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> (match dtb__275 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__277, dtb__278, dtb__279) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__279) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__276))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel ec depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__280) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__280) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__281) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__281))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__282, dtb__283, dtb__284, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__285), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__286)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__287, dtb__288, dtb__289) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__287, dtb__288, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__289)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__290, dtb__291, dtb__292) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__290), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__291), dtb__292))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__293, dtb__294) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__293, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__294)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__295, dtb__296) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__295), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__296)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__297, dtb__298, dtb__299) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__297), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__298), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__299)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel ec depth alt0 -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ("", Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (0)))) else (match alt0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__300, dtb__301, dtb__302) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__300, dtb__301, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (Base_dList.v_Base_dList_dlength dtb__301))) dtb__302)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec depth t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec depth alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__303, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__307) mc1) mc2), mc2))
  | _ -> mc1
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__312)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__313, dtb__314) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__313), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__313))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__314)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__315, dtb__316) -> (if ((match dtb__315 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_DataHead (dtb__317, dtb__318, dtb__319) -> dtb__317
  | _ -> failwith "DT: impossible branch"
) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((match dtb__315 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_DataHead (dtb__320, dtb__321, dtb__322) -> dtb__321
  | _ -> failwith "DT: impossible branch"
), (match dtb__315 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_DataHead (dtb__323, dtb__324, dtb__325) -> dtb__325
  | _ -> failwith "DT: impossible branch"
))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__316))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ("Dict_" ^ cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ("MkDict_" ^ cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__326, dtb__327) -> (match dtb__326 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__328, dtb__329, dtb__330, dtb__331) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__327) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__326, dtb__331)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__327) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__332, dtb__333) -> (match dtb__332 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__334, dtb__335, dtb__336, dtb__337) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__333) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__332, dtb__337)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__333) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__338, dtb__339) -> dtb__338
  | Base_dList.C_Base_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__340, dtb__341) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)))), dtb__340)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__341) mc1) (mc2 + 1)) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (("x" ^ (bi_strFromInt mc1)), dtb__342, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__343) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ("f" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), acc)))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n i acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__344, dtb__345) -> (match (Base_dPair.v_Base_dPair_dfirstOf dtb__344) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__346, dtb__347) -> (if (if (dtb__347 >= 0) then (dtb__347 < mc0) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs mc0) dtb__345) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead = (fun n head -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__348) -> (match dtb__348 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__349, dtb__350) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__350) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs n) dtb__350) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp head))))

let v_Vuna_dCompiler_dElab_dMeta_disBlanketInst = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__351, dtb__352, dtb__353, dtb__354) -> ((v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength dtb__352)) dtb__354)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname arg ty -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark = "#linclos"

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureName = (fun sp depth name -> (String.concat "" [v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark; (bi_strFromInt (match sp with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> dtb__356
  | _ -> failwith "DT: impossible branch"
)); "_"; (bi_strFromInt (match sp with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__360, dtb__361, dtb__362, dtb__363, dtb__364) -> dtb__362
  | _ -> failwith "DT: impossible branch"
)); "_"; (bi_strFromInt depth); ":"; name]))

let v_Vuna_dCompiler_dElab_dMeta_disLinClosureName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark) name))

let rec v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__365, dtb__366) -> (if (dtb__365 = 58) then (Base_dList.dtp_pack dtb__366) else (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo dtb__366))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName = (fun name -> (if (v_Vuna_dCompiler_dElab_dMeta_disLinClosureName name) then (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo (Base_dList.dtp_unpack name)) else name))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__368))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx ec lvl -> ((fun d -> ((fun idx -> (if (lvl < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (idx < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__369, dtb__370) -> dtb__369
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__371) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (Base_dPair.v_Base_dPair_dsecondOf dtb__371))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

let v_Vuna_dCompiler_dElab_dMeta_drigOfQty = (fun implicit isTypeDom qty -> (if (if implicit then true else isTypeDom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__372) -> (match dtb__372 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc = (fun ec name -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name)) else false))

let v_Vuna_dCompiler_dElab_dMeta_disUniverseValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__373) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__374, dtb__375, dtb__376, dtb__377, dtb__378) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_disUniverseValue dtb__377)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__378) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__374, 0, Base_dList.C_Base_dList_dList_Nil)))))))
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel 64) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeishValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__379, dtb__380) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__381) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__387) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__388, dtb__389) -> (if (dtb__388 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel mc0) dtb__389))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo = (fun fuel outerNVar headOpaque depth famLevels v -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__390) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__391, dtb__392) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__393) -> (match dtb__393 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__394, dtb__395, dtb__396) -> (if (dtb__395 < depth) then (outerNVar dtb__395) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel dtb__395) famLevels) then true else false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__397, dtb__398) -> (if (headOpaque dtb__397) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__398))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> ((fun fam2 -> (if ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__402) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__403) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__399, depth, Base_dList.C_Base_dList_dList_Nil)))))))) (if (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__402) then (Base_dList.C_Base_dList_dList_Cons (depth, famLevels)) else famLevels))
  | _ -> true
)))
and v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine = (fun fuel outerNVar headOpaque depth famLevels sp -> (if (fuel <= 0) then true else (match sp with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__404, dtb__405) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disTypeishValue dtb__404) then ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__404) else false) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__405))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped = (fun outerNVar headOpaque depth famLevels v -> ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

let v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx = (fun ctx lvl -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> (match dtb__406 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__407, dtb__408) -> (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__408))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__409, dtb__410) -> dtb__409
  | _ -> failwith "DT: impossible branch"
))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - 1) - lvl)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn = (fun ec ctx v -> (((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx ctx)) (v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly ec) v)))

let v_Vuna_dCompiler_dElab_dMeta_dcastErased = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName)), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar = (fun depth idxs name i -> (if (i < depth) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i)) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel (i - depth)) idxs) then (v_Vuna_dCompiler_dElab_dMeta_dcastErased (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel = (fun fuel depth idxs t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__411, dtb__412) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar depth) idxs) dtb__411) dtb__412)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__413) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__413))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__414) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__414))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__415) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__415))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__416) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__416))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__417) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__417))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__418) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__418))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__419) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__419))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__420, dtb__421, dtb__422, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__423), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__424)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__425, dtb__426, dtb__427) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__425, dtb__426, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__427)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__428, dtb__429, dtb__430) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__428), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__429), dtb__430))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__431, dtb__432) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__431, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__432)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__433, dtb__434) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__433), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__434)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__435, dtb__436, dtb__437) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__435), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__436), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__437)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__438, dtb__439, dtb__440) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__438, dtb__439, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (Base_dList.v_Base_dList_dlength dtb__439))) mc2) dtb__440)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses = (fun idxs t -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel 512) 0) idxs) t))

let v_Vuna_dCompiler_dElab_dMeta_ddataLinearName = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__441) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__441)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorLinearName = (fun ec c -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__442) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__442))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel = (fun fuel ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__443) -> (match dtb__443 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__444, dtb__445) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) dtb__444)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__446, dtb__447, dtb__448) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__449, dtb__450) -> ((v_Vuna_dCompiler_dElab_dMeta_dctorLinearName ec) dtb__449)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disLinearType = (fun ec v -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decHasLinear ec) then (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel 64) ec) v) else false))

let rec v_Vuna_dCompiler_dElab_dMeta_danyLinearVals = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__451, dtb__452) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel mc0) mc1) dtb__451) then true else (((v_Vuna_dCompiler_dElab_dMeta_danyLinearVals mc0) mc1) dtb__452))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain = (fun ec sp name rig dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Base_dResult.C_Base_dResult_dResult_Ok (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Base_dResult.C_Base_dResult_dResult_Ok (rig))))

let v_Vuna_dCompiler_dElab_dMeta_drigCaseField = (fun ec dom rig -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else rig))

let v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__453, dtb__454) -> (match dtb__453 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__455, dtb__456) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc3) dtb__456)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) mc1) dtb__454) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__457, dtb__458) -> ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__457, dtb__458))) dtb__457) 0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_douterScan = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__459, dtb__460, dtb__461) -> (if (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__459) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__460)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__461))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__462, dtb__463) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__462) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__463))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__464, dtb__465) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__465)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__466, dtb__467, dtb__468) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__466) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__467))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__469, dtb__470, dtb__471) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + 1)) dtb__471)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__477, dtb__478) -> (if (dtb__478 > mc2) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__479) -> (match dtb__479 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__480, dtb__481) -> ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) (dtb__478 - mc2)) dtb__481))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (dtb__478 - mc2)) (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__482, dtb__483) -> dtb__482
  | _ -> failwith "DT: impossible branch"
))) else false)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanArgs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__484, dtb__485) -> (match dtb__484 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__486, dtb__487) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__486) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__485))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_douterScanAlts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__488, dtb__489) -> (match dtb__488 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__490, dtb__491, dtb__492) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__491))) dtb__492) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__489))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear = (fun ec ctx t -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan ec) ctx) 0) t))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__493) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__497) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__498) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__494, 0, Base_dList.C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit dom -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__499) -> (match dtb__499 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__500, dtb__501) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__500) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__502) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx ec lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__503) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__503)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__504) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__509) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("ty", 0, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__510) -> (match dtb__510 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__511, dtb__512, dtb__513) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__512) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__514) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__514)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__515, dtb__516) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__517, dtb__518) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__519) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__520, dtb__521, dtb__522, dtb__523, dtb__524) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__523) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__524) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("kind", 0, Base_dList.C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx ec v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__525, dtb__526) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__527) -> (match dtb__527 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__528, dtb__529, dtb__530) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__529)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__531, dtb__532, dtb__533, dtb__534, dtb__535) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel ec ctx v -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (v, (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, ec)))))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__536, dtb__537, dtb__538, dtb__539, dtb__540) -> (if dtb__537 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__539) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__541, dtb__542) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__542) ctx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__540) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__541)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__543, dtb__544) -> (match dtb__544 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__545, dtb__546) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__543, (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__541, dtb__545)), dtb__546))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (v, (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, ec))))))) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (v, (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, ec)))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (v, (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, ec))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec ctx v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__547, dtb__548) -> dtb__547
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__549, dtb__550, dtb__551) -> dtb__549
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__552) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__552))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__553) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__554) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal mc0) dtb__554) then (match (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc3) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__555) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__555))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__554)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__554)) mc3) mc4))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__556, dtb__557) -> (match dtb__556 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__558, dtb__559) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__558), dtb__559)), ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__557)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__560, dtb__561) -> (match dtb__560 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__562, dtb__563) -> ((fun binder -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binder, dtb__563, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__561) ((Base_dList.v_Base_dList_dappend mc3) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (binder, (Base_dList.v_Base_dList_dlength dtb__561))), dtb__563)), Base_dList.C_Base_dList_dList_Nil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__564, dtb__565) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__565)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (Base_dList.v_Base_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (Base_dList.v_Base_dList_dlength args)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__566) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__566)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__566)) else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__566)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dList.C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__566) Base_dList.C_Base_dList_dList_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec ctx name tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__567) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__567)) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__567)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__568) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__568))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__569) -> (match dtb__569 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__570, dtb__571) -> (match dtb__571 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__572, dtb__573) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__567) dtb__572), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__570, dtb__573))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (Base_dPair.C_Base_dPair_dPair_Pair (ctorTy, ec)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__574, dtb__575) -> (match dtb__574 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__576, dtb__577) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__576, dtb__577))) dtb__575)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__578) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__578) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__579) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__579)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__578) else (if ((Base_dList.v_Base_dList_dlength mc2) >= (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__579))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__578, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__579) mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__578))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585) -> (dtb__580 <> "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__586, dtb__587) -> dtb__587
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__588, dtb__589) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__588)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__588)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__589))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__590, dtb__591) -> (match dtb__590 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__592, dtb__593) -> (match dtb__592 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__594, dtb__595, dtb__596) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__591)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__593))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
