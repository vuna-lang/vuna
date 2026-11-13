open Vuna_runtime
type t_Vuna_dCompiler_dQuery_dRun_dRunOpts = { f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin : string; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist : bool; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket : string }
and t_Vuna_dCompiler_dQuery_dRun_dNodeSpan = { f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsSeq : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsWave : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsKey : string; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsStartUs : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsEndUs : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsOutcome : string }
and t_Vuna_dCompiler_dQuery_dRun_dRunState = { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb : Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans : t_Vuna_dCompiler_dQuery_dRun_dNodeSpan Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled : bool }

let v_Vuna_dCompiler_dQuery_dRun_drunResume = (fun opts db -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin db) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = 0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = 1; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = 0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = false })

let v_Vuna_dCompiler_dQuery_dRun_drunEmpty = (fun opts -> ((v_Vuna_dCompiler_dQuery_dRun_drunResume opts) Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty))

let v_Vuna_dCompiler_dQuery_dRun_drunWithBudget = (fun st n -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = n; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = n; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })

let v_Vuna_dCompiler_dQuery_dRun_drunStepCount = (fun st -> (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps)

let v_Vuna_dCompiler_dQuery_dRun_drunDbOf = (fun st -> (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb)

let v_Vuna_dCompiler_dQuery_dRun_drunCancelled = (fun st -> (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled)

let v_Vuna_dCompiler_dQuery_dRun_drunCancel = (fun st -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = true })

let v_Vuna_dCompiler_dQuery_dRun_drunNote = (fun st line -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbNote (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) line); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })

let v_Vuna_dCompiler_dQuery_dRun_drunSpans = (fun st -> (Base_dList.v_Base_dList_dreverse (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans))

let v_Vuna_dCompiler_dQuery_dRun_dspanText = (fun s -> ((fun body -> (if ((s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsWave <= 0) then body else (String.concat "" ["w"; (bi_strFromInt (s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsWave); ":"; body]))) (String.concat "" [(s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsOutcome; " "; (s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsKey])))

let v_Vuna_dCompiler_dQuery_dRun_drunSpansText = (fun st -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_dRun_dspanText) (v_Vuna_dCompiler_dQuery_dRun_drunSpans st))))

let v_Vuna_dCompiler_dQuery_dRun_dspanReport = (fun s -> (String.concat "" [(v_Vuna_dCompiler_dQuery_dRun_dspanText s); " "; (bi_strFromInt ((s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsEndUs - (s).f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsStartUs)); "us"]))

let v_Vuna_dCompiler_dQuery_dRun_drunSpanReport = (fun st -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_dRun_dspanReport) (v_Vuna_dCompiler_dQuery_dRun_drunSpans st))))

let rec v_Vuna_dCompiler_dQuery_dRun_dlistLen = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dQuery_dRun_dlistLen dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_drunSpanCount = (fun st -> (v_Vuna_dCompiler_dQuery_dRun_dlistLen (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans))

let v_Vuna_dCompiler_dQuery_dRun_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let v_Vuna_dCompiler_dQuery_dRun_dwithDb = (fun st db -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = db; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })

let v_Vuna_dCompiler_dQuery_dRun_dwithWave = (fun st wave -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = wave; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })

let v_Vuna_dCompiler_dQuery_dRun_daddSpan = (fun st seq wave key outcome t0 t1 -> ((fun _u -> { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsSeq = seq; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsWave = wave; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsKey = key; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsOutcome = outcome }, (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans)); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (seq + 1); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled }) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["query-span "; key; " "; outcome; " "; (bi_strFromInt (t1 - t0)); "us"])) else 0)))

let v_Vuna_dCompiler_dQuery_dRun_dspendBudget = (fun st -> (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps + 1); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })) else (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget - 1); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps + 1); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })))))

let rec v_Vuna_dCompiler_dQuery_dRun_dinStack = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (dtb__2 = mc1) then true else ((v_Vuna_dCompiler_dQuery_dRun_dinStack dtb__3) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dRun_dmemKey = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (dtb__4 = mc0) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey mc0) dtb__5))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dcancelRequested = (fun st -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled))

