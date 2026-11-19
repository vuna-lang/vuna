open Vuna_runtime
type t_ValueEntry = C_ValueEntry_VECtor of (Elab_dTypes.t_DtCtor) | C_ValueEntry_VEDef of (Core_dTerm.t_Term)
and t_DataHead = { f_DataHead_dataHeadName : string; f_DataHead_dataHeadKind : Core_dTerm.t_Term; f_DataHead_dataHeadArity : int }

# 31 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_hasNoExplicitPiFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_hasNoExplicitPiFuel (fuel - 1)) ec) ((Core_dEval.v_applyClosure dtb__4) ((Elab_dTypes.v_forceVal ec) dtb__3))) else false)
  | _ -> true
)) ((Elab_dTypes.v_forceVal ec) v))))

# 28 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasNoExplicitPi = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_hasNoExplicitPiFuel 128) ec) v))

# 76 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_zipTeleRigs = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__7) }, ((v_zipTeleRigs dtb__6) dtb__8)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Meta.vuna"
let v_nullaryCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (metas : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_length metas) = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor))) then (Core_dTerm.C_Term_TCon ((Elab_dTypes.v_dtCtorName ctor), ((v_zipTeleRigs metas) (Elab_dTypes.v_dtCtorTelescope ctor)))) else (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtCtorName ctor)))))

# 83 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorValue = (fun (name : string) -> (if (name = Base_dIntrinsics.v_boolTrueCtor) then (B_dData_dMaybe.C_Maybe_Just (true)) else (if (name = Base_dIntrinsics.v_boolFalseCtor) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 87 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorTerm = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (if dtb__9 then (Core_dTerm.C_Term_TBool (true)) else (Core_dTerm.C_Term_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_boolCtorValue name)))

# 121 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupSpanPair = (fun (mc0 : int) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (dtb__12 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__13)) else ((v_lookupSpanPair mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_metaSpanOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VApp (dtb__14, dtb__15) -> ((v_metaSpanOf mc0) dtb__14)
  | Core_dTerm.C_Value_VMeta (dtb__16, dtb__17) -> ((v_lookupSpanPair dtb__16) (Elab_dTypes.v_ecMetaSpans mc0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 125 "Vuna/Compiler/Elab/Meta.vuna"
let v_convEc = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) expected) actual) with
  | Base_dDiag.C_Check_ErrC (dtb__18) -> (match ((v_metaSpanOf ec) actual) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__19) dtb__18)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_metaSpanOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__20) dtb__18)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__21) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__21))))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_unsolvedFromGo = (fun (remaining : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (if (remaining <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun i -> (match ((Core_dTerm.v_metaLookup i) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (((v_unsolvedFromGo (remaining - 1)) stop) sols)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 138 "Vuna/Compiler/Elab/Meta.vuna"
let v_unsolvedFrom = (fun (i : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (((v_unsolvedFromGo (stop - i)) stop) sols))

# 152 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memMetaId = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = mc0) then true else ((v_memMetaId mc0) dtb__24))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_termMetasAll = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__25, dtb__26, dtb__27) -> ((B_dData_dList.v_append (v_termMetasAll dtb__25)) ((B_dData_dList.v_append (v_termMetasAll dtb__26)) (v_termMetasAll dtb__27)))
  | Core_dTerm.C_Term_TBool (dtb__28) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TFloat (dtb__29) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TStr (dtb__30) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TInt (dtb__31) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TCase (dtb__32, dtb__33) -> ((B_dData_dList.v_append (v_termMetasAll dtb__32)) ((B_dData_dList.v_concatMap (fun (alt : Core_dTerm.t_CaseAlt) -> (v_termMetasAll (Core_dTerm.v_caseAltBody alt)))) dtb__33))
  | Core_dTerm.C_Term_TRecUpd (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((B_dData_dList.v_append (v_termMetasAll dtb__34)) (v_termMetasAll dtb__38))
  | Core_dTerm.C_Term_TProj (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (v_termMetasAll dtb__39)
  | Core_dTerm.C_Term_TRecord (dtb__44, dtb__45) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf p)))) dtb__45)
  | Core_dTerm.C_Term_TMk (dtb__46, dtb__47) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf p)))) dtb__47)
  | Core_dTerm.C_Term_TCon (dtb__48, dtb__49) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf p)))) dtb__49)
  | Core_dTerm.C_Term_TApp (dtb__50, dtb__51, dtb__52) -> ((B_dData_dList.v_append (v_termMetasAll dtb__50)) (v_termMetasAll dtb__51))
  | Core_dTerm.C_Term_TLam (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> ((fun tys -> ((B_dData_dList.v_append tys) (v_termMetasAll dtb__57))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (match dtb__58 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> ((B_dData_dList.v_append (v_termMetasAllMaybe dtb__59)) (v_termMetasAllMaybe dtb__60))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) dtb__55))
  | Core_dTerm.C_Term_TPi (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> ((B_dData_dList.v_append (v_termMetasAll dtb__64)) (v_termMetasAll dtb__65))
  | Core_dTerm.C_Term_TType (dtb__66) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb__67) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb__68, dtb__69, dtb__70) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb__71) -> (B_dData_dList.C_List__x58__x58_ (dtb__71, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 218 "Vuna/Compiler/Elab/Meta.vuna"
and v_termMetasAllMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (v_termMetasAll dtb__72)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_termMetasRuntime = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__73, dtb__74, dtb__75) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__73)) ((B_dData_dList.v_append (v_termMetasRuntime dtb__74)) (v_termMetasRuntime dtb__75)))
  | Core_dTerm.C_Term_TBool (dtb__76) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TFloat (dtb__77) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TStr (dtb__78) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TInt (dtb__79) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TCase (dtb__80, dtb__81) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__80)) ((B_dData_dList.v_concatMap (fun (alt : Core_dTerm.t_CaseAlt) -> (v_termMetasRuntime (Core_dTerm.v_caseAltBody alt)))) dtb__81))
  | Core_dTerm.C_Term_TRecUpd (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__82)) (v_termMetasRuntime dtb__86))
  | Core_dTerm.C_Term_TProj (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (v_termMetasRuntime dtb__87)
  | Core_dTerm.C_Term_TRecord (dtb__92, dtb__93) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__93)
  | Core_dTerm.C_Term_TMk (dtb__94, dtb__95) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__95)
  | Core_dTerm.C_Term_TCon (dtb__96, dtb__97) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__97)
  | Core_dTerm.C_Term_TApp (dtb__98, dtb__99, dtb__100) -> (if (Core_dTerm.v_rigIsErased dtb__100) then (v_termMetasRuntime dtb__98) else ((B_dData_dList.v_append (v_termMetasRuntime dtb__98)) (v_termMetasRuntime dtb__99)))
  | Core_dTerm.C_Term_TLam (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (v_termMetasRuntime dtb__105)
  | Core_dTerm.C_Term_TPi (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> ((B_dData_dList.v_append (v_termMetasAll dtb__109)) (v_termMetasAll dtb__110))
  | Core_dTerm.C_Term_TType (dtb__111) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb__112) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb__113, dtb__114, dtb__115) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb__116) -> (B_dData_dList.C_List__x58__x58_ (dtb__116, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Elab/Meta.vuna"
let v_relevantMetas = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (v_termMetasRuntime (B_dData_dPair.v_secondOf d)))) (Elab_dTypes.v_ecDefs ec))) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_concatMap v_termMetasAll) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorType) (Elab_dTypes.v_dtDataCtors d))))) (Elab_dTypes.v_ecDatas ec))))

