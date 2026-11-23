open Vuna_runtime
# 43 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtFieldMeta = (fun (mc0 : Elab_dTypes.t_DtFieldMeta) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__0; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__1; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__2 } -> ((Base_dBytes.v_encStr dtb__0) ((Base_dBytes.v_encInt dtb__1) ((Core_dCanonical.v_encTerm dtb__2) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtDef = (fun (mc0 : Elab_dTypes.t_DtDef) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__3, dtb__4, dtb__5, dtb__6) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__3) ((Core_dCanonical.v_encTerm dtb__4) ((Base_dBytes.v_encStr dtb__5) mc1))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__7, dtb__8, dtb__9) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__7) ((Core_dCanonical.v_encTerm dtb__8) mc1)))
  | Elab_dTypes.C_DtDef_DtDef (dtb__10, dtb__11, dtb__12, dtb__13) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__10) ((Core_dCanonical.v_encTerm dtb__11) ((Core_dCanonical.v_encTerm dtb__12) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtDefs = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encDtDef) ds) acc))

# 64 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encSpan = (fun (s : Base_dSource.t_Span) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (s).Base_dSource.f_Span_spanFile) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanStartLine) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanStartCol) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanEndLine) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanEndCol) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanStartOffset) ((Base_dBytes.v_encInt (s).Base_dSource.f_Span_spanEndOffset) acc))))))))

# 70 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decSpan = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (file : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (sl : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (sc : int) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b3)) (fun (el : int) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b4)) (fun (ec : int) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b5)) (fun (so : int) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b6)) (fun (eo : int) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = sl; Base_dSource.f_Span_spanStartCol = sc; Base_dSource.f_Span_spanEndLine = el; Base_dSource.f_Span_spanEndCol = ec; Base_dSource.f_Span_spanStartOffset = so; Base_dSource.f_Span_spanEndOffset = eo }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 76 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encMaybeSpan = (Base_dBytes.v_encMaybe v_encSpan)

