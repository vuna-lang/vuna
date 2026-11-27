open Vuna_runtime
type t_CachedProgram = { f_CachedProgram_cachedDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_CachedProgram_cachedDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_CachedProgram_cachedGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_CachedProgram_cachedInsts : Elab_dTypes.t_DtInst B_dData_dList.t_List; f_CachedProgram_cachedClasses : Elab_dTypes.t_DtClass B_dData_dList.t_List; f_CachedProgram_cachedOpaque : string B_dData_dList.t_List }

# 37 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaqueOf = (fun (dtb_u_u1 : t_CachedProgram) -> (match dtb_u_u1 with
  | { f_CachedProgram_cachedDatas = dtb_u_u2; f_CachedProgram_cachedDefs = dtb_u_u3; f_CachedProgram_cachedGlobals = dtb_u_u4; f_CachedProgram_cachedInsts = dtb_u_u5; f_CachedProgram_cachedClasses = dtb_u_u6; f_CachedProgram_cachedOpaque = dtb_u_u7 } -> dtb_u_u7
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Driver/Cache.vuna"
let v_withCachedOpaque = (fun (dtb_u_u8 : string B_dData_dList.t_List) (dtb_u_u9 : t_CachedProgram) -> (match dtb_u_u9 with
  | { f_CachedProgram_cachedDatas = dtb_u_u10; f_CachedProgram_cachedDefs = dtb_u_u11; f_CachedProgram_cachedGlobals = dtb_u_u12; f_CachedProgram_cachedInsts = dtb_u_u13; f_CachedProgram_cachedClasses = dtb_u_u14; f_CachedProgram_cachedOpaque = dtb_u_u15 } -> { f_CachedProgram_cachedDatas = dtb_u_u10; f_CachedProgram_cachedDefs = dtb_u_u11; f_CachedProgram_cachedGlobals = dtb_u_u12; f_CachedProgram_cachedInsts = dtb_u_u13; f_CachedProgram_cachedClasses = dtb_u_u14; f_CachedProgram_cachedOpaque = dtb_u_u8 }
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixTerm = (fun (dtb_u_u16 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u17 : int) (dtb_u_u18 : Core_dTerm.t_Term) -> (((Core_dEval.v_substSolvedMetasAtTbl dtb_u_u16) dtb_u_u17) dtb_u_u18))

# 50 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixDef = (fun (dtb_u_u19 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u20 : Elab_dTypes.t_DtDef) -> (match dtb_u_u20 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb_u_u21, dtb_u_u22, dtb_u_u23, dtb_u_u24) -> (Elab_dTypes.C_DtDef_DtExtern (dtb_u_u21, (((v_fixTerm dtb_u_u19) 0) dtb_u_u22), dtb_u_u23, dtb_u_u24))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u25, (((v_fixTerm dtb_u_u19) 0) dtb_u_u26), dtb_u_u27))
  | Elab_dTypes.C_DtDef_DtDef (dtb_u_u28, dtb_u_u29, dtb_u_u30, dtb_u_u31) -> (Elab_dTypes.C_DtDef_DtDef (dtb_u_u28, (((v_fixTerm dtb_u_u19) 0) dtb_u_u29), (((v_fixTerm dtb_u_u19) 0) dtb_u_u30), dtb_u_u31))
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixCtor = (fun (dtb_u_u32 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u33 : Elab_dTypes.t_DtCtor) -> (match dtb_u_u33 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u34; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u35; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u36; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u37; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb_u_u38 } -> { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u34; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u35; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u36; Elab_dTypes.f_DtCtor_dtCtorType = (((v_fixTerm dtb_u_u32) 0) dtb_u_u37); Elab_dTypes.f_DtCtor_dtCtorSpan = dtb_u_u38 }
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixFieldMeta = (fun (dtb_u_u39 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u40 : Elab_dTypes.t_DtFieldMeta) -> (match dtb_u_u40 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u41; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u42; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb_u_u43 } -> { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u41; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u42; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((v_fixTerm dtb_u_u39) 0) dtb_u_u43) }
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixData = (fun (dtb_u_u44 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u45 : Elab_dTypes.t_DtData) -> (match dtb_u_u45 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb_u_u46; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u47; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u48; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u49; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u50; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u51; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u52; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u53; Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u54 } -> { Elab_dTypes.f_DtData_dtDataName = dtb_u_u46; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u47; Elab_dTypes.f_DtData_dtDataCtors = ((B_dData_dList.v_map (v_fixCtor dtb_u_u44)) dtb_u_u48); Elab_dTypes.f_DtData_dtDataKind = (((v_fixTerm dtb_u_u44) 0) dtb_u_u49); Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u50; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u51; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u52; Elab_dTypes.f_DtData_dtDataFields = ((B_dData_dList.v_map (v_fixFieldMeta dtb_u_u44)) dtb_u_u53); Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u54 }
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixClass = (fun (dtb_u_u55 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u56 : Elab_dTypes.t_DtClass) -> (match dtb_u_u56 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u57; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u58; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u59; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u60; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u61; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u62 } -> { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u57; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u58; Elab_dTypes.f_DtClass_dtClassSupers = ((B_dData_dList.v_map ((v_fixTerm dtb_u_u55) (B_dData_dList.v_length dtb_u_u58))) dtb_u_u59); Elab_dTypes.f_DtClass_dtClassMethods = ((B_dData_dList.v_map (fun (dtb_u_u63 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u63); B_dData_dPair.f_Pair_second = (((v_fixTerm dtb_u_u55) 0) (B_dData_dPair.v_secondOf dtb_u_u63)) })) dtb_u_u60); Elab_dTypes.f_DtClass_dtClassFieldTys = ((B_dData_dList.v_map ((v_fixTerm dtb_u_u55) (B_dData_dList.v_length dtb_u_u58))) dtb_u_u61); Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u62 }
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/Cache.vuna"
let[@tail_mod_cons] rec v_fixTele = (fun (dtb_u_u64 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u65 : int) (dtb_u_u66 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u66 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u67, dtb_u_u68) -> (match dtb_u_u67 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = dtb_u_u70 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = (((v_fixTerm dtb_u_u64) dtb_u_u65) dtb_u_u70) }, (((v_fixTele dtb_u_u64) (dtb_u_u65 + 1)) dtb_u_u68)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixInst = (fun (dtb_u_u71 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u72 : Elab_dTypes.t_DtInst) -> (match dtb_u_u72 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u73; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u74; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u75; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u76; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u77; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u78; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u79 } -> (let dtb_u_u80 = (B_dData_dList.v_length dtb_u_u76) in { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u73; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u74; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u75; Elab_dTypes.f_DtInst_dtInstTele = (((v_fixTele dtb_u_u71) 0) dtb_u_u76); Elab_dTypes.f_DtInst_dtInstCtx = ((B_dData_dList.v_map ((v_fixTerm dtb_u_u71) dtb_u_u80)) dtb_u_u77); Elab_dTypes.f_DtInst_dtInstHead = (((v_fixTerm dtb_u_u71) dtb_u_u80) dtb_u_u78); Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u79 })
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgramWith = (fun (dtb_u_u81 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u82 : Elab_dTypes.t_DtProgram) -> { f_CachedProgram_cachedDatas = ((B_dData_dList.v_map (v_fixData dtb_u_u81)) (Elab_dTypes.v_dtProgDatas dtb_u_u82)); f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_fixDef dtb_u_u81)) (Elab_dTypes.v_dtProgDefs dtb_u_u82)); f_CachedProgram_cachedGlobals = ((B_dData_dList.v_map (fun (dtb_u_u83 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u83); B_dData_dPair.f_Pair_second = (((v_fixTerm dtb_u_u81) 0) (B_dData_dPair.v_secondOf dtb_u_u83)) })) (Elab_dTypes.v_dtProgGlobals dtb_u_u82)); f_CachedProgram_cachedInsts = ((B_dData_dList.v_map (v_fixInst dtb_u_u81)) (Elab_dTypes.v_dtProgInsts dtb_u_u82)); f_CachedProgram_cachedClasses = ((B_dData_dList.v_map (v_fixClass dtb_u_u81)) (Elab_dTypes.v_dtProgClasses dtb_u_u82)); f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil })

# 105 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgram = (fun (dtb_u_u84 : Elab_dTypes.t_DtProgram) -> ((v_cachedOfProgramWith (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Elab_dTypes.v_dtProgSols dtb_u_u84))) dtb_u_u84))

# 126 "Vuna/Compiler/Driver/Cache.vuna"
let v_termValidAt = (fun (dtb_u_u85 : int) (dtb_u_u86 : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll dtb_u_u86)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar dtb_u_u85) dtb_u_u86)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar dtb_u_u86)) else false))

