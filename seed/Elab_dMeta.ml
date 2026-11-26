open Vuna_runtime
type t_ValueEntry = C_ValueEntry_VECtor of (Elab_dTypes.t_DtCtor) | C_ValueEntry_VEDef of (Core_dTerm.t_Term)
and t_DataHead = { f_DataHead_dataHeadName : string; f_DataHead_dataHeadKind : Core_dTerm.t_Term; f_DataHead_dataHeadArity : int }

# 32 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_hasNoExplicitPiFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_hasNoExplicitPiFuel (fuel - 1)) ec) ((Core_dEval.v_applyClosure dtb__4) ((Elab_dTypes.v_forceVal ec) dtb__3))) else false)
  | _ -> true
))))

# 29 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasNoExplicitPi = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_hasNoExplicitPiFuel 128) ec) v))

# 77 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_zipTeleRigs = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__7) }, ((v_zipTeleRigs dtb__6) dtb__8)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Meta.vuna"
let v_nullaryCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (metas : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_length metas) = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor))) then (Core_dTerm.C_Term_TCon ((Elab_dTypes.v_dtCtorName ctor), ((v_zipTeleRigs metas) (Elab_dTypes.v_dtCtorTelescope ctor)))) else (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtCtorName ctor)))))

# 84 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorValue = (fun (name : string) -> (if (name = Base_dIntrinsics.v_boolTrueCtor) then (B_dData_dMaybe.C_Maybe_Just (true)) else (if (name = Base_dIntrinsics.v_boolFalseCtor) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 88 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorTerm = (fun (name : string) -> (let nd_uscrut1 = (v_boolCtorValue name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (if dtb__9 then (Core_dTerm.C_Term_TBool (true)) else (Core_dTerm.C_Term_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)))

# 122 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupSpanPair = (fun (mc0 : int) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (dtb__12 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__13)) else ((v_lookupSpanPair mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_metaSpanOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VApp (dtb__14, dtb__15) -> ((v_metaSpanOf mc0) dtb__14)
  | Core_dTerm.C_Value_VMeta (dtb__16, dtb__17) -> ((v_lookupSpanPair dtb__16) (Elab_dTypes.v_ecMetaSpans mc0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 126 "Vuna/Compiler/Elab/Meta.vuna"
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

# 142 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_unsolvedFromGo = (fun (remaining : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (if (remaining <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let i = (stop - remaining) in (match ((Core_dTerm.v_metaLookup i) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (((v_unsolvedFromGo (remaining - 1)) stop) sols)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (i))
  | _ -> failwith "DT: impossible branch"
))))

# 139 "Vuna/Compiler/Elab/Meta.vuna"
let v_unsolvedFrom = (fun (i : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (((v_unsolvedFromGo (stop - i)) stop) sols))

# 153 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memMetaId = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = mc0) then true else ((v_memMetaId mc0) dtb__24))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Elab/Meta.vuna"
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
  | Core_dTerm.C_Term_TLam (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> (let tys = (let nd_uscrut6 = dtb__55 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (match dtb__58 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (match dtb__60 with
  | { B_dData_dPair.f_Pair_first = dtb__61; B_dData_dPair.f_Pair_second = dtb__62 } -> ((B_dData_dList.v_append (v_termMetasAllMaybe dtb__61)) (v_termMetasAllMaybe dtb__62))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in ((B_dData_dList.v_append tys) (v_termMetasAll dtb__57)))
  | Core_dTerm.C_Term_TPi (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> ((B_dData_dList.v_append (v_termMetasAll dtb__66)) (v_termMetasAll dtb__67))
  | Core_dTerm.C_Term_TType (dtb__68) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb__69) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb__70, dtb__71, dtb__72) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb__73) -> (B_dData_dList.C_List__x58__x58_ (dtb__73, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 219 "Vuna/Compiler/Elab/Meta.vuna"
and v_termMetasAllMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (v_termMetasAll dtb__74)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_termMetasRuntime = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__75, dtb__76, dtb__77) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__75)) ((B_dData_dList.v_append (v_termMetasRuntime dtb__76)) (v_termMetasRuntime dtb__77)))
  | Core_dTerm.C_Term_TBool (dtb__78) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TFloat (dtb__79) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TStr (dtb__80) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TInt (dtb__81) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TCase (dtb__82, dtb__83) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__82)) ((B_dData_dList.v_concatMap (fun (alt : Core_dTerm.t_CaseAlt) -> (v_termMetasRuntime (Core_dTerm.v_caseAltBody alt)))) dtb__83))
  | Core_dTerm.C_Term_TRecUpd (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb__84)) (v_termMetasRuntime dtb__88))
  | Core_dTerm.C_Term_TProj (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> (v_termMetasRuntime dtb__89)
  | Core_dTerm.C_Term_TRecord (dtb__94, dtb__95) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__95)
  | Core_dTerm.C_Term_TMk (dtb__96, dtb__97) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__97)
  | Core_dTerm.C_Term_TCon (dtb__98, dtb__99) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf p))))) dtb__99)
  | Core_dTerm.C_Term_TApp (dtb__100, dtb__101, dtb__102) -> (if (Core_dTerm.v_rigIsErased dtb__102) then (v_termMetasRuntime dtb__100) else ((B_dData_dList.v_append (v_termMetasRuntime dtb__100)) (v_termMetasRuntime dtb__101)))
  | Core_dTerm.C_Term_TLam (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (v_termMetasRuntime dtb__107)
  | Core_dTerm.C_Term_TPi (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> ((B_dData_dList.v_append (v_termMetasAll dtb__111)) (v_termMetasAll dtb__112))
  | Core_dTerm.C_Term_TType (dtb__113) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb__114) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb__115, dtb__116, dtb__117) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb__118) -> (B_dData_dList.C_List__x58__x58_ (dtb__118, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Elab/Meta.vuna"
let v_relevantMetas = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (v_termMetasRuntime (B_dData_dPair.v_secondOf d)))) (Elab_dTypes.v_ecDefs ec))) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_concatMap v_termMetasAll) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorType) (Elab_dTypes.v_dtDataCtors d))))) (Elab_dTypes.v_ecDatas ec))))