# 108 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encTelePair = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = dtb__15 } -> ((Base_dBytes.v_encStr dtb__14) ((Core_dCanonical.v_encTerm dtb__15) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtInstSem = (fun (mc0 : Elab_dTypes.t_DtInst) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__16; Elab_dTypes.f_DtInst_dtInstSym = dtb__17; Elab_dTypes.f_DtInst_dtInstKey = dtb__18; Elab_dTypes.f_DtInst_dtInstTele = dtb__19; Elab_dTypes.f_DtInst_dtInstCtx = dtb__20; Elab_dTypes.f_DtInst_dtInstHead = dtb__21; Elab_dTypes.f_DtInst_dtInstSpan = dtb__22 } -> ((Base_dBytes.v_encStr dtb__16) ((Base_dBytes.v_encStr dtb__17) ((Base_dBytes.v_encStr dtb__18) (((Base_dBytes.v_encList v_encTelePair) dtb__19) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__20) ((Core_dCanonical.v_encTerm dtb__21) mc1))))))
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtInst = (fun (mc0 : Elab_dTypes.t_DtInst) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__23; Elab_dTypes.f_DtInst_dtInstSym = dtb__24; Elab_dTypes.f_DtInst_dtInstKey = dtb__25; Elab_dTypes.f_DtInst_dtInstTele = dtb__26; Elab_dTypes.f_DtInst_dtInstCtx = dtb__27; Elab_dTypes.f_DtInst_dtInstHead = dtb__28; Elab_dTypes.f_DtInst_dtInstSpan = dtb__29 } -> ((Base_dBytes.v_encStr dtb__23) ((Base_dBytes.v_encStr dtb__24) ((Base_dBytes.v_encStr dtb__25) (((Base_dBytes.v_encList v_encTelePair) dtb__26) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__27) ((Core_dCanonical.v_encTerm dtb__28) ((v_encMaybeSpan dtb__29) mc1)))))))
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtClassSem = (fun (mc0 : Elab_dTypes.t_DtClass) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__30; Elab_dTypes.f_DtClass_dtClassParams = dtb__31; Elab_dTypes.f_DtClass_dtClassSupers = dtb__32; Elab_dTypes.f_DtClass_dtClassMethods = dtb__33; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__34; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__35 } -> ((Base_dBytes.v_encStr dtb__30) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__31) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__32) (((Base_dBytes.v_encList v_encTelePair) dtb__33) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__34) mc1)))))
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtClass = (fun (mc0 : Elab_dTypes.t_DtClass) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__36; Elab_dTypes.f_DtClass_dtClassParams = dtb__37; Elab_dTypes.f_DtClass_dtClassSupers = dtb__38; Elab_dTypes.f_DtClass_dtClassMethods = dtb__39; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__40; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__41 } -> ((Base_dBytes.v_encStr dtb__36) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__37) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__38) (((Base_dBytes.v_encList v_encTelePair) dtb__39) (((Base_dBytes.v_encList Core_dCanonical.v_encTerm) dtb__40) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) v_encSpan)) dtb__41) mc1))))))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encBinder = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> ((Base_dBytes.v_encStr dtb__42) ((Core_dCanonical.v_encRig dtb__43) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtCtor = (fun (mc0 : Elab_dTypes.t_DtCtor) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__44; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__45; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__46; Elab_dTypes.f_DtCtor_dtCtorType = dtb__47; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__48 } -> ((Base_dBytes.v_encStr dtb__44) ((Base_dBytes.v_encStr dtb__45) (((Base_dBytes.v_encList v_encBinder) dtb__46) ((Core_dCanonical.v_encTerm dtb__47) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encMaybeTerm = (fun (m : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe Core_dCanonical.v_encTerm) m) acc))

# 120 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encReprTier = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> (Base_dBytes.v_encTag 2)
  | Frontend_dAst.C_ReprTier_ReprAlias -> (Base_dBytes.v_encTag 1)
  | Frontend_dAst.C_ReprTier_ReprAuto -> (Base_dBytes.v_encTag 0)
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encDtData = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__49; Elab_dTypes.f_DtData_dtDataParams = dtb__50; Elab_dTypes.f_DtData_dtDataCtors = dtb__51; Elab_dTypes.f_DtData_dtDataKind = dtb__52; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__53; Elab_dTypes.f_DtData_dtDataLinear = dtb__54; Elab_dTypes.f_DtData_dtDataRepr = dtb__55; Elab_dTypes.f_DtData_dtDataFields = dtb__56; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__57 } -> ((Base_dBytes.v_encStr dtb__49) (((Base_dBytes.v_encList v_encBinder) dtb__50) (((Base_dBytes.v_encList v_encDtCtor) dtb__51) ((Core_dCanonical.v_encTerm dtb__52) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__53) ((Base_dBytes.v_encBool dtb__54) ((v_encReprTier dtb__55) (((Base_dBytes.v_encList v_encDtFieldMeta) dtb__56) ((Base_dBytes.v_encBool dtb__57) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encExportEntry = (fun (e : Loader_dModules.t_ExportEntry) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (e).Loader_dModules.f_ExportEntry_kind) ((Base_dBytes.v_encStr (e).Loader_dModules.f_ExportEntry_public) ((Base_dBytes.v_encStr (e).Loader_dModules.f_ExportEntry_target) ((Base_dBytes.v_encStr (e).Loader_dModules.f_ExportEntry_parent) acc)))))

# 133 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encExportEntries = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encExportEntry) es) acc))

# 137 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encFixity = (fun (f : Frontend_dAst.t_FixityDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityAssoc) acc))))

# 141 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encFixities = (fun (fs : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encFixity) fs) acc))

# 145 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encImport = (fun (i : Frontend_dAst.t_Import) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (i).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (i).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (i).Frontend_dAst.f_Import_importAlias) acc))))

# 150 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encImports = (fun (is : Frontend_dAst.t_Import B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encImport) is) acc))

# 154 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordFieldMeta = (fun (f : Elab_dRecords.t_RecordFieldMeta) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Elab_dRecords.f_RecordFieldMeta_recordFieldName) ((Base_dBytes.v_encInt (f).Elab_dRecords.f_RecordFieldMeta_recordFieldIndex) ((Frontend_dCanonical_dAst.v_encExpr (Frontend_dRast_dBridge.v_toAstExpr (f).Elab_dRecords.f_RecordFieldMeta_recordFieldType)) acc))))

# 159 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordMeta = (fun (r : Elab_dRecords.t_RecordMeta) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (r).Elab_dRecords.f_RecordMeta_recordMetaName) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (r).Elab_dRecords.f_RecordMeta_recordMetaParams) (((Base_dBytes.v_encList v_encRecordFieldMeta) (r).Elab_dRecords.f_RecordMeta_recordMetaFields) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (r).Elab_dRecords.f_RecordMeta_recordMetaDerivings) ((Base_dBytes.v_encBool (r).Elab_dRecords.f_RecordMeta_recordMetaDerivingVia) ((v_encReprTier (r).Elab_dRecords.f_RecordMeta_recordMetaRepr) ((Base_dBytes.v_encStr (r).Elab_dRecords.f_RecordMeta_recordMetaCtor) ((Base_dBytes.v_encBool (r).Elab_dRecords.f_RecordMeta_recordMetaLinear) acc)))))))))

# 166 "Vuna/Compiler/Elab/Canonical.vuna"
let v_encRecordMetas = (fun (rs : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encRecordMeta) rs) acc))

# 173 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decBinder = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decRig (fuel - 1)) b1)) (fun (r : Core_dTerm.t_Rig) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = r }; B_dData_dPair.f_Pair_second = b2 }))))))))

# 183 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decTelePair = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b1)) (fun (t : Core_dTerm.t_Term) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = t }; B_dData_dPair.f_Pair_second = b2 })))))))

# 190 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decReprTier = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) bytes)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = b1 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 205 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtCtor = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (family : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decBinder) (fuel - 1)) b2)) (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b3)) (fun (ty : Core_dTerm.t_Term) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = name; Elab_dTypes.f_DtCtor_dtCtorFamily = family; Elab_dTypes.f_DtCtor_dtCtorTelescope = tele; Elab_dTypes.f_DtCtor_dtCtorType = ty; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = b4 })))))))))))

# 212 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtFieldMeta = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (idx : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b2)) (fun (ty : Core_dTerm.t_Term) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtFieldMeta_dtFieldName = name; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = idx; Elab_dTypes.f_DtFieldMeta_dtFieldType = ty }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 219 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtData = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decBinder) (fuel - 1)) b1)) (fun (params : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDtCtor) (fuel - 1)) b2)) (fun (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b3)) (fun (kind : Core_dTerm.t_Term) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b4)) (fun (viaClasses : string B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b5)) (fun (lin : bool) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decReprTier (fuel - 1)) b6)) (fun (repr : Frontend_dAst.t_ReprTier) (b7 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDtFieldMeta) (fuel - 1)) b7)) (fun (fields : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (b8 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b8)) (fun (isRec : bool) (b9 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtData_dtDataName = name; Elab_dTypes.f_DtData_dtDataParams = params; Elab_dTypes.f_DtData_dtDataCtors = ctors; Elab_dTypes.f_DtData_dtDataKind = kind; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = lin; Elab_dTypes.f_DtData_dtDataRepr = repr; Elab_dTypes.f_DtData_dtDataFields = fields; Elab_dTypes.f_DtData_dtDataIsRecord = isRec }; B_dData_dPair.f_Pair_second = b9 })))))))))))))))))))))

# 226 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDef = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) bytes)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (name : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b2)) (fun (ty : Core_dTerm.t_Term) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b3)) (fun (body : Core_dTerm.t_Term) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtDef (name, ty, body, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = b4 })))))))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (name : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b2)) (fun (ty : Core_dTerm.t_Term) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtAxiom (name, ty, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (name : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b2)) (fun (ty : Core_dTerm.t_Term) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b3)) (fun (cName : string) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtExtern (name, ty, cName, B_dData_dMaybe.C_Maybe_Nothing)); B_dData_dPair.f_Pair_second = b4 })))))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 241 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDefs = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decDtDef) fuel) bytes)))

# 245 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtInst = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (sym : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b2)) (fun (key : string) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTelePair) (fuel - 1)) b3)) (fun (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (fuel - 1)) b4)) (fun (ctxE : Core_dTerm.t_Term B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b5)) (fun (head : Core_dTerm.t_Term) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) b6)) (fun (sp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtInst_dtInstName = name; Elab_dTypes.f_DtInst_dtInstSym = sym; Elab_dTypes.f_DtInst_dtInstKey = key; Elab_dTypes.f_DtInst_dtInstTele = tele; Elab_dTypes.f_DtInst_dtInstCtx = ctxE; Elab_dTypes.f_DtInst_dtInstHead = head; Elab_dTypes.f_DtInst_dtInstSpan = sp }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 252 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtClass = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (params : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (fuel - 1)) b2)) (fun (supers : Core_dTerm.t_Term B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTelePair) (fuel - 1)) b3)) (fun (projs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Core_dCanonical.v_decTerm) (fuel - 1)) b4)) (fun (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decSpan)) (fuel - 1)) b5)) (fun (spans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtClass_dtClassName = name; Elab_dTypes.f_DtClass_dtClassParams = params; Elab_dTypes.f_DtClass_dtClassSupers = supers; Elab_dTypes.f_DtClass_dtClassMethods = projs; Elab_dTypes.f_DtClass_dtClassFieldTys = fieldTys; Elab_dTypes.f_DtClass_dtClassMethodSpans = spans }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 259 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decExportEntry = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (kind : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (public : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b2)) (fun (target : string) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b3)) (fun (parent : string) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_ExportEntry_kind = kind; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = target; Loader_dModules.f_ExportEntry_parent = parent }; B_dData_dPair.f_Pair_second = b4 })))))))))))

# 266 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decExportEntries = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decExportEntry) fuel) bytes)))

# 270 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decFixity = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (op : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (level : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (assoc : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 277 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decFixities = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decFixity) fuel) bytes)))

# 281 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decImport = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (q : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = q; Frontend_dAst.f_Import_importAlias = alias; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 288 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decImports = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decImport) fuel) bytes)))

# 292 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordFieldMeta = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (idx : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Frontend_dCanonical_dAst.v_decExpr (fuel - 1)) b2)) (fun (ty : Frontend_dAst.t_Expr) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dRecords.f_RecordFieldMeta_recordFieldName = name; Elab_dRecords.f_RecordFieldMeta_recordFieldType = (Frontend_dRast_dBridge.v_toRastExpr ty); Elab_dRecords.f_RecordFieldMeta_recordFieldIndex = idx }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 299 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordMeta = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) bytes)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (params : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decRecordFieldMeta) (fuel - 1)) b2)) (fun (fields : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b3)) (fun (derivings : string B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b4)) (fun (via : bool) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decReprTier (fuel - 1)) b5)) (fun (repr : Frontend_dAst.t_ReprTier) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b6)) (fun (ctor : string) (b7 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b7)) (fun (lin : bool) (b8 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Elab_dRecords.f_RecordMeta_recordMetaName = name; Elab_dRecords.f_RecordMeta_recordMetaParams = params; Elab_dRecords.f_RecordMeta_recordMetaFields = fields; Elab_dRecords.f_RecordMeta_recordMetaDerivings = derivings; Elab_dRecords.f_RecordMeta_recordMetaDerivingVia = via; Elab_dRecords.f_RecordMeta_recordMetaRepr = repr; Elab_dRecords.f_RecordMeta_recordMetaCtor = ctor; Elab_dRecords.f_RecordMeta_recordMetaLinear = lin }; B_dData_dPair.f_Pair_second = b8 })))))))))))))))))))

# 306 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decRecordMetas = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (((Base_dBytes.v_decList v_decRecordMeta) fuel) bytes)))

# 310 "Vuna/Compiler/Elab/Canonical.vuna"
let v_decDtDefsComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDtDefs (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (match dtb__58 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (if (Base_dBytes.v_curAtEnd dtb__60) then (B_dData_dMaybe.C_Maybe_Just (dtb__59)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