# 222 "Vuna/Compiler/Elab/Meta.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 225 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_globalLookup = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (if (mc0 = dtb__119) then (B_dData_dMaybe.C_Maybe_Just (dtb__120)) else ((v_globalLookup mc0) dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsLookup = (fun (name : string) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (Elab_dTypes.v_ecGlobalsTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> (B_dData_dMaybe.C_Maybe_Just (dtb__121))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (ec).Elab_dTypes.f_Ec_ecGlobalsComplete then B_dData_dMaybe.C_Maybe_Nothing else ((v_globalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsTableOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) globals) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 248 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__124) mc1) then true else (((v_memSig _uctx0) dtb__123) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memDefName = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__126 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (if (dtb__128 = mc0) then true else ((v_memDefName mc0) dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectSigsInto = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | Frontend_dRast.C_Decl_DSig (dtb__132, dtb__133, dtb__134, dtb__135) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__132) dtb__133) dtb__134) dtb__135) dtb__131)
  | Frontend_dRast.C_Decl_DAxiom (dtb__136, dtb__137, dtb__138) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__136) B_dData_dList.C_List_Nil) dtb__137) dtb__138) dtb__131)
  | Frontend_dRast.C_Decl_DExtern (dtb__139, dtb__140, dtb__141, dtb__142) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__139) B_dData_dList.C_List_Nil) dtb__141) dtb__142) dtb__131)
  | Frontend_dRast.C_Decl_DFun (dtb__143, dtb__144, dtb__145, dtb__146) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Frontend_dRast.C_Decl_DData (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Frontend_dRast.C_Decl_DRecord (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Frontend_dRast.C_Decl_DTrait (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | Frontend_dRast.C_Decl_DInstance (dtb__169, dtb__170, dtb__171, dtb__172) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__131)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Elab/Meta.vuna"
and v_collectSigOne = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (seen : (string, bool) B_dContainer_dHashMap.t_HashMap) (acc : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (ctx : Frontend_dRast.t_Expr B_dData_dList.t_List) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (rest : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName name) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (name))) name) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) seen) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_DuplicateSignature (name))) name) else ((((((v_collectSigsInto banned) preludeBanned) paramKinds) ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) name) true) seen)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctx; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((((((Elab_dSig.v_quantifyTopSigCtxCachedKinds (Elab_dSig.v_modulePrefixOf name)) banned) preludeBanned) paramKinds) ctx) ty) sp); B_dData_dPair.f_Pair_second = sp } } }, acc))) rest))))

# 256 "Vuna/Compiler/Elab/Meta.vuna"
let v_collectSigs = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> ((((((v_collectSigsInto banned) preludeBanned) (Elab_dSig.v_dataParamKindTbl decls)) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) decls)) (Elab_dSig.v_topQuantBanned B_dData_dList.C_List_Nil))) (Elab_dSig.v_qualifiedBannedTbl defined))) (Elab_dSig.v_definedNames decls)))

# 306 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectDataDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | Frontend_dRast.C_Decl_DData (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((v_collectDataDecls dtb__174) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__183 }, mc1)))
  | Frontend_dRast.C_Decl_DRecord (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> ((v_collectDataDecls dtb__174) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__191 }, mc1)))
  | _ -> ((v_collectDataDecls dtb__174) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dataNamesOf = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | Frontend_dRast.C_Decl_DData (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (B_dData_dList.C_List__x58__x58_ (dtb__194, (v_dataNamesOf dtb__193)))
  | Frontend_dRast.C_Decl_DRecord (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (B_dData_dList.C_List__x58__x58_ (dtb__203, (v_dataNamesOf dtb__193)))
  | _ -> (v_dataNamesOf dtb__193)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Meta.vuna"
let v_nonEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindDomainWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (if (v_kindDomainWellFormed dtb__216) then (v_kindDomainWellFormed dtb__217) else false)
  | Core_dTerm.C_Term_TType (dtb__218) -> ((Core_dTerm.v_levelToInt dtb__218) >= 0)
  | _ -> true
))

# 337 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__219) -> ((Core_dTerm.v_levelToInt dtb__219) >= 0)
  | Core_dTerm.C_Term_TPi (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> (if (v_kindDomainWellFormed dtb__223) then (v_kindWellFormed dtb__224) else false)
  | _ -> false
))

# 350 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_splitKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__227 }, (v_splitKind dtb__229)))
  | _ -> B_dData_dList.C_List_Nil
))

# 354 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtDataLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (if ((Elab_dTypes.v_dtDataName dtb__230) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__230)) else ((v_dtDataLookup mc0) dtb__231))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCtorIn = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (if ((Elab_dTypes.v_dtCtorName dtb__232) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__232)) else ((v_findCtorIn mc0) dtb__233))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtCtorLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match ((v_findCtorIn mc0) (Elab_dTypes.v_dtDataCtors dtb__234)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__236) -> (B_dData_dMaybe.C_Maybe_Just (dtb__236))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_dtCtorLookup mc0) dtb__235)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Meta.vuna"
let v_dtCtorLookupEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ec).Elab_dTypes.f_Ec_ecCtorTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (B_dData_dMaybe.C_Maybe_Just (dtb__237))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Elab_dTypes.v_ecCtorIndexComplete ec) then B_dData_dMaybe.C_Maybe_Nothing else ((v_dtCtorLookup name) (Elab_dTypes.v_ecDatas ec)))
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataFamilyName = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLevelGlobal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (v_kindWellFormed dtb__239)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeName = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (if (((v_isTypeLevelGlobal globals) ec) name) then true else ((v_isDataFamilyName ec) name)))