# 223 "Vuna/Compiler/Elab/Meta.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 226 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_globalLookup = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (match dtb__119 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (if (mc0 = dtb__121) then (B_dData_dMaybe.C_Maybe_Just (dtb__122)) else ((v_globalLookup mc0) dtb__120))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsLookup = (fun (name : string) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (Elab_dTypes.v_ecGlobalsTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (B_dData_dMaybe.C_Maybe_Just (dtb__123))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (ec).Elab_dTypes.f_Ec_ecGlobalsComplete then B_dData_dMaybe.C_Maybe_Nothing else ((v_globalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsTableOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) globals) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 249 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memSig = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | { B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = dtb__127 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__126) mc1) then true else (((v_memSig _uctx0) dtb__125) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memDefName = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match dtb__128 with
  | { B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = dtb__131 } -> (if (dtb__130 = mc0) then true else ((v_memDefName mc0) dtb__129))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectSigsInto = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | Frontend_dAst.C_Decl_DSig (dtb__134, dtb__135, dtb__136, dtb__137) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__134) dtb__135) dtb__136) (Frontend_dAst.v_nodeRefSpan dtb__137)) dtb__133)
  | Frontend_dAst.C_Decl_DAxiom (dtb__138, dtb__139, dtb__140) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__138) B_dData_dList.C_List_Nil) dtb__139) (Frontend_dAst.v_nodeRefSpan dtb__140)) dtb__133)
  | Frontend_dAst.C_Decl_DExtern (dtb__141, dtb__142, dtb__143, dtb__144) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__141) B_dData_dList.C_List_Nil) dtb__143) (Frontend_dAst.v_nodeRefSpan dtb__144)) dtb__133)
  | Frontend_dAst.C_Decl_DFun (dtb__145, dtb__146, dtb__147, dtb__148) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dAst.C_Decl_DData (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dAst.C_Decl_DRecord (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dAst.C_Decl_DTrait (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dAst.C_Decl_DInstance (dtb__171, dtb__172, dtb__173, dtb__174) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Meta.vuna"
and v_collectSigOne = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (seen : (string, bool) B_dContainer_dHashMap.t_HashMap) (acc : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (ctx : Frontend_dAst.t_Expr B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName name) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (name))) name) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) seen) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_DuplicateSignature (name))) name) else ((((((v_collectSigsInto banned) preludeBanned) paramKinds) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) true) seen)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctx; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((((((Elab_dSig.v_quantifyTopSigCtxCachedKinds (Elab_dSig.v_modulePrefixOf name)) banned) preludeBanned) paramKinds) ctx) ty) sp); B_dData_dPair.f_Pair_second = sp } } }, acc))) rest))))

# 257 "Vuna/Compiler/Elab/Meta.vuna"
let v_collectSigs = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let defined = (Elab_dSig.v_definedNames decls) in (let banned = (Elab_dSig.v_qualifiedBannedTbl defined) in (let preludeBanned = (Elab_dSig.v_topQuantBanned B_dData_dList.C_List_Nil) in ((((((v_collectSigsInto banned) preludeBanned) (Elab_dSig.v_dataParamKindTbl decls)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) decls)))))

# 308 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectDataDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | Frontend_dAst.C_Decl_DData (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_collectDataDecls dtb__176) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__185) }, mc1)))
  | Frontend_dAst.C_Decl_DRecord (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> ((v_collectDataDecls dtb__176) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__193) }, mc1)))
  | _ -> ((v_collectDataDecls dtb__176) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dataNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__194 with
  | Frontend_dAst.C_Decl_DData (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (B_dData_dList.C_List__x58__x58_ (dtb__196, (v_dataNamesOf dtb__195)))
  | Frontend_dAst.C_Decl_DRecord (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212) -> (B_dData_dList.C_List__x58__x58_ (dtb__205, (v_dataNamesOf dtb__195)))
  | _ -> (v_dataNamesOf dtb__195)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Meta.vuna"
let v_nonEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindDomainWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (if (v_kindDomainWellFormed dtb__218) then (v_kindDomainWellFormed dtb__219) else false)
  | Core_dTerm.C_Term_TType (dtb__220) -> ((Core_dTerm.v_levelToInt dtb__220) >= 0)
  | _ -> true
))

# 339 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__221) -> ((Core_dTerm.v_levelToInt dtb__221) >= 0)
  | Core_dTerm.C_Term_TPi (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (if (v_kindDomainWellFormed dtb__225) then (v_kindWellFormed dtb__226) else false)
  | _ -> false
))

# 352 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_splitKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__229 }, (v_splitKind dtb__231)))
  | _ -> B_dData_dList.C_List_Nil
))

# 356 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtDataLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (if ((Elab_dTypes.v_dtDataName dtb__232) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__232)) else ((v_dtDataLookup mc0) dtb__233))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCtorIn = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if ((Elab_dTypes.v_dtCtorName dtb__234) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__234)) else ((v_findCtorIn mc0) dtb__235))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtCtorLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (match ((v_findCtorIn mc0) (Elab_dTypes.v_dtDataCtors dtb__236)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (B_dData_dMaybe.C_Maybe_Just (dtb__238))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_dtCtorLookup mc0) dtb__237)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Meta.vuna"
let v_dtCtorLookupEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ec).Elab_dTypes.f_Ec_ecCtorTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (B_dData_dMaybe.C_Maybe_Just (dtb__239))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Elab_dTypes.v_ecCtorIndexComplete ec) then B_dData_dMaybe.C_Maybe_Nothing else ((v_dtCtorLookup name) (Elab_dTypes.v_ecDatas ec)))
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataFamilyName = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLevelGlobal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (v_kindWellFormed dtb__241)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeName = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (if (((v_isTypeLevelGlobal globals) ec) name) then true else ((v_isDataFamilyName ec) name)))

# 412 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataShortNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 416 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeNameOfDualCtor = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if ((Base_dSource.v_prefixOfName name) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let fam = (Base_dSource.v_prefixOfName name) in (if ((v_dataShortNameOf fam) = (Base_dSource.v_lastSeg name)) then (match ((v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (B_dData_dMaybe.C_Maybe_Just (fam))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))))

