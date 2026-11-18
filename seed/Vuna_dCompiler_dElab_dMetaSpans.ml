open Vuna_runtime
# 21 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan = (fun ec m sp -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = m; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp }, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans ec)))))

# 29 "Vuna/Compiler/Elab/MetaSpans.vuna"
let rec v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> (if (dtb__2 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3)) else ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf = (fun ec m -> ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decMetaSpans ec)))

# 34 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt = (fun sp ctx ec -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) sp) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec)))

# 42 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta = (fun ctx ec sp ty name -> ((fun m -> ((fun p -> ((fun ec1 -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan ec1) m) sp) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddGoal (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = m; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan = sp; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType = ty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx = (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = name }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))
