open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = { f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName : string; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity : int }

# 30 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel ec v -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 27 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

# 62 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__7) }, ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor metas -> (if ((Base_dData_dList.v_Base_dData_dList_dlength metas) = (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)))))

# 69 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTrueCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolFalseCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 73 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> (if dtb__9 then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

# 103 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (if (dtb__12 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair dtb__16) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans mc0))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 107 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec depth expected actual -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
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

# 120 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining stop sols -> (if (remaining <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 117 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i stop sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

# 129 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__24))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__25, dtb__26, dtb__27) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__25)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__27)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__28) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__29) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__30) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__31) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__32, dtb__33) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__32)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__33))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__34)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__39)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__44, dtb__45) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__45)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__46, dtb__47) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__48, dtb__49) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__49)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__50, dtb__51, dtb__52) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__50)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__51))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__53, dtb__54, dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__56)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__60)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__61))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__62) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__63) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__64, dtb__65, dtb__66) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__67) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__68, dtb__69, dtb__70) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__68)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__69)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__70)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__71) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__72) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__73) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__74) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__75, dtb__76) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__75)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__76))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__77)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__81))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__82)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__87, dtb__88) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__88)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__89, dtb__90) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__90)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__91, dtb__92) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))) dtb__92)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__93, dtb__94, dtb__95) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__95) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__93) else ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__93)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__94)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__96, dtb__97, dtb__98, dtb__99) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__99)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__103)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__104))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__105) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__106) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__107, dtb__108, dtb__109) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__110) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (Base_dData_dPair.v_Base_dData_dPair_dsecondOf d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun d -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

# 188 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a b -> (if (a >= b) then a else b))

# 191 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> (if (mc0 = dtb__113) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__114)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__112))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name globals ec -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf = (fun globals -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) globals) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 213 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 } -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__118) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig _uctx0) dtb__117) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 } -> (if (dtb__122 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__126, dtb__127, dtb__128, dtb__129) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__126) dtb__127) dtb__128) dtb__129) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__130, dtb__131, dtb__132) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__130) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__131) dtb__132) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__133, dtb__134, dtb__135, dtb__136) -> ((((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) mc4) dtb__133) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__135) dtb__136) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__137, dtb__138, dtb__139, dtb__140) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__125)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__163, dtb__164, dtb__165, dtb__166) -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__125)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 252 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned preludeBanned paramKinds seen acc name ctx ty sp rest -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (name))) name) else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) seen) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DuplicateSignature (name))) name) else ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) paramKinds) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) name) true) seen)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = name; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ctx; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCachedKinds (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) paramKinds) ctx) ty) sp); Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp } } }, acc))) rest))))

# 221 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> ((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl decls)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil) decls)) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

# 262 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (match dtb__167 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__168) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__167; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__177 }, mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__168) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__167; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__168) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (match dtb__186 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__188, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__187)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__197, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__187)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__187)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> true
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__210) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__211) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__212) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__212) >= 0)
  | _ -> true
))

# 291 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__213) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__213) >= 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__217) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__218) else false)
  | _ -> false
))

# 304 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__219; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__221 }, (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__223)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 308 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__224) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__224)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__225))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__226, dtb__227) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__226) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__226)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__227))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__228, dtb__229) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__228)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__229)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decCtorIndexComplete ec) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__232) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals ec name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__233) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__233)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

# 360 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 364 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor = (fun ec name -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf fam) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name)) then (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__234) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (fam))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name))))

# 373 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf = (fun ec target -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) target) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__235) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__235)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel = (fun fuel ec v -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel (fuel - 1)) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__240) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_over", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__241) -> (match dtb__241 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__242, dtb__243) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__242))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 379 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel 64) ec) v))

# 392 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText = (fun targets -> ((Base_dData_dString.v_Base_dData_dString_djoin ", ") ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName) targets)))

# 396 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__244, dtb__245) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__244) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__246) -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__246)) = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__246))) else (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__245))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc1) dtb__245)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs = (fun ec target fam -> (match ((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) target) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247) -> (dtb__247 = fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__248) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun t -> (((v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs mc0) t) dtb__248))) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__249, dtb__250) -> (match dtb__250 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__249))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc2, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3)))) mc2) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc3))
))

