open Vuna_runtime
type t_ProjEntry = { f_ProjEntry_peName : string; f_ProjEntry_peCtor : string; f_ProjEntry_peField : int }
and t_DefShape = { f_DefShape_dsName : string; f_DefShape_dsPrefix : int; f_DefShape_dsArity : int }
and t_ConvCtx = { f_ConvCtx_ccProjs : t_ProjEntry B_dData_dList.t_List; f_ConvCtx_ccDicts : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ConvCtx_ccShapes : t_DefShape B_dData_dList.t_List; f_ConvCtx_ccClasses : Elab_dTypes.t_DtClass B_dData_dList.t_List; f_ConvCtx_ccFields : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ConvCtx_ccSpan : Base_dSource.t_Span }
and t_Group = { f_Group_grName : string; f_Group_grParams : string B_dData_dList.t_List; f_Group_grBody : Frontend_dAst.t_Expr; f_Group_grSpan : Base_dSource.t_Span }

# 38 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictGroupKey = (fun (dtb_u_u1 : string) (dtb_u_u2 : string) -> (String.concat "" [dtb_u_u1; "#"; dtb_u_u2]))

# 52 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peNameOf = (fun (dtb_u_u3 : t_ProjEntry) -> (dtb_u_u3).f_ProjEntry_peName)

# 86 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grNameOf = (fun (dtb_u_u4 : t_Group) -> (dtb_u_u4).f_Group_grName)

# 100 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupToDecl = (fun (dtb_u_u5 : t_Group) -> (Frontend_dAst.C_Decl_DFun ((dtb_u_u5).f_Group_grName, ((B_dData_dList.v_map (fun (dtb_u_u6 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u6, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))))) (dtb_u_u5).f_Group_grParams), (dtb_u_u5).f_Group_grBody, (Frontend_dAst.v_detachedNodeRef (dtb_u_u5).f_Group_grSpan))))

# 186 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupDictCtor = (fun (dtb_u_u7 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u8 : string) -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (if ((Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName dtb_u_u9)) = dtb_u_u8) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9)) else ((v_lookupDictCtor dtb_u_u10) dtb_u_u8))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_lookupCtorClass = v_lookupDictCtor

# 194 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_lookupDictClass = (fun (dtb_u_u11 : t_ConvCtx) (dtb_u_u12 : string) -> (let dtb_u_u13 = ((B_dData_dList.v_filter (fun (dtb_u_u18 : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf dtb_u_u18) = dtb_u_u12))) (dtb_u_u11).f_ConvCtx_ccDicts) in (match dtb_u_u13 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u14 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u16; B_dData_dPair.f_Pair_second = dtb_u_u17 } -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u17))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 200 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupClassByName = (fun (dtb_u_u19 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u20 : string) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (if ((Elab_dTypes.v_dtClassName dtb_u_u21) = dtb_u_u20) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u21)) else ((v_lookupClassByName dtb_u_u22) dtb_u_u20))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupProjEntry = (fun (dtb_u_u23 : string) (dtb_u_u24 : t_ProjEntry B_dData_dList.t_List) -> (match dtb_u_u24 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u25, dtb_u_u26) -> (if ((dtb_u_u25).f_ProjEntry_peName = dtb_u_u23) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u25)) else ((v_lookupProjEntry dtb_u_u23) dtb_u_u26))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_shapeGo = (fun (dtb_u_u27 : Core_dTerm.t_Term) (dtb_u_u28 : int) (dtb_u_u29 : int) -> (match dtb_u_u27 with
  | Core_dTerm.C_Term_TPi (dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (if dtb_u_u31 then (((v_shapeGo dtb_u_u34) (if (Core_dTerm.v_rigIsErased dtb_u_u32) then dtb_u_u28 else (dtb_u_u28 + 1))) dtb_u_u29) else (((v_shapeGo dtb_u_u34) dtb_u_u28) (if (Core_dTerm.v_rigIsErased dtb_u_u32) then dtb_u_u29 else (dtb_u_u29 + 1))))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u28; B_dData_dPair.f_Pair_second = dtb_u_u29 }
))

# 221 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_shapeOfTy = (fun (dtb_u_u35 : Core_dTerm.t_Term) -> (((v_shapeGo dtb_u_u35) 0) 0))