# 429 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyNameOf = (fun (ec : Elab_dTypes.t_Ec) (target : string) -> (match ((v_dtCtorLookupEc ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__243)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_expectedFamilyOfFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> (((v_expectedFamilyOfFuel (fuel - 1)) ec) ((Core_dEval.v_applyClosure dtb__248) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_over", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__249) -> (match dtb__249 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__250, dtb__251) -> (B_dData_dMaybe.C_Maybe_Just (dtb__250))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 436 "Vuna/Compiler/Elab/Meta.vuna"
let v_expectedFamilyOf = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_expectedFamilyOfFuel 64) ec) v))

# 451 "Vuna/Compiler/Elab/Meta.vuna"
let v_overCandidatesText = (fun (targets : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map Frontend_dAst.v_ctorDisplayName) targets)))

# 455 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dualFamilyOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match ((v_dtCtorLookupEc mc0) dtb__252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (if ((v_dataShortNameOf (Elab_dTypes.v_dtCtorFamily dtb__254)) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__254))) else (((v_dualFamilyOf mc0) mc1) dtb__253))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dualFamilyOf mc0) mc1) dtb__253)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyIs = (fun (ec : Elab_dTypes.t_Ec) (target : string) (fam : string) -> (match ((v_ctorFamilyNameOf ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (dtb__255 = fam)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Elab/Meta.vuna"
let v_candidatesInFamily = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__256) -> ((B_dData_dList.v_filter (fun (t : string) -> (((v_ctorFamilyIs mc0) t) dtb__256))) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Meta.vuna"
let v_defaultOrOver = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__258 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__257))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
))

# 490 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtorGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__259) -> (let nd_uscrut7 = (((v_candidatesInFamily mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__259))) mc4) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (match dtb__261 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__260))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc3, (v_overCandidatesText mc4)))) mc3) (v_overCandidatesText mc4))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc3, (v_overCandidatesText mc4)))) mc3) (v_overCandidatesText mc4))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeHeadLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__262)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_isTypeLevelGlobal globals) ec) name) then (((v_globalsLookup name) globals) ec) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (((v_typeHeadLookup globals) ec) name))

# 532 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VECtor (dtb__263))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VEDef (dtb__264))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_teleOf = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__265, (B_dData_dList.v_length mc1), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__267 }, ((v_teleOf dtb__269) (B_dData_dList.C_List__x58__x58_ (v, mc1))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 543 "Vuna/Compiler/Elab/Meta.vuna"
let v_teleOfType = (fun (ty : Core_dTerm.t_Term) -> ((v_teleOf ty) B_dData_dList.C_List_Nil))

# 554 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_spineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__270) -> { B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__271, dtb__272) -> { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__272) }
  | Core_dTerm.C_Term_TApp (dtb__273, dtb__274, dtb__275) -> (match (v_spineOfType dtb__273) with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__277) (B_dData_dList.C_List__x58__x58_ (dtb__274, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 562 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_resultSpine = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (v_resultSpine dtb__282)
  | _ -> (v_spineOfType mc0)
))

# 587 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkFuelMax = 1000000

# 641 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVar = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.v_hasNegativeVar t))

# 590 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_zonkTermFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TMeta (dtb__283) -> (match ((Core_dTerm.v_metaLookup dtb__283) (Elab_dTypes.v_ecSolTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__284) -> (let q = ((Core_dEval.v_quote depth) dtb__284) in (if (v_hasOutOfScopeVar q) then t else ((((v_zonkTermFuel (fuel - 1)) ec) depth) q)))
  | B_dData_dMaybe.C_Maybe_Nothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> (Core_dTerm.C_Term_TPi (dtb__285, dtb__286, dtb__287, ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__288), ((((v_zonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__289)))
  | Core_dTerm.C_Term_TLam (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> (let slot2 = (let nd_uscrut9 = dtb__292 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> (match dtb__297 with
  | { B_dData_dPair.f_Pair_first = dtb__298; B_dData_dPair.f_Pair_second = dtb__299 } -> (let bt2 = (match dtb__298 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> (B_dData_dMaybe.C_Maybe_Just (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__301)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__299 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__300) -> (B_dData_dMaybe.C_Maybe_Just (((((v_zonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__300)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__290, dtb__291, slot2, dtb__293, ((((v_zonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__294))))
  | Core_dTerm.C_Term_TApp (dtb__302, dtb__303, dtb__304) -> (Core_dTerm.C_Term_TApp (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__302), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__303), dtb__304))
  | Core_dTerm.C_Term_TCon (dtb__305, dtb__306) -> (Core_dTerm.C_Term_TCon (dtb__305, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (fuel - 1)) ec) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__306)))
  | Core_dTerm.C_Term_TMk (dtb__307, dtb__308) -> (Core_dTerm.C_Term_TMk (dtb__307, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (fuel - 1)) ec) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__308)))
  | Core_dTerm.C_Term_TCase (dtb__309, dtb__310) -> (Core_dTerm.C_Term_TCase (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__309), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_zonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__310)))
  | Core_dTerm.C_Term_TIf (dtb__311, dtb__312, dtb__313) -> (Core_dTerm.C_Term_TIf (((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__311), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__312), ((((v_zonkTermFuel (fuel - 1)) ec) depth) dtb__313)))
  | _ -> t
)))
# 630 "Vuna/Compiler/Elab/Meta.vuna"
and v_zonkAltFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (alt0 : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt0 else (match alt0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = dtb__316 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_zonkTermFuel (fuel - 1)) ec) (depth + (B_dData_dList.v_length dtb__315))) dtb__316) }
  | _ -> failwith "DT: impossible branch"
)))

# 579 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkTerm = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> (let _u = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.zonk") 1) in ((((v_zonkTermFuel v_zonkFuelMax) ec) depth) t)))

# 644 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarArgs = (fun (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarArgs args))

# 647 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarAlts = (fun (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarAlts alts))

# 655 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_prependFamParams = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Frontend_dAst.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (match dtb__320 with
  | Core_dTerm.C_Term_TType (dtb__322) -> (Frontend_dAst.C_Expr_EPi (dtb__317, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef mc2))), (((v_prependFamParams dtb__321) mc1) mc2), (Frontend_dAst.v_detachedNodeRef mc2)))
  | _ -> mc1
)
  | _ -> mc1
))

# 670 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (v_dropParams dtb__327)
  | _ -> mc0
))