# 130 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorsValid = (fun (dtb_u_u87 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u87 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtCtorType dtb_u_u88)) then (v_ctorsValid dtb_u_u89) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldsValid = (fun (dtb_u_u90 : int) (dtb_u_u91 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match dtb_u_u91 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u92, dtb_u_u93) -> (if ((v_termValidAt dtb_u_u90) (dtb_u_u92).Elab_dTypes.f_DtFieldMeta_dtFieldType) then ((v_fieldsValid dtb_u_u90) dtb_u_u93) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasValid = (fun (dtb_u_u94 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDataKind dtb_u_u95)) then (v_ctorsValid (Elab_dTypes.v_dtDataCtors dtb_u_u95)) else false) then ((v_fieldsValid (B_dData_dList.v_length (dtb_u_u95).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields dtb_u_u95)) else false) then (v_datasValid dtb_u_u96) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyValid = (fun (dtb_u_u97 : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime dtb_u_u97)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar 0) dtb_u_u97)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar dtb_u_u97)) else false))

# 146 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsValid = (fun (dtb_u_u98 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u99, dtb_u_u100) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u99) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u101) -> (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb_u_u99)) then (v_bodyValid dtb_u_u101) else false) then (v_defsValid dtb_u_u100) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb_u_u99)) then (v_defsValid dtb_u_u100) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsValid = (fun (dtb_u_u102 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u102 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u103, dtb_u_u104) -> (match dtb_u_u103 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u105; B_dData_dPair.f_Pair_second = dtb_u_u106 } -> (if ((v_termValidAt 0) dtb_u_u106) then (v_globalsValid dtb_u_u104) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleValid = (fun (dtb_u_u107 : int) (dtb_u_u108 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u108 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u109, dtb_u_u110) -> (match dtb_u_u109 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u111; B_dData_dPair.f_Pair_second = dtb_u_u112 } -> (if ((v_termValidAt dtb_u_u107) dtb_u_u112) then ((v_teleValid (dtb_u_u107 + 1)) dtb_u_u110) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_termsValidAt = (fun (dtb_u_u113 : int) (dtb_u_u114 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u114 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u115, dtb_u_u116) -> (if ((v_termValidAt dtb_u_u113) dtb_u_u115) then ((v_termsValidAt dtb_u_u113) dtb_u_u116) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsValid = (fun (dtb_u_u117 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (let dtb_u_u120 = (B_dData_dList.v_length (dtb_u_u118).Elab_dTypes.f_DtInst_dtInstTele) in (if (if (if ((v_teleValid 0) (dtb_u_u118).Elab_dTypes.f_DtInst_dtInstTele) then ((v_termsValidAt dtb_u_u120) (dtb_u_u118).Elab_dTypes.f_DtInst_dtInstCtx) else false) then ((v_termValidAt dtb_u_u120) (dtb_u_u118).Elab_dTypes.f_DtInst_dtInstHead) else false) then (v_instsValid dtb_u_u119) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesValid = (fun (dtb_u_u121 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match dtb_u_u121 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u122, dtb_u_u123) -> (let dtb_u_u124 = ((B_dData_dList.v_map (fun (dtb_u_u125 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u125))) (dtb_u_u122).Elab_dTypes.f_DtClass_dtClassMethods) in (if (if (if ((v_termsValidAt 0) dtb_u_u124) then ((v_termsValidAt (B_dData_dList.v_length (dtb_u_u122).Elab_dTypes.f_DtClass_dtClassParams)) (dtb_u_u122).Elab_dTypes.f_DtClass_dtClassSupers) else false) then ((v_termsValidAt (B_dData_dList.v_length (dtb_u_u122).Elab_dTypes.f_DtClass_dtClassParams)) (dtb_u_u122).Elab_dTypes.f_DtClass_dtClassFieldTys) else false) then (v_classesValid dtb_u_u123) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramValid = (fun (dtb_u_u126 : t_CachedProgram) -> (match dtb_u_u126 with
  | { f_CachedProgram_cachedDatas = dtb_u_u127; f_CachedProgram_cachedDefs = dtb_u_u128; f_CachedProgram_cachedGlobals = dtb_u_u129; f_CachedProgram_cachedInsts = dtb_u_u130; f_CachedProgram_cachedClasses = dtb_u_u131; f_CachedProgram_cachedOpaque = dtb_u_u132 } -> (if (if (if (if (v_datasValid dtb_u_u127) then (v_defsValid dtb_u_u128) else false) then (v_globalsValid dtb_u_u129) else false) then (v_instsValid dtb_u_u130) else false) then (v_classesValid dtb_u_u131) else false)
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Driver/Cache.vuna"
let v_termIssueAt = (fun (dtb_u_u133 : int) (dtb_u_u134 : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll dtb_u_u134)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar dtb_u_u134) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar dtb_u_u133) dtb_u_u134) then "free-var" else ""))))