# 410 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataShortNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 414 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeNameOfDualCtor = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if ((Base_dSource.v_prefixOfName name) = "") then B_dData_dMaybe.C_Maybe_Nothing else ((fun fam -> (if ((v_dataShortNameOf fam) = (Base_dSource.v_lastSeg name)) then (match ((v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (B_dData_dMaybe.C_Maybe_Just (fam))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)) (Base_dSource.v_prefixOfName name))))

# 427 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyNameOf = (fun (ec : Elab_dTypes.t_Ec) (target : string) -> (match ((v_dtCtorLookupEc ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__241)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_expectedFamilyOfFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (((v_expectedFamilyOfFuel (fuel - 1)) ec) ((Core_dEval.v_applyClosure dtb__246) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_over", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__247) -> (match dtb__247 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__248, dtb__249) -> (B_dData_dMaybe.C_Maybe_Just (dtb__248))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) ((Elab_dTypes.v_forceVal ec) v))))

# 434 "Vuna/Compiler/Elab/Meta.vuna"
let v_expectedFamilyOf = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_expectedFamilyOfFuel 64) ec) v))

# 449 "Vuna/Compiler/Elab/Meta.vuna"
let v_overCandidatesText = (fun (targets : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map Frontend_dRast.v_ctorDisplayName) targets)))

# 453 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dualFamilyOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (match ((v_dtCtorLookupEc mc0) dtb__250) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (if ((v_dataShortNameOf (Elab_dTypes.v_dtCtorFamily dtb__252)) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__252))) else (((v_dualFamilyOf mc0) mc1) dtb__251))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dualFamilyOf mc0) mc1) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyIs = (fun (ec : Elab_dTypes.t_Ec) (target : string) (fam : string) -> (match ((v_ctorFamilyNameOf ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (dtb__253 = fam)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Meta.vuna"
let v_candidatesInFamily = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> ((B_dData_dList.v_filter (fun (t : string) -> (((v_ctorFamilyIs mc0) t) dtb__254))) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Meta.vuna"
let v_defaultOrOver = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> (match dtb__256 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__255))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
))

# 488 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtorGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__258))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc3, (v_overCandidatesText mc4)))) mc3) (v_overCandidatesText mc4))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc3, (v_overCandidatesText mc4)))) mc3) (v_overCandidatesText mc4))
)) (((v_candidatesInFamily mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__257))) mc4))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeHeadLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__260) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__260)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_isTypeLevelGlobal globals) ec) name) then (((v_globalsLookup name) globals) ec) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (((v_typeHeadLookup globals) ec) name))

# 530 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VECtor (dtb__261))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VEDef (dtb__262))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_teleOf = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> ((fun v -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__265 }, ((v_teleOf dtb__267) (B_dData_dList.C_List__x58__x58_ (v, mc1)))))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__263, (B_dData_dList.v_length mc1), B_dData_dList.C_List_Nil)))))
  | _ -> B_dData_dList.C_List_Nil
))

# 541 "Vuna/Compiler/Elab/Meta.vuna"
let v_teleOfType = (fun (ty : Core_dTerm.t_Term) -> ((v_teleOf ty) B_dData_dList.C_List_Nil))

# 552 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_spineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__268) -> { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__269, dtb__270) -> { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__270) }
  | Core_dTerm.C_Term_TApp (dtb__271, dtb__272, dtb__273) -> (match (v_spineOfType dtb__271) with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__275) (B_dData_dList.C_List__x58__x58_ (dtb__272, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 560 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_resultSpine = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> (v_resultSpine dtb__280)
  | _ -> (v_spineOfType mc0)
))

# 588 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkFuelMax = 1000000

# 582 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkFuelFor = (fun (t : Core_dTerm.t_Term) -> ((fun need -> (if (need > v_zonkFuelMax) then v_zonkFuelMax else need)) (128 + (4 * (Core_dTerm.v_termSize t)))))

# 635 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVar = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.v_hasNegativeVar t))

# 591 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_zonkTermFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TMeta (dtb__281) -> (match ((Core_dTerm.v_metaLookup dtb__281) (Elab_dTypes.v_ecSolTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> ((fun q -> (if (v_hasOutOfScopeVar q) then t else ((((v_zonkTermFuel (fuel - 1)) ec) depth) q))) ((Core_dEval.v_quote depth) dtb__282))
  | B_dData_dMaybe.C_Maybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (Core_dTerm.C_Term_TPi (dtb__283, dtb__284, dtb__285, ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__286), ((((v_zonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__287)))
  | Core_dTerm.C_Term_TLam (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__288, dtb__289, slot2, dtb__291, ((((v_zonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__292)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__293) -> (match dtb__293 with
  | { B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 } -> ((Core_dTerm.v_lamTyOf ((Core_dTerm.v_mapTermMaybe (((v_zonkTermFuel (fuel - 1)) ec) depth)) dtb__294)) ((Core_dTerm.v_mapTermMaybe (((v_zonkTermFuel (fuel - 1)) ec) (depth + 1))) dtb__295))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__290))
  | Core_dTerm.C_Term_TApp (dtb__296, dtb__297, dtb__298) -> (Core_dTerm.C_Term_TApp (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__296), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__297), dtb__298))
  | Core_dTerm.C_Term_TCon (dtb__299, dtb__300) -> (Core_dTerm.C_Term_TCon (dtb__299, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (fuel - 1)) ec) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__300)))
  | Core_dTerm.C_Term_TMk (dtb__301, dtb__302) -> (Core_dTerm.C_Term_TMk (dtb__301, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (fuel - 1)) ec) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__302)))
  | Core_dTerm.C_Term_TCase (dtb__303, dtb__304) -> (Core_dTerm.C_Term_TCase (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__303), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_zonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__304)))
  | Core_dTerm.C_Term_TIf (dtb__305, dtb__306, dtb__307) -> (Core_dTerm.C_Term_TIf (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__305), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__306), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__307)))
  | _ -> t
)))
# 624 "Vuna/Compiler/Elab/Meta.vuna"
and v_zonkAltFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (alt0 : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt0 else (match alt0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__308; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__309; Core_dTerm.f_CaseAlt_caseAltBody = dtb__310 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__308; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__309; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_zonkTermFuel (fuel - 1)) ec) (depth + (B_dData_dList.v_length dtb__309))) dtb__310) }
  | _ -> failwith "DT: impossible branch"
)))