# 212 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_defShape = (fun (dtb_u_u36 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u36) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u37) -> (let dtb_u_u38 = (v_shapeOfTy (Elab_dTypes.v_dtDefType dtb_u_u36)) in (B_dData_dMaybe.C_Maybe_Just ({ f_DefShape_dsName = (Elab_dTypes.v_dtDefName dtb_u_u36); f_DefShape_dsPrefix = (B_dData_dPair.v_firstOf dtb_u_u38); f_DefShape_dsArity = (B_dData_dPair.v_secondOf dtb_u_u38) })))
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupShape = (fun (dtb_u_u39 : string) (dtb_u_u40 : t_DefShape B_dData_dList.t_List) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (if ((dtb_u_u41).f_DefShape_dsName = dtb_u_u39) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u41)) else ((v_lookupShape dtb_u_u39) dtb_u_u42))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_stripGo = (fun (dtb_u_u43 : Core_dTerm.t_Term) (dtb_u_u44 : Core_dTerm.t_Term) (dtb_u_u45 : string B_dData_dList.t_List) -> (match dtb_u_u43 with
  | Core_dTerm.C_Term_TPi (dtb_u_u46, dtb_u_u47, dtb_u_u48, dtb_u_u49, dtb_u_u50) -> (match dtb_u_u44 with
  | Core_dTerm.C_Term_TLam (dtb_u_u51, dtb_u_u52, dtb_u_u53, dtb_u_u54, dtb_u_u55) -> (let dtb_u_u56 = (if (if (B_dData_dBool.v_not dtb_u_u47) then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u48)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u52)) else false) in (let dtb_u_u57 = (if dtb_u_u56 then ((B_dData_dList.v_append dtb_u_u45) (B_dData_dList.C_List__x58__x58_ (dtb_u_u51, B_dData_dList.C_List_Nil))) else dtb_u_u45) in (((v_stripGo dtb_u_u50) dtb_u_u55) dtb_u_u57)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u45; B_dData_dPair.f_Pair_second = dtb_u_u44 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u45; B_dData_dPair.f_Pair_second = dtb_u_u44 }
))

# 239 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_stripLeading = (fun (dtb_u_u58 : Core_dTerm.t_Term) (dtb_u_u59 : Core_dTerm.t_Term) -> (((v_stripGo dtb_u_u58) dtb_u_u59) B_dData_dList.C_List_Nil))

# 340 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let[@tail_mod_cons] rec v_convBinders = (fun (dtb_u_u60 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (match dtb_u_u60 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u61, dtb_u_u62) -> (match dtb_u_u61 with
  | { Core_dTerm.f_Binder_binderName = dtb_u_u63; Core_dTerm.f_Binder_binderRig = dtb_u_u64; Core_dTerm.f_Binder_binderSpan = dtb_u_u65 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u64) then (v_convBinders dtb_u_u62) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar (dtb_u_u63, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))), (v_convBinders dtb_u_u62))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_altPattern = (fun (dtb_u_u66 : string) (dtb_u_u67 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (if (dtb_u_u66 = "") then (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))) else (Frontend_dAst.C_Pat_PCon (dtb_u_u66, (v_convBinders dtb_u_u67), (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty)))))

# 348 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_applyAcc = (fun (dtb_u_u68 : t_ConvCtx) (dtb_u_u69 : Frontend_dAst.t_Expr) (dtb_u_u70 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u70 with
  | B_dData_dList.C_List_Nil -> dtb_u_u69
  | _ -> (Frontend_dAst.C_Expr_EApp (dtb_u_u69, dtb_u_u70, (Frontend_dAst.v_detachedNodeRef (dtb_u_u68).f_ConvCtx_ccSpan)))
))

# 352 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_tagApply = (fun (dtb_u_u71 : t_ConvCtx) (dtb_u_u72 : string) (dtb_u_u73 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u74 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (((v_applyAcc dtb_u_u71) (((v_applyAcc dtb_u_u71) (Frontend_dAst.C_Expr_EVar (dtb_u_u72, (Frontend_dAst.v_detachedNodeRef (dtb_u_u71).f_ConvCtx_ccSpan)))) dtb_u_u73)) dtb_u_u74))

# 399 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_nestApp = (fun (dtb_u_u75 : t_ConvCtx) (dtb_u_u76 : Frontend_dAst.t_Expr) (dtb_u_u77 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (((v_nestApp dtb_u_u75) (Frontend_dAst.C_Expr_EApp (dtb_u_u76, (B_dData_dList.C_List__x58__x58_ (dtb_u_u78, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (dtb_u_u75).f_ConvCtx_ccSpan)))) dtb_u_u79)
  | B_dData_dList.C_List_Nil -> dtb_u_u76
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldMetaName = (fun (dtb_u_u80 : Elab_dTypes.t_DtFieldMeta) -> (let dtb_u_u81 = (dtb_u_u80).Elab_dTypes.f_DtFieldMeta_dtFieldName in dtb_u_u81))