# 214 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorIssues = (fun (dtb_u_u135 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u135 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (let dtb_u_u138 = ((v_termIssueAt 0) (Elab_dTypes.v_dtCtorType dtb_u_u136)) in (if (dtb_u_u138 = "") then (v_ctorIssues dtb_u_u137) else (String.concat "" [(Elab_dTypes.v_dtCtorName dtb_u_u136); " ctor:"; dtb_u_u138])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldIssues = (fun (dtb_u_u139 : int) (dtb_u_u140 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match dtb_u_u140 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u141, dtb_u_u142) -> (let dtb_u_u143 = ((v_termIssueAt dtb_u_u139) (dtb_u_u141).Elab_dTypes.f_DtFieldMeta_dtFieldType) in (if (dtb_u_u143 = "") then ((v_fieldIssues dtb_u_u139) dtb_u_u142) else (String.concat "" [(dtb_u_u141).Elab_dTypes.f_DtFieldMeta_dtFieldName; " field:"; dtb_u_u143])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Driver/Cache.vuna"
let v_dataIssue = (fun (dtb_u_u144 : Elab_dTypes.t_DtData) -> (let dtb_u_u145 = ((v_termIssueAt 0) (Elab_dTypes.v_dtDataKind dtb_u_u144)) in (if (dtb_u_u145 = "") then (let dtb_u_u146 = (v_ctorIssues (Elab_dTypes.v_dtDataCtors dtb_u_u144)) in (if (dtb_u_u146 = "") then ((v_fieldIssues (B_dData_dList.v_length (dtb_u_u144).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields dtb_u_u144)) else dtb_u_u146)) else (String.concat "" [(Elab_dTypes.v_dtDataName dtb_u_u144); " kind:"; dtb_u_u145]))))

# 228 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasIssue = (fun (dtb_u_u147 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u147 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u148, dtb_u_u149) -> (let dtb_u_u150 = (v_dataIssue dtb_u_u148) in (if (dtb_u_u150 = "") then (v_datasIssue dtb_u_u149) else dtb_u_u150))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyIssueAt = (fun (dtb_u_u151 : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime dtb_u_u151)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar dtb_u_u151) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar 0) dtb_u_u151) then "free-var" else ""))))

# 241 "Vuna/Compiler/Driver/Cache.vuna"
let v_defIssue = (fun (dtb_u_u152 : Elab_dTypes.t_DtDef) -> (let dtb_u_u153 = ((v_termIssueAt 0) (Elab_dTypes.v_dtDefType dtb_u_u152)) in (if (dtb_u_u153 = "") then (match (Elab_dTypes.v_dtDefBody dtb_u_u152) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u154) -> (let dtb_u_u155 = (v_bodyIssueAt dtb_u_u154) in (if (dtb_u_u155 = "") then "" else (String.concat "" [(Elab_dTypes.v_dtDefName dtb_u_u152); " body:"; dtb_u_u155])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Elab_dTypes.v_dtDefName dtb_u_u152); " type:"; dtb_u_u153]))))