# 424 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__251) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, dtb__253) -> (match dtb__253 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__252))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor (mc3, (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4)))) mc3) (v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText mc4))
)) (((v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__251))) mc4))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__254) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__254)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals ec name -> (((v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name))

# 460 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__255) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__255))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__256) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__256))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261) -> ((fun v -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__257; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__259 }, ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__261) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, mc1)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__257, (Base_dData_dList.v_Base_dData_dList_dlength mc1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 469 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 480 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__262) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__262; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__263, dtb__264) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__263; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__264) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__265, dtb__266, dtb__267) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__265) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__269) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ""; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 487 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__270, dtb__271, dtb__272, dtb__273, dtb__274) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__274)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

# 545 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun t -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t))

# 507 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel ec depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__275) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__275) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__276) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__276))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__277, dtb__278, dtb__279, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__280), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__281)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__282, dtb__283, dtb__284, dtb__285) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__282, dtb__283, dtb__284, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__285)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__286, dtb__287, dtb__288) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__286), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__287), dtb__288))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__289, dtb__290) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__289, ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__290)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__291, dtb__292) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__291, ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__292)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__293, dtb__294) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__293), ((Base_dData_dList.v_Base_dData_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__294)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__295, dtb__296, dtb__297) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__295), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__296), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__297)))
  | _ -> t
)))
# 537 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel ec depth alt0 -> (if (fuel <= 0) then alt0 else (match alt0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__298; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__299; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__300 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__298; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__299; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (Base_dData_dList.v_Base_dData_dList_dlength dtb__299))) dtb__300) }
  | _ -> failwith "DT: impossible branch"
)))

# 504 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec depth t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

# 532 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec depth alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

# 548 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun args -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs args))

# 551 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun alts -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts alts))

# 559 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (match dtb__304 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__306) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__301, true, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__305) mc1) mc2), mc2))
  | _ -> mc1
)
  | _ -> mc1
))

# 566 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__311)
  | _ -> mc0
))

# 570 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__312, dtb__313) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__312); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__312) }, (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__313)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__314, dtb__315) -> (if ((dtb__314).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__314).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__314).f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity })) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__315))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ("Dict_" ^ cname))

# 597 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ("MkDict_" ^ cname))

# 601 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__316, dtb__317) -> (match dtb__316 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__317) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__316; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__317) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__323, dtb__324) -> (match dtb__323 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__325, dtb__326, dtb__327, dtb__328) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__324) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__323; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__328 }, mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__324) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__329, dtb__330) -> dtb__329
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 622 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__331, dtb__332) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__331 }, ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__332) mc1) (mc2 + 1)) mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (Base_dData_dList.v_Base_dData_dList_dlength rigs)))

# 629 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__333, dtb__334) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (("x" ^ (bi_strFromInt mc1)), dtb__333, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__334) (mc1 + 1)) mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ("_f" ^ (bi_strFromInt i)))

# 645 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, acc)))))

# 642 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n i acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

# 639 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 670 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__335, dtb__336) -> (match (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__335) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__337, dtb__338, dtb__339) -> (if (if (dtb__338 >= 0) then (dtb__338 < mc0) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs mc0) dtb__336) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead = (fun n head -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__340) -> (match dtb__340 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__341; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__342 } -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__342) then ((v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs n) dtb__342) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp head))))

# 676 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBlanketInst = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__343; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__344; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__345; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__346; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__347 } -> ((v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dData_dList.v_Base_dData_dList_dlength dtb__344)) dtb__346)
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname arg ty -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

# 695 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark = "#linclos"

# 698 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureName = (fun sp depth name -> (String.concat "" [v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark; (bi_strFromInt (sp).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine); "_"; (bi_strFromInt (sp).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol); "_"; (bi_strFromInt depth); ":"; name]))

# 702 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinClosureName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark) name))

# 708 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__348, dtb__349) -> (if (dtb__348 = 58) then (Base_dData_dList.dtp_pack dtb__349) else (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo dtb__349))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName = (fun name -> (if (v_Vuna_dCompiler_dElab_dMeta_disLinClosureName name) then (v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo (Base_dData_dList.dtp_unpack name)) else name))