# 577 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkTerm = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> ((((v_zonkTermFuel (v_zonkFuelFor t)) ec) depth) t))

# 619 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkAlt = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> ((((v_zonkAltFuel 64) ec) depth) alt))

# 638 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarArgs = (fun (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarArgs args))

# 641 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarAlts = (fun (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarAlts alts))

# 649 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_prependFamParams = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Frontend_dRast.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (match dtb__314 with
  | Core_dTerm.C_Term_TType (dtb__316) -> (Frontend_dRast.C_Expr_EPi (dtb__311, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), mc2)), (((v_prependFamParams dtb__315) mc1) mc2), mc2))
  | _ -> mc1
)
  | _ -> mc1
))

# 658 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (v_dropParams dtb__321)
  | _ -> mc0
))

# 662 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctorGlobals = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__322, dtb__323) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__322); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtCtorType dtb__322) }, (v_ctorGlobals dtb__323)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupDataHead = (fun (mc0 : string) (mc1 : t_DataHead B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__324, dtb__325) -> (if ((dtb__324).f_DataHead_dataHeadName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__324).f_DataHead_dataHeadKind; B_dData_dPair.f_Pair_second = (dtb__324).f_DataHead_dataHeadArity })) else ((v_lookupDataHead mc0) dtb__325))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 688 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictTypeName = (fun (cname : string) -> ("Dict_" ^ cname))

# 691 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictCtorName = (fun (cname : string) -> ("MkDict_" ^ cname))

# 695 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectTraitDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__326, dtb__327) -> (match dtb__326 with
  | Frontend_dRast.C_Decl_DTrait (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> ((v_collectTraitDecls dtb__327) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__332 }, mc1)))
  | _ -> ((v_collectTraitDecls dtb__327) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectInstDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (match dtb__333 with
  | Frontend_dRast.C_Decl_DInstance (dtb__335, dtb__336, dtb__337, dtb__338) -> ((v_collectInstDecls dtb__334) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__333; B_dData_dPair.f_Pair_second = dtb__338 }, mc1)))
  | _ -> ((v_collectInstDecls dtb__334) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Elab/Meta.vuna"
let v_paramNameOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> dtb__339
  | B_dData_dList.C_List_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgTermsGo = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__341 }, ((((v_methodArgTermsGo dtb__342) mc1) (mc2 + 1)) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Elab/Meta.vuna"
let v_methodArgTerms = (fun (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) -> ((((v_methodArgTermsGo rigs) nFields) 0) (B_dData_dList.v_length rigs)))

# 725 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgLams = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__343, dtb__344) -> (Core_dTerm.C_Term_TLam (("x" ^ (bi_strFromInt mc1)), dtb__343, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_methodArgLams dtb__344) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldVarName = (fun (i : int) -> ("_f" ^ (bi_strFromInt i)))

# 742 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_fieldBinderGoGo = (fun (remaining : int) (n : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_fieldBinderGoGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldVarName (n - remaining)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, acc)))))

# 739 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderGo = (fun (n : int) (i : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fieldBinderGoGo (n - i)) n) acc))

# 736 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderNames = (fun (n : int) -> (((v_fieldBinderGo n) 0) B_dData_dList.C_List_Nil))

# 772 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_allTeleArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__345, dtb__346) -> (match (B_dData_dPair.v_firstOf dtb__345) with
  | Core_dTerm.C_Term_TVar (dtb__347, dtb__348, dtb__349) -> (if (if (dtb__348 >= 0) then (dtb__348 < mc0) else false) then ((v_allTeleArgs mc0) dtb__346) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 763 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInstHead = (fun (n : int) (head : Core_dTerm.t_Term) -> (if (n <= 0) then false else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match dtb__350 with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> (if (v_nonEmpty dtb__352) then ((v_allTeleArgs n) dtb__352) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Elab_dTypes.v_flattenTaggedApp head))))

# 779 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInst = (fun (mc0 : Elab_dTypes.t_DtInst) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__353; Elab_dTypes.f_DtInst_dtInstTele = dtb__354; Elab_dTypes.f_DtInst_dtInstCtx = dtb__355; Elab_dTypes.f_DtInst_dtInstHead = dtb__356; Elab_dTypes.f_DtInst_dtInstSpan = dtb__357 } -> ((v_isBlanketInstHead (B_dData_dList.v_length dtb__354)) dtb__356)
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Elab/Meta.vuna"
let v_substClassParam = (fun (pname : string) (arg : Core_dTerm.t_Term) (ty : Core_dTerm.t_Term) -> (((Core_dTerm.v_substVarAt 0) arg) ty))

# 798 "Vuna/Compiler/Elab/Meta.vuna"
let v_linClosureMark = "#linclos"

# 801 "Vuna/Compiler/Elab/Meta.vuna"
let v_linClosureName = (fun (sp : Base_dSource.t_Span) (depth : int) (name : string) -> (String.concat "" [v_linClosureMark; (bi_strFromInt (sp).Base_dSource.f_Span_spanStartLine); "_"; (bi_strFromInt (sp).Base_dSource.f_Span_spanStartCol); "_"; (bi_strFromInt depth); ":"; name]))

# 808 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinClosureName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_linClosureMark) name))

# 814 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_linClosureOrigGo = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (if (dtb__358 = 58) then (B_dData_dList.dtp_pack dtb__359) else (v_linClosureOrigGo dtb__359))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Elab/Meta.vuna"
let v_linClosureOrigName = (fun (name : string) -> (if (v_isLinClosureName name) then (v_linClosureOrigGo (B_dData_dList.dtp_unpack name)) else name))

# 819 "Vuna/Compiler/Elab/Meta.vuna"
let v_litEqName = (fun (tyName : string) -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

# 861 "Vuna/Compiler/Elab/Meta.vuna"
let v_isStringImplicitDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__360) -> (match dtb__360 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__361, dtb__362) -> (match dtb__362 with
  | B_dData_dList.C_List_Nil -> (dtb__361 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Elab_dTypes.v_forceVal ec) dom)))

# 867 "Vuna/Compiler/Elab/Meta.vuna"
let v_implicitBinderRig = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isStringImplicitDomain ec) dom) then Core_dTerm.C_Rig_RigOmega else Core_dTerm.C_Rig_Rig0))

# 930 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxItemAt = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__363)) else ((v_ctxItemAt (mc0 - 1)) dtb__364))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 879 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderType = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> ((fun d -> ((fun idx -> (if (lvl < 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (idx < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (B_dData_dMaybe.C_Maybe_Just ((((Elab_dTypes.v_varTypeValue ctx) idx) (B_dData_dPair.v_secondOf dtb__365))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (Elab_dTypes.v_ctxDepth ctx)))

