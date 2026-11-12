open Vuna_runtime
type t_Vuna_dCompiler_dQuery_dRun_dRunOpts = { f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin : string; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist : bool; f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket : string }
and t_Vuna_dCompiler_dQuery_dRun_dNodeSpan = { f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsSeq : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsWave : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsKey : string; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsStartUs : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsEndUs : int; f_Vuna_dCompiler_dQuery_dRun_dNodeSpan_nsOutcome : string }
and t_Vuna_dCompiler_dQuery_dRun_dRunState = { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb : Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans : t_Vuna_dCompiler_dQuery_dRun_dNodeSpan Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq : int; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled : bool }
and t_Vuna_dCompiler_dQuery_dRun_dWaveNode = C_Vuna_dCompiler_dQuery_dRun_dWaveNode_WaveNodeMk of (string) * (string Base_dList.t_Base_dList_dList) * ((Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dQVal Base_dList.t_Base_dList_dList) -> (Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dQVal, string Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dEff.t_Base_dEff_dEff)
and t_Vuna_dCompiler_dQuery_dRun_dWaveOut = { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome : string; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs : int; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs : int; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue : Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dQVal Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh : (Vuna_dCompiler_dQuery.t_Vuna_dCompiler_dQuery_dQVal, string Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dMaybe.t_Base_dMaybe_dMaybe }

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

let v_Vuna_dCompiler_dQuery_dRun_dcancelRequested = (fun st -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Base_dEffSched.v_Base_dEffSched_disCancelled) (fun sched -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled then true else (sched = 1))))))

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

let v_Vuna_dCompiler_dQuery_dRun_dwaveNode = (fun key deps compute -> (C_Vuna_dCompiler_dQuery_dRun_dWaveNode_WaveNodeMk (key, deps, compute)))

let v_Vuna_dCompiler_dQuery_dRun_dwaveKey = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dQuery_dRun_dWaveNode_WaveNodeMk (dtb__15, dtb__16, dtb__17) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dwaveDeps = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dQuery_dRun_dWaveNode_WaveNodeMk (dtb__18, dtb__19, dtb__20) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dwaveCompute = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dQuery_dRun_dWaveNode_WaveNodeMk (dtb__21, dtb__22, dtb__23) -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dwoOutcomeOf = (fun w -> (w).f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome)

let v_Vuna_dCompiler_dQuery_dRun_dwoStartOf = (fun w -> (w).f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs)

let v_Vuna_dCompiler_dQuery_dRun_dwoEndOf = (fun w -> (w).f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs)

let v_Vuna_dCompiler_dQuery_dRun_dwoValueOf = (fun w -> (w).f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue)

let v_Vuna_dCompiler_dQuery_dRun_dwoFreshOf = (fun w -> (w).f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh)

let rec v_Vuna_dCompiler_dQuery_dRun_drunWaveSeq = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dQuery_dRun_drunNode mc0) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__24)) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps dtb__24)) (v_Vuna_dCompiler_dQuery_dRun_dwaveCompute dtb__24))) (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_drunWaveSeq (Base_dPair.v_Base_dPair_dfirstOf r)) dtb__25)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf restR); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__24); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }, (Base_dPair.v_Base_dPair_dsecondOf restR))) })))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dRun_dcancelWave = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> ((fun st1 -> ((fun tailR -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf tailR); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__26); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, (Base_dPair.v_Base_dPair_dsecondOf tailR))) }) ((v_Vuna_dCompiler_dQuery_dRun_dcancelWave st1) dtb__27))) (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_drunNote mc0) ("cancel " ^ (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__26)))) (mc0).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) 0) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__26)) "cancel") 0) 0))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dwaveSlice = (fun st width -> (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 <= 0) then st else ((fun share -> (if (share <= 0) then { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = 0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = 1; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled } else { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = share; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = share; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled })) (if width = 0 then failwith "division by zero" else (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget / width))))