# 674 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctorGlobals = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__328); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtCtorType dtb__328) }, (v_ctorGlobals dtb__329)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupDataHead = (fun (mc0 : string) (mc1 : t_DataHead B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__330, dtb__331) -> (if ((dtb__330).f_DataHead_dataHeadName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__330).f_DataHead_dataHeadKind; B_dData_dPair.f_Pair_second = (dtb__330).f_DataHead_dataHeadArity })) else ((v_lookupDataHead mc0) dtb__331))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictTypeName = (fun (cname : string) -> ("Dict_" ^ cname))

# 703 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictCtorName = (fun (cname : string) -> ("MkDict_" ^ cname))

# 707 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectTraitDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__332, dtb__333) -> (match dtb__332 with
  | Frontend_dAst.C_Decl_DTrait (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> ((v_collectTraitDecls dtb__333) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__338) }, mc1)))
  | _ -> ((v_collectTraitDecls dtb__333) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectInstDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (match dtb__339 with
  | Frontend_dAst.C_Decl_DInstance (dtb__341, dtb__342, dtb__343, dtb__344) -> ((v_collectInstDecls dtb__340) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__344) }, mc1)))
  | _ -> ((v_collectInstDecls dtb__340) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Meta.vuna"
let v_paramNameOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__345, dtb__346) -> dtb__345
  | B_dData_dList.C_List_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgTermsGo = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__347 }, ((((v_methodArgTermsGo dtb__348) mc1) (mc2 + 1)) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Elab/Meta.vuna"
let v_methodArgTerms = (fun (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) -> ((((v_methodArgTermsGo rigs) nFields) 0) (B_dData_dList.v_length rigs)))

# 737 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgLams = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (Core_dTerm.C_Term_TLam (("x" ^ (bi_strFromInt mc1)), dtb__349, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_methodArgLams dtb__350) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldVarName = (fun (i : int) -> ("_f" ^ (bi_strFromInt i)))

# 754 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_fieldBinderGoGo = (fun (remaining : int) (n : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_fieldBinderGoGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldVarName (n - remaining)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, acc)))))

# 751 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderGo = (fun (n : int) (i : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fieldBinderGoGo (n - i)) n) acc))

# 748 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderNames = (fun (n : int) -> (((v_fieldBinderGo n) 0) B_dData_dList.C_List_Nil))

# 763 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findClassByMethod = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (if ((B_dData_dList.v_memName mc0) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (dtb__351).Elab_dTypes.f_DtClass_dtClassMethods)) then (B_dData_dMaybe.C_Maybe_Just (dtb__351)) else ((v_findClassByMethod mc0) dtb__352))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_allTeleArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__353, dtb__354) -> (match (B_dData_dPair.v_firstOf dtb__353) with
  | Core_dTerm.C_Term_TVar (dtb__355, dtb__356, dtb__357) -> (if (if (dtb__356 >= 0) then (dtb__356 < mc0) else false) then ((v_allTeleArgs mc0) dtb__354) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 775 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInstHead = (fun (n : int) (head : Core_dTerm.t_Term) -> (if (n <= 0) then false else (let nd_uscrut2 = (Elab_dTypes.v_flattenTaggedApp head) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (if (v_nonEmpty dtb__360) then ((v_allTeleArgs n) dtb__360) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 791 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInst = (fun (mc0 : Elab_dTypes.t_DtInst) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__361; Elab_dTypes.f_DtInst_dtInstSym = dtb__362; Elab_dTypes.f_DtInst_dtInstKey = dtb__363; Elab_dTypes.f_DtInst_dtInstTele = dtb__364; Elab_dTypes.f_DtInst_dtInstCtx = dtb__365; Elab_dTypes.f_DtInst_dtInstHead = dtb__366; Elab_dTypes.f_DtInst_dtInstSpan = dtb__367 } -> ((v_isBlanketInstHead (B_dData_dList.v_length dtb__364)) dtb__366)
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Elab/Meta.vuna"
let v_substClassParam = (fun (pname : string) (arg : Core_dTerm.t_Term) (ty : Core_dTerm.t_Term) -> (((Core_dTerm.v_substVarAt 0) arg) ty))

# 801 "Vuna/Compiler/Elab/Meta.vuna"
let v_litEqName = (fun (tyName : string) -> (if (tyName = Base_dIntrinsics.v_strTypeName) then "bi_eq_str" else "bi_eq_int"))

# 843 "Vuna/Compiler/Elab/Meta.vuna"
let v_isStringImplicitDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__368) -> (match dtb__368 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__369, dtb__370) -> (match dtb__370 with
  | B_dData_dList.C_List_Nil -> (dtb__369 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 849 "Vuna/Compiler/Elab/Meta.vuna"
let v_implicitBinderRig = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isStringImplicitDomain ec) dom) then Core_dTerm.C_Rig_RigOmega else Core_dTerm.C_Rig_Rig0))

# 912 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxItemAt = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__371)) else ((v_ctxItemAt (mc0 - 1)) dtb__372))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 861 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderType = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let idx = ((d - lvl) - 1) in (if (lvl < 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (idx < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (B_dData_dMaybe.C_Maybe_Just ((((Elab_dTypes.v_varTypeValue ctx) idx) (B_dData_dPair.v_secondOf dtb__373))))
  | _ -> failwith "DT: impossible branch"
))))))

# 938 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfQty = (fun (implicit : bool) (isTypeDom : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (if (if implicit then true else isTypeDom) then Core_dTerm.C_Rig_Rig0 else (let nd_uscrut3 = qty in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (match dtb__374 with
  | Frontend_dAst.C_Qty_Q1 -> Core_dTerm.C_Rig_Rig1
  | Frontend_dAst.C_Qty_Q0 -> Core_dTerm.C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
))))

# 961 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeHeadOpaqueEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if (B_dData_dBool.v_not ((v_isDataFamilyName ec) name)) then (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name)) else false))

# 977 "Vuna/Compiler/Elab/Meta.vuna"
let v_isUniverseValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VType (dtb__375) -> true
  | _ -> false
))

