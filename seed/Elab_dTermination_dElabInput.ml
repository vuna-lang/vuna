open Vuna_runtime
type t_ProjEntry = { f_ProjEntry_peName : string; f_ProjEntry_peCtor : string; f_ProjEntry_peField : int }
and t_DefShape = { f_DefShape_dsName : string; f_DefShape_dsPrefix : int; f_DefShape_dsArity : int }
and t_ConvCtx = { f_ConvCtx_ccProjs : t_ProjEntry B_dData_dList.t_List; f_ConvCtx_ccDicts : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ConvCtx_ccShapes : t_DefShape B_dData_dList.t_List; f_ConvCtx_ccClasses : Elab_dTypes.t_DtClass B_dData_dList.t_List; f_ConvCtx_ccFields : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ConvCtx_ccSpan : Base_dSource.t_Span }
and t_Group = { f_Group_grName : string; f_Group_grParams : string B_dData_dList.t_List; f_Group_grBody : Frontend_dRast.t_Expr; f_Group_grSpan : Base_dSource.t_Span }

# 38 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictGroupKey = (fun (dictSym : string) (method_ : string) -> (String.concat "" [dictSym; "#"; method_]))

# 52 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peNameOf = (fun (p : t_ProjEntry) -> (p).f_ProjEntry_peName)

# 86 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grNameOf = (fun (g : t_Group) -> (g).f_Group_grName)

# 100 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupToDecl = (fun (g : t_Group) -> (Frontend_dRast.C_Decl_DFun ((g).f_Group_grName, ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dRast.C_Pat_PVar (p, Base_dSource.v_spanEmpty)))) (g).f_Group_grParams), (g).f_Group_grBody, (g).f_Group_grSpan)))

# 181 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupDictCtor = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName dtb__0)) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__0)) else ((v_lookupDictCtor dtb__1) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_lookupCtorClass = v_lookupDictCtor

# 189 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_lookupDictClass = (fun (cc : t_ConvCtx) (sym : string) -> (let nd_uscrut2 = ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf p) = sym))) (cc).f_ConvCtx_ccDicts) in (match nd_uscrut2 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 195 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupClassByName = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if ((Elab_dTypes.v_dtClassName dtb__6) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__6)) else ((v_lookupClassByName dtb__7) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupProjEntry = (fun (mc0 : string) (mc1 : t_ProjEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if ((dtb__8).f_ProjEntry_peName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__8)) else ((v_lookupProjEntry mc0) dtb__9))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_shapeGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : int) (mc2 : int) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> (if dtb__11 then (((v_shapeGo dtb__14) (if (Core_dTerm.v_rigIsErased dtb__12) then mc1 else (mc1 + 1))) mc2) else (((v_shapeGo dtb__14) mc1) (if (Core_dTerm.v_rigIsErased dtb__12) then mc2 else (mc2 + 1))))
  | _ -> { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 }
))

# 216 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_shapeOfTy = (fun (ty : Core_dTerm.t_Term) -> (((v_shapeGo ty) 0) 0))

# 207 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_defShape = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (let counts = (v_shapeOfTy (Elab_dTypes.v_dtDefType d)) in (B_dData_dMaybe.C_Maybe_Just ({ f_DefShape_dsName = (Elab_dTypes.v_dtDefName d); f_DefShape_dsPrefix = (B_dData_dPair.v_firstOf counts); f_DefShape_dsArity = (B_dData_dPair.v_secondOf counts) })))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupShape = (fun (mc0 : string) (mc1 : t_DefShape B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if ((dtb__16).f_DefShape_dsName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__16)) else ((v_lookupShape mc0) dtb__17))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_stripGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (match mc1 with
  | Core_dTerm.C_Term_TLam (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (let isParam = (if (if (B_dData_dBool.v_not dtb__19) then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__20)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__24)) else false) in (let acc2 = (if isParam then ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (dtb__23, B_dData_dList.C_List_Nil))) else mc2) in (((v_stripGo dtb__22) dtb__27) acc2)))
  | _ -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = mc1 }
)
  | _ -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = mc1 }
))

