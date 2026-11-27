open Vuna_runtime
# 21 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_recordMetaSpan = (fun (ec : Elab_dTypes.t_Ec) (m : int) (sp : Base_dSource.t_Span) -> ((Elab_dTypes.v_ecPutMetaSpans ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = sp }, (Elab_dTypes.v_ecMetaSpans ec)))))

# 29 "Vuna/Compiler/Elab/MetaSpans.vuna"
let rec v_lookupMeta = (fun (mc0 : int) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (if (dtb__2 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_lookupMeta mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_metaSpanOf = (fun (ec : Elab_dTypes.t_Ec) (m : int) -> ((v_lookupMeta m) (Elab_dTypes.v_ecMetaSpans ec)))

# 34 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_newMetaAt = (fun (sp : Base_dSource.t_Span) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) -> (let p = ((Elab_dTypes.v_newMeta ctx) ec) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_recordMetaSpan (B_dData_dPair.v_secondOf p)) (Elab_dTypes.v_ecNext ec)) sp) }))

# 42 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_newHoleMeta = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (ty : Core_dTerm.t_Value) (name : string) -> (let m = (Elab_dTypes.v_ecNext ec) in (let p = ((Elab_dTypes.v_newMeta ctx) ec) in (let ec1 = ((Elab_dTypes.v_ecAddGoal (B_dData_dPair.v_secondOf p)) { Elab_dTypes.f_DtGoal_dtGoalMeta = m; Elab_dTypes.f_DtGoal_dtGoalSpan = sp; Elab_dTypes.f_DtGoal_dtGoalType = ty; Elab_dTypes.f_DtGoal_dtGoalCtx = (ctx).Elab_dTypes.f_Ctx_ctxItems; Elab_dTypes.f_DtGoal_dtGoalName = name }) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_recordMetaSpan ec1) m) sp) }))))