# 413 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_recordFieldTable = (fun (dtb_u_u82 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u82 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u83, dtb_u_u84) -> (match (Elab_dTypes.v_dtDataFields dtb_u_u83) with
  | B_dData_dList.C_List_Nil -> (v_recordFieldTable dtb_u_u84)
  | dtb_u_u85 -> (let dtb_u_u86 = ((B_dData_dList.v_map v_fieldMetaName) dtb_u_u85) in (let dtb_u_u87 = ((B_dData_dList.v_map (fun (dtb_u_u88 : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u88); B_dData_dPair.f_Pair_second = dtb_u_u86 })) (Elab_dTypes.v_dtDataCtors dtb_u_u83)) in ((B_dData_dList.v_append dtb_u_u87) (v_recordFieldTable dtb_u_u84))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupFieldNames = (fun (dtb_u_u89 : string) (dtb_u_u90 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u90 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (match dtb_u_u91 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u93; B_dData_dPair.f_Pair_second = dtb_u_u94 } -> (if (dtb_u_u93 = dtb_u_u89) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u94)) else ((v_lookupFieldNames dtb_u_u89) dtb_u_u92))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_peelLams = (fun (dtb_u_u95 : Core_dTerm.t_Term) -> (match dtb_u_u95 with
  | Core_dTerm.C_Term_TLam (dtb_u_u96, dtb_u_u97, dtb_u_u98, dtb_u_u99, dtb_u_u100) -> (v_peelLams dtb_u_u100)
  | _ -> dtb_u_u95
))

# 132 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictFieldsOf = (fun (dtb_u_u101 : t_ConvCtx) (dtb_u_u102 : Core_dTerm.t_Term) -> (match (v_peelLams dtb_u_u102) with
  | Core_dTerm.C_Term_TCon (dtb_u_u103, dtb_u_u104) -> (match ((v_lookupDictCtor (dtb_u_u101).f_ConvCtx_ccClasses) dtb_u_u103) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u105) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u103; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 174 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictSymbolOf = (fun (dtb_u_u106 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u107 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u107) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u108) -> (match (v_peelLams dtb_u_u108) with
  | Core_dTerm.C_Term_TCon (dtb_u_u109, dtb_u_u110) -> (match ((v_lookupCtorClass dtb_u_u106) dtb_u_u109) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u111) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u107); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtClassName dtb_u_u111) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictSymbolsOf = (fun (dtb_u_u112 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u113 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_mapMaybe (v_dictSymbolOf dtb_u_u112)) dtb_u_u113))