# 713 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

# 751 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__350) -> (match dtb__350 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__351, dtb__352) -> (match dtb__352 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__351 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 756 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))

# 810 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__353, dtb__354) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__353)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__354))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 767 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx ec lvl -> ((fun d -> ((fun idx -> (if (lvl < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (idx < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__355) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__355))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

# 836 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigOfQty = (fun implicit isTypeDom qty -> (if (if implicit then true else isTypeDom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__356) -> (match dtb__356 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

# 856 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc = (fun ec name -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)) then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName name)) else false))

# 871 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disUniverseValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__357) -> true
  | _ -> false
))

# 863 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_disUniverseValue dtb__361)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__362) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__358, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | _ -> false
)))

# 860 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel 64) v))

# 914 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeishValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__363, dtb__364) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__365) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__366, dtb__367, dtb__368, dtb__369, dtb__370) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__371) -> true
  | _ -> false
))

# 921 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, dtb__373) -> (if (dtb__372 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel mc0) dtb__373))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo = (fun fuel outerNVar headOpaque depth famLevels v -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__374) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__375, dtb__376) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__377) -> (match dtb__377 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__378, dtb__379, dtb__380) -> (if (dtb__379 < depth) then (outerNVar dtb__379) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel dtb__379) famLevels) then true else false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__381, dtb__382) -> (if (headOpaque dtb__381) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387) -> ((fun fam2 -> (if ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__386) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__387) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__383, depth, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) (if (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__386) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (depth, famLevels)) else famLevels))
  | _ -> true
)))
# 904 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine = (fun fuel outerNVar headOpaque depth famLevels sp -> (if (fuel <= 0) then true else (match sp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__388, dtb__389) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disTypeishValue dtb__388) then ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__388) else false) then true else ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__389))
  | _ -> failwith "DT: impossible branch"
)))

# 879 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped = (fun outerNVar headOpaque depth famLevels v -> ((((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

# 926 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx = (fun ctx lvl -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__390) -> (match dtb__390 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__391; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__392 } -> (v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__392))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - 1) - lvl)))

# 937 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 940 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn = (fun ec ctx v -> (((((v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx ctx)) (v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly ec) v)))

# 945 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dcastErased = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEraseName)), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 992 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar = (fun depth idxs name i -> (if (i < depth) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else (if ((v_Vuna_dCompiler_dElab_dMeta_dmemLevel (i - depth)) idxs) then (v_Vuna_dCompiler_dElab_dMeta_dcastErased (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, i, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))))

# 954 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel = (fun fuel depth idxs t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__393, dtb__394, dtb__395) -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar depth) idxs) dtb__393) dtb__394)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__396) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__396))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__397) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__397))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__398) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__398))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__399) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__399))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__400) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__400))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__401) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__401))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__402) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__402))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__403, dtb__404, dtb__405, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__406), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__407)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__408, dtb__409, dtb__410, dtb__411) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__408, dtb__409, dtb__410, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__411)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__412, dtb__413, dtb__414) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__412), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__413), dtb__414))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__415, dtb__416) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__415, ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__416)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__417, dtb__418) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__417, ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__418)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__419, dtb__420) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__419, ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__420)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__421, dtb__422, dtb__423, dtb__424, dtb__425) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__421), dtb__422, dtb__423, dtb__424, dtb__425))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__426), dtb__427, dtb__428, dtb__429, ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) (depth + (Base_dData_dList.v_Base_dData_dList_dlength dtb__428))) idxs) dtb__430)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__431, dtb__432) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__431), ((Base_dData_dList.v_Base_dData_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__432)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__433, dtb__434, dtb__435) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__433), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__434), ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__435)))
  | _ -> failwith "DT: impossible branch"
)))
# 998 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__436; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__437; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__438 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__436; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__437; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__437))) mc2) dtb__438) }
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses = (fun idxs t -> ((((v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel 512) 0) idxs) t))

# 1019 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_ddataLinearName = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__439) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__439)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1024 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorLinearName = (fun ec c -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__440) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__440))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel = (fun fuel ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__441) -> (match dtb__441 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__442, dtb__443) -> ((v_Vuna_dCompiler_dElab_dMeta_ddataLinearName ec) dtb__442)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__444, dtb__445, dtb__446) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__447, dtb__448) -> ((v_Vuna_dCompiler_dElab_dMeta_dctorLinearName ec) dtb__447)
  | _ -> false
)))