# 255 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsIssue = (fun (dtb_u_u156 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u156 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> (let dtb_u_u159 = (v_defIssue dtb_u_u157) in (if (dtb_u_u159 = "") then (v_defsIssue dtb_u_u158) else dtb_u_u159))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsIssue = (fun (dtb_u_u160 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u160 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (match dtb_u_u161 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u163; B_dData_dPair.f_Pair_second = dtb_u_u164 } -> (let dtb_u_u165 = ((v_termIssueAt 0) dtb_u_u164) in (if (dtb_u_u165 = "") then (v_globalsIssue dtb_u_u162) else (String.concat "" [dtb_u_u163; ":"; dtb_u_u165])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleIssueGo = (fun (dtb_u_u166 : int) (dtb_u_u167 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u167 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> (match dtb_u_u168 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u170; B_dData_dPair.f_Pair_second = dtb_u_u171 } -> (let dtb_u_u172 = ((v_termIssueAt dtb_u_u166) dtb_u_u171) in (if (dtb_u_u172 = "") then ((v_teleIssueGo (dtb_u_u166 + 1)) dtb_u_u169) else (String.concat "" [dtb_u_u170; ":"; dtb_u_u172])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctxIssues = (fun (dtb_u_u173 : int) (dtb_u_u174 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u174 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u175, dtb_u_u176) -> (let dtb_u_u177 = ((v_termIssueAt dtb_u_u173) dtb_u_u175) in (if (dtb_u_u177 = "") then ((v_ctxIssues dtb_u_u173) dtb_u_u176) else dtb_u_u177))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Driver/Cache.vuna"
let v_instIssue = (fun (dtb_u_u178 : Elab_dTypes.t_DtInst) -> (let dtb_u_u179 = (B_dData_dList.v_length (dtb_u_u178).Elab_dTypes.f_DtInst_dtInstTele) in (let dtb_u_u180 = ((v_teleIssueGo 0) (dtb_u_u178).Elab_dTypes.f_DtInst_dtInstTele) in (if (dtb_u_u180 <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName dtb_u_u178); " tele:"; dtb_u_u180]) else (let dtb_u_u181 = ((v_ctxIssues dtb_u_u179) (dtb_u_u178).Elab_dTypes.f_DtInst_dtInstCtx) in (if (dtb_u_u181 <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName dtb_u_u178); " ctx:"; dtb_u_u181]) else (let dtb_u_u182 = ((v_termIssueAt dtb_u_u179) (dtb_u_u178).Elab_dTypes.f_DtInst_dtInstHead) in (if (dtb_u_u182 = "") then "" else (String.concat "" [(Elab_dTypes.v_dtInstName dtb_u_u178); " head:"; dtb_u_u182])))))))))

# 300 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsIssue = (fun (dtb_u_u183 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u183 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u185) -> (let dtb_u_u186 = (v_instIssue dtb_u_u184) in (if (dtb_u_u186 = "") then (v_instsIssue dtb_u_u185) else dtb_u_u186))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Driver/Cache.vuna"
let v_classIssue = (fun (dtb_u_u187 : Elab_dTypes.t_DtClass) -> (let dtb_u_u188 = ((v_ctxIssues 0) ((B_dData_dList.v_map (fun (dtb_u_u191 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u191))) (dtb_u_u187).Elab_dTypes.f_DtClass_dtClassMethods)) in (if (dtb_u_u188 <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName dtb_u_u187); " proj:"; dtb_u_u188]) else (let dtb_u_u189 = ((v_ctxIssues (B_dData_dList.v_length (dtb_u_u187).Elab_dTypes.f_DtClass_dtClassParams)) (dtb_u_u187).Elab_dTypes.f_DtClass_dtClassSupers) in (if (dtb_u_u189 <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName dtb_u_u187); " super:"; dtb_u_u189]) else (let dtb_u_u190 = ((v_ctxIssues (B_dData_dList.v_length (dtb_u_u187).Elab_dTypes.f_DtClass_dtClassParams)) (dtb_u_u187).Elab_dTypes.f_DtClass_dtClassFieldTys) in (if (dtb_u_u190 = "") then "" else (String.concat "" [(Elab_dTypes.v_dtClassName dtb_u_u187); " field:"; dtb_u_u190]))))))))