# 451 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_nthAt = (fun dtb_u_u115 (dtb_u_u116 : int) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u117, dtb_u_u118) -> (if (dtb_u_u116 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u117)) else ((v_nthAt dtb_u_u118) (dtb_u_u116 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_teleName = (fun (dtb_u_u119 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u120 : int) -> (let dtb_u_u121 = ((v_nthAt dtb_u_u119) dtb_u_u120) in (match dtb_u_u121 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u122) -> (match dtb_u_u122 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u123; B_dData_dPair.f_Pair_second = dtb_u_u124 } -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u123))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 424 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldNameAt = (fun (dtb_u_u125 : t_ConvCtx) (dtb_u_u126 : string) (dtb_u_u127 : int) (dtb_u_u128 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_lookupFieldNames dtb_u_u126) (dtb_u_u125).f_ConvCtx_ccFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u129) -> (match ((v_nthAt dtb_u_u129) dtb_u_u127) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u130) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u130))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_teleName dtb_u_u128) dtb_u_u127)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_teleName dtb_u_u128) dtb_u_u127)
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let[@tail_mod_cons] rec v_takeGo = (fun (dtb_u_u132 : int) dtb_u_u133 -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u134, dtb_u_u135) -> (if (dtb_u_u132 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u134, ((v_takeGo (dtb_u_u132 - 1)) dtb_u_u135))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_takeCount = (fun (dtb_u_u137 : int) dtb_u_u138 -> (if (dtb_u_u137 <= 0) then B_dData_dList.C_List_Nil else ((v_takeGo dtb_u_u137) dtb_u_u138)))

# 465 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_dropGo = (fun (dtb_u_u140 : int) dtb_u_u141 -> (match dtb_u_u141 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u142, dtb_u_u143) -> (if (dtb_u_u140 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, dtb_u_u143)) else ((v_dropGo (dtb_u_u140 - 1)) dtb_u_u143))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dropCount = (fun (dtb_u_u145 : int) dtb_u_u146 -> (if (dtb_u_u145 <= 0) then dtb_u_u146 else ((v_dropGo dtb_u_u145) dtb_u_u146)))

# 383 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_applyNamed = (fun (dtb_u_u147 : t_ConvCtx) (dtb_u_u148 : string) (dtb_u_u149 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match ((v_lookupShape dtb_u_u148) (dtb_u_u147).f_ConvCtx_ccShapes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u150) -> (let dtb_u_u151 = ((v_dropCount (dtb_u_u150).f_DefShape_dsPrefix) dtb_u_u149) in (let dtb_u_u152 = (Frontend_dAst.C_Expr_EVar (dtb_u_u148, (Frontend_dAst.v_detachedNodeRef (dtb_u_u147).f_ConvCtx_ccSpan))) in (match dtb_u_u151 with
  | B_dData_dList.C_List_Nil -> dtb_u_u152
  | _ -> (((v_nestApp dtb_u_u147) (Frontend_dAst.C_Expr_EApp (dtb_u_u152, ((v_takeCount (dtb_u_u150).f_DefShape_dsArity) dtb_u_u151), (Frontend_dAst.v_detachedNodeRef (dtb_u_u147).f_ConvCtx_ccSpan)))) ((v_dropCount (dtb_u_u150).f_DefShape_dsArity) dtb_u_u151))
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyAcc dtb_u_u147) (Frontend_dAst.C_Expr_EVar (dtb_u_u148, (Frontend_dAst.v_detachedNodeRef (dtb_u_u147).f_ConvCtx_ccSpan)))) dtb_u_u149)
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_appGlobal = (fun (dtb_u_u153 : t_ConvCtx) (dtb_u_u154 : string) (dtb_u_u155 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match ((v_lookupProjEntry dtb_u_u154) (dtb_u_u153).f_ConvCtx_ccProjs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u156) -> (match dtb_u_u155 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> (match dtb_u_u157 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u159, dtb_u_u160) -> (match ((v_lookupDictClass dtb_u_u153) dtb_u_u159) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u161) -> (match ((v_lookupClassByName (dtb_u_u153).f_ConvCtx_ccClasses) dtb_u_u161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u162) -> (let dtb_u_u163 = ((v_nthAt (dtb_u_u162).Elab_dTypes.f_DtClass_dtClassMethods) (dtb_u_u156).f_ProjEntry_peField) in (match dtb_u_u163 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u164) -> (match dtb_u_u164 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u165; B_dData_dPair.f_Pair_second = dtb_u_u166 } -> (((v_applyAcc dtb_u_u153) (Frontend_dAst.C_Expr_EVar (((v_dictGroupKey dtb_u_u159) dtb_u_u165), (Frontend_dAst.v_detachedNodeRef (dtb_u_u153).f_ConvCtx_ccSpan)))) dtb_u_u158)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
)
  | B_dData_dList.C_List_Nil -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed dtb_u_u153) dtb_u_u154) dtb_u_u155)
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_convExpr = (fun (dtb_u_u167 : t_ConvCtx) (dtb_u_u168 : Core_dTerm.t_Term) -> (match (Core_dTerm.v_natChainValue dtb_u_u168) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u169) -> (Frontend_dAst.C_Expr_EInt (dtb_u_u169, (Frontend_dAst.v_detachedNodeRef (dtb_u_u167).f_ConvCtx_ccSpan)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_convGo dtb_u_u167) dtb_u_u168) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 268 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convGo = (fun (dtb_u_u170 : t_ConvCtx) (dtb_u_u171 : Core_dTerm.t_Term) (dtb_u_u172 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u171 with
  | Core_dTerm.C_Term_TApp (dtb_u_u173, dtb_u_u174, dtb_u_u175) -> (match dtb_u_u175 with
  | Core_dTerm.C_Rig_Rig0 -> (((v_convGo dtb_u_u170) dtb_u_u173) dtb_u_u172)
  | _ -> (((v_convGo dtb_u_u170) dtb_u_u173) (B_dData_dList.C_List__x58__x58_ (((v_convExpr dtb_u_u170) dtb_u_u174), dtb_u_u172)))
)
  | Core_dTerm.C_Term_TLam (dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179, dtb_u_u180) -> (match dtb_u_u172 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (if (Core_dTerm.v_rigIsErased dtb_u_u177) then (((v_convGo dtb_u_u170) dtb_u_u180) (B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182))) else (Frontend_dAst.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb_u_u176, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u181)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = (Frontend_dAst.v_detachedNodeRef (dtb_u_u170).f_ConvCtx_ccSpan) }, B_dData_dList.C_List_Nil)), (((v_convGo dtb_u_u170) dtb_u_u180) dtb_u_u182), false, (Frontend_dAst.v_detachedNodeRef (dtb_u_u170).f_ConvCtx_ccSpan))))
  | B_dData_dList.C_List_Nil -> (if (Core_dTerm.v_rigIsErased dtb_u_u177) then (((v_convGo dtb_u_u170) dtb_u_u180) B_dData_dList.C_List_Nil) else (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u176; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (((v_convGo dtb_u_u170) dtb_u_u180) B_dData_dList.C_List_Nil), (Frontend_dAst.v_detachedNodeRef (dtb_u_u170).f_ConvCtx_ccSpan))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_convLeaf dtb_u_u170) dtb_u_u171) dtb_u_u172)
))
# 294 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convLeaf = (fun (dtb_u_u183 : t_ConvCtx) (dtb_u_u184 : Core_dTerm.t_Term) (dtb_u_u185 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u184 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u186) -> (((v_appGlobal dtb_u_u183) dtb_u_u186) dtb_u_u185)
  | Core_dTerm.C_Term_TVar (dtb_u_u187, dtb_u_u188, dtb_u_u189) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EVar (dtb_u_u187, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TCon (dtb_u_u190, dtb_u_u191) -> ((((v_tagApply dtb_u_u183) dtb_u_u190) ((v_convArgs dtb_u_u183) dtb_u_u191)) dtb_u_u185)
  | Core_dTerm.C_Term_TMk (dtb_u_u192, dtb_u_u193) -> ((((v_tagApply dtb_u_u183) dtb_u_u192) ((v_convArgs dtb_u_u183) dtb_u_u193)) dtb_u_u185)
  | Core_dTerm.C_Term_TRecord (dtb_u_u194, dtb_u_u195) -> ((((v_tagApply dtb_u_u183) dtb_u_u194) ((v_convArgs dtb_u_u183) dtb_u_u195)) dtb_u_u185)
  | Core_dTerm.C_Term_TProj (dtb_u_u196, dtb_u_u197, dtb_u_u198, dtb_u_u199, dtb_u_u200) -> (match ((((v_fieldNameAt dtb_u_u183) dtb_u_u197) dtb_u_u200) dtb_u_u198) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u201) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EField (((v_convExpr dtb_u_u183) dtb_u_u196), dtb_u_u201, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyAcc dtb_u_u183) ((v_convExpr dtb_u_u183) dtb_u_u196)) dtb_u_u185)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u202, dtb_u_u203, dtb_u_u204, dtb_u_u205, dtb_u_u206) -> (((v_applyAcc dtb_u_u183) ((v_convExpr dtb_u_u183) dtb_u_u202)) dtb_u_u185)
  | Core_dTerm.C_Term_TCase (dtb_u_u207, dtb_u_u208) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_ECase (((v_convExpr dtb_u_u183) dtb_u_u207), ((v_convAlts dtb_u_u183) dtb_u_u208), (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TIf (dtb_u_u209, dtb_u_u210, dtb_u_u211) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EIf (((v_convExpr dtb_u_u183) dtb_u_u209), ((v_convExpr dtb_u_u183) dtb_u_u210), ((v_convExpr dtb_u_u183) dtb_u_u211), (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TInt (dtb_u_u212) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EInt (dtb_u_u212, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TBool (dtb_u_u213) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EInt ((if dtb_u_u213 then 1 else 0), (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TStr (dtb_u_u214) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EStr (dtb_u_u214, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | Core_dTerm.C_Term_TFloat (dtb_u_u215) -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EStr (dtb_u_u215, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
  | _ -> (((v_applyAcc dtb_u_u183) (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef (dtb_u_u183).f_ConvCtx_ccSpan)))) dtb_u_u185)
))
# 324 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convArgs = (fun (dtb_u_u216 : t_ConvCtx) (dtb_u_u217 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u217 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u218, dtb_u_u219) -> (match dtb_u_u218 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u220; B_dData_dPair.f_Pair_second = dtb_u_u221 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u221) then ((v_convArgs dtb_u_u216) dtb_u_u219) else (B_dData_dList.C_List__x58__x58_ (((v_convExpr dtb_u_u216) dtb_u_u220), ((v_convArgs dtb_u_u216) dtb_u_u219))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 329 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convAlts = (fun (dtb_u_u222 : t_ConvCtx) (dtb_u_u223 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u223 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u224, dtb_u_u225) -> (match dtb_u_u224 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u226; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u227; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u228 } -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = ((v_altPattern dtb_u_u226) dtb_u_u227); Frontend_dAst.f_Alt_altBody = ((v_convExpr dtb_u_u222) dtb_u_u228); Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef (dtb_u_u222).f_ConvCtx_ccSpan) }, ((v_convAlts dtb_u_u222) dtb_u_u225)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_dictFieldGroupsGo = (fun (dtb_u_u229 : t_ConvCtx) (dtb_u_u230 : string) (dtb_u_u231 : string) (dtb_u_u232 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u233 : int) -> (match dtb_u_u232 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (match dtb_u_u234 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u236; B_dData_dPair.f_Pair_second = dtb_u_u237 } -> (match ((v_lookupCtorClass (dtb_u_u229).f_ConvCtx_ccClasses) dtb_u_u231) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u235) (dtb_u_u233 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> (match ((v_nthAt (dtb_u_u238).Elab_dTypes.f_DtClass_dtClassMethods) dtb_u_u233) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u235) (dtb_u_u233 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u239) -> (match ((v_nthAt (dtb_u_u238).Elab_dTypes.f_DtClass_dtClassFieldTys) dtb_u_u233) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u235) (dtb_u_u233 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u240) -> (let dtb_u_u241 = (B_dData_dPair.v_firstOf dtb_u_u239) in (let dtb_u_u242 = ((v_stripLeading dtb_u_u240) dtb_u_u236) in (let dtb_u_u243 = { f_Group_grName = ((v_dictGroupKey dtb_u_u230) dtb_u_u241); f_Group_grParams = (B_dData_dPair.v_firstOf dtb_u_u242); f_Group_grBody = ((v_convExpr dtb_u_u229) (B_dData_dPair.v_secondOf dtb_u_u242)); f_Group_grSpan = (dtb_u_u229).f_ConvCtx_ccSpan } in (B_dData_dList.C_List__x58__x58_ (dtb_u_u243, (((((v_dictFieldGroupsGo dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u235) (dtb_u_u233 + 1)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictFieldGroups = (fun (dtb_u_u244 : t_ConvCtx) (dtb_u_u245 : string) (dtb_u_u246 : string) (dtb_u_u247 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_dictFieldGroupsGo dtb_u_u244) dtb_u_u245) dtb_u_u246) dtb_u_u247) 0))

# 115 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupsOfDefGo = (fun (dtb_u_u248 : t_ConvCtx) (dtb_u_u249 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u249) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u250) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDefName dtb_u_u249)) ((B_dData_dList.v_map v_peNameOf) (dtb_u_u248).f_ConvCtx_ccProjs)) then B_dData_dList.C_List_Nil else (let dtb_u_u251 = ((v_dictFieldsOf dtb_u_u248) dtb_u_u250) in (match dtb_u_u251 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u252 = ((v_stripLeading (Elab_dTypes.v_dtDefType dtb_u_u249)) dtb_u_u250) in (B_dData_dList.C_List__x58__x58_ ({ f_Group_grName = (Elab_dTypes.v_dtDefName dtb_u_u249); f_Group_grParams = (B_dData_dPair.v_firstOf dtb_u_u252); f_Group_grBody = ((v_convExpr dtb_u_u248) (B_dData_dPair.v_secondOf dtb_u_u252)); f_Group_grSpan = (dtb_u_u248).f_ConvCtx_ccSpan }, B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u253) -> (match dtb_u_u253 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u254; B_dData_dPair.f_Pair_second = dtb_u_u255 } -> ((((v_dictFieldGroups dtb_u_u248) (Elab_dTypes.v_dtDefName dtb_u_u249)) dtb_u_u254) dtb_u_u255)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupsOfDef = (fun (dtb_u_u256 : t_ProjEntry B_dData_dList.t_List) (dtb_u_u257 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u258 : t_DefShape B_dData_dList.t_List) (dtb_u_u259 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u260 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u261 : Elab_dTypes.t_DtDef) -> (let dtb_u_u262 = ((B_dData_dMaybe.v_fromMaybe Base_dSource.v_spanEmpty) (Elab_dTypes.v_dtDefSpan dtb_u_u261)) in (let dtb_u_u263 = { f_ConvCtx_ccProjs = dtb_u_u256; f_ConvCtx_ccDicts = dtb_u_u257; f_ConvCtx_ccShapes = dtb_u_u258; f_ConvCtx_ccClasses = dtb_u_u259; f_ConvCtx_ccFields = dtb_u_u260; f_ConvCtx_ccSpan = dtb_u_u262 } in ((v_groupsOfDefGo dtb_u_u263) dtb_u_u261))))

# 492 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_peelToCase = (fun (dtb_u_u264 : Core_dTerm.t_Term) -> (match dtb_u_u264 with
  | Core_dTerm.C_Term_TCase (dtb_u_u265, dtb_u_u266) -> (match dtb_u_u266 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u267, dtb_u_u268) -> (match dtb_u_u268 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u267))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Term_TLam (dtb_u_u269, dtb_u_u270, dtb_u_u271, dtb_u_u272, dtb_u_u273) -> (v_peelToCase dtb_u_u273)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 497 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_appHeadVar = (fun (dtb_u_u274 : Core_dTerm.t_Term) -> (match dtb_u_u274 with
  | Core_dTerm.C_Term_TVar (dtb_u_u275, dtb_u_u276, dtb_u_u277) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u275))
  | Core_dTerm.C_Term_TApp (dtb_u_u278, dtb_u_u279, dtb_u_u280) -> (v_appHeadVar dtb_u_u278)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 510 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldVarPrefix = "_f"

# 516 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_parseNatGo = (fun (dtb_u_u281 : int B_dData_dList.t_List) (dtb_u_u282 : int) (dtb_u_u283 : int) -> (match dtb_u_u281 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u284, dtb_u_u285) -> (if (if (dtb_u_u284 >= 48) then (dtb_u_u284 <= 57) else false) then (((v_parseNatGo dtb_u_u285) ((dtb_u_u282 * 10) + (dtb_u_u284 - 48))) (dtb_u_u283 + 1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u283 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u282)))
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_parseNat = (fun (dtb_u_u286 : int B_dData_dList.t_List) -> (((v_parseNatGo dtb_u_u286) 0) 0))

# 503 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldIndexOfVar = (fun (dtb_u_u287 : string) -> (if ((B_dData_dString.v_startsWith v_fieldVarPrefix) dtb_u_u287) then (v_parseNat ((v_dropGo (String.length v_fieldVarPrefix)) (B_dData_dList.dtp_unpack dtb_u_u287))) else B_dData_dMaybe.C_Maybe_Nothing))

# 479 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_projectionShape = (fun (dtb_u_u288 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u288 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u289) -> (match (v_peelToCase dtb_u_u289) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u290) -> (match (v_appHeadVar (Core_dTerm.v_caseAltBody dtb_u_u290)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u291) -> (match (v_fieldIndexOfVar dtb_u_u291) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u292) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.v_caseAltName dtb_u_u290); B_dData_dPair.f_Pair_second = dtb_u_u292 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_projectionTable = (fun (dtb_u_u293 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u293 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u294, dtb_u_u295) -> (let dtb_u_u296 = (v_projectionShape (Elab_dTypes.v_dtDefBody dtb_u_u294)) in (match dtb_u_u296 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionTable dtb_u_u295)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u297) -> (match dtb_u_u297 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u298; B_dData_dPair.f_Pair_second = dtb_u_u299 } -> (B_dData_dList.C_List__x58__x58_ ({ f_ProjEntry_peName = (Elab_dTypes.v_dtDefName dtb_u_u294); f_ProjEntry_peCtor = dtb_u_u298; f_ProjEntry_peField = dtb_u_u299 }, (v_projectionTable dtb_u_u295)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_elabTermInput = (fun (dtb_u_u300 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u301 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u302 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u303 = (v_projectionTable dtb_u_u302) in (let dtb_u_u304 = ((v_dictSymbolsOf dtb_u_u301) dtb_u_u302) in (let dtb_u_u305 = ((B_dData_dList.v_mapMaybe v_defShape) dtb_u_u302) in (let dtb_u_u306 = (v_recordFieldTable dtb_u_u300) in (let dtb_u_u307 = ((B_dData_dList.v_concatMap (((((v_groupsOfDef dtb_u_u303) dtb_u_u304) dtb_u_u305) dtb_u_u301) dtb_u_u306)) dtb_u_u302) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map v_grNameOf) dtb_u_u307); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map v_groupToDecl) dtb_u_u307) }))))))

# 47 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peName = (fun (dtb_u_u308 : t_ProjEntry) -> (match dtb_u_u308 with
  | { f_ProjEntry_peName = dtb_u_u309; f_ProjEntry_peCtor = dtb_u_u310; f_ProjEntry_peField = dtb_u_u311 } -> dtb_u_u309
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peCtor = (fun (dtb_u_u312 : t_ProjEntry) -> (match dtb_u_u312 with
  | { f_ProjEntry_peName = dtb_u_u313; f_ProjEntry_peCtor = dtb_u_u314; f_ProjEntry_peField = dtb_u_u315 } -> dtb_u_u314
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peField = (fun (dtb_u_u316 : t_ProjEntry) -> (match dtb_u_u316 with
  | { f_ProjEntry_peName = dtb_u_u317; f_ProjEntry_peCtor = dtb_u_u318; f_ProjEntry_peField = dtb_u_u319 } -> dtb_u_u319
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsName = (fun (dtb_u_u320 : t_DefShape) -> (match dtb_u_u320 with
  | { f_DefShape_dsName = dtb_u_u321; f_DefShape_dsPrefix = dtb_u_u322; f_DefShape_dsArity = dtb_u_u323 } -> dtb_u_u321
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsPrefix = (fun (dtb_u_u324 : t_DefShape) -> (match dtb_u_u324 with
  | { f_DefShape_dsName = dtb_u_u325; f_DefShape_dsPrefix = dtb_u_u326; f_DefShape_dsArity = dtb_u_u327 } -> dtb_u_u326
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsArity = (fun (dtb_u_u328 : t_DefShape) -> (match dtb_u_u328 with
  | { f_DefShape_dsName = dtb_u_u329; f_DefShape_dsPrefix = dtb_u_u330; f_DefShape_dsArity = dtb_u_u331 } -> dtb_u_u331
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccProjs = (fun (dtb_u_u332 : t_ConvCtx) -> (match dtb_u_u332 with
  | { f_ConvCtx_ccProjs = dtb_u_u333; f_ConvCtx_ccDicts = dtb_u_u334; f_ConvCtx_ccShapes = dtb_u_u335; f_ConvCtx_ccClasses = dtb_u_u336; f_ConvCtx_ccFields = dtb_u_u337; f_ConvCtx_ccSpan = dtb_u_u338 } -> dtb_u_u333
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccDicts = (fun (dtb_u_u339 : t_ConvCtx) -> (match dtb_u_u339 with
  | { f_ConvCtx_ccProjs = dtb_u_u340; f_ConvCtx_ccDicts = dtb_u_u341; f_ConvCtx_ccShapes = dtb_u_u342; f_ConvCtx_ccClasses = dtb_u_u343; f_ConvCtx_ccFields = dtb_u_u344; f_ConvCtx_ccSpan = dtb_u_u345 } -> dtb_u_u341
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccShapes = (fun (dtb_u_u346 : t_ConvCtx) -> (match dtb_u_u346 with
  | { f_ConvCtx_ccProjs = dtb_u_u347; f_ConvCtx_ccDicts = dtb_u_u348; f_ConvCtx_ccShapes = dtb_u_u349; f_ConvCtx_ccClasses = dtb_u_u350; f_ConvCtx_ccFields = dtb_u_u351; f_ConvCtx_ccSpan = dtb_u_u352 } -> dtb_u_u349
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccClasses = (fun (dtb_u_u353 : t_ConvCtx) -> (match dtb_u_u353 with
  | { f_ConvCtx_ccProjs = dtb_u_u354; f_ConvCtx_ccDicts = dtb_u_u355; f_ConvCtx_ccShapes = dtb_u_u356; f_ConvCtx_ccClasses = dtb_u_u357; f_ConvCtx_ccFields = dtb_u_u358; f_ConvCtx_ccSpan = dtb_u_u359 } -> dtb_u_u357
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccFields = (fun (dtb_u_u360 : t_ConvCtx) -> (match dtb_u_u360 with
  | { f_ConvCtx_ccProjs = dtb_u_u361; f_ConvCtx_ccDicts = dtb_u_u362; f_ConvCtx_ccShapes = dtb_u_u363; f_ConvCtx_ccClasses = dtb_u_u364; f_ConvCtx_ccFields = dtb_u_u365; f_ConvCtx_ccSpan = dtb_u_u366 } -> dtb_u_u365
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccSpan = (fun (dtb_u_u367 : t_ConvCtx) -> (match dtb_u_u367 with
  | { f_ConvCtx_ccProjs = dtb_u_u368; f_ConvCtx_ccDicts = dtb_u_u369; f_ConvCtx_ccShapes = dtb_u_u370; f_ConvCtx_ccClasses = dtb_u_u371; f_ConvCtx_ccFields = dtb_u_u372; f_ConvCtx_ccSpan = dtb_u_u373 } -> dtb_u_u373
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grName = (fun (dtb_u_u374 : t_Group) -> (match dtb_u_u374 with
  | { f_Group_grName = dtb_u_u375; f_Group_grParams = dtb_u_u376; f_Group_grBody = dtb_u_u377; f_Group_grSpan = dtb_u_u378 } -> dtb_u_u375
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grParams = (fun (dtb_u_u379 : t_Group) -> (match dtb_u_u379 with
  | { f_Group_grName = dtb_u_u380; f_Group_grParams = dtb_u_u381; f_Group_grBody = dtb_u_u382; f_Group_grSpan = dtb_u_u383 } -> dtb_u_u381
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grBody = (fun (dtb_u_u384 : t_Group) -> (match dtb_u_u384 with
  | { f_Group_grName = dtb_u_u385; f_Group_grParams = dtb_u_u386; f_Group_grBody = dtb_u_u387; f_Group_grSpan = dtb_u_u388 } -> dtb_u_u387
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grSpan = (fun (dtb_u_u389 : t_Group) -> (match dtb_u_u389 with
  | { f_Group_grName = dtb_u_u390; f_Group_grParams = dtb_u_u391; f_Group_grBody = dtb_u_u392; f_Group_grSpan = dtb_u_u393 } -> dtb_u_u393
  | _ -> failwith "DT: impossible branch"
))