# 1003 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disLinearType = (fun ec v -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decHasLinear ec) then (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel 64) ec) v) else false))

# 1015 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyLinearVals = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__449, dtb__450) -> (if (((v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel mc0) mc1) dtb__449) then true else (((v_Vuna_dCompiler_dElab_dMeta_danyLinearVals mc0) mc1) dtb__450))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1030 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain = (fun ec sp name rig dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (rig))))

# 1037 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigCaseField = (fun ec dom rig -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else rig))

# 1041 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) dom) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))

# 1048 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__451, dtb__452) -> (match dtb__451 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__453; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__454 } -> (if ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc3) dtb__454)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) mc1) dtb__452) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1045 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__455; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__456; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__457; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__458 } -> ((((v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems mc0) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__455; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__456; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__457; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__458 }) dtb__455) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1058 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_douterScan = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__459, dtb__460, dtb__461) -> (if (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__459) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__460)) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__461))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__462, dtb__463) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__462) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__463))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__464, dtb__465) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__465)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__466, dtb__467) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__467)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__468, dtb__469, dtb__470) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__468) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__469))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__471, dtb__472, dtb__473, dtb__474) -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + 1)) dtb__474)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__475, dtb__476, dtb__477, dtb__478, dtb__479) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__480, dtb__481, dtb__482) -> (if (dtb__481 > mc2) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__483) -> (match dtb__483 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__484; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__485 } -> ((v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) (dtb__481 - mc2)) dtb__485))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (dtb__481 - mc2)) (mc1).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)) else false)
  | _ -> false
))
# 1073 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_douterScanArgs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__486, dtb__487) -> (match dtb__486 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__488; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__489 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) mc2) dtb__488) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanArgs mc0) mc1) mc2) dtb__487))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1078 "Vuna/Compiler/Elab/Meta.vuna"
and v_Vuna_dCompiler_dElab_dMeta_douterScanAlts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__490, dtb__491) -> (match dtb__490 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__492; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__493; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__494 } -> (if ((((v_Vuna_dCompiler_dElab_dMeta_douterScan mc0) mc1) (mc2 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__493))) dtb__494) then true else ((((v_Vuna_dCompiler_dElab_dMeta_douterScanAlts mc0) mc1) mc2) dtb__491))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1055 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear = (fun ec ctx t -> ((((v_Vuna_dCompiler_dElab_dMeta_douterScan ec) ctx) 0) t))

# 1086 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__495) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__499) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__500) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__496, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else false)
  | _ -> false
)))

# 1083 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

# 829 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

# 832 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit dom -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

# 1095 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__501) -> (match dtb__501 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__502, dtb__503) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__502) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__504) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 719 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 761 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx ec lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__505) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__505)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 795 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__506) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__511) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("ty", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__512) -> (match dtb__512 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__513, dtb__514, dtb__515) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__514) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__516) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__516)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__517, dtb__518) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__519, dtb__520) -> true
  | _ -> false
)))

# 783 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__521) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__522, dtb__523, dtb__524, dtb__525, dtb__526) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__525) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__526) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("kind", 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else false)
  | _ -> false
)))

# 780 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx ec v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

# 734 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__527, dtb__528, dtb__529, dtb__530, dtb__531) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__532) -> (match dtb__532 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__533, dtb__534) -> (match dtb__534 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__533 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> (match dtb__532 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__535, dtb__536, dtb__537) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__536)
  | _ -> false
)
)
  | _ -> (match dtb__532 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__538, dtb__539, dtb__540) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__539)
  | _ -> false
)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__541, dtb__542) -> true
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 44 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel ec ctx v -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__543, dtb__544, dtb__545, dtb__546, dtb__547) -> (if dtb__544 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__546) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__548; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__549 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__549) ctx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__547) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__548)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__550; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__551 } -> (match dtb__551 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__552; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__553 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__550; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__548, dtb__552)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__553 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

# 41 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec ctx v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