# 323 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesIssue = (fun (dtb_u_u192 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match dtb_u_u192 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u193, dtb_u_u194) -> (let dtb_u_u195 = (v_classIssue dtb_u_u193) in (if (dtb_u_u195 = "") then (v_classesIssue dtb_u_u194) else dtb_u_u195))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramIssue = (fun (dtb_u_u196 : t_CachedProgram) -> (match dtb_u_u196 with
  | { f_CachedProgram_cachedDatas = dtb_u_u197; f_CachedProgram_cachedDefs = dtb_u_u198; f_CachedProgram_cachedGlobals = dtb_u_u199; f_CachedProgram_cachedInsts = dtb_u_u200; f_CachedProgram_cachedClasses = dtb_u_u201; f_CachedProgram_cachedOpaque = dtb_u_u202 } -> (let dtb_u_u203 = (v_datasIssue dtb_u_u197) in (let dtb_u_u204 = (v_defsIssue dtb_u_u198) in (let dtb_u_u205 = (v_globalsIssue dtb_u_u199) in (let dtb_u_u206 = (v_instsIssue dtb_u_u200) in (let dtb_u_u207 = (v_classesIssue dtb_u_u201) in (if (dtb_u_u203 <> "") then ("datas " ^ dtb_u_u203) else (if (dtb_u_u204 <> "") then ("defs " ^ dtb_u_u204) else (if (dtb_u_u205 <> "") then ("globals " ^ dtb_u_u205) else (if (dtb_u_u206 <> "") then ("insts " ^ dtb_u_u206) else (if (dtb_u_u207 <> "") then ("classes " ^ dtb_u_u207) else ""))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Driver/Cache.vuna"
let v_summaryMetaSegment = 1073741824

# 370 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTermFuel = (fun (dtb_u_u208 : int) (dtb_u_u209 : int) (dtb_u_u210 : Core_dTerm.t_Term) -> (if (dtb_u_u208 <= 0) then (Base_dDiag.v_icFuel "meta-shift") else (match dtb_u_u210 with
  | Core_dTerm.C_Term_TVar (dtb_u_u211, dtb_u_u212, dtb_u_u213) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb_u_u211, dtb_u_u212, dtb_u_u213))))
  | Core_dTerm.C_Term_TMeta (dtb_u_u214) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta ((dtb_u_u214 + dtb_u_u209)))))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u215) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb_u_u215))))
  | Core_dTerm.C_Term_TType (dtb_u_u216) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb_u_u216))))
  | Core_dTerm.C_Term_TPi (dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u220)) (fun (dtb_u_u222 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u221)) (fun (dtb_u_u223 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u222, dtb_u_u223))))))))
  | Core_dTerm.C_Term_TLam (dtb_u_u224, dtb_u_u225, dtb_u_u226, dtb_u_u227, dtb_u_u228) -> ((Base_dCommon.v_bind (((v_shiftLamTyFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u226)) (fun (dtb_u_u229 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u228)) (fun (dtb_u_u230 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb_u_u224, dtb_u_u225, dtb_u_u229, dtb_u_u227, dtb_u_u230))))))))
  | Core_dTerm.C_Term_TApp (dtb_u_u231, dtb_u_u232, dtb_u_u233) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u231)) (fun (dtb_u_u234 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u232)) (fun (dtb_u_u235 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (dtb_u_u234, dtb_u_u235, dtb_u_u233))))))))
  | Core_dTerm.C_Term_TCon (dtb_u_u236, dtb_u_u237) -> ((Base_dCommon.v_bind (((v_shiftArgs (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u237)) (fun (dtb_u_u238 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb_u_u236, dtb_u_u238))))))
  | Core_dTerm.C_Term_TMk (dtb_u_u239, dtb_u_u240) -> ((Base_dCommon.v_bind (((v_shiftArgs (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u240)) (fun (dtb_u_u241 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb_u_u239, dtb_u_u241))))))
  | Core_dTerm.C_Term_TRecord (dtb_u_u242, dtb_u_u243) -> ((Base_dCommon.v_bind (((v_shiftArgs (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u243)) (fun (dtb_u_u244 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb_u_u242, dtb_u_u244))))))
  | Core_dTerm.C_Term_TCase (dtb_u_u245, dtb_u_u246) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u245)) (fun (dtb_u_u247 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u246)) (fun (dtb_u_u248 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (dtb_u_u247, dtb_u_u248))))))))
  | Core_dTerm.C_Term_TProj (dtb_u_u249, dtb_u_u250, dtb_u_u251, dtb_u_u252, dtb_u_u253) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u249)) (fun (dtb_u_u254 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (dtb_u_u254, dtb_u_u250, dtb_u_u251, dtb_u_u252, dtb_u_u253))))))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u255, dtb_u_u256, dtb_u_u257, dtb_u_u258, dtb_u_u259) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u255)) (fun (dtb_u_u260 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u259)) (fun (dtb_u_u261 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (dtb_u_u260, dtb_u_u256, dtb_u_u257, dtb_u_u258, dtb_u_u261))))))))
  | Core_dTerm.C_Term_TInt (dtb_u_u262) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb_u_u262))))
  | Core_dTerm.C_Term_TStr (dtb_u_u263) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb_u_u263))))
  | Core_dTerm.C_Term_TBool (dtb_u_u264) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb_u_u264))))
  | Core_dTerm.C_Term_TIf (dtb_u_u265, dtb_u_u266, dtb_u_u267) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u265)) (fun (dtb_u_u268 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u266)) (fun (dtb_u_u269 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (dtb_u_u208 - 1)) dtb_u_u209) dtb_u_u267)) (fun (dtb_u_u270 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (dtb_u_u268, dtb_u_u269, dtb_u_u270))))))))))
  | Core_dTerm.C_Term_TFloat (dtb_u_u271) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb_u_u271))))
  | _ -> failwith "DT: impossible branch"
)))
# 396 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftLamTyFuel = (fun (dtb_u_u272 : int) (dtb_u_u273 : int) (dtb_u_u274 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u274 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u275) -> (let dtb_u_u276 = (B_dData_dPair.v_secondOf dtb_u_u275) in ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel dtb_u_u272) dtb_u_u273) (B_dData_dPair.v_firstOf dtb_u_u276))) (fun (dtb_u_u277 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel dtb_u_u272) dtb_u_u273) (B_dData_dPair.v_secondOf dtb_u_u276))) (fun (dtb_u_u278 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u275); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u277; B_dData_dPair.f_Pair_second = dtb_u_u278 } })))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 406 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftTermMaybeFuel = (fun (dtb_u_u279 : int) (dtb_u_u280 : int) (dtb_u_u281 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u281 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u282) -> ((Base_dCommon.v_bind (((v_shiftTermFuel dtb_u_u279) dtb_u_u280) dtb_u_u282)) (fun (dtb_u_u283 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u283))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 412 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftArgs = (fun (dtb_u_u284 : int) (dtb_u_u285 : int) (dtb_u_u286 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u286 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u287, dtb_u_u288) -> (match dtb_u_u287 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u289; B_dData_dPair.f_Pair_second = dtb_u_u290 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel dtb_u_u284) dtb_u_u285) dtb_u_u289)) (fun (dtb_u_u291 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftArgs dtb_u_u284) dtb_u_u285) dtb_u_u288)) (fun (dtb_u_u292 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u291; B_dData_dPair.f_Pair_second = dtb_u_u290 }, dtb_u_u292))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 419 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftAlts = (fun (dtb_u_u293 : int) (dtb_u_u294 : int) (dtb_u_u295 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u295 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u296, dtb_u_u297) -> (match dtb_u_u296 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u298; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u299; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u300 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel dtb_u_u293) dtb_u_u294) dtb_u_u300)) (fun (dtb_u_u301 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts dtb_u_u293) dtb_u_u294) dtb_u_u297)) (fun (dtb_u_u302 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u298; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u299; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u301 }, dtb_u_u302))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftTerm = (fun (dtb_u_u303 : int) (dtb_u_u304 : Core_dTerm.t_Term) -> (((v_shiftTermFuel ((Core_dTerm.v_termSize dtb_u_u304) + 16)) dtb_u_u303) dtb_u_u304))

