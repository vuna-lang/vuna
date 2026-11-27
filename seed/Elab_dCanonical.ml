open Vuna_runtime
# 42 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtFieldMeta = (fun (dtb_u_u1 : Elab_dTypes.t_DtFieldMeta) (dtb_u_u2 : string B_dData_dList.t_List) -> (match dtb_u_u1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u3; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u4; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb_u_u5 } -> ((Base_dBytes.v_encStr dtb_u_u3) ((Base_dBytes.v_encInt dtb_u_u4) ((Core_dCanonical.v_encTerm dtb_u_u5) dtb_u_u2)))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtDef = (fun (dtb_u_u6 : Elab_dTypes.t_DtDef) (dtb_u_u7 : string B_dData_dList.t_List) -> (match dtb_u_u6 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb_u_u8, dtb_u_u9, dtb_u_u10, dtb_u_u11) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u8) ((Core_dCanonical.v_encTerm dtb_u_u9) ((Base_dBytes.v_encStr dtb_u_u10) dtb_u_u7))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u12, dtb_u_u13, dtb_u_u14) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u12) ((Core_dCanonical.v_encTerm dtb_u_u13) dtb_u_u7)))
  | Elab_dTypes.C_DtDef_DtDef (dtb_u_u15, dtb_u_u16, dtb_u_u17, dtb_u_u18) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u15) ((Core_dCanonical.v_encTerm dtb_u_u16) ((Core_dCanonical.v_encTerm dtb_u_u17) dtb_u_u7))))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtDefs = (fun (dtb_u_u19 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u20 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encDtDef) dtb_u_u19) dtb_u_u20))

# 63 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encSpan = (fun (dtb_u_u21 : Base_dSource.t_Span) (dtb_u_u22 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u21).Base_dSource.f_Span_spanFile) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanStartLine) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanStartCol) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanEndLine) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanEndCol) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanStartOffset) ((Base_dBytes.v_encInt (dtb_u_u21).Base_dSource.f_Span_spanEndOffset) dtb_u_u22))))))))

# 69 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decSpan = (fun (dtb_u_u23 : int) (dtb_u_u24 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u23 - 1)) dtb_u_u24)) (fun (dtb_u_u25 : string) (dtb_u_u26 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u26)) (fun (dtb_u_u27 : int) (dtb_u_u28 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u28)) (fun (dtb_u_u29 : int) (dtb_u_u30 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u30)) (fun (dtb_u_u31 : int) (dtb_u_u32 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u32)) (fun (dtb_u_u33 : int) (dtb_u_u34 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u34)) (fun (dtb_u_u35 : int) (dtb_u_u36 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u23 - 1)) dtb_u_u36)) (fun (dtb_u_u37 : int) (dtb_u_u38 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = dtb_u_u25; Base_dSource.f_Span_spanStartLine = dtb_u_u27; Base_dSource.f_Span_spanStartCol = dtb_u_u29; Base_dSource.f_Span_spanEndLine = dtb_u_u31; Base_dSource.f_Span_spanEndCol = dtb_u_u33; Base_dSource.f_Span_spanStartOffset = dtb_u_u35; Base_dSource.f_Span_spanEndOffset = dtb_u_u37 }; B_dData_dPair.f_Pair_second = dtb_u_u38 })))))))))))))))))

# 75 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encMaybeSpan = (Base_dBytes.v_encMaybe v_encSpan)