# 234 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_stripLeading = (fun (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (((v_stripGo ty) body) B_dData_dList.C_List_Nil))

# 320 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_convBinders = (fun (mc0 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (match dtb__28 with
  | { Core_dTerm.f_Binder_binderName = dtb__30; Core_dTerm.f_Binder_binderRig = dtb__31; Core_dTerm.f_Binder_binderSpan = dtb__32 } -> (if (Core_dTerm.v_rigIsErased dtb__31) then (v_convBinders dtb__29) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar (dtb__30, Base_dSource.v_spanEmpty)), (v_convBinders dtb__29))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_altPattern = (fun (mc0 : string) (mc1 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (if (mc0 = "") then (Frontend_dRast.C_Pat_PWild (Base_dSource.v_spanEmpty)) else (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc0), (v_convBinders mc1), Base_dSource.v_spanEmpty))))

# 325 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_applyAcc = (fun (mc0 : t_ConvCtx) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> (Frontend_dRast.C_Expr_EApp (mc1, mc2, (mc0).f_ConvCtx_ccSpan))
))

# 329 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_tagApply = (fun (cc : t_ConvCtx) (ctor : string) (vals : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (((v_applyAcc cc) (((v_applyAcc cc) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName ctor), (cc).f_ConvCtx_ccSpan))) vals)) acc))

# 375 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_nestApp = (fun (mc0 : t_ConvCtx) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (((v_nestApp mc0) (Frontend_dRast.C_Expr_EApp (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__33, B_dData_dList.C_List_Nil)), (mc0).f_ConvCtx_ccSpan))) dtb__34)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldMetaName = (fun (m : Elab_dTypes.t_DtFieldMeta) -> (let n = (m).Elab_dTypes.f_DtFieldMeta_dtFieldName in n))

# 389 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_recordFieldTable = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match (Elab_dTypes.v_dtDataFields dtb__35) with
  | B_dData_dList.C_List_Nil -> (v_recordFieldTable dtb__36)
  | dtb__37 -> (let names = ((B_dData_dList.v_map v_fieldMetaName) dtb__37) in (let entries = ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = names })) (Elab_dTypes.v_dtDataCtors dtb__35)) in ((B_dData_dList.v_append entries) (v_recordFieldTable dtb__36))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_lookupFieldNames = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (if (dtb__40 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__41)) else ((v_lookupFieldNames mc0) dtb__39))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_peelLams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (v_peelLams dtb__46)
  | _ -> mc0
))

# 127 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictFieldsOf = (fun (cc : t_ConvCtx) (body : Core_dTerm.t_Term) -> (match (v_peelLams body) with
  | Core_dTerm.C_Term_TCon (dtb__47, dtb__48) -> (match ((v_lookupDictCtor (cc).f_ConvCtx_ccClasses) dtb__47) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 169 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictSymbolOf = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match (v_peelLams dtb__50) with
  | Core_dTerm.C_Term_TCon (dtb__51, dtb__52) -> (match ((v_lookupCtorClass classes) dtb__51) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtClassName dtb__53) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictSymbolsOf = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_mapMaybe (v_dictSymbolOf classes)) defs))

# 427 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_nthAt = (fun mc0 (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__54)) else ((v_nthAt dtb__55) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_teleName = (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) -> (let nd_uscrut2 = ((v_nthAt tele) i) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (match dtb__56 with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__57))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 400 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldNameAt = (fun (cc : t_ConvCtx) (ctor : string) (i : int) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_lookupFieldNames ctor) (cc).f_ConvCtx_ccFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (match ((v_nthAt dtb__59) i) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (B_dData_dMaybe.C_Maybe_Just (dtb__60))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_teleName tele) i)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_teleName tele) i)
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_takeGo = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__61, ((v_takeGo (mc0 - 1)) dtb__62))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_takeCount = (fun (n : int) xs -> (if (n <= 0) then B_dData_dList.C_List_Nil else ((v_takeGo n) xs)))

# 441 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_dropGo = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64)) else ((v_dropGo (mc0 - 1)) dtb__64))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dropCount = (fun (n : int) xs -> (if (n <= 0) then xs else ((v_dropGo n) xs)))