# 956 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfQty = (fun (implicit : bool) (isTypeDom : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (if (if implicit then true else isTypeDom) then Core_dTerm.C_Rig_Rig0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (match dtb__366 with
  | Frontend_dAst.C_Qty_Q1 -> Core_dTerm.C_Rig_Rig1
  | Frontend_dAst.C_Qty_Q0 -> Core_dTerm.C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
)) qty)))

# 979 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeHeadOpaqueEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if (B_dData_dBool.v_not ((v_isDataFamilyName ec) name)) then (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name)) else false))

# 995 "Vuna/Compiler/Elab/Meta.vuna"
let v_isUniverseValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VType (dtb__367) -> true
  | _ -> false
))

# 986 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isFamilyKindFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (if (B_dData_dBool.v_not (v_isUniverseValue dtb__371)) then true else ((v_isFamilyKindFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__372) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__368, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 983 "Vuna/Compiler/Elab/Meta.vuna"
let v_isFamilyKindValue = (fun (v : Core_dTerm.t_Value) -> ((v_isFamilyKindFuel 64) v))

# 1012 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueHasImplicitPiFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> (if dtb__374 then true else ((v_valueHasImplicitPiFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__377) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__373, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 1009 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueHasImplicitPi = (fun (v : Core_dTerm.t_Value) -> ((v_valueHasImplicitPiFuel 64) v))

# 1054 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeishValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VMeta (dtb__378, dtb__379) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__380) -> true
  | Core_dTerm.C_Value_VPi (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> true
  | Core_dTerm.C_Value_VType (dtb__386) -> true
  | _ -> false
))

# 1061 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__387, dtb__388) -> (if (dtb__387 = mc0) then true else ((v_memLevel mc0) dtb__388))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1021 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueOpaqueGo = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (match v with
  | Core_dTerm.C_Value_VType (dtb__389) -> false
  | Core_dTerm.C_Value_VMeta (dtb__390, dtb__391) -> false
  | Core_dTerm.C_Value_VNeutral (dtb__392) -> (match dtb__392 with
  | Core_dTerm.C_Neutral_NVar (dtb__393, dtb__394, dtb__395) -> (if (dtb__394 < depth) then (outerNVar dtb__394) else (if ((v_memLevel dtb__394) famLevels) then true else false))
  | Core_dTerm.C_Neutral_NGlobal (dtb__396, dtb__397) -> (if (headOpaque dtb__396) then true else ((((((v_valueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__397))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> ((fun fam2 -> (if ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__401) then true else ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Core_dEval.v_applyClosure dtb__402) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__398, depth, B_dData_dList.C_List_Nil)))))))) (if (v_isFamilyKindValue dtb__401) then (B_dData_dList.C_List__x58__x58_ (depth, famLevels)) else famLevels))
  | _ -> true
)))
# 1043 "Vuna/Compiler/Elab/Meta.vuna"
and v_valueOpaqueTypeSpine = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match sp with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__403, dtb__404) -> (if (if (v_isTypeishValue dtb__403) then ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__403) else false) then true else ((((((v_valueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__404))
  | _ -> failwith "DT: impossible branch"
)))

# 1003 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueOpaqueScoped = (fun (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((((v_valueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

# 1066 "Vuna/Compiler/Elab/Meta.vuna"
let v_nvarOpaqueCtx = (fun (ctx : Elab_dTypes.t_Ctx) (lvl : int) -> ((fun idx -> (if (idx < 0) then false else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (match dtb__405 with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> (v_isFamilyKindValue (((Elab_dTypes.v_varTypeValue ctx) idx) dtb__407))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems)))) (((Elab_dTypes.v_ctxDepth ctx) - 1) - lvl)))

# 1079 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkValueOnly = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1082 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyIn = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (((((v_valueOpaqueScoped (v_nvarOpaqueCtx ctx)) (v_isTypeHeadOpaqueEc ec)) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) ((v_zonkValueOnly ec) v)))

# 1091 "Vuna/Compiler/Elab/Meta.vuna"
let v_castErased = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_primEraseName)), t, Core_dTerm.C_Rig_Rig1)))

# 1131 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueVar = (fun (depth : int) (idxs : int B_dData_dList.t_List) (name : string) (i : int) -> (if (i < depth) then (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else (if ((v_memLevel (i - depth)) idxs) then (v_castErased (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) else (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))))

# 1100 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_wrapOpaqueUsesFuel = (fun (fuel : int) (depth : int) (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TVar (dtb__408, dtb__409, dtb__410) -> ((((v_wrapOpaqueVar depth) idxs) dtb__408) dtb__409)
  | Core_dTerm.C_Term_TGlobal (dtb__411) -> (Core_dTerm.C_Term_TGlobal (dtb__411))
  | Core_dTerm.C_Term_TMeta (dtb__412) -> (Core_dTerm.C_Term_TMeta (dtb__412))
  | Core_dTerm.C_Term_TType (dtb__413) -> (Core_dTerm.C_Term_TType (dtb__413))
  | Core_dTerm.C_Term_TInt (dtb__414) -> (Core_dTerm.C_Term_TInt (dtb__414))
  | Core_dTerm.C_Term_TStr (dtb__415) -> (Core_dTerm.C_Term_TStr (dtb__415))
  | Core_dTerm.C_Term_TFloat (dtb__416) -> (Core_dTerm.C_Term_TFloat (dtb__416))
  | Core_dTerm.C_Term_TBool (dtb__417) -> (Core_dTerm.C_Term_TBool (dtb__417))
  | Core_dTerm.C_Term_TPi (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (Core_dTerm.C_Term_TPi (dtb__418, dtb__419, dtb__420, ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__421), ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__422)))
  | Core_dTerm.C_Term_TLam (dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__423, dtb__424, slot2, dtb__426, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__427)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__428) -> (match dtb__428 with
  | { B_dData_dPair.f_Pair_first = dtb__429; B_dData_dPair.f_Pair_second = dtb__430 } -> ((Core_dTerm.v_lamTyOf ((Core_dTerm.v_mapTermMaybe (((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs)) dtb__429)) ((Core_dTerm.v_mapTermMaybe (((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs)) dtb__430))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__425))
  | Core_dTerm.C_Term_TApp (dtb__431, dtb__432, dtb__433) -> (Core_dTerm.C_Term_TApp (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__431), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__432), dtb__433))
  | Core_dTerm.C_Term_TCon (dtb__434, dtb__435) -> (Core_dTerm.C_Term_TCon (dtb__434, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__435)))
  | Core_dTerm.C_Term_TMk (dtb__436, dtb__437) -> (Core_dTerm.C_Term_TMk (dtb__436, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__437)))
  | Core_dTerm.C_Term_TRecord (dtb__438, dtb__439) -> (Core_dTerm.C_Term_TRecord (dtb__438, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__439)))
  | Core_dTerm.C_Term_TProj (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> (Core_dTerm.C_Term_TProj (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__440), dtb__441, dtb__442, dtb__443, dtb__444))
  | Core_dTerm.C_Term_TRecUpd (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> (Core_dTerm.C_Term_TRecUpd (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__445), dtb__446, dtb__447, dtb__448, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + (B_dData_dList.v_length dtb__447))) idxs) dtb__449)))
  | Core_dTerm.C_Term_TCase (dtb__450, dtb__451) -> (Core_dTerm.C_Term_TCase (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__450), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_wrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__451)))
  | Core_dTerm.C_Term_TIf (dtb__452, dtb__453, dtb__454) -> (Core_dTerm.C_Term_TIf (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__452), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__453), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__454)))
  | _ -> failwith "DT: impossible branch"
)))
# 1140 "Vuna/Compiler/Elab/Meta.vuna"
and v_wrapOpaqueAltFuel = (fun (mc0 : int) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__455; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__456; Core_dTerm.f_CaseAlt_caseAltBody = dtb__457 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__455; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__456; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_wrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (B_dData_dList.v_length dtb__456))) mc2) dtb__457) }
  | _ -> failwith "DT: impossible branch"
))