let v_Vuna_dCompiler_dQuery_dRun_drunNode = (fun st key deps compute -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dcancelRequested st)) (fun cancelled -> (if cancelled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("cancel " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "cancel") t0) t1); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) else (if (if ((v_Vuna_dCompiler_dQuery_dRun_dinStack (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack) key) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey key) deps)) then ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("cycle " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "cycle") t0) t1); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-cycle " ^ key)) else 0)) else (match (((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((fun _u -> ((fun st1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = st1; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6)) })) (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb st) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dmarkHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "hit") t0) t1))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-hit " ^ key)) else 0))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dQuery_dRun_dspendBudget st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("reject " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "reject") t0) t1); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-reject budget " ^ key)) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (compute ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryDepValues (dtb__7).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) deps))) (fun result -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((fun resolved -> ((fun st2 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = st2; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf resolved)))) })) (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb dtb__7) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf resolved)))) (dtb__7).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) (Base_dPair.v_Base_dPair_dsecondOf resolved)) t0) t1))) ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolveTagged (dtb__7).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) result))))))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-miss " ^ key)) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dQuery_dRun_drunCachedMiss = (fun st key deps compute t0 -> (match (v_Vuna_dCompiler_dQuery_dRun_dspendBudget st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("reject " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "reject") t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("query budget exhausted: " ^ key)) })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (compute ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryDepValues (dtb__8).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) deps))) (fun result -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> (match result with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan dtb__8) (dtb__8).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "error") t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9)) })
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10) -> ((fun resolved -> ((fun st2 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = st2; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__10))) })) (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb dtb__8) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf resolved)))) (dtb__8).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) (Base_dPair.v_Base_dPair_dsecondOf resolved)) t0) t1))) ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolveTagged (dtb__8).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) (Base_dPair.v_Base_dPair_dsecondOf dtb__10)))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-miss " ^ key)) else 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_drunCachedNode = (fun st key deps compute recover -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dcancelRequested st)) (fun cancelled -> (if cancelled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("cancel " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "cancel") t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("query node cancelled: " ^ key)) }))) else (if (if ((v_Vuna_dCompiler_dQuery_dRun_dinStack (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack) key) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey key) deps)) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote st) ("cycle " ^ key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "cycle") t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("query cycle: " ^ key)) }))) else (match (((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (recover dtb__11)) (fun recovered -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__12) -> (match dtb__12 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dQuery_dRun_drunCachedMiss st) key) deps) compute) t0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> ((fun _u -> ((fun st1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = st1; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__13)) })) (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb st) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dmarkHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "hit") t0) t1))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-hit " ^ key)) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__14) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan st) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) key) "error") t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__14)) })
  | _ -> failwith "DT: impossible branch"
)) recovered)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dQuery_dRun_drunCachedMiss st) key) deps) compute) t0)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec = "query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema = "vuna-query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema; "/"; tag]))))

let v_Vuna_dCompiler_dQuery_dRun_dencVal = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__15) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__15) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__16) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__16) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecVal = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> (match dtb__17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__18; Base_dPair.f_Base_dPair_dPair_second = dtb__19 } -> (if (dtb__18 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker; Base_dPair.f_Base_dPair_dPair_second = dtb__19 })) else (if (dtb__18 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> (match dtb__20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__21)); Base_dPair.f_Base_dPair_dPair_second = dtb__22 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__19)) else (if (dtb__18 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (match dtb__23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__24)); Base_dPair.f_Base_dPair_dPair_second = dtb__25 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__19)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) c))))

let v_Vuna_dCompiler_dQuery_dRun_dencDep = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__26; Base_dPair.f_Base_dPair_dPair_second = dtb__27 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__26) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__27) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecDep = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28) -> (match dtb__28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> (match dtb__31 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__32 }; Base_dPair.f_Base_dPair_dPair_second = dtb__33 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__30))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__34) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencDep) (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps) ((v_Vuna_dCompiler_dQuery_dRun_dencVal (dtb__35).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal) mc1)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36) -> (match dtb__36 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__39) -> (match dtb__39 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (match dtb__45 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__49; Base_dPair.f_Base_dPair_dPair_second = dtb__50 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (match dtb__51 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (match dtb__54 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = dtb__56 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps = dtb__52; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = dtb__49; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest = dtb__40; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = dtb__43; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal = dtb__55; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits = dtb__46 } }; Base_dPair.f_Base_dPair_dPair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dQuery_dRun_ddecVal (fuel - 1)) dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecDep) (fuel - 1)) dtb__50))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__44))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__41))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__38))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex = (fun db -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (db).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap)))

let v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (match dtb__57 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = dtb__59 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__59) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) dtb__58); Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbOriginOf Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

let v_Vuna_dCompiler_dQuery_dRun_dhashContentKey = (fun bucket -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey bucket))

let v_Vuna_dCompiler_dQuery_dRun_dsessionPath = (fun bucket -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey bucket)); "/index"])))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionLoad = (fun opts -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> (match (v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete dtb__60) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin dtb__61) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-index-reject len=" ^ (bi_strFromInt (bi_strLength dtb__60)))) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionSave = (fun opts db -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff (String.concat "" [dir; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket))]))) (fun _u -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path) (v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex db))))))))))))