# 968 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isFamilyKindFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__376, dtb__377, dtb__378, dtb__379, dtb__380) -> (if (B_dData_dBool.v_not (v_isUniverseValue dtb__379)) then true else ((v_isFamilyKindFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__380) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__376, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 965 "Vuna/Compiler/Elab/Meta.vuna"
let v_isFamilyKindValue = (fun (v : Core_dTerm.t_Value) -> ((v_isFamilyKindFuel 64) v))

# 994 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueHasImplicitPiFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> (if dtb__382 then true else ((v_valueHasImplicitPiFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__385) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__381, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 991 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueHasImplicitPi = (fun (v : Core_dTerm.t_Value) -> ((v_valueHasImplicitPiFuel 64) v))

# 1036 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeishValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VMeta (dtb__386, dtb__387) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__388) -> true
  | Core_dTerm.C_Value_VPi (dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> true
  | Core_dTerm.C_Value_VType (dtb__394) -> true
  | _ -> false
))

# 1043 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__395, dtb__396) -> (if (dtb__395 = mc0) then true else ((v_memLevel mc0) dtb__396))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1003 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueOpaqueGo = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (match v with
  | Core_dTerm.C_Value_VType (dtb__397) -> false
  | Core_dTerm.C_Value_VMeta (dtb__398, dtb__399) -> false
  | Core_dTerm.C_Value_VNeutral (dtb__400) -> (match dtb__400 with
  | Core_dTerm.C_Neutral_NVar (dtb__401, dtb__402, dtb__403) -> (if (dtb__402 < depth) then (outerNVar dtb__402) else (if ((v_memLevel dtb__402) famLevels) then true else false))
  | Core_dTerm.C_Neutral_NGlobal (dtb__404, dtb__405) -> (if (headOpaque dtb__404) then true else ((((((v_valueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__405))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> (let fam2 = (if (v_isFamilyKindValue dtb__409) then (B_dData_dList.C_List__x58__x58_ (depth, famLevels)) else famLevels) in (if ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__409) then true else ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Core_dEval.v_applyClosure dtb__410) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__406, depth, B_dData_dList.C_List_Nil))))))))
  | _ -> true
)))
# 1025 "Vuna/Compiler/Elab/Meta.vuna"
and v_valueOpaqueTypeSpine = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match sp with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__411, dtb__412) -> (if (if (v_isTypeishValue dtb__411) then ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__411) else false) then true else ((((((v_valueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__412))
  | _ -> failwith "DT: impossible branch"
)))

# 985 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueOpaqueScoped = (fun (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((((v_valueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

# 1048 "Vuna/Compiler/Elab/Meta.vuna"
let v_nvarOpaqueCtx = (fun (ctx : Elab_dTypes.t_Ctx) (lvl : int) -> (let idx = (((Elab_dTypes.v_ctxDepth ctx) - 1) - lvl) in (if (idx < 0) then false else (let nd_uscrut3 = ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> (match dtb__413 with
  | { B_dData_dPair.f_Pair_first = dtb__414; B_dData_dPair.f_Pair_second = dtb__415 } -> (v_isFamilyKindValue (((Elab_dTypes.v_varTypeValue ctx) idx) dtb__415))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1061 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkValueOnly = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1064 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyIn = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (((((v_valueOpaqueScoped (v_nvarOpaqueCtx ctx)) (v_isTypeHeadOpaqueEc ec)) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) ((v_zonkValueOnly ec) v)))

# 1073 "Vuna/Compiler/Elab/Meta.vuna"
let v_castErased = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_primEraseName)), t, Core_dTerm.C_Rig_Rig1)))

# 1123 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueVar = (fun (depth : int) (idxs : int B_dData_dList.t_List) (name : string) (i : int) -> (if (i < depth) then (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else (if ((v_memLevel (i - depth)) idxs) then (v_castErased (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) else (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))))

# 1082 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_wrapOpaqueUsesFuel = (fun (fuel : int) (depth : int) (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TVar (dtb__416, dtb__417, dtb__418) -> ((((v_wrapOpaqueVar depth) idxs) dtb__416) dtb__417)
  | Core_dTerm.C_Term_TGlobal (dtb__419) -> (Core_dTerm.C_Term_TGlobal (dtb__419))
  | Core_dTerm.C_Term_TMeta (dtb__420) -> (Core_dTerm.C_Term_TMeta (dtb__420))
  | Core_dTerm.C_Term_TType (dtb__421) -> (Core_dTerm.C_Term_TType (dtb__421))
  | Core_dTerm.C_Term_TInt (dtb__422) -> (Core_dTerm.C_Term_TInt (dtb__422))
  | Core_dTerm.C_Term_TStr (dtb__423) -> (Core_dTerm.C_Term_TStr (dtb__423))
  | Core_dTerm.C_Term_TFloat (dtb__424) -> (Core_dTerm.C_Term_TFloat (dtb__424))
  | Core_dTerm.C_Term_TBool (dtb__425) -> (Core_dTerm.C_Term_TBool (dtb__425))
  | Core_dTerm.C_Term_TPi (dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> (Core_dTerm.C_Term_TPi (dtb__426, dtb__427, dtb__428, ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__429), ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__430)))
  | Core_dTerm.C_Term_TLam (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435) -> (let slot2 = (let nd_uscrut9 = dtb__433 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (match dtb__436 with
  | { B_dData_dPair.f_Pair_first = dtb__437; B_dData_dPair.f_Pair_second = dtb__438 } -> (match dtb__438 with
  | { B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = dtb__440 } -> (let bt2 = (match dtb__439 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__442)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__440 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__441) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__441)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__437; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__431, dtb__432, slot2, dtb__434, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__435))))
  | Core_dTerm.C_Term_TApp (dtb__443, dtb__444, dtb__445) -> (Core_dTerm.C_Term_TApp (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__443), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__444), dtb__445))
  | Core_dTerm.C_Term_TCon (dtb__446, dtb__447) -> (Core_dTerm.C_Term_TCon (dtb__446, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__447)))
  | Core_dTerm.C_Term_TMk (dtb__448, dtb__449) -> (Core_dTerm.C_Term_TMk (dtb__448, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__449)))
  | Core_dTerm.C_Term_TRecord (dtb__450, dtb__451) -> (Core_dTerm.C_Term_TRecord (dtb__450, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__451)))
  | Core_dTerm.C_Term_TProj (dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> (Core_dTerm.C_Term_TProj (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__452), dtb__453, dtb__454, dtb__455, dtb__456))
  | Core_dTerm.C_Term_TRecUpd (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> (Core_dTerm.C_Term_TRecUpd (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__457), dtb__458, dtb__459, dtb__460, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + (B_dData_dList.v_length dtb__459))) idxs) dtb__461)))
  | Core_dTerm.C_Term_TCase (dtb__462, dtb__463) -> (Core_dTerm.C_Term_TCase (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__462), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_wrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__463)))
  | Core_dTerm.C_Term_TIf (dtb__464, dtb__465, dtb__466) -> (Core_dTerm.C_Term_TIf (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__464), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__465), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__466)))
  | _ -> failwith "DT: impossible branch"
)))
# 1132 "Vuna/Compiler/Elab/Meta.vuna"
and v_wrapOpaqueAltFuel = (fun (mc0 : int) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__467; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__468; Core_dTerm.f_CaseAlt_caseAltBody = dtb__469 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__467; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__468; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_wrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (B_dData_dList.v_length dtb__468))) mc2) dtb__469) }
  | _ -> failwith "DT: impossible branch"
))