let v_Vuna_dCompiler_dQuery_dRun_dwaveLeaf = (fun st node -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dcancelRequested st)) (fun cancelled -> (if cancelled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome = "cancel"; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) else (if (if ((v_Vuna_dCompiler_dQuery_dRun_dinStack (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)) then true else ((v_Vuna_dCompiler_dQuery_dRun_dmemKey (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps node))) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome = "cycle"; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) else (match (((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps node)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome = "hit"; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28)); f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dQuery_dRun_dspendBudget st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome = "reject"; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_dwaveCompute node) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryDepValues (dtb__29).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps node)))) (fun result -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woOutcome = "compute"; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woStartUs = t0; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woEndUs = t1; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woValue = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dQuery_dRun_dWaveOut_woFresh = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (result)) })))))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-miss " ^ (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node))) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dQuery_dRun_dcommitAbort = (fun wave st accList node outcome line t0 t1 -> { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb st) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbNote (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) line))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) wave) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)) outcome) t0) t1); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node); Base_dPair.f_Base_dPair_dPair_second = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, accList)) })

let v_Vuna_dCompiler_dQuery_dRun_dcommitErr = (fun wave st accList node msg -> ((fun key -> (if (msg = "cancelled") then ((((((((v_Vuna_dCompiler_dQuery_dRun_dcommitAbort wave) st) accList) node) "cancel") ("cancel " ^ key)) 0) 0) else ((((((((v_Vuna_dCompiler_dQuery_dRun_dcommitAbort wave) st) accList) node) "error") (String.concat "" ["wave-error "; key; " "; msg])) 0) 0))) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)))

let v_Vuna_dCompiler_dQuery_dRun_dcommitHit = (fun wave st accList node wo -> (match (v_Vuna_dCompiler_dQuery_dRun_dwoValueOf wo) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dQuery_dRun_dcommitAbort wave) st) accList) node) "error") ("wave-error " ^ (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node))) (v_Vuna_dCompiler_dQuery_dRun_dwoStartOf wo)) (v_Vuna_dCompiler_dQuery_dRun_dwoEndOf wo))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> ((fun key -> { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb st) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dmarkHit (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) wave) key) "hit") (v_Vuna_dCompiler_dQuery_dRun_dwoStartOf wo)) (v_Vuna_dCompiler_dQuery_dRun_dwoEndOf wo)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = key; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30)) }, accList)) }) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dcommitFresh = (fun wave st accList node deps wo -> (match (v_Vuna_dCompiler_dQuery_dRun_dwoFreshOf wo) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dQuery_dRun_dcommitAbort wave) st) accList) node) "error") ("wave-error " ^ (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node))) (v_Vuna_dCompiler_dQuery_dRun_dwoStartOf wo)) (v_Vuna_dCompiler_dQuery_dRun_dwoEndOf wo))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> ((fun key -> ((fun resolved -> { Base_dPair.f_Base_dPair_dPair_first = (((((((v_Vuna_dCompiler_dQuery_dRun_daddSpan ((v_Vuna_dCompiler_dQuery_dRun_dwithDb st) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf resolved)))) (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq) wave) key) (Base_dPair.v_Base_dPair_dsecondOf resolved)) (v_Vuna_dCompiler_dQuery_dRun_dwoStartOf wo)) (v_Vuna_dCompiler_dQuery_dRun_dwoEndOf wo)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = key; Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf resolved)))) }, accList)) }) ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolveTagged (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb) key) deps) dtb__31))) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dcommitOut = (fun wave st accList node deps wo -> (if ((v_Vuna_dCompiler_dQuery_dRun_dwoOutcomeOf wo) = "hit") then (((((v_Vuna_dCompiler_dQuery_dRun_dcommitHit wave) st) accList) node) wo) else (if ((v_Vuna_dCompiler_dQuery_dRun_dwoOutcomeOf wo) = "compute") then ((((((v_Vuna_dCompiler_dQuery_dRun_dcommitFresh wave) st) accList) node) deps) wo) else ((fun other -> ((((((((v_Vuna_dCompiler_dQuery_dRun_dcommitAbort wave) st) accList) node) other) (String.concat "" [other; " "; (v_Vuna_dCompiler_dQuery_dRun_dwaveKey node)])) (v_Vuna_dCompiler_dQuery_dRun_dwoStartOf wo)) (v_Vuna_dCompiler_dQuery_dRun_dwoEndOf wo))) (v_Vuna_dCompiler_dQuery_dRun_dwoOutcomeOf wo)))))