# 1097 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueUses = (fun (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_wrapOpaqueUsesFuel 512) 0) idxs) t))

# 1165 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataLinearName = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_dtDataLookup g) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__458) -> (Elab_dTypes.v_dtDataLinear dtb__458)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorLinearName = (fun (ec : Elab_dTypes.t_Ec) (c : string) -> (match ((v_dtCtorLookupEc ec) c) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> ((v_dataLinearName ec) (Elab_dTypes.v_dtCtorFamily dtb__459))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1148 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearTypeFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__460) -> (match dtb__460 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__461, dtb__462) -> ((v_dataLinearName ec) dtb__461)
  | Core_dTerm.C_Neutral_NVar (dtb__463, dtb__464, dtb__465) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__466, dtb__467) -> ((v_ctorLinearName ec) dtb__466)
  | _ -> false
)))

# 1145 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearType = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (Elab_dTypes.v_ecHasLinear ec) then (((v_isLinearTypeFuel 64) ec) v) else false))

# 1161 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyLinearVals = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__468, dtb__469) -> (if (((v_isLinearTypeFuel mc0) mc1) dtb__468) then true else (((v_anyLinearVals mc0) mc1) dtb__469))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1178 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigForLinearDomain = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (name : string) (rig : Core_dTerm.t_Rig) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then (match rig with
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (Core_dTerm.C_Rig_Rig1))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Base_dDiag.C_Check_OkC (rig))))

# 1188 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigCaseField = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (rig : Core_dTerm.t_Rig) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else rig))

# 1192 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfLinearValue = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_RigOmega))

# 1199 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxHasLinearItems = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__471) -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (if ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) mc3) dtb__473)) then true else ((((v_ctxHasLinearItems mc0) mc1) dtb__471) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1196 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctxHasLinear = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) -> (match mc1 with
  | { Elab_dTypes.f_Ctx_ctxItems = dtb__474; Elab_dTypes.f_Ctx_ctxEnvF = dtb__475; Elab_dTypes.f_Ctx_ctxRefVals = dtb__476; Elab_dTypes.f_Ctx_ctxDepthF = dtb__477 } -> ((((v_ctxHasLinearItems mc0) { Elab_dTypes.f_Ctx_ctxItems = dtb__474; Elab_dTypes.f_Ctx_ctxEnvF = dtb__475; Elab_dTypes.f_Ctx_ctxRefVals = dtb__476; Elab_dTypes.f_Ctx_ctxDepthF = dtb__477 }) dtb__474) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1209 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_outerScan = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__478, dtb__479, dtb__480) -> (if (if ((((v_outerScan mc0) mc1) mc2) dtb__478) then true else ((((v_outerScan mc0) mc1) mc2) dtb__479)) then true else ((((v_outerScan mc0) mc1) mc2) dtb__480))
  | Core_dTerm.C_Term_TCase (dtb__481, dtb__482) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__481) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__482))
  | Core_dTerm.C_Term_TRecUpd (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__483) then true else ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__485))) dtb__487))
  | Core_dTerm.C_Term_TRecord (dtb__488, dtb__489) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__489)
  | Core_dTerm.C_Term_TProj (dtb__490, dtb__491, dtb__492, dtb__493, dtb__494) -> ((((v_outerScan mc0) mc1) mc2) dtb__490)
  | Core_dTerm.C_Term_TMk (dtb__495, dtb__496) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__496)
  | Core_dTerm.C_Term_TCon (dtb__497, dtb__498) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__498)
  | Core_dTerm.C_Term_TApp (dtb__499, dtb__500, dtb__501) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__499) then true else ((((v_outerScan mc0) mc1) mc2) dtb__500))
  | Core_dTerm.C_Term_TLam (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> ((((v_outerScan mc0) mc1) (mc2 + 1)) dtb__506)
  | Core_dTerm.C_Term_TPi (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511) -> false
  | Core_dTerm.C_Term_TVar (dtb__512, dtb__513, dtb__514) -> (if (dtb__513 > mc2) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__515) -> (match dtb__515 with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) (dtb__513 - mc2)) dtb__517))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_ctxItemAt (dtb__513 - mc2)) (mc1).Elab_dTypes.f_Ctx_ctxItems)) else false)
  | _ -> false
))
# 1231 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanArgs = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__518, dtb__519) -> (match dtb__518 with
  | { B_dData_dPair.f_Pair_first = dtb__520; B_dData_dPair.f_Pair_second = dtb__521 } -> (if ((((v_outerScan mc0) mc1) mc2) dtb__520) then true else ((((v_outerScanArgs mc0) mc1) mc2) dtb__519))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1236 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanAlts = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__522, dtb__523) -> (match dtb__522 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__524; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__525; Core_dTerm.f_CaseAlt_caseAltBody = dtb__526 } -> (if ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__525))) dtb__526) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__523))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1206 "Vuna/Compiler/Elab/Meta.vuna"