# 426 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftDef = (fun (dtb_u_u305 : int) (dtb_u_u306 : Elab_dTypes.t_DtDef) -> (match dtb_u_u306 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u305) dtb_u_u308)) (fun (dtb_u_u311 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtExtern (dtb_u_u307, dtb_u_u311, dtb_u_u309, dtb_u_u310))))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u312, dtb_u_u313, dtb_u_u314) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u305) dtb_u_u313)) (fun (dtb_u_u315 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u312, dtb_u_u315, dtb_u_u314))))))
  | Elab_dTypes.C_DtDef_DtDef (dtb_u_u316, dtb_u_u317, dtb_u_u318, dtb_u_u319) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u305) dtb_u_u317)) (fun (dtb_u_u320 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u305) dtb_u_u318)) (fun (dtb_u_u321 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtDef (dtb_u_u316, dtb_u_u320, dtb_u_u321, dtb_u_u319))))))))
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCtor = (fun (dtb_u_u322 : int) (dtb_u_u323 : Elab_dTypes.t_DtCtor) -> (match dtb_u_u323 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u324; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u325; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u326; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u327; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb_u_u328 } -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u322) dtb_u_u327)) (fun (dtb_u_u329 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u324; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u325; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u326; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u329; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb_u_u328 }))))
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftFieldMeta = (fun (dtb_u_u330 : int) (dtb_u_u331 : Elab_dTypes.t_DtFieldMeta) -> (match dtb_u_u331 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u332; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u333; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb_u_u334 } -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u330) dtb_u_u334)) (fun (dtb_u_u335 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u332; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u333; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb_u_u335 }))))
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftData = (fun (dtb_u_u336 : int) (dtb_u_u337 : Elab_dTypes.t_DtData) -> (match dtb_u_u337 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb_u_u338; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u339; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u340; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u341; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u342; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u343; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u344; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u345; Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u346 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftCtor dtb_u_u336)) dtb_u_u340)) (fun (dtb_u_u347 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u336) dtb_u_u341)) (fun (dtb_u_u348 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftFieldMeta dtb_u_u336)) dtb_u_u345)) (fun (dtb_u_u349 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtData_dtDataName = dtb_u_u338; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u339; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u347; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u348; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u342; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u343; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u344; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u349; Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u346 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTele = (fun (dtb_u_u350 : int) (dtb_u_u351 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u351 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u352, dtb_u_u353) -> (match dtb_u_u352 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u354; B_dData_dPair.f_Pair_second = dtb_u_u355 } -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u350) dtb_u_u355)) (fun (dtb_u_u356 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTele dtb_u_u350) dtb_u_u353)) (fun (dtb_u_u357 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u354; B_dData_dPair.f_Pair_second = dtb_u_u356 }, dtb_u_u357))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftClass = (fun (dtb_u_u358 : int) (dtb_u_u359 : Elab_dTypes.t_DtClass) -> (match dtb_u_u359 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u360; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u361; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u362; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u363; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u364; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u365 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm dtb_u_u358)) dtb_u_u362)) (fun (dtb_u_u366 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTele dtb_u_u358) dtb_u_u363)) (fun (dtb_u_u367 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm dtb_u_u358)) dtb_u_u364)) (fun (dtb_u_u368 : Core_dTerm.t_Term B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtClass_dtClassName = dtb_u_u360; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u361; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u366; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u367; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u368; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u365 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftInst = (fun (dtb_u_u369 : int) (dtb_u_u370 : Elab_dTypes.t_DtInst) -> (match dtb_u_u370 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u371; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u372; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u373; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u374; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u375; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u376; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u377 } -> ((Base_dCommon.v_bind ((v_shiftTele dtb_u_u369) dtb_u_u374)) (fun (dtb_u_u378 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm dtb_u_u369)) dtb_u_u375)) (fun (dtb_u_u379 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u369) dtb_u_u376)) (fun (dtb_u_u380 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtInst_dtInstName = dtb_u_u371; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u372; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u373; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u378; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u379; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u380; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u377 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftGlobal = (fun (dtb_u_u381 : int) (dtb_u_u382 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match dtb_u_u382 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u383; B_dData_dPair.f_Pair_second = dtb_u_u384 } -> ((Base_dCommon.v_bind ((v_shiftTerm dtb_u_u381) dtb_u_u384)) (fun (dtb_u_u385 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u383; B_dData_dPair.f_Pair_second = dtb_u_u385 }))))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCachedProgram = (fun (dtb_u_u386 : int) (dtb_u_u387 : t_CachedProgram) -> (match dtb_u_u387 with
  | { f_CachedProgram_cachedDatas = dtb_u_u388; f_CachedProgram_cachedDefs = dtb_u_u389; f_CachedProgram_cachedGlobals = dtb_u_u390; f_CachedProgram_cachedInsts = dtb_u_u391; f_CachedProgram_cachedClasses = dtb_u_u392; f_CachedProgram_cachedOpaque = dtb_u_u393 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftData dtb_u_u386)) dtb_u_u388)) (fun (dtb_u_u394 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftDef dtb_u_u386)) dtb_u_u389)) (fun (dtb_u_u395 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftGlobal dtb_u_u386)) dtb_u_u390)) (fun (dtb_u_u396 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftInst dtb_u_u386)) dtb_u_u391)) (fun (dtb_u_u397 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftClass dtb_u_u386)) dtb_u_u392)) (fun (dtb_u_u398 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ f_CachedProgram_cachedDatas = dtb_u_u394; f_CachedProgram_cachedDefs = dtb_u_u395; f_CachedProgram_cachedGlobals = dtb_u_u396; f_CachedProgram_cachedInsts = dtb_u_u397; f_CachedProgram_cachedClasses = dtb_u_u398; f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Driver/Cache.vuna"
let v_encGlobalPair = (fun (dtb_u_u399 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (dtb_u_u400 : string B_dData_dList.t_List) -> (match dtb_u_u399 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u401; B_dData_dPair.f_Pair_second = dtb_u_u402 } -> ((Base_dBytes.v_encStr dtb_u_u401) ((Core_dCanonical.v_encTerm dtb_u_u402) dtb_u_u400))
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Driver/Cache.vuna"
let v_encCachedProgram = (fun (dtb_u_u403 : t_CachedProgram) (dtb_u_u404 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Elab_dCanonical.v_encDtData) (dtb_u_u403).f_CachedProgram_cachedDatas) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtDef) (dtb_u_u403).f_CachedProgram_cachedDefs) (((Base_dBytes.v_encList v_encGlobalPair) (dtb_u_u403).f_CachedProgram_cachedGlobals) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtInst) (dtb_u_u403).f_CachedProgram_cachedInsts) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtClass) (dtb_u_u403).f_CachedProgram_cachedClasses) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (dtb_u_u403).f_CachedProgram_cachedOpaque) dtb_u_u404)))))))

