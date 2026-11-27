open Vuna_runtime
# 21 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_recordMetaSpan = (fun (dtb_u_u1 : Elab_dTypes.t_Ec) (dtb_u_u2 : int) (dtb_u_u3 : Base_dSource.t_Span) -> ((Elab_dTypes.v_ecPutMetaSpans dtb_u_u1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2; B_dData_dPair.f_Pair_second = dtb_u_u3 }, (Elab_dTypes.v_ecMetaSpans dtb_u_u1)))))

# 29 "Vuna/Compiler/Elab/MetaSpans.vuna"
let rec v_lookupMeta = (fun (dtb_u_u4 : int) (dtb_u_u5 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (match dtb_u_u6 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u8; B_dData_dPair.f_Pair_second = dtb_u_u9 } -> (if (dtb_u_u8 = dtb_u_u4) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9)) else ((v_lookupMeta dtb_u_u4) dtb_u_u7))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_metaSpanOf = (fun (dtb_u_u10 : Elab_dTypes.t_Ec) (dtb_u_u11 : int) -> ((v_lookupMeta dtb_u_u11) (Elab_dTypes.v_ecMetaSpans dtb_u_u10)))

# 34 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_newMetaAt = (fun (dtb_u_u12 : Base_dSource.t_Span) (dtb_u_u13 : Elab_dTypes.t_Ctx) (dtb_u_u14 : Elab_dTypes.t_Ec) -> (let dtb_u_u15 = ((Elab_dTypes.v_newMeta dtb_u_u13) dtb_u_u14) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u15); B_dData_dPair.f_Pair_second = (((v_recordMetaSpan (B_dData_dPair.v_secondOf dtb_u_u15)) (Elab_dTypes.v_ecNext dtb_u_u14)) dtb_u_u12) }))

# 42 "Vuna/Compiler/Elab/MetaSpans.vuna"
let v_newHoleMeta = (fun (dtb_u_u16 : Elab_dTypes.t_Ctx) (dtb_u_u17 : Elab_dTypes.t_Ec) (dtb_u_u18 : Base_dSource.t_Span) (dtb_u_u19 : Core_dTerm.t_Value) (dtb_u_u20 : string) -> (let dtb_u_u21 = (Elab_dTypes.v_ecNext dtb_u_u17) in (let dtb_u_u22 = ((Elab_dTypes.v_newMeta dtb_u_u16) dtb_u_u17) in (let dtb_u_u23 = ((Elab_dTypes.v_ecAddGoal (B_dData_dPair.v_secondOf dtb_u_u22)) { Elab_dTypes.f_DtGoal_dtGoalMeta = dtb_u_u21; Elab_dTypes.f_DtGoal_dtGoalSpan = dtb_u_u18; Elab_dTypes.f_DtGoal_dtGoalType = dtb_u_u19; Elab_dTypes.f_DtGoal_dtGoalCtx = (dtb_u_u16).Elab_dTypes.f_Ctx_ctxItems; Elab_dTypes.f_DtGoal_dtGoalName = dtb_u_u20 }) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u22); B_dData_dPair.f_Pair_second = (((v_recordMetaSpan dtb_u_u23) dtb_u_u21) dtb_u_u18) }))))