# 1103 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 1114 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__554, dtb__555) -> dtb__554
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__556, dtb__557, dtb__558) -> dtb__556
  | _ -> failwith "DT: impossible branch"
))

# 1118 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical name))

# 1110 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__559) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__559))
  | _ -> false
))

# 1123 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__560) -> true
  | _ -> false
))

# 416 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__561) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal mc0) dtb__561) then (match (((v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf mc0) mc3) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__562) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__562))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__561)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf mc0) dtb__561)) mc3) mc4))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1175 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm = (fun datas ctor g args -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__563) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__563) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (g, args)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1197 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__564, dtb__565) -> (match dtb__564 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__566; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__567 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__566); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__567 }, ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__565)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1206 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__568, dtb__569) -> (match dtb__568 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__570; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__571 } -> ((fun binder -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binder, dtb__571, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__569) ((Base_dData_dList.v_Base_dData_dList_dappend mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (binder, (Base_dData_dList.v_Base_dData_dList_dlength dtb__569), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__571 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1215 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__572, dtb__573) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__573)
  | _ -> failwith "DT: impossible branch"
)))

# 1189 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (Base_dData_dList.v_Base_dData_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (Base_dData_dList.v_Base_dData_dList_dlength args)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

# 1135 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__574) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__574)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__574)) else (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__574)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__574) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec ctx name tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__575) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__575)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__575)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__576) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__576))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__577) -> (match dtb__577 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__578; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__579 } -> (match dtb__579 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__580; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__581 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__575) dtb__580); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__578; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__581 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc ec) name); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ctorTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc ec) name); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1142 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__582) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__582)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__582)) else (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__582)) = 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (name, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__582) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__583, dtb__584) -> (match dtb__583 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__585; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__586 } -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__585, dtb__586))) dtb__584)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__587) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc0) dtb__587) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__588) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__588)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__587) else (if ((Base_dData_dList.v_Base_dData_dList_dlength mc2) >= (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__588))) then ((((v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas mc0)) dtb__588) dtb__587) mc2) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__588) mc2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__587))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

# 1163 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__589) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__589) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__590) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__590)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__589) else (if ((Base_dData_dList.v_Base_dData_dList_dlength mc2) >= (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__590))) then ((((v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm mc0) dtb__590) dtb__589) mc2) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__590) mc2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__589))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

# 1237 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_disSortExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__591, dtb__592, dtb__593) -> (match dtb__591 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__594, dtb__595) -> (if (dtb__594 = "Type") then true else false)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__596, dtb__597) -> (if (dtb__596 = "Type") then true else false)
  | _ -> false
))

# 1232 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__598, dtb__599, dtb__600, dtb__601, dtb__602, dtb__603) -> (if (dtb__598 <> "_") then (v_Vuna_dCompiler_dElab_dMeta_disSortExpr dtb__601) else false)
  | _ -> false
))

# 1243 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 652 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__604, dtb__605) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__604)) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__604)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__605))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1250 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__606, dtb__607, dtb__608, dtb__609, dtb__610) -> (if dtb__607 then (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity dtb__610) else (1 + (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity dtb__610)))
  | _ -> 0
))

# 1277 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__611, dtb__612, dtb__613, dtb__614, dtb__615) -> (v_Vuna_dCompiler_dElab_dMeta_ddropPis dtb__615)
  | _ -> mc0
))

# 1281 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__616, dtb__617) -> (match dtb__616 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__618, dtb__619, dtb__620) -> (v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg dtb__617)
  | _ -> true
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1273 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorResultIndexed = (fun c -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dMeta_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__621; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__622 } -> (v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg dtb__622)
  | _ -> failwith "DT: impossible branch"
))

# 1269 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__623, dtb__624) -> (if (v_Vuna_dCompiler_dElab_dMeta_dctorResultIndexed dtb__623) then true else (v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed dtb__624))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1266 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dfamilyIndexed = (fun d -> (v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 1257 "Vuna/Compiler/Elab/Meta.vuna"
let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_dfamilyIndexed d)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

# 1288 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__625, dtb__626) -> (match dtb__625 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__627; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__628 } -> (match dtb__627 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__629, dtb__630, dtb__631) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__626)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__628))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