# 511 "Vuna/Compiler/Driver/Cache.vuna"
let v_decGlobalPair = (fun (dtb_u_u405 : int) (dtb_u_u406 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u405 - 1)) dtb_u_u406)) (fun (dtb_u_u407 : string) (dtb_u_u408 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u405 - 1)) dtb_u_u408)) (fun (dtb_u_u409 : Core_dTerm.t_Term) (dtb_u_u410 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = dtb_u_u409 }; B_dData_dPair.f_Pair_second = dtb_u_u410 })))))))

# 505 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgram = (fun (dtb_u_u411 : int) (dtb_u_u412 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtData) (dtb_u_u411 - 1)) dtb_u_u412)) (fun (dtb_u_u413 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u414 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtDef) (dtb_u_u411 - 1)) dtb_u_u414)) (fun (dtb_u_u415 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u416 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGlobalPair) (dtb_u_u411 - 1)) dtb_u_u416)) (fun (dtb_u_u417 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u418 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtInst) (dtb_u_u411 - 1)) dtb_u_u418)) (fun (dtb_u_u419 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (dtb_u_u420 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtClass) (dtb_u_u411 - 1)) dtb_u_u420)) (fun (dtb_u_u421 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u422 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u411 - 1)) dtb_u_u422)) (fun (dtb_u_u423 : string B_dData_dList.t_List) (dtb_u_u424 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_CachedProgram_cachedDatas = dtb_u_u413; f_CachedProgram_cachedDefs = dtb_u_u415; f_CachedProgram_cachedGlobals = dtb_u_u417; f_CachedProgram_cachedInsts = dtb_u_u419; f_CachedProgram_cachedClasses = dtb_u_u421; f_CachedProgram_cachedOpaque = dtb_u_u423 }; B_dData_dPair.f_Pair_second = dtb_u_u424 })))))))))))))))