# 1079 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueUses = (fun (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_wrapOpaqueUsesFuel 512) 0) idxs) t))

# 1157 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataLinearName = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_dtDataLookup g) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__470) -> (Elab_dTypes.v_dtDataLinear dtb__470)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1163 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorLinearName = (fun (ec : Elab_dTypes.t_Ec) (c : string) -> (match ((v_dtCtorLookupEc ec) c) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> ((v_dataLinearName ec) (Elab_dTypes.v_dtCtorFamily dtb__471))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1140 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearTypeFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__472) -> (match dtb__472 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__473, dtb__474) -> ((v_dataLinearName ec) dtb__473)
  | Core_dTerm.C_Neutral_NVar (dtb__475, dtb__476, dtb__477) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__478, dtb__479) -> ((v_ctorLinearName ec) dtb__478)
  | _ -> false
)))

# 1137 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearType = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (Elab_dTypes.v_ecHasLinear ec) then (((v_isLinearTypeFuel 64) ec) v) else false))

# 1153 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyLinearVals = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__480, dtb__481) -> (if (((v_isLinearTypeFuel mc0) mc1) dtb__480) then true else (((v_anyLinearVals mc0) mc1) dtb__481))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1170 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigForLinearDomain = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (name : string) (rig : Core_dTerm.t_Rig) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then (match rig with
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (Core_dTerm.C_Rig_Rig1))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Base_dDiag.C_Check_OkC (rig))))

# 1180 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigCaseField = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (rig : Core_dTerm.t_Rig) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else rig))

# 1184 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfLinearValue = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_RigOmega))

# 1191 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxHasLinearItems = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__482, dtb__483) -> (match dtb__482 with
  | { B_dData_dPair.f_Pair_first = dtb__484; B_dData_dPair.f_Pair_second = dtb__485 } -> (if ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) mc3) dtb__485)) then true else ((((v_ctxHasLinearItems mc0) mc1) dtb__483) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1188 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctxHasLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) -> ((((v_ctxHasLinearItems ec) ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0))

# 1201 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_outerScan = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__486, dtb__487, dtb__488) -> (if (if ((((v_outerScan mc0) mc1) mc2) dtb__486) then true else ((((v_outerScan mc0) mc1) mc2) dtb__487)) then true else ((((v_outerScan mc0) mc1) mc2) dtb__488))
  | Core_dTerm.C_Term_TCase (dtb__489, dtb__490) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__489) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__490))
  | Core_dTerm.C_Term_TRecUpd (dtb__491, dtb__492, dtb__493, dtb__494, dtb__495) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__491) then true else ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__493))) dtb__495))
  | Core_dTerm.C_Term_TRecord (dtb__496, dtb__497) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__497)
  | Core_dTerm.C_Term_TProj (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> ((((v_outerScan mc0) mc1) mc2) dtb__498)
  | Core_dTerm.C_Term_TMk (dtb__503, dtb__504) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__504)
  | Core_dTerm.C_Term_TCon (dtb__505, dtb__506) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__506)
  | Core_dTerm.C_Term_TApp (dtb__507, dtb__508, dtb__509) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__507) then true else ((((v_outerScan mc0) mc1) mc2) dtb__508))
  | Core_dTerm.C_Term_TLam (dtb__510, dtb__511, dtb__512, dtb__513, dtb__514) -> ((((v_outerScan mc0) mc1) (mc2 + 1)) dtb__514)
  | Core_dTerm.C_Term_TPi (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519) -> false
  | Core_dTerm.C_Term_TVar (dtb__520, dtb__521, dtb__522) -> (if (dtb__521 > mc2) then (let nd_uscrut7 = ((v_ctxItemAt (dtb__521 - mc2)) (mc1).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (match dtb__523 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) (dtb__521 - mc2)) dtb__525))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
))
# 1223 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanArgs = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__526, dtb__527) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (if ((((v_outerScan mc0) mc1) mc2) dtb__528) then true else ((((v_outerScanArgs mc0) mc1) mc2) dtb__527))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1228 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanAlts = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__530, dtb__531) -> (match dtb__530 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__532; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__533; Core_dTerm.f_CaseAlt_caseAltBody = dtb__534 } -> (if ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__533))) dtb__534) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__531))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Elab/Meta.vuna"
let v_termHasOuterLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (t : Core_dTerm.t_Term) -> ((((v_outerScan ec) ctx) 0) t))

# 1236 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLayerValueFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VType (dtb__535) -> true
  | Core_dTerm.C_Value_VPi (dtb__536, dtb__537, dtb__538, dtb__539, dtb__540) -> (if ((v_isTypeLayerValueFuel (fuel - 1)) dtb__539) then ((v_isTypeLayerValueFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__540) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__536, 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 1233 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLayerValue = (fun (v : Core_dTerm.t_Value) -> ((v_isTypeLayerValueFuel 128) v))

# 931 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeDomain = (fun (v : Core_dTerm.t_Value) -> (v_isTypeLayerValue v))

# 934 "Vuna/Compiler/Elab/Meta.vuna"
let v_piBinderRig = (fun (implicit : bool) (dom : Core_dTerm.t_Value) -> ((Core_dTerm.v_rigOfBinder implicit) (v_isTypeDomain dom)))

# 1246 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataHead = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__541) -> (match dtb__541 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__542, dtb__543) -> (match ((v_dtDataLookup dtb__542) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__544) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 807 "Vuna/Compiler/Elab/Meta.vuna"
let v_isIndexDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (v_isTypeDomain dom) then true else ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) ((Elab_dTypes.v_forceVal ec) dom))))

