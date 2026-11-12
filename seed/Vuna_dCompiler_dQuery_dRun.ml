open Vuna_runtime
type t_Vuna_dCompiler_dQuery_dRun_dRunOpts = { f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin : string; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist : bool; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket : string }
and t_Vuna_dCompiler_dQuery_dRun_dRunState = { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb : Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps : int }

let v_Vuna_dCompiler_dQuery_dRun_drunEmpty = (fun opts -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = 0 })

let v_Vuna_dCompiler_dQuery_dRun_drunWithBudget = (fun st n -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = n; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = n; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps })

let v_Vuna_dCompiler_dQuery_dRun_drunStepCount = (fun st -> (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps)

let v_Vuna_dCompiler_dQuery_dRun_drunNote = (fun st line -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbNote (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) line); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps })

let v_Vuna_dCompiler_dQuery_dRun_dspendBudget = (fun st -> (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (st)) else (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget - 1); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps + 1) })))))

let rec v_Vuna_dCompiler_dQuery_dRun_dinStack = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (dtb__0 = mc1) then true else ((v_Vuna_dCompiler_dQuery_dRun_dinStack dtb__1) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec = "query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema = "vuna-query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema; "/"; tag]))))

let v_Vuna_dCompiler_dQuery_dRun_dencVal = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__2) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__2) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__3) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__3) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecVal = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__5; Base_dPair.f_Base_dPair_dPair_second = dtb__6 } -> (if (dtb__5 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker; Base_dPair.f_Base_dPair_dPair_second = dtb__6 })) else (if (dtb__5 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (match dtb__7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__8)); Base_dPair.f_Base_dPair_dPair_second = dtb__9 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__6)) else (if (dtb__5 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__11; Base_dPair.f_Base_dPair_dPair_second = dtb__12 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__11)); Base_dPair.f_Base_dPair_dPair_second = dtb__12 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__6)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) c))))

let v_Vuna_dCompiler_dQuery_dRun_dencDep = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__13) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__14) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecDep = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__19 }; Base_dPair.f_Base_dPair_dPair_second = dtb__20 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__21) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencDep) (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps) ((v_Vuna_dCompiler_dQuery_dRun_dencVal (dtb__22).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal) mc1)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (match dtb__23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (match dtb__26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> (match dtb__29 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__30; Base_dPair.f_Base_dPair_dPair_second = dtb__31 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> (match dtb__32 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> (match dtb__35 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__37 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (match dtb__38 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = dtb__40 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> (match dtb__41 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps = dtb__39; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = dtb__36; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest = dtb__27; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = dtb__30; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal = dtb__42; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits = dtb__33 } }; Base_dPair.f_Base_dPair_dPair_second = dtb__43 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dQuery_dRun_ddecVal (fuel - 1)) dtb__40))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecDep) (fuel - 1)) dtb__37))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__34))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex = (fun db -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (db).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap)))

let v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44) -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__46) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) dtb__45); Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbOriginOf Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

let rec v_Vuna_dCompiler_dQuery_dRun_dmemKey = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if (dtb__47 = mc0) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey mc0) dtb__48))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_drunNode = (fun st key deps compute -> (if (if ((v_Vuna_dCompiler_dQuery_dRun_dinStack (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack) key) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey key) deps)) then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("cycle " ^ key)); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("query-cycle " ^ key))) else (match (((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dmarkHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps }; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49)) })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dQuery_dRun_dspendBudget st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("reject " ^ key)); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("query-reject budget " ^ key)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (compute ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryDepValues (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) deps))) (fun result -> ((fun parent -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (Base_dPair.v_Base_dPair_dfirstOf parent); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps }; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf parent))) })) ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolve (dtb__50).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) result))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("query-miss " ^ key)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dQuery_dRun_dhashContentKey = (fun bucket -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey bucket))

let v_Vuna_dCompiler_dQuery_dRun_dsessionPath = (fun bucket -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey bucket)); "/index"])))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionLoad = (fun opts -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (match (v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete dtb__51) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin dtb__52) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("query-index-reject len=" ^ (bi_strFromInt (bi_strLength dtb__51)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionSave = (fun opts db -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff (String.concat "" [dir; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket))]))) (fun _u -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path) (v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex db))))))))))))