# 359 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_applyNamed = (fun (cc : t_ConvCtx) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match ((v_lookupShape name) (cc).f_ConvCtx_ccShapes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (let valueArgs = ((v_dropCount (dtb__65).f_DefShape_dsPrefix) args) in (let head = (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName name), (cc).f_ConvCtx_ccSpan)) in (match valueArgs with
  | B_dData_dList.C_List_Nil -> head
  | _ -> (((v_nestApp cc) (Frontend_dRast.C_Expr_EApp (head, ((v_takeCount (dtb__65).f_DefShape_dsArity) valueArgs), (cc).f_ConvCtx_ccSpan))) ((v_dropCount (dtb__65).f_DefShape_dsArity) valueArgs))
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName name), (cc).f_ConvCtx_ccSpan))) args)
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_appGlobal = (fun (cc : t_ConvCtx) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match ((v_lookupProjEntry name) (cc).f_ConvCtx_ccProjs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Frontend_dRast.C_Expr_EVar (dtb__69, dtb__70) -> (match ((v_lookupDictClass cc) (Frontend_dRast_dName.v_rnameKey dtb__69)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (match ((v_lookupClassByName (cc).f_ConvCtx_ccClasses) dtb__71) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (let nd_uscrut14 = ((v_nthAt (dtb__72).Elab_dTypes.f_DtClass_dtClassMethods) (dtb__66).f_ProjEntry_peField) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed cc) name) args)
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (match dtb__73 with
  | { B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = dtb__75 } -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (((v_dictGroupKey (Frontend_dRast_dName.v_rnameKey dtb__69)) dtb__74))), (cc).f_ConvCtx_ccSpan))) dtb__68)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed cc) name) args)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed cc) name) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_applyNamed cc) name) args)
)
  | B_dData_dList.C_List_Nil -> (((v_applyNamed cc) name) args)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyNamed cc) name) args)
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_convExpr = (fun (cc : t_ConvCtx) (t : Core_dTerm.t_Term) -> (((v_convGo cc) t) B_dData_dList.C_List_Nil))
# 257 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convGo = (fun (cc : t_ConvCtx) (t : Core_dTerm.t_Term) (acc : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match t with
  | Core_dTerm.C_Term_TApp (dtb__76, dtb__77, dtb__78) -> (match dtb__78 with
  | Core_dTerm.C_Rig_Rig0 -> (((v_convGo cc) dtb__76) acc)
  | _ -> (((v_convGo cc) dtb__76) (B_dData_dList.C_List__x58__x58_ (((v_convExpr cc) dtb__77), acc)))
)
  | Core_dTerm.C_Term_TLam (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if (Core_dTerm.v_rigIsErased dtb__80) then (((v_convGo cc) dtb__83) (B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85))) else (Frontend_dRast.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PVar (dtb__79, Base_dSource.v_spanEmpty)); B_dData_dPair.f_Pair_second = dtb__84 }, B_dData_dList.C_List_Nil)), (((v_convGo cc) dtb__83) dtb__85), false, (cc).f_ConvCtx_ccSpan)))
  | B_dData_dList.C_List_Nil -> (if (Core_dTerm.v_rigIsErased dtb__80) then (((v_convGo cc) dtb__83) B_dData_dList.C_List_Nil) else (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__79; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (((v_convGo cc) dtb__83) B_dData_dList.C_List_Nil), (cc).f_ConvCtx_ccSpan)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_convLeaf cc) t) acc)
))
# 279 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convLeaf = (fun (cc : t_ConvCtx) (t : Core_dTerm.t_Term) (acc : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match t with
  | Core_dTerm.C_Term_TGlobal (dtb__86) -> (((v_appGlobal cc) dtb__86) acc)
  | Core_dTerm.C_Term_TVar (dtb__87, dtb__88, dtb__89) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (dtb__87)), (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TCon (dtb__90, dtb__91) -> ((((v_tagApply cc) dtb__90) ((v_convArgs cc) dtb__91)) acc)
  | Core_dTerm.C_Term_TMk (dtb__92, dtb__93) -> ((((v_tagApply cc) dtb__92) ((v_convArgs cc) dtb__93)) acc)
  | Core_dTerm.C_Term_TRecord (dtb__94, dtb__95) -> ((((v_tagApply cc) dtb__94) ((v_convArgs cc) dtb__95)) acc)
  | Core_dTerm.C_Term_TProj (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (match ((((v_fieldNameAt cc) dtb__97) dtb__100) dtb__98) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__101) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EField (((v_convExpr cc) dtb__96), dtb__101, (cc).f_ConvCtx_ccSpan))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_applyAcc cc) ((v_convExpr cc) dtb__96)) acc)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecUpd (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (((v_applyAcc cc) ((v_convExpr cc) dtb__102)) acc)
  | Core_dTerm.C_Term_TCase (dtb__107, dtb__108) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_ECase (((v_convExpr cc) dtb__107), ((v_convAlts cc) dtb__108), (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TIf (dtb__109, dtb__110, dtb__111) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EIf (((v_convExpr cc) dtb__109), ((v_convExpr cc) dtb__110), ((v_convExpr cc) dtb__111), (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TInt (dtb__112) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EInt (dtb__112, (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TBool (dtb__113) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EInt ((if dtb__113 then 1 else 0), (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TStr (dtb__114) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EStr (dtb__114, (cc).f_ConvCtx_ccSpan))) acc)
  | Core_dTerm.C_Term_TFloat (dtb__115) -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EStr (dtb__115, (cc).f_ConvCtx_ccSpan))) acc)
  | _ -> (((v_applyAcc cc) (Frontend_dRast.C_Expr_EInt (0, (cc).f_ConvCtx_ccSpan))) acc)
))
# 304 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convArgs = (fun (mc0 : t_ConvCtx) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__119 } -> (if (Core_dTerm.v_rigIsErased dtb__119) then ((v_convArgs mc0) dtb__117) else (B_dData_dList.C_List__x58__x58_ (((v_convExpr mc0) dtb__118), ((v_convArgs mc0) dtb__117))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 309 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
and v_convAlts = (fun (mc0 : t_ConvCtx) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__122; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__123; Core_dTerm.f_CaseAlt_caseAltBody = dtb__124 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_altPattern dtb__122) dtb__123); B_dData_dPair.f_Pair_second = ((v_convExpr mc0) dtb__124) }, ((v_convAlts mc0) dtb__121)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_dictFieldGroupsGo = (fun (mc0 : t_ConvCtx) (mc1 : string) (mc2 : string) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__125 with
  | { B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 } -> (match ((v_lookupCtorClass (mc0).f_ConvCtx_ccClasses) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo mc0) mc1) mc2) dtb__126) (mc4 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> (match ((v_nthAt (dtb__129).Elab_dTypes.f_DtClass_dtClassMethods) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo mc0) mc1) mc2) dtb__126) (mc4 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (match ((v_nthAt (dtb__129).Elab_dTypes.f_DtClass_dtClassFieldTys) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dictFieldGroupsGo mc0) mc1) mc2) dtb__126) (mc4 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (let mname = (B_dData_dPair.v_firstOf dtb__130) in (let stripped = ((v_stripLeading dtb__131) dtb__127) in (let g = { f_Group_grName = ((v_dictGroupKey mc1) mname); f_Group_grParams = (B_dData_dPair.v_firstOf stripped); f_Group_grBody = ((v_convExpr mc0) (B_dData_dPair.v_secondOf stripped)); f_Group_grSpan = (mc0).f_ConvCtx_ccSpan } in (B_dData_dList.C_List__x58__x58_ (g, (((((v_dictFieldGroupsGo mc0) mc1) mc2) dtb__126) (mc4 + 1)))))))
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

# 136 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dictFieldGroups = (fun (cc : t_ConvCtx) (dictSym : string) (dictCtor : string) (fields : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_dictFieldGroupsGo cc) dictSym) dictCtor) fields) 0))

# 110 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupsOfDefGo = (fun (cc : t_ConvCtx) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDefName d)) ((B_dData_dList.v_map v_peNameOf) (cc).f_ConvCtx_ccProjs)) then B_dData_dList.C_List_Nil else (let nd_uscrut4 = ((v_dictFieldsOf cc) dtb__132) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let stripped = ((v_stripLeading (Elab_dTypes.v_dtDefType d)) dtb__132) in (B_dData_dList.C_List__x58__x58_ ({ f_Group_grName = (Elab_dTypes.v_dtDefName d); f_Group_grParams = (B_dData_dPair.v_firstOf stripped); f_Group_grBody = ((v_convExpr cc) (B_dData_dPair.v_secondOf stripped)); f_Group_grSpan = (cc).f_ConvCtx_ccSpan }, B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> ((((v_dictFieldGroups cc) (Elab_dTypes.v_dtDefName d)) dtb__134) dtb__135)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_groupsOfDef = (fun (projs : t_ProjEntry B_dData_dList.t_List) (dicts : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (shapes : t_DefShape B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (fields : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> (let sp = ((B_dData_dMaybe.v_fromMaybe Base_dSource.v_spanEmpty) (Elab_dTypes.v_dtDefSpan d)) in (let cc = { f_ConvCtx_ccProjs = projs; f_ConvCtx_ccDicts = dicts; f_ConvCtx_ccShapes = shapes; f_ConvCtx_ccClasses = classes; f_ConvCtx_ccFields = fields; f_ConvCtx_ccSpan = sp } in ((v_groupsOfDefGo cc) d))))

# 468 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_peelToCase = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCase (dtb__136, dtb__137) -> (match dtb__137 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__138))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Term_TLam (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> (v_peelToCase dtb__144)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 473 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_appHeadVar = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TVar (dtb__145, dtb__146, dtb__147) -> (B_dData_dMaybe.C_Maybe_Just (dtb__145))
  | Core_dTerm.C_Term_TApp (dtb__148, dtb__149, dtb__150) -> (v_appHeadVar dtb__148)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 486 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldVarPrefix = "_f"

# 492 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_parseNatGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if (if (dtb__151 >= 48) then (dtb__151 <= 57) else false) then (((v_parseNatGo dtb__152) ((mc1 * 10) + (dtb__151 - 48))) (mc2 + 1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dList.C_List_Nil -> (if (mc2 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_parseNat = (fun (ds : int B_dData_dList.t_List) -> (((v_parseNatGo ds) 0) 0))

# 479 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_fieldIndexOfVar = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_fieldVarPrefix) name) then (v_parseNat ((v_dropGo (bi_strLength v_fieldVarPrefix)) (B_dData_dList.dtp_unpack name))) else B_dData_dMaybe.C_Maybe_Nothing))

# 455 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_projectionShape = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (match (v_peelToCase dtb__153) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (match (v_appHeadVar (Core_dTerm.v_caseAltBody dtb__154)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (match (v_fieldIndexOfVar dtb__155) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.v_caseAltName dtb__154); B_dData_dPair.f_Pair_second = dtb__156 }))
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

# 448 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let rec v_projectionTable = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (let nd_uscrut4 = (v_projectionShape (Elab_dTypes.v_dtDefBody dtb__157)) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionTable dtb__158)
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (match dtb__159 with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (B_dData_dList.C_List__x58__x58_ ({ f_ProjEntry_peName = (Elab_dTypes.v_dtDefName dtb__157); f_ProjEntry_peCtor = dtb__160; f_ProjEntry_peField = dtb__161 }, (v_projectionTable dtb__158)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_elabTermInput = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let projs = (v_projectionTable defs) in (let dicts = ((v_dictSymbolsOf classes) defs) in (let shapes = ((B_dData_dList.v_mapMaybe v_defShape) defs) in (let fields = (v_recordFieldTable datas) in (let groups = ((B_dData_dList.v_concatMap (((((v_groupsOfDef projs) dicts) shapes) classes) fields)) defs) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map v_grNameOf) groups); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map v_groupToDecl) groups) }))))))