# 107 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encTelePair = (fun (dtb_u_u39 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (dtb_u_u40 : string B_dData_dList.t_List) -> (match dtb_u_u39 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u41; B_dData_dPair.f_Pair_second = dtb_u_u42 } -> ((Base_dBytes.v_encStr dtb_u_u41) ((Core_dCanonical.v_encTerm dtb_u_u42) dtb_u_u40))
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtInstSem = (fun (dtb_u_u43 : Elab_dTypes.t_DtInst) (dtb_u_u44 : string B_dData_dList.t_List) -> (match dtb_u_u43 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u45; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u46; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u47; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u48; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u49; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u50; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u51 } -> ((Base_dBytes.v_encStr dtb_u_u45) ((Base_dBytes.v_encStr dtb_u_u46) ((Base_dBytes.v_encStr dtb_u_u47) (((Base_dBytes.v_encList v_encTelePair) dtb_u_u48) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u49) ((Core_dCanonical.v_encTerm dtb_u_u50) dtb_u_u44))))))
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtInst = (fun (dtb_u_u52 : Elab_dTypes.t_DtInst) (dtb_u_u53 : string B_dData_dList.t_List) -> (match dtb_u_u52 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u54; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u55; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u56; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u57; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u58; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u59; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u60 } -> ((Base_dBytes.v_encStr dtb_u_u54) ((Base_dBytes.v_encStr dtb_u_u55) ((Base_dBytes.v_encStr dtb_u_u56) (((Base_dBytes.v_encList v_encTelePair) dtb_u_u57) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u58) ((Core_dCanonical.v_encTerm dtb_u_u59) ((v_encMaybeSpan dtb_u_u60) dtb_u_u53)))))))
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtClassSem = (fun (dtb_u_u61 : Elab_dTypes.t_DtClass) (dtb_u_u62 : string B_dData_dList.t_List) -> (match dtb_u_u61 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u63; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u64; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u65; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u66; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u67; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u68 } -> ((Base_dBytes.v_encStr dtb_u_u63) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u64) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u65) (((Base_dBytes.v_encList v_encTelePair) dtb_u_u66) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u67) dtb_u_u62)))))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtClass = (fun (dtb_u_u69 : Elab_dTypes.t_DtClass) (dtb_u_u70 : string B_dData_dList.t_List) -> (match dtb_u_u69 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u71; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u72; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u73; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u74; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u75; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u76 } -> ((Base_dBytes.v_encStr dtb_u_u71) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u72) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u73) (((Base_dBytes.v_encList v_encTelePair) dtb_u_u74) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb_u_u75) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) v_encSpan)) dtb_u_u76) dtb_u_u70))))))
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encBinder = (fun (dtb_u_u77 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (dtb_u_u78 : string B_dData_dList.t_List) -> (match dtb_u_u77 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u79; B_dData_dPair.f_Pair_second = dtb_u_u80 } -> ((Base_dBytes.v_encStr dtb_u_u79) ((Core_dCanonical.v_encRig dtb_u_u80) dtb_u_u78))
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtCtor = (fun (dtb_u_u81 : Elab_dTypes.t_DtCtor) (dtb_u_u82 : string B_dData_dList.t_List) -> (match dtb_u_u81 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u83; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u84; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u85; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u86; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb_u_u87 } -> ((Base_dBytes.v_encStr dtb_u_u83) ((Base_dBytes.v_encStr dtb_u_u84) (((Base_dBytes.v_encList v_encBinder) dtb_u_u85) ((Core_dCanonical.v_encTerm dtb_u_u86) dtb_u_u82))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encMaybeTerm = (fun (dtb_u_u88 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) (dtb_u_u89 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe Core_dCanonical.v_encTerm) dtb_u_u88) dtb_u_u89))

# 119 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encReprTier = (fun (dtb_u_u90 : Frontend_dAst.t_ReprTier) -> (match dtb_u_u90 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> (Base_dBytes.v_encTag 2)
  | Frontend_dAst.C_ReprTier_ReprAlias -> (Base_dBytes.v_encTag 1)
  | Frontend_dAst.C_ReprTier_ReprAuto -> (Base_dBytes.v_encTag 0)
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtData = (fun (dtb_u_u91 : Elab_dTypes.t_DtData) (dtb_u_u92 : string B_dData_dList.t_List) -> (match dtb_u_u91 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb_u_u93; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u94; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u95; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u96; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u97; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u98; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u99; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u100; Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u101 } -> ((Base_dBytes.v_encStr dtb_u_u93) (((Base_dBytes.v_encList v_encBinder) dtb_u_u94) (((Base_dBytes.v_encList v_encDtCtor) dtb_u_u95) ((Core_dCanonical.v_encTerm dtb_u_u96) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u97) ((Base_dBytes.v_encBool dtb_u_u98) ((v_encReprTier dtb_u_u99) (((Base_dBytes.v_encList v_encDtFieldMeta) dtb_u_u100) ((Base_dBytes.v_encBool dtb_u_u101) dtb_u_u92)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encExportEntry = (fun (dtb_u_u102 : Loader_dModules.t_ExportEntry) (dtb_u_u103 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u102).Loader_dModules.f_ExportEntry_kind) ((Base_dBytes.v_encStr (dtb_u_u102).Loader_dModules.f_ExportEntry_public) ((Base_dBytes.v_encStr (dtb_u_u102).Loader_dModules.f_ExportEntry_target) ((Base_dBytes.v_encStr (dtb_u_u102).Loader_dModules.f_ExportEntry_parent) dtb_u_u103)))))

# 132 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encExportEntries = (fun (dtb_u_u104 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u105 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encExportEntry) dtb_u_u104) dtb_u_u105))

# 136 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encFixity = (fun (dtb_u_u106 : Frontend_dAst.t_FixityDecl) (dtb_u_u107 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u106).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (dtb_u_u106).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (dtb_u_u106).Frontend_dAst.f_FixityDecl_fixityAssoc) dtb_u_u107))))

# 140 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encFixities = (fun (dtb_u_u108 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (dtb_u_u109 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encFixity) dtb_u_u108) dtb_u_u109))

# 144 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encImport = (fun (dtb_u_u110 : Frontend_dAst.t_Import) (dtb_u_u111 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u110).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (dtb_u_u110).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (dtb_u_u110).Frontend_dAst.f_Import_importAlias) dtb_u_u111))))

# 149 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encImports = (fun (dtb_u_u112 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u113 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encImport) dtb_u_u112) dtb_u_u113))

# 153 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordFieldMeta = (fun (dtb_u_u114 : Elab_dRecords.t_RecordFieldMeta) (dtb_u_u115 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u114).Elab_dRecords.f_RecordFieldMeta_recordFieldName) ((Base_dBytes.v_encInt (dtb_u_u114).Elab_dRecords.f_RecordFieldMeta_recordFieldIndex) ((Frontend_dCanonical_dAst.v_encExpr (dtb_u_u114).Elab_dRecords.f_RecordFieldMeta_recordFieldType) dtb_u_u115))))

# 158 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordMeta = (fun (dtb_u_u116 : Elab_dRecords.t_RecordMeta) (dtb_u_u117 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaName) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaParams) (((Base_dBytes.v_encList v_encRecordFieldMeta) (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaFields) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaDerivings) ((Base_dBytes.v_encBool (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaDerivingVia) ((v_encReprTier (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaRepr) ((Base_dBytes.v_encStr (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaCtor) ((Base_dBytes.v_encBool (dtb_u_u116).Elab_dRecords.f_RecordMeta_recordMetaLinear) dtb_u_u117)))))))))

# 165 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordMetas = (fun (dtb_u_u118 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u119 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encRecordMeta) dtb_u_u118) dtb_u_u119))

# 172 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decBinder = (fun (dtb_u_u120 : int) (dtb_u_u121 : Base_dBytes.t_Cur) -> (if (dtb_u_u120 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u120 - 1)) dtb_u_u121)) (fun (dtb_u_u122 : string) (dtb_u_u123 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decRig (dtb_u_u120 - 1)) dtb_u_u123)) (fun (dtb_u_u124 : Core_dTerm.t_Rig) (dtb_u_u125 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u122; B_dData_dPair.f_Pair_second = dtb_u_u124 }; B_dData_dPair.f_Pair_second = dtb_u_u125 }))))))))

# 182 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decTelePair = (fun (dtb_u_u126 : int) (dtb_u_u127 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u126 - 1)) dtb_u_u127)) (fun (dtb_u_u128 : string) (dtb_u_u129 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u126 - 1)) dtb_u_u129)) (fun (dtb_u_u130 : Core_dTerm.t_Term) (dtb_u_u131 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u128; B_dData_dPair.f_Pair_second = dtb_u_u130 }; B_dData_dPair.f_Pair_second = dtb_u_u131 })))))))

# 189 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decReprTier = (fun (dtb_u_u132 : int) (dtb_u_u133 : Base_dBytes.t_Cur) -> (if (dtb_u_u132 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u132) dtb_u_u133)) (fun (dtb_u_u134 : int) (dtb_u_u135 : Base_dBytes.t_Cur) -> (if (dtb_u_u134 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb_u_u135 })) else (if (dtb_u_u134 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb_u_u135 })) else (if (dtb_u_u134 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb_u_u135 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 204 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtCtor = (fun (dtb_u_u136 : int) (dtb_u_u137 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u136 - 1)) dtb_u_u137)) (fun (dtb_u_u138 : string) (dtb_u_u139 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u136 - 1)) dtb_u_u139)) (fun (dtb_u_u140 : string) (dtb_u_u141 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decBinder) (dtb_u_u136 - 1)) dtb_u_u141)) (fun (dtb_u_u142 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u143 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u136 - 1)) dtb_u_u143)) (fun (dtb_u_u144 : Core_dTerm.t_Term) (dtb_u_u145 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u138; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u140; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u142; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u144; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u145 })))))))))))

# 211 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtFieldMeta = (fun (dtb_u_u146 : int) (dtb_u_u147 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u146 - 1)) dtb_u_u147)) (fun (dtb_u_u148 : string) (dtb_u_u149 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u146 - 1)) dtb_u_u149)) (fun (dtb_u_u150 : int) (dtb_u_u151 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u146 - 1)) dtb_u_u151)) (fun (dtb_u_u152 : Core_dTerm.t_Term) (dtb_u_u153 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u148; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u150; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb_u_u152 }; B_dData_dPair.f_Pair_second = dtb_u_u153 })))))))))

# 218 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtData = (fun (dtb_u_u154 : int) (dtb_u_u155 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u154 - 1)) dtb_u_u155)) (fun (dtb_u_u156 : string) (dtb_u_u157 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decBinder) (dtb_u_u154 - 1)) dtb_u_u157)) (fun (dtb_u_u158 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u159 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDtCtor) (dtb_u_u154 - 1)) dtb_u_u159)) (fun (dtb_u_u160 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u161 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u154 - 1)) dtb_u_u161)) (fun (dtb_u_u162 : Core_dTerm.t_Term) (dtb_u_u163 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u154 - 1)) dtb_u_u163)) (fun (dtb_u_u164 : string B_dData_dList.t_List) (dtb_u_u165 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u154 - 1)) dtb_u_u165)) (fun (dtb_u_u166 : bool) (dtb_u_u167 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decReprTier (dtb_u_u154 - 1)) dtb_u_u167)) (fun (dtb_u_u168 : Frontend_dAst.t_ReprTier) (dtb_u_u169 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDtFieldMeta) (dtb_u_u154 - 1)) dtb_u_u169)) (fun (dtb_u_u170 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (dtb_u_u171 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u154 - 1)) dtb_u_u171)) (fun (dtb_u_u172 : bool) (dtb_u_u173 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtData_dtDataName = dtb_u_u156; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u158; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u160; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u162; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u164; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u166; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u168; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u170; Elab_dTypes.f_DtData_dtDataIsRecord = dtb_u_u172 }; B_dData_dPair.f_Pair_second = dtb_u_u173 })))))))))))))))))))))

# 225 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDef = (fun (dtb_u_u174 : int) (dtb_u_u175 : Base_dBytes.t_Cur) -> (if (dtb_u_u174 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u174) dtb_u_u175)) (fun (dtb_u_u176 : int) (dtb_u_u177 : Base_dBytes.t_Cur) -> (if (dtb_u_u176 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u174 - 1)) dtb_u_u177)) (fun (dtb_u_u178 : string) (dtb_u_u179 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u174 - 1)) dtb_u_u179)) (fun (dtb_u_u180 : Core_dTerm.t_Term) (dtb_u_u181 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u174 - 1)) dtb_u_u181)) (fun (dtb_u_u182 : Core_dTerm.t_Term) (dtb_u_u183 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtDef (dtb_u_u178, dtb_u_u180, dtb_u_u182, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = dtb_u_u183 })))))))) else (if (dtb_u_u176 = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u174 - 1)) dtb_u_u177)) (fun (dtb_u_u184 : string) (dtb_u_u185 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u174 - 1)) dtb_u_u185)) (fun (dtb_u_u186 : Core_dTerm.t_Term) (dtb_u_u187 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u184, dtb_u_u186, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = dtb_u_u187 })))))) else (if (dtb_u_u176 = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u174 - 1)) dtb_u_u177)) (fun (dtb_u_u188 : string) (dtb_u_u189 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u174 - 1)) dtb_u_u189)) (fun (dtb_u_u190 : Core_dTerm.t_Term) (dtb_u_u191 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u174 - 1)) dtb_u_u191)) (fun (dtb_u_u192 : string) (dtb_u_u193 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtExtern (dtb_u_u188, dtb_u_u190, dtb_u_u192, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = dtb_u_u193 })))))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 240 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDefs = (fun (dtb_u_u194 : int) (dtb_u_u195 : Base_dBytes.t_Cur) -> (if (dtb_u_u194 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decDtDef) dtb_u_u194) dtb_u_u195)))

# 244 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtInst = (fun (dtb_u_u196 : int) (dtb_u_u197 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u196 - 1)) dtb_u_u197)) (fun (dtb_u_u198 : string) (dtb_u_u199 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u196 - 1)) dtb_u_u199)) (fun (dtb_u_u200 : string) (dtb_u_u201 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u196 - 1)) dtb_u_u201)) (fun (dtb_u_u202 : string) (dtb_u_u203 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTelePair) (dtb_u_u196 - 1)) dtb_u_u203)) (fun (dtb_u_u204 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u205 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (dtb_u_u196 - 1)) dtb_u_u205)) (fun (dtb_u_u206 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u207 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (dtb_u_u196 - 1)) dtb_u_u207)) (fun (dtb_u_u208 : Core_dTerm.t_Term) (dtb_u_u209 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u196 - 1)) dtb_u_u209)) (fun (dtb_u_u210 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u211 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u198; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u200; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u202; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u204; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u206; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u208; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u210 }; B_dData_dPair.f_Pair_second = dtb_u_u211 })))))))))))))))))

# 251 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtClass = (fun (dtb_u_u212 : int) (dtb_u_u213 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u212 - 1)) dtb_u_u213)) (fun (dtb_u_u214 : string) (dtb_u_u215 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u212 - 1)) dtb_u_u215)) (fun (dtb_u_u216 : string B_dData_dList.t_List) (dtb_u_u217 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (dtb_u_u212 - 1)) dtb_u_u217)) (fun (dtb_u_u218 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u219 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTelePair) (dtb_u_u212 - 1)) dtb_u_u219)) (fun (dtb_u_u220 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u221 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (dtb_u_u212 - 1)) dtb_u_u221)) (fun (dtb_u_u222 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u223 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decSpan)) (dtb_u_u212 - 1)) dtb_u_u223)) (fun (dtb_u_u224 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u225 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u214; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u216; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u218; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u220; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u222; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u224 }; B_dData_dPair.f_Pair_second = dtb_u_u225 })))))))))))))))

# 258 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decExportEntry = (fun (dtb_u_u226 : int) (dtb_u_u227 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u226 - 1)) dtb_u_u227)) (fun (dtb_u_u228 : string) (dtb_u_u229 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u226 - 1)) dtb_u_u229)) (fun (dtb_u_u230 : string) (dtb_u_u231 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u226 - 1)) dtb_u_u231)) (fun (dtb_u_u232 : string) (dtb_u_u233 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u226 - 1)) dtb_u_u233)) (fun (dtb_u_u234 : string) (dtb_u_u235 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_ExportEntry_kind = dtb_u_u228; Loader_dModules.f_ExportEntry_public = dtb_u_u230; Loader_dModules.f_ExportEntry_target = dtb_u_u232; Loader_dModules.f_ExportEntry_parent = dtb_u_u234 }; B_dData_dPair.f_Pair_second = dtb_u_u235 })))))))))))

# 265 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decExportEntries = (fun (dtb_u_u236 : int) (dtb_u_u237 : Base_dBytes.t_Cur) -> (if (dtb_u_u236 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decExportEntry) dtb_u_u236) dtb_u_u237)))

# 269 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decFixity = (fun (dtb_u_u238 : int) (dtb_u_u239 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u238 - 1)) dtb_u_u239)) (fun (dtb_u_u240 : string) (dtb_u_u241 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u238 - 1)) dtb_u_u241)) (fun (dtb_u_u242 : int) (dtb_u_u243 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u238 - 1)) dtb_u_u243)) (fun (dtb_u_u244 : int) (dtb_u_u245 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = dtb_u_u240; Frontend_dAst.f_FixityDecl_fixityLevel = dtb_u_u242; Frontend_dAst.f_FixityDecl_fixityAssoc = dtb_u_u244; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u245 })))))))))

# 276 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decFixities = (fun (dtb_u_u246 : int) (dtb_u_u247 : Base_dBytes.t_Cur) -> (if (dtb_u_u246 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decFixity) dtb_u_u246) dtb_u_u247)))

# 280 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decImport = (fun (dtb_u_u248 : int) (dtb_u_u249 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u248 - 1)) dtb_u_u249)) (fun (dtb_u_u250 : string) (dtb_u_u251 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u248 - 1)) dtb_u_u251)) (fun (dtb_u_u252 : bool) (dtb_u_u253 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (dtb_u_u248 - 1)) dtb_u_u253)) (fun (dtb_u_u254 : string B_dData_dMaybe.t_Maybe) (dtb_u_u255 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = dtb_u_u250; Frontend_dAst.f_Import_importIsQualified = dtb_u_u252; Frontend_dAst.f_Import_importAlias = dtb_u_u254; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u255 })))))))))

# 287 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decImports = (fun (dtb_u_u256 : int) (dtb_u_u257 : Base_dBytes.t_Cur) -> (if (dtb_u_u256 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decImport) dtb_u_u256) dtb_u_u257)))

# 291 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordFieldMeta = (fun (dtb_u_u258 : int) (dtb_u_u259 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u258 - 1)) dtb_u_u259)) (fun (dtb_u_u260 : string) (dtb_u_u261 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u258 - 1)) dtb_u_u261)) (fun (dtb_u_u262 : int) (dtb_u_u263 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Frontend_dCanonical_dAst.v_decExpr (dtb_u_u258 - 1)) dtb_u_u263)) (fun (dtb_u_u264 : Frontend_dAst.t_Expr) (dtb_u_u265 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dRecords.f_RecordFieldMeta_recordFieldName = dtb_u_u260; Elab_dRecords.f_RecordFieldMeta_recordFieldType = dtb_u_u264; Elab_dRecords.f_RecordFieldMeta_recordFieldIndex = dtb_u_u262 }; B_dData_dPair.f_Pair_second = dtb_u_u265 })))))))))

# 298 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordMeta = (fun (dtb_u_u266 : int) (dtb_u_u267 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u266 - 1)) dtb_u_u267)) (fun (dtb_u_u268 : string) (dtb_u_u269 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u266 - 1)) dtb_u_u269)) (fun (dtb_u_u270 : string B_dData_dList.t_List) (dtb_u_u271 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decRecordFieldMeta) (dtb_u_u266 - 1)) dtb_u_u271)) (fun (dtb_u_u272 : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (dtb_u_u273 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u266 - 1)) dtb_u_u273)) (fun (dtb_u_u274 : string B_dData_dList.t_List) (dtb_u_u275 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u266 - 1)) dtb_u_u275)) (fun (dtb_u_u276 : bool) (dtb_u_u277 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decReprTier (dtb_u_u266 - 1)) dtb_u_u277)) (fun (dtb_u_u278 : Frontend_dAst.t_ReprTier) (dtb_u_u279 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u266 - 1)) dtb_u_u279)) (fun (dtb_u_u280 : string) (dtb_u_u281 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u266 - 1)) dtb_u_u281)) (fun (dtb_u_u282 : bool) (dtb_u_u283 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dRecords.f_RecordMeta_recordMetaName = dtb_u_u268; Elab_dRecords.f_RecordMeta_recordMetaParams = dtb_u_u270; Elab_dRecords.f_RecordMeta_recordMetaFields = dtb_u_u272; Elab_dRecords.f_RecordMeta_recordMetaDerivings = dtb_u_u274; Elab_dRecords.f_RecordMeta_recordMetaDerivingVia = dtb_u_u276; Elab_dRecords.f_RecordMeta_recordMetaRepr = dtb_u_u278; Elab_dRecords.f_RecordMeta_recordMetaCtor = dtb_u_u280; Elab_dRecords.f_RecordMeta_recordMetaLinear = dtb_u_u282 }; B_dData_dPair.f_Pair_second = dtb_u_u283 })))))))))))))))))))

# 305 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordMetas = (fun (dtb_u_u284 : int) (dtb_u_u285 : Base_dBytes.t_Cur) -> (if (dtb_u_u284 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decRecordMeta) dtb_u_u284) dtb_u_u285)))

# 309 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDefsComplete = (fun (dtb_u_u286 : string) -> (let dtb_u_u287 = ((v_decDtDefs (String.length dtb_u_u286)) (Base_dBytes.v_curOf dtb_u_u286)) in (match dtb_u_u287 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u288) -> (match dtb_u_u288 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u289; B_dData_dPair.f_Pair_second = dtb_u_u290 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u290) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u289)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