let v_Vuna_dCompiler_dQuery_dRun_dcommitOne = (fun wave acc pr -> ((fun st -> ((fun accList -> ((fun node -> (match (Base_dPair.v_Base_dPair_dsecondOf pr) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__32) -> (((((v_Vuna_dCompiler_dQuery_dRun_dcommitErr wave) st) accList) node) dtb__32)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__33) -> ((((((v_Vuna_dCompiler_dQuery_dRun_dcommitOut wave) st) accList) node) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps node)) dtb__33)
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dfirstOf pr))) (Base_dPair.v_Base_dPair_dsecondOf acc))) (Base_dPair.v_Base_dPair_dfirstOf acc)))

let v_Vuna_dCompiler_dQuery_dRun_dcountFresh = (fun acc pr -> (match (Base_dPair.v_Base_dPair_dsecondOf pr) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__34) -> acc
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__35) -> (if ((v_Vuna_dCompiler_dQuery_dRun_dwoOutcomeOf dtb__35) = "compute") then (acc + 1) else acc)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dfreshCount = (fun pairs -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dQuery_dRun_dcountFresh) 0) pairs))

let v_Vuna_dCompiler_dQuery_dRun_dchargeWave = (fun st spent -> (if ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 <= 0) then { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps + spent); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled } else { f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsDb; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsStack; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget = ((v_Vuna_dCompiler_dQuery_dRun_dmaxInt 0) ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget - spent)); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0 = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsBudget0; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps = ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSteps + spent); f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpans; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsSpanSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq; f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled = (st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsCancelled }))

let v_Vuna_dCompiler_dQuery_dRun_dcommitWave = (fun st wave pairs -> ((fun stW -> ((fun folded -> ((fun st1 -> ((fun st2 -> { Base_dPair.f_Base_dPair_dPair_first = st2; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf folded)) }) ((v_Vuna_dCompiler_dQuery_dRun_dchargeWave st1) (v_Vuna_dCompiler_dQuery_dRun_dfreshCount pairs)))) (Base_dPair.v_Base_dPair_dfirstOf folded))) (((Base_dList.v_Base_dList_dfoldl (v_Vuna_dCompiler_dQuery_dRun_dcommitOne wave)) { Base_dPair.f_Base_dPair_dPair_first = stW; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }) pairs))) ((v_Vuna_dCompiler_dQuery_dRun_dwithWave st) wave)))

let rec v_Vuna_dCompiler_dQuery_dRun_dkeysUnique = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__36)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_dRun_dwaveKey) dtb__37))) then (v_Vuna_dCompiler_dQuery_dRun_dkeysUnique dtb__37) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dRun_ddepHitsWave = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if ((Base_dList.v_Base_dList_dmemName dtb__38) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_dRun_dwaveKey) mc1)) then true else ((v_Vuna_dCompiler_dQuery_dRun_ddepHitsWave dtb__39) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dRun_ddepsClosed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dQuery_dRun_ddepHitsWave (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps dtb__40)) mc1)) then ((v_Vuna_dCompiler_dQuery_dRun_ddepsClosed dtb__41) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dnodesIndependent = (fun nodes -> (if (v_Vuna_dCompiler_dQuery_dRun_dkeysUnique nodes) then ((v_Vuna_dCompiler_dQuery_dRun_ddepsClosed nodes) nodes) else false))

let rec v_Vuna_dCompiler_dQuery_dRun_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__42)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_dmapEff mc0) dtb__43)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_drunWaveParallel = (fun st nodes -> ((fun width -> ((fun childSt -> ((fun wave -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Base_dEffSched.v_Base_dEffSched_dnewScope) (fun sc -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_dmapEff (fun n -> ((Base_dEffSched.v_Base_dEffSched_dforkTask sc) ((v_Vuna_dCompiler_dQuery_dRun_dwaveLeaf childSt) n)))) nodes)) (fun tasks -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_dmapEff (fun t -> (Base_dEffSched.v_Base_dEffSched_dawaitTask t))) tasks)) (fun outs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffSched.v_Base_dEffSched_dscopeWait sc)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dQuery_dRun_dcommitWave st) wave) ((Base_dList.v_Base_dList_dzip nodes) outs)))))))))))) ((st).f_Vuna_dCompiler_dQuery_dRun_dRunState_rsWaveSeq + 1))) ((v_Vuna_dCompiler_dQuery_dRun_dwaveSlice st) width))) (v_Vuna_dCompiler_dQuery_dRun_dlistLen nodes)))