# 499 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgramComplete = (fun (dtb_u_u425 : string) -> (let dtb_u_u426 = ((v_decCachedProgram (String.length dtb_u_u425)) (Base_dBytes.v_curOf dtb_u_u425)) in (match dtb_u_u426 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u427) -> (match dtb_u_u427 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u428; B_dData_dPair.f_Pair_second = dtb_u_u429 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u429) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u428)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 29 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDatas = (fun (dtb_u_u430 : t_CachedProgram) -> (match dtb_u_u430 with
  | { f_CachedProgram_cachedDatas = dtb_u_u431; f_CachedProgram_cachedDefs = dtb_u_u432; f_CachedProgram_cachedGlobals = dtb_u_u433; f_CachedProgram_cachedInsts = dtb_u_u434; f_CachedProgram_cachedClasses = dtb_u_u435; f_CachedProgram_cachedOpaque = dtb_u_u436 } -> dtb_u_u431
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDefs = (fun (dtb_u_u437 : t_CachedProgram) -> (match dtb_u_u437 with
  | { f_CachedProgram_cachedDatas = dtb_u_u438; f_CachedProgram_cachedDefs = dtb_u_u439; f_CachedProgram_cachedGlobals = dtb_u_u440; f_CachedProgram_cachedInsts = dtb_u_u441; f_CachedProgram_cachedClasses = dtb_u_u442; f_CachedProgram_cachedOpaque = dtb_u_u443 } -> dtb_u_u439
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedGlobals = (fun (dtb_u_u444 : t_CachedProgram) -> (match dtb_u_u444 with
  | { f_CachedProgram_cachedDatas = dtb_u_u445; f_CachedProgram_cachedDefs = dtb_u_u446; f_CachedProgram_cachedGlobals = dtb_u_u447; f_CachedProgram_cachedInsts = dtb_u_u448; f_CachedProgram_cachedClasses = dtb_u_u449; f_CachedProgram_cachedOpaque = dtb_u_u450 } -> dtb_u_u447
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedInsts = (fun (dtb_u_u451 : t_CachedProgram) -> (match dtb_u_u451 with
  | { f_CachedProgram_cachedDatas = dtb_u_u452; f_CachedProgram_cachedDefs = dtb_u_u453; f_CachedProgram_cachedGlobals = dtb_u_u454; f_CachedProgram_cachedInsts = dtb_u_u455; f_CachedProgram_cachedClasses = dtb_u_u456; f_CachedProgram_cachedOpaque = dtb_u_u457 } -> dtb_u_u455
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedClasses = (fun (dtb_u_u458 : t_CachedProgram) -> (match dtb_u_u458 with
  | { f_CachedProgram_cachedDatas = dtb_u_u459; f_CachedProgram_cachedDefs = dtb_u_u460; f_CachedProgram_cachedGlobals = dtb_u_u461; f_CachedProgram_cachedInsts = dtb_u_u462; f_CachedProgram_cachedClasses = dtb_u_u463; f_CachedProgram_cachedOpaque = dtb_u_u464 } -> dtb_u_u463
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaque = (fun (dtb_u_u465 : t_CachedProgram) -> (match dtb_u_u465 with
  | { f_CachedProgram_cachedDatas = dtb_u_u466; f_CachedProgram_cachedDefs = dtb_u_u467; f_CachedProgram_cachedGlobals = dtb_u_u468; f_CachedProgram_cachedInsts = dtb_u_u469; f_CachedProgram_cachedClasses = dtb_u_u470; f_CachedProgram_cachedOpaque = dtb_u_u471 } -> dtb_u_u471
  | _ -> failwith "DT: impossible branch"
))