let v_termHasOuterLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (t : Core_dTerm.t_Term) -> ((((v_outerScan ec) ctx) 0) t))

# 1244 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLayerValueFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VType (dtb__527) -> true
  | Core_dTerm.C_Value_VPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if ((v_isTypeLayerValueFuel (fuel - 1)) dtb__531) then ((v_isTypeLayerValueFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__532) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__528, 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 1241 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLayerValue = (fun (v : Core_dTerm.t_Value) -> ((v_isTypeLayerValueFuel 128) v))

# 949 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeDomain = (fun (v : Core_dTerm.t_Value) -> (v_isTypeLayerValue v))

# 952 "Vuna/Compiler/Elab/Meta.vuna"
let v_binderRig = (fun (implicit : bool) (dom : Core_dTerm.t_Value) -> ((Core_dTerm.v_rigOfBinder implicit) (v_isTypeDomain dom)))

# 1254 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataHead = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__533) -> (match dtb__533 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__534, dtb__535) -> (match ((v_dtDataLookup dtb__534) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__536) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 825 "Vuna/Compiler/Elab/Meta.vuna"
let v_isIndexDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (v_isTypeDomain dom) then true else ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) ((Elab_dTypes.v_forceVal ec) dom))))

# 872 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderIndexDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (match (((v_neutralBinderType ctx) ec) lvl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> ((v_isIndexDomain ec) dtb__537)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLikeWithCtx = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__538) -> true
  | Core_dTerm.C_Value_VPi (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> ((((v_isTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__543) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("ty", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__544) -> (match dtb__544 with
  | Core_dTerm.C_Neutral_NVar (dtb__545, dtb__546, dtb__547) -> (match (((v_neutralBinderType ctx) ec) dtb__546) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> (v_isTypeDomain dtb__548)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__549, dtb__550) -> ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) v)
  | _ -> false
)
  | Core_dTerm.C_Value_VMeta (dtb__551, dtb__552) -> true
  | _ -> false
)))

# 898 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isKindWithCtxFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__553) -> true
  | Core_dTerm.C_Value_VPi (dtb__554, dtb__555, dtb__556, dtb__557, dtb__558) -> (if ((((v_isTypeLikeWithCtx fuel) ctx) ec) dtb__557) then ((((v_isKindWithCtxFuel (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__558) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("kind", 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 895 "Vuna/Compiler/Elab/Meta.vuna"
let v_isKindWithCtx = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_isKindWithCtxFuel 64) ctx) ec) v))

# 840 "Vuna/Compiler/Elab/Meta.vuna"
let v_isImplicitDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isIndexDomain ec) dom) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__559, dtb__560, dtb__561, dtb__562, dtb__563) -> (((v_isKindWithCtx ctx) ec) ((Elab_dTypes.v_forceVal ec) dom))
  | Core_dTerm.C_Value_VNeutral (dtb__564) -> (match dtb__564 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__565, dtb__566) -> (match dtb__566 with
  | B_dData_dList.C_List_Nil -> (dtb__565 = Base_dIntrinsics.v_strTypeName)
  | _ -> (match dtb__564 with
  | Core_dTerm.C_Neutral_NVar (dtb__567, dtb__568, dtb__569) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__568)
  | _ -> false
)
)
  | _ -> (match dtb__564 with
  | Core_dTerm.C_Neutral_NVar (dtb__570, dtb__571, dtb__572) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__571)
  | _ -> false
)
)
  | Core_dTerm.C_Value_VMeta (dtb__573, dtb__574) -> true
  | _ -> false
)) ((Elab_dTypes.v_forceVal ec) dom))))

# 48 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_instantiateNullaryCtorFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Core_dTerm.C_Value_VPi (dtb__575, dtb__576, dtb__577, dtb__578, dtb__579) -> (if dtb__576 then (if (((v_isImplicitDomain ctx) ec) dtb__578) then (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = dtb__581 } -> ((Base_dCommon.v_bind ((((v_instantiateNullaryCtorFuel (fuel - 1)) dtb__581) ctx) ((Core_dEval.v_applyClosure dtb__579) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__580)))) (fun (p : (Core_dTerm.t_Value, (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__582; B_dData_dPair.f_Pair_second = dtb__583 } -> (match dtb__583 with
  | { B_dData_dPair.f_Pair_first = dtb__584; B_dData_dPair.f_Pair_second = dtb__585 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__582; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__580, dtb__584)); B_dData_dPair.f_Pair_second = dtb__585 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } }))
)) ((Elab_dTypes.v_forceVal ec) v))))

# 45 "Vuna/Compiler/Elab/Meta.vuna"
let v_instantiateNullaryCtor = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> ((((v_instantiateNullaryCtorFuel 64) ec) ctx) v))

# 1264 "Vuna/Compiler/Elab/Meta.vuna"
let v_freshVarValue = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 1275 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralHeadName = (fun (mc0 : Core_dTerm.t_Neutral) -> (match mc0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__586, dtb__587) -> dtb__586
  | Core_dTerm.C_Neutral_NVar (dtb__588, dtb__589, dtb__590) -> dtb__588
  | _ -> failwith "DT: impossible branch"
))

# 1279 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolGlobal = (fun (name : string) -> (Base_dIntrinsics.v_isBoolCanonical name))

# 1271 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolType = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__591) -> (v_isBoolGlobal (v_neutralHeadName dtb__591))
  | _ -> false
))

# 1284 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortVal = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__592) -> true
  | _ -> false
))