# 47 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peName = (fun (p : t_ProjEntry) -> (match p with
  | { f_ProjEntry_peName = dtb__162; f_ProjEntry_peCtor = dtb__163; f_ProjEntry_peField = dtb__164 } -> dtb__162
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peCtor = (fun (p : t_ProjEntry) -> (match p with
  | { f_ProjEntry_peName = dtb__165; f_ProjEntry_peCtor = dtb__166; f_ProjEntry_peField = dtb__167 } -> dtb__166
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_peField = (fun (p : t_ProjEntry) -> (match p with
  | { f_ProjEntry_peName = dtb__168; f_ProjEntry_peCtor = dtb__169; f_ProjEntry_peField = dtb__170 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsName = (fun (p : t_DefShape) -> (match p with
  | { f_DefShape_dsName = dtb__171; f_DefShape_dsPrefix = dtb__172; f_DefShape_dsArity = dtb__173 } -> dtb__171
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsPrefix = (fun (p : t_DefShape) -> (match p with
  | { f_DefShape_dsName = dtb__174; f_DefShape_dsPrefix = dtb__175; f_DefShape_dsArity = dtb__176 } -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_dsArity = (fun (p : t_DefShape) -> (match p with
  | { f_DefShape_dsName = dtb__177; f_DefShape_dsPrefix = dtb__178; f_DefShape_dsArity = dtb__179 } -> dtb__179
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccProjs = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__180; f_ConvCtx_ccDicts = dtb__181; f_ConvCtx_ccShapes = dtb__182; f_ConvCtx_ccClasses = dtb__183; f_ConvCtx_ccFields = dtb__184; f_ConvCtx_ccSpan = dtb__185 } -> dtb__180
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccDicts = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__186; f_ConvCtx_ccDicts = dtb__187; f_ConvCtx_ccShapes = dtb__188; f_ConvCtx_ccClasses = dtb__189; f_ConvCtx_ccFields = dtb__190; f_ConvCtx_ccSpan = dtb__191 } -> dtb__187
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccShapes = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__192; f_ConvCtx_ccDicts = dtb__193; f_ConvCtx_ccShapes = dtb__194; f_ConvCtx_ccClasses = dtb__195; f_ConvCtx_ccFields = dtb__196; f_ConvCtx_ccSpan = dtb__197 } -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccClasses = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__198; f_ConvCtx_ccDicts = dtb__199; f_ConvCtx_ccShapes = dtb__200; f_ConvCtx_ccClasses = dtb__201; f_ConvCtx_ccFields = dtb__202; f_ConvCtx_ccSpan = dtb__203 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccFields = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__204; f_ConvCtx_ccDicts = dtb__205; f_ConvCtx_ccShapes = dtb__206; f_ConvCtx_ccClasses = dtb__207; f_ConvCtx_ccFields = dtb__208; f_ConvCtx_ccSpan = dtb__209 } -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_ccSpan = (fun (p : t_ConvCtx) -> (match p with
  | { f_ConvCtx_ccProjs = dtb__210; f_ConvCtx_ccDicts = dtb__211; f_ConvCtx_ccShapes = dtb__212; f_ConvCtx_ccClasses = dtb__213; f_ConvCtx_ccFields = dtb__214; f_ConvCtx_ccSpan = dtb__215 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grName = (fun (p : t_Group) -> (match p with
  | { f_Group_grName = dtb__216; f_Group_grParams = dtb__217; f_Group_grBody = dtb__218; f_Group_grSpan = dtb__219 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grParams = (fun (p : t_Group) -> (match p with
  | { f_Group_grName = dtb__220; f_Group_grParams = dtb__221; f_Group_grBody = dtb__222; f_Group_grSpan = dtb__223 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grBody = (fun (p : t_Group) -> (match p with
  | { f_Group_grName = dtb__224; f_Group_grParams = dtb__225; f_Group_grBody = dtb__226; f_Group_grSpan = dtb__227 } -> dtb__226
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Termination/ElabInput.vuna"
let v_grSpan = (fun (p : t_Group) -> (match p with
  | { f_Group_grName = dtb__228; f_Group_grParams = dtb__229; f_Group_grBody = dtb__230; f_Group_grSpan = dtb__231 } -> dtb__231
  | _ -> failwith "DT: impossible branch"
))