# 854 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderIndexDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (match (((v_neutralBinderType ctx) ec) lvl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__545) -> ((v_isIndexDomain ec) dtb__545)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 893 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLikeWithCtx = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__546) -> true
  | Core_dTerm.C_Value_VPi (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551) -> ((((v_isTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__551) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("ty", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__552) -> (match dtb__552 with
  | Core_dTerm.C_Neutral_NVar (dtb__553, dtb__554, dtb__555) -> (match (((v_neutralBinderType ctx) ec) dtb__554) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__556) -> (v_isTypeDomain dtb__556)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__557, dtb__558) -> ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) v)
  | _ -> false
)
  | Core_dTerm.C_Value_VMeta (dtb__559, dtb__560) -> true
  | _ -> false
)))

# 880 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isKindWithCtxFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__561) -> true
  | Core_dTerm.C_Value_VPi (dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> (if ((((v_isTypeLikeWithCtx fuel) ctx) ec) dtb__565) then ((((v_isKindWithCtxFuel (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__566) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("kind", 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 877 "Vuna/Compiler/Elab/Meta.vuna"
let v_isKindWithCtx = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_isKindWithCtxFuel 64) ctx) ec) v))

# 822 "Vuna/Compiler/Elab/Meta.vuna"
let v_isImplicitDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isIndexDomain ec) dom) then true else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__567, dtb__568, dtb__569, dtb__570, dtb__571) -> (((v_isKindWithCtx ctx) ec) ((Elab_dTypes.v_forceVal ec) dom))
  | Core_dTerm.C_Value_VNeutral (dtb__572) -> (match dtb__572 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__573, dtb__574) -> (match dtb__574 with
  | B_dData_dList.C_List_Nil -> (dtb__573 = Base_dIntrinsics.v_strTypeName)
  | _ -> (match dtb__572 with
  | Core_dTerm.C_Neutral_NVar (dtb__575, dtb__576, dtb__577) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__576)
  | _ -> false
)
)
  | _ -> (match dtb__572 with
  | Core_dTerm.C_Neutral_NVar (dtb__578, dtb__579, dtb__580) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__579)
  | _ -> false
)
)
  | Core_dTerm.C_Value_VMeta (dtb__581, dtb__582) -> true
  | _ -> false
))))

# 49 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_instantiateNullaryCtorFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })) else (let nd_uscrut4 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut4 with
  | Core_dTerm.C_Value_VPi (dtb__583, dtb__584, dtb__585, dtb__586, dtb__587) -> (if dtb__584 then (if (((v_isImplicitDomain ctx) ec) dtb__586) then (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__588; B_dData_dPair.f_Pair_second = dtb__589 } -> ((Base_dCommon.v_bind ((((v_instantiateNullaryCtorFuel (fuel - 1)) dtb__589) ctx) ((Core_dEval.v_applyClosure dtb__587) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__588)))) (fun (p : (Core_dTerm.t_Value, (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = dtb__591 } -> (match dtb__591 with
  | { B_dData_dPair.f_Pair_first = dtb__592; B_dData_dPair.f_Pair_second = dtb__593 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__588, dtb__592)); B_dData_dPair.f_Pair_second = dtb__593 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } }))
))))

# 46 "Vuna/Compiler/Elab/Meta.vuna"
let v_instantiateNullaryCtor = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> ((((v_instantiateNullaryCtorFuel 64) ec) ctx) v))

# 1256 "Vuna/Compiler/Elab/Meta.vuna"
let v_freshVarValue = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 1267 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralHeadName = (fun (mc0 : Core_dTerm.t_Neutral) -> (match mc0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__594, dtb__595) -> dtb__594
  | Core_dTerm.C_Neutral_NVar (dtb__596, dtb__597, dtb__598) -> dtb__596
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolGlobal = (fun (name : string) -> (Base_dIntrinsics.v_isBoolCanonical name))

# 1263 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolType = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__599) -> (v_isBoolGlobal (v_neutralHeadName dtb__599))
  | _ -> false
))