# 477 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtor = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__593) -> (if ((v_isSortVal mc0) dtb__593) then (match (((v_dualFamilyOf mc0) mc3) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__594) -> (Base_dDiag.C_Check_OkC (dtb__594))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__593)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__593)) mc3) mc4))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1349 "Vuna/Compiler/Elab/Meta.vuna"
let v_mkCtorTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData (Elab_dTypes.v_dtCtorFamily ctor)) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__595) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__595) then (Core_dTerm.C_Term_TMk (g, args)) else (Core_dTerm.C_Term_TCon (g, args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1372 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_shiftCtorArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__596, dtb__597) -> (match dtb__596 with
  | { B_dData_dPair.f_Pair_first = dtb__598; B_dData_dPair.f_Pair_second = dtb__599 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((Core_dTerm.v_shift 0) mc0) dtb__598); B_dData_dPair.f_Pair_second = dtb__599 }, ((v_shiftCtorArgs mc0) dtb__597)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1381 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_etaCtorLa = (fun (mc0 : string) (mc1 : int) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__600, dtb__601) -> (match dtb__600 with
  | { B_dData_dPair.f_Pair_first = dtb__602; B_dData_dPair.f_Pair_second = dtb__603 } -> ((fun binder -> (Core_dTerm.C_Term_TLam (binder, dtb__603, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((((v_etaCtorLa mc0) (mc1 + 1)) dtb__601) ((B_dData_dList.v_append mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (binder, (B_dData_dList.v_length dtb__601), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__603 }, B_dData_dList.C_List_Nil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1394 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropCount = (fun (n : int) xs -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__604, dtb__605) -> ((v_dropCount (n - 1)) dtb__605)
  | _ -> failwith "DT: impossible branch"
)))

# 1364 "Vuna/Compiler/Elab/Meta.vuna"
let v_etaCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun rest -> ((fun k -> ((((v_etaCtorLa (Elab_dTypes.v_dtCtorName ctor)) 0) rest) ((v_shiftCtorArgs k) args))) (B_dData_dList.v_length rest))) ((v_dropCount (B_dData_dList.v_length args)) (Elab_dTypes.v_dtCtorTelescope ctor))))

# 1297 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__606) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__606)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__606)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__606)) = 0) then (Core_dTerm.C_Term_TCon (name, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__606) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Meta.vuna"
let v_inferCtorRef = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (name : string) (tyTerm : Core_dTerm.t_Term) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__607) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__607)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__607)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } })) else ((fun ctorTy -> (if ((v_hasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dDiag.C_Check_ErrC (dtb__608) -> (Base_dDiag.C_Check_ErrC (dtb__608))
  | Base_dDiag.C_Check_OkC (dtb__609) -> (match dtb__609 with
  | { B_dData_dPair.f_Pair_first = dtb__610; B_dData_dPair.f_Pair_second = dtb__611 } -> (match dtb__611 with
  | { B_dData_dPair.f_Pair_first = dtb__612; B_dData_dPair.f_Pair_second = dtb__613 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_nullaryCtorTerm dtb__607) dtb__612); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__610; B_dData_dPair.f_Pair_second = dtb__613 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_instantiateNullaryCtor ec) ctx) ctorTy)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctorTy; B_dData_dPair.f_Pair_second = ec } })))) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> (match ((v_dtCtorLookup name) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__614) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__614)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__614)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__614)) = 0) then (Core_dTerm.C_Term_TCon (name, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__614) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 1403 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_foldAppTerms = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__615, dtb__616) -> (match dtb__615 with
  | { B_dData_dPair.f_Pair_first = dtb__617; B_dData_dPair.f_Pair_second = dtb__618 } -> ((v_foldAppTerms (Core_dTerm.C_Term_TApp (mc0, dtb__617, dtb__618))) dtb__616)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1320 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTermEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__619) -> (match ((v_dtCtorLookupEc mc0) dtb__619) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__620) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__620)) then (v_boolCtorTerm dtb__619) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__620))) then ((((v_mkCtorTerm (Elab_dTypes.v_ecDatas mc0)) dtb__620) dtb__619) mc2) else ((v_etaCtorTerm dtb__620) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__619))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1333 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTerm = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__621) -> (match ((v_dtCtorLookup dtb__621) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__622) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__622)) then (v_boolCtorTerm dtb__621) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__622))) then ((((v_mkCtorTerm mc0) dtb__622) dtb__621) mc2) else ((v_etaCtorTerm dtb__622) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__621))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1419 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__623, dtb__624, dtb__625) -> (match dtb__623 with
  | Frontend_dRast.C_Expr_EVar (dtb__626, dtb__627) -> (match dtb__626 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__628) -> (if (dtb__628 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
)
  | Frontend_dRast.C_Expr_EVar (dtb__629, dtb__630) -> (match dtb__629 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__631) -> (if (dtb__631 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1414 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasFamParams = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EPi (dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637) -> (if (dtb__632 <> "_") then (v_isSortExpr dtb__635) else false)
  | _ -> false
))

# 1425 "Vuna/Compiler/Elab/Meta.vuna"
let v_baseNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 751 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findClassByShortName = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__638, dtb__639) -> (if ((v_baseNameOf (Elab_dTypes.v_dtClassName dtb__638)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__638)) else ((v_findClassByShortName mc0) dtb__639))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1432 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_explicitPiArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__640, dtb__641, dtb__642, dtb__643, dtb__644) -> (if dtb__641 then (v_explicitPiArity dtb__644) else (1 + (v_explicitPiArity dtb__644)))
  | _ -> 0
))

# 1460 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__645, dtb__646, dtb__647, dtb__648, dtb__649) -> (v_dropPis dtb__649)
  | _ -> mc0
))

# 1464 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyNonVarArg = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__650, dtb__651) -> (match dtb__650 with
  | Core_dTerm.C_Term_TVar (dtb__652, dtb__653, dtb__654) -> (v_anyNonVarArg dtb__651)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1455 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorResultIndexed = (fun (c : Elab_dTypes.t_DtCtor) -> (match (v_resultSpine (v_dropPis (Elab_dTypes.v_dtCtorType c))) with
  | { B_dData_dPair.f_Pair_first = dtb__655; B_dData_dPair.f_Pair_second = dtb__656 } -> (v_anyNonVarArg dtb__656)
  | _ -> failwith "DT: impossible branch"
))

# 1451 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyCtorIndexed = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__657, dtb__658) -> (if (v_ctorResultIndexed dtb__657) then true else (v_anyCtorIndexed dtb__658))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1448 "Vuna/Compiler/Elab/Meta.vuna"
let v_familyIndexed = (fun (d : Elab_dTypes.t_DtData) -> (v_anyCtorIndexed (Elab_dTypes.v_dtDataCtors d)))

# 1439 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyTable = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dBool.v_not (v_familyIndexed d)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (v_explicitPiArity (Elab_dTypes.v_dtCtorType c)) })) (Elab_dTypes.v_dtDataCtors d)) } })) (Elab_dTypes.v_ecDatas ec)))

# 1472 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCatchAllBody = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__659, dtb__660) -> (match dtb__659 with
  | { B_dData_dPair.f_Pair_first = dtb__661; B_dData_dPair.f_Pair_second = dtb__662 } -> (match dtb__661 with
  | Frontend_dRast.C_Pat_PCon (dtb__663, dtb__664, dtb__665) -> (v_findCatchAllBody dtb__660)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb__662))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
