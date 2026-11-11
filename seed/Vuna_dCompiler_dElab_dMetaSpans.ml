open Vuna_runtime
let v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan = (fun ec m sp -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans ec) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = sp }, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans ec)))))

let rec v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> (if (dtb__2 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3)) else ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf = (fun ec m -> ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans ec)))

let v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt = (fun sp ctx ec -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan (Base_dPair.v_Base_dPair_dsecondOf p)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) sp) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec)))

let v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta = (fun ctx ec sp ty name -> ((fun m -> ((fun p -> ((fun ec1 -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan ec1) m) sp) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddGoal (Base_dPair.v_Base_dPair_dsecondOf p)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = m; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan = sp; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType = ty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx = (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = name }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))