# 1276 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortVal = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__600) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtor = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__601) -> (if ((v_isSortVal mc0) dtb__601) then (match (((v_dualFamilyOf mc0) mc3) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__602) -> (Base_dDiag.C_Check_OkC (dtb__602))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__601)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__601)) mc3) mc4))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1338 "Vuna/Compiler/Elab/Meta.vuna"
let v_mkCtorTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData (Elab_dTypes.v_dtCtorFamily ctor)) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__603) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__603) then (Core_dTerm.C_Term_TMk (g, args)) else (Core_dTerm.C_Term_TCon (g, args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_shiftCtorArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__604, dtb__605) -> (match dtb__604 with
  | { B_dData_dPair.f_Pair_first = dtb__606; B_dData_dPair.f_Pair_second = dtb__607 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((Core_dTerm.v_shift 0) mc0) dtb__606); B_dData_dPair.f_Pair_second = dtb__607 }, ((v_shiftCtorArgs mc0) dtb__605)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1370 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_etaCtorLa = (fun (mc0 : string) (mc1 : int) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__608, dtb__609) -> (match dtb__608 with
  | { B_dData_dPair.f_Pair_first = dtb__610; B_dData_dPair.f_Pair_second = dtb__611 } -> (let binder = (Frontend_dReserved.v_etaBinderName mc1) in (Core_dTerm.C_Term_TLam (binder, dtb__611, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((((v_etaCtorLa mc0) (mc1 + 1)) dtb__609) ((B_dData_dList.v_append mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (binder, (B_dData_dList.v_length dtb__609), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__611 }, B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1383 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropCount = (fun (n : int) xs -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__612, dtb__613) -> ((v_dropCount (n - 1)) dtb__613)
  | _ -> failwith "DT: impossible branch"
)))

# 1353 "Vuna/Compiler/Elab/Meta.vuna"
let v_etaCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rest = ((v_dropCount (B_dData_dList.v_length args)) (Elab_dTypes.v_dtCtorTelescope ctor)) in (let k = (B_dData_dList.v_length rest) in ((((v_etaCtorLa (Elab_dTypes.v_dtCtorName ctor)) 0) rest) ((v_shiftCtorArgs k) args)))))

# 1290 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermOf = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__614) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__614)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__614)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__614)) = 0) then (Core_dTerm.C_Term_TCon (mc1, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__614) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1298 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> ((v_ctorRefTermOf ((v_dtCtorLookupEc ec) name)) name))

# 97 "Vuna/Compiler/Elab/Meta.vuna"
let v_inferCtorRef = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (name : string) (tyTerm : Core_dTerm.t_Term) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__615) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__615)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__615)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } })) else (let ctorTy = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm) in (if ((v_hasNoExplicitPi ec) ctorTy) then (let nd_uscrut7 = (((v_instantiateNullaryCtor ec) ctx) ctorTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_ErrC (dtb__616) -> (Base_dDiag.C_Check_ErrC (dtb__616))
  | Base_dDiag.C_Check_OkC (dtb__617) -> (match dtb__617 with
  | { B_dData_dPair.f_Pair_first = dtb__618; B_dData_dPair.f_Pair_second = dtb__619 } -> (match dtb__619 with
  | { B_dData_dPair.f_Pair_first = dtb__620; B_dData_dPair.f_Pair_second = dtb__621 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_nullaryCtorTerm dtb__615) dtb__620); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__618; B_dData_dPair.f_Pair_second = dtb__621 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctorTy; B_dData_dPair.f_Pair_second = ec } })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> ((v_ctorRefTermOf ((v_dtCtorLookup name) datas)) name))

# 1392 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_foldAppTerms = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__622, dtb__623) -> (match dtb__622 with
  | { B_dData_dPair.f_Pair_first = dtb__624; B_dData_dPair.f_Pair_second = dtb__625 } -> ((v_foldAppTerms (Core_dTerm.C_Term_TApp (mc0, dtb__624, dtb__625))) dtb__623)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1309 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTermEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__626) -> (match ((v_dtCtorLookupEc mc0) dtb__626) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__627) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__627)) then (v_boolCtorTerm dtb__626) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__627))) then ((((v_mkCtorTerm (Elab_dTypes.v_ecDatas mc0)) dtb__627) dtb__626) mc2) else ((v_etaCtorTerm dtb__627) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__626))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1322 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTerm = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__628) -> (match ((v_dtCtorLookup dtb__628) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__629) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__629)) then (v_boolCtorTerm dtb__628) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__629))) then ((((v_mkCtorTerm mc0) dtb__629) dtb__628) mc2) else ((v_etaCtorTerm dtb__629) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__628))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1408 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__630, dtb__631, dtb__632) -> (match dtb__630 with
  | Frontend_dAst.C_Expr_EVar (dtb__633, dtb__634) -> (if (dtb__633 = "Type") then true else false)
  | _ -> false
)
  | Frontend_dAst.C_Expr_EVar (dtb__635, dtb__636) -> (if (dtb__635 = "Type") then true else false)
  | _ -> false
))

# 1403 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasFamParams = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__637, dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> (if (dtb__637 <> "_") then (v_isSortExpr dtb__640) else false)
  | _ -> false
))

# 1414 "Vuna/Compiler/Elab/Meta.vuna"
let v_baseNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 1421 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_explicitPiArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__643, dtb__644, dtb__645, dtb__646, dtb__647) -> (if dtb__644 then (v_explicitPiArity dtb__647) else (1 + (v_explicitPiArity dtb__647)))
  | _ -> 0
))

# 1449 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__648, dtb__649, dtb__650, dtb__651, dtb__652) -> (v_dropPis dtb__652)
  | _ -> mc0
))

# 1453 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyNonVarArg = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__653, dtb__654) -> (match dtb__653 with
  | Core_dTerm.C_Term_TVar (dtb__655, dtb__656, dtb__657) -> (v_anyNonVarArg dtb__654)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1444 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorResultIndexed = (fun (c : Elab_dTypes.t_DtCtor) -> (match (v_resultSpine (v_dropPis (Elab_dTypes.v_dtCtorType c))) with
  | { B_dData_dPair.f_Pair_first = dtb__658; B_dData_dPair.f_Pair_second = dtb__659 } -> (v_anyNonVarArg dtb__659)
  | _ -> failwith "DT: impossible branch"
))

# 1440 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyCtorIndexed = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__660, dtb__661) -> (if (v_ctorResultIndexed dtb__660) then true else (v_anyCtorIndexed dtb__661))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1437 "Vuna/Compiler/Elab/Meta.vuna"
let v_familyIndexed = (fun (d : Elab_dTypes.t_DtData) -> (v_anyCtorIndexed (Elab_dTypes.v_dtDataCtors d)))

# 1428 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyTable = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dBool.v_not (v_familyIndexed d)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (v_explicitPiArity (Elab_dTypes.v_dtCtorType c)) })) (Elab_dTypes.v_dtDataCtors d)) } })) (Elab_dTypes.v_ecDatas ec)))

# 1461 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCatchAllBody = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__662, dtb__663) -> (match dtb__662 with
  | { B_dData_dPair.f_Pair_first = dtb__664; B_dData_dPair.f_Pair_second = dtb__665 } -> (match dtb__664 with
  | Frontend_dAst.C_Pat_PCon (dtb__666, dtb__667, dtb__668) -> (v_findCatchAllBody dtb__663)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb__665))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadName = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__669; f_DataHead_dataHeadKind = dtb__670; f_DataHead_dataHeadArity = dtb__671 } -> dtb__669
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadKind = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__672; f_DataHead_dataHeadKind = dtb__673; f_DataHead_dataHeadArity = dtb__674 } -> dtb__673
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadArity = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__675; f_DataHead_dataHeadKind = dtb__676; f_DataHead_dataHeadArity = dtb__677 } -> dtb__677
  | _ -> failwith "DT: impossible branch"
))