let v_Vuna_dCompiler_dQuery_dRun_drunWaveReady = (fun st nodes -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dcancelRequested st)) (fun cancelled -> (if cancelled then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dQuery_dRun_dcancelWave st) nodes)) else ((v_Vuna_dCompiler_dQuery_dRun_drunWaveParallel st) nodes)))))

let v_Vuna_dCompiler_dQuery_dRun_drunWave = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dQuery_dRun_drunNode mc0) (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__44)) (v_Vuna_dCompiler_dQuery_dRun_dwaveDeps dtb__44)) (v_Vuna_dCompiler_dQuery_dRun_dwaveCompute dtb__44))) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf r); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dQuery_dRun_dwaveKey dtb__44); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }, Base_dList.C_Base_dList_dList_Nil)) })))
  | _ -> (if (v_Vuna_dCompiler_dQuery_dRun_dnodesIndependent mc1) then ((v_Vuna_dCompiler_dQuery_dRun_drunWaveReady mc0) mc1) else ((v_Vuna_dCompiler_dQuery_dRun_drunWaveSeq mc0) mc1))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec = "query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema = "vuna-query-index 1"

let v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema; "/"; tag]))))

let v_Vuna_dCompiler_dQuery_dRun_dencVal = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__46) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__46) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__47) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__47) mc1))
  | Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecVal = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__49; Base_dPair.f_Base_dPair_dPair_second = dtb__50 } -> (if (dtb__49 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker; Base_dPair.f_Base_dPair_dPair_second = dtb__50 })) else (if (dtb__49 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (match dtb__51 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__52)); Base_dPair.f_Base_dPair_dPair_second = dtb__53 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__50)) else (if (dtb__49 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (match dtb__54 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = dtb__56 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__55)); Base_dPair.f_Base_dPair_dPair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__50)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) c))))

let v_Vuna_dCompiler_dQuery_dRun_dencDep = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__57; Base_dPair.f_Base_dPair_dPair_second = dtb__58 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__57) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__58) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecDep = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (match dtb__62 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__63; Base_dPair.f_Base_dPair_dPair_second = dtb__64 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__63 }; Base_dPair.f_Base_dPair_dPair_second = dtb__64 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__65; Base_dPair.f_Base_dPair_dPair_second = dtb__66 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__65) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencDep) (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps) ((v_Vuna_dCompiler_dQuery_dRun_dencVal (dtb__66).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal) mc1)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> (match dtb__67 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__68; Base_dPair.f_Base_dPair_dPair_second = dtb__69 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (match dtb__70 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (match dtb__73 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__74; Base_dPair.f_Base_dPair_dPair_second = dtb__75 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (match dtb__76 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__77; Base_dPair.f_Base_dPair_dPair_second = dtb__78 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> (match dtb__79 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> (match dtb__82 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = dtb__84 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (match dtb__85 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__86; Base_dPair.f_Base_dPair_dPair_second = dtb__87 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__68; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeps = dtb__83; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = dtb__80; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryDigest = dtb__71; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = dtb__74; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryVal = dtb__86; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dEntry_entryHits = dtb__77 } }; Base_dPair.f_Base_dPair_dPair_second = dtb__87 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dQuery_dRun_ddecVal (fuel - 1)) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecDep) (fuel - 1)) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__78))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__72))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__69))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)))

let v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex = (fun db -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (db).Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap)))

let v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (match dtb__88 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__89; Base_dPair.f_Base_dPair_dPair_second = dtb__90 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__90) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) dtb__89); Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dQuery.f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbOriginOf Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

let v_Vuna_dCompiler_dQuery_dRun_dhashContentKey = (fun bucket -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey bucket))

let v_Vuna_dCompiler_dQuery_dRun_dsessionPath = (fun bucket -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey bucket)); "/index"])))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionLoad = (fun opts -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> (match (v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete dtb__91) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin dtb__92) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbWithOrigin Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbEmpty) (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-index-reject len=" ^ (bi_strFromInt (bi_strLength dtb__91)))) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dQuery_dRun_dsessionSave = (fun opts db -> (if (if (Base_dBool.v_Base_dBool_dnot (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist) then true else ((opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = "")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dQuery_dRun_dsessionPath (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreCacheBaseEff) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff (String.concat "" [dir; "/query/"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dRun_dhashContentKey (opts).f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket))]))) (fun _u -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff tag) v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec) path) (v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex db))))))))))))
