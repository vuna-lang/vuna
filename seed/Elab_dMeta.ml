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
let rec v_collectSigsInto = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | Frontend_dRast.C_Decl_DSig (dtb__134, dtb__135, dtb__136, dtb__137) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__134) dtb__135) dtb__136) dtb__137) dtb__133)
  | Frontend_dRast.C_Decl_DAxiom (dtb__138, dtb__139, dtb__140) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__138) B_dData_dList.C_List_Nil) dtb__139) dtb__140) dtb__133)
  | Frontend_dRast.C_Decl_DExtern (dtb__141, dtb__142, dtb__143, dtb__144) -> ((((((((((v_collectSigOne mc0) mc1) mc2) mc3) mc4) dtb__141) B_dData_dList.C_List_Nil) dtb__143) dtb__144) dtb__133)
  | Frontend_dRast.C_Decl_DFun (dtb__145, dtb__146, dtb__147, dtb__148) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dRast.C_Decl_DData (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dRast.C_Decl_DRecord (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dRast.C_Decl_DTrait (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | Frontend_dRast.C_Decl_DInstance (dtb__171, dtb__172, dtb__173, dtb__174) -> ((((((v_collectSigsInto mc0) mc1) mc2) mc3) mc4) dtb__133)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 290 "Vuna/Compiler/Elab/Meta.vuna"
and v_collectSigOne = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (seen : (string, bool) B_dContainer_dHashMap.t_HashMap) (acc : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (ctx : Frontend_dRast.t_Expr B_dData_dList.t_List) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (rest : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName name) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (name))) name) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) seen) then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_DuplicateSignature (name))) name) else ((((((v_collectSigsInto banned) preludeBanned) paramKinds) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) true) seen)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctx; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((((((Elab_dSig.v_quantifyTopSigCtxCachedKinds (Elab_dSig.v_modulePrefixOf name)) banned) preludeBanned) paramKinds) ctx) ty) sp); B_dData_dPair.f_Pair_second = sp } } }, acc))) rest))))

# 257 "Vuna/Compiler/Elab/Meta.vuna"
let v_collectSigs = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let defined = (Elab_dSig.v_definedNames decls) in (let banned = (Elab_dSig.v_qualifiedBannedTbl defined) in (let preludeBanned = (Elab_dSig.v_topQuantBanned B_dData_dList.C_List_Nil) in ((((((v_collectSigsInto banned) preludeBanned) (Elab_dSig.v_dataParamKindTbl decls)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) decls)))))

# 307 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectDataDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | Frontend_dRast.C_Decl_DData (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_collectDataDecls dtb__176) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__185 }, mc1)))
  | Frontend_dRast.C_Decl_DRecord (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> ((v_collectDataDecls dtb__176) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__193 }, mc1)))
  | _ -> ((v_collectDataDecls dtb__176) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dataNamesOf = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__194 with
  | Frontend_dRast.C_Decl_DData (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (B_dData_dList.C_List__x58__x58_ (dtb__196, (v_dataNamesOf dtb__195)))
  | Frontend_dRast.C_Decl_DRecord (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212) -> (B_dData_dList.C_List__x58__x58_ (dtb__205, (v_dataNamesOf dtb__195)))
  | _ -> (v_dataNamesOf dtb__195)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Elab/Meta.vuna"
let v_nonEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindDomainWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (if (v_kindDomainWellFormed dtb__218) then (v_kindDomainWellFormed dtb__219) else false)
  | Core_dTerm.C_Term_TType (dtb__220) -> ((Core_dTerm.v_levelToInt dtb__220) >= 0)
  | _ -> true
))

# 338 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindWellFormed = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__221) -> ((Core_dTerm.v_levelToInt dtb__221) >= 0)
  | Core_dTerm.C_Term_TPi (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (if (v_kindDomainWellFormed dtb__225) then (v_kindWellFormed dtb__226) else false)
  | _ -> false
))

# 351 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_splitKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__229 }, (v_splitKind dtb__231)))
  | _ -> B_dData_dList.C_List_Nil
))

# 355 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtDataLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (if ((Elab_dTypes.v_dtDataName dtb__232) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__232)) else ((v_dtDataLookup mc0) dtb__233))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCtorIn = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if ((Elab_dTypes.v_dtCtorName dtb__234) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__234)) else ((v_findCtorIn mc0) dtb__235))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtCtorLookup = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (match ((v_findCtorIn mc0) (Elab_dTypes.v_dtDataCtors dtb__236)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (B_dData_dMaybe.C_Maybe_Just (dtb__238))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_dtCtorLookup mc0) dtb__237)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Meta.vuna"
let v_dtCtorLookupEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ec).Elab_dTypes.f_Ec_ecCtorTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (B_dData_dMaybe.C_Maybe_Just (dtb__239))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Elab_dTypes.v_ecCtorIndexComplete ec) then B_dData_dMaybe.C_Maybe_Nothing else ((v_dtCtorLookup name) (Elab_dTypes.v_ecDatas ec)))
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataFamilyName = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLevelGlobal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (v_kindWellFormed dtb__241)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeName = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (if (((v_isTypeLevelGlobal globals) ec) name) then true else ((v_isDataFamilyName ec) name)))

# 411 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataShortNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 415 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeNameOfDualCtor = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if ((Base_dSource.v_prefixOfName name) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let fam = (Base_dSource.v_prefixOfName name) in (if ((v_dataShortNameOf fam) = (Base_dSource.v_lastSeg name)) then (match ((v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (B_dData_dMaybe.C_Maybe_Just (fam))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))))

# 428 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyNameOf = (fun (ec : Elab_dTypes.t_Ec) (target : string) -> (match ((v_dtCtorLookupEc ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__243)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_expectedFamilyOfFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> (((v_expectedFamilyOfFuel (fuel - 1)) ec) ((Core_dEval.v_applyClosure dtb__248) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_over", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__249) -> (match dtb__249 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__250, dtb__251) -> (B_dData_dMaybe.C_Maybe_Just (dtb__250))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 435 "Vuna/Compiler/Elab/Meta.vuna"
let v_expectedFamilyOf = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_expectedFamilyOfFuel 64) ec) v))

# 450 "Vuna/Compiler/Elab/Meta.vuna"
let v_overCandidatesText = (fun (targets : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map Frontend_dRast.v_ctorDisplayName) targets)))

# 454 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dualFamilyOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match ((v_dtCtorLookupEc mc0) dtb__252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (if ((v_dataShortNameOf (Elab_dTypes.v_dtCtorFamily dtb__254)) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb__254))) else (((v_dualFamilyOf mc0) mc1) dtb__253))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dualFamilyOf mc0) mc1) dtb__253)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyIs = (fun (ec : Elab_dTypes.t_Ec) (target : string) (fam : string) -> (match ((v_ctorFamilyNameOf ec) target) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (dtb__255 = fam)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Elab/Meta.vuna"
let v_candidatesInFamily = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__256) -> ((B_dData_dList.v_filter (fun (t : string) -> (((v_ctorFamilyIs mc0) t) dtb__256))) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Meta.vuna"
let v_defaultOrOver = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__258 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__257))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (mc2, (v_overCandidatesText mc3)))) mc2) (v_overCandidatesText mc3))
))

# 489 "Vuna/Compiler/Elab/Meta.vuna"
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

# 514 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeHeadLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__262)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_isTypeLevelGlobal globals) ec) name) then (((v_globalsLookup name) globals) ec) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (((v_typeHeadLookup globals) ec) name))

# 531 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueLookup = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VECtor (dtb__263))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_globalsLookup name) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VEDef (dtb__264))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_teleOf = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__265, (B_dData_dList.v_length mc1), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__267 }, ((v_teleOf dtb__269) (B_dData_dList.C_List__x58__x58_ (v, mc1))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 542 "Vuna/Compiler/Elab/Meta.vuna"
let v_teleOfType = (fun (ty : Core_dTerm.t_Term) -> ((v_teleOf ty) B_dData_dList.C_List_Nil))

# 553 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_spineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__270) -> { B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__271, dtb__272) -> { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__272) }
  | Core_dTerm.C_Term_TApp (dtb__273, dtb__274, dtb__275) -> (match (v_spineOfType dtb__273) with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__277) (B_dData_dList.C_List__x58__x58_ (dtb__274, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 561 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_resultSpine = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (v_resultSpine dtb__282)
  | _ -> (v_spineOfType mc0)
))

# 586 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkFuelMax = 1000000

# 640 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVar = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.v_hasNegativeVar t))

# 589 "Vuna/Compiler/Elab/Meta.vuna"
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
# 629 "Vuna/Compiler/Elab/Meta.vuna"
and v_zonkAltFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (alt0 : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt0 else (match alt0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = dtb__316 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_zonkTermFuel (fuel - 1)) ec) (depth + (B_dData_dList.v_length dtb__315))) dtb__316) }
  | _ -> failwith "DT: impossible branch"
)))

# 578 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkTerm = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> (let _u = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.zonk") 1) in ((((v_zonkTermFuel v_zonkFuelMax) ec) depth) t)))

# 643 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarArgs = (fun (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarArgs args))

# 646 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarAlts = (fun (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarAlts alts))

# 654 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_prependFamParams = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Frontend_dRast.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (match dtb__320 with
  | Core_dTerm.C_Term_TType (dtb__322) -> (Frontend_dRast.C_Expr_EPi (dtb__317, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), mc2)), (((v_prependFamParams dtb__321) mc1) mc2), mc2))
  | _ -> mc1
)
  | _ -> mc1
))

# 663 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (v_dropParams dtb__327)
  | _ -> mc0
))

# 667 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctorGlobals = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__328); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtCtorType dtb__328) }, (v_ctorGlobals dtb__329)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 677 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupDataHead = (fun (mc0 : string) (mc1 : t_DataHead B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__330, dtb__331) -> (if ((dtb__330).f_DataHead_dataHeadName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__330).f_DataHead_dataHeadKind; B_dData_dPair.f_Pair_second = (dtb__330).f_DataHead_dataHeadArity })) else ((v_lookupDataHead mc0) dtb__331))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictTypeName = (fun (cname : string) -> ("Dict_" ^ cname))

# 696 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictCtorName = (fun (cname : string) -> ("MkDict_" ^ cname))

# 700 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectTraitDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__332, dtb__333) -> (match dtb__332 with
  | Frontend_dRast.C_Decl_DTrait (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> ((v_collectTraitDecls dtb__333) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = dtb__338 }, mc1)))
  | _ -> ((v_collectTraitDecls dtb__333) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 707 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectInstDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (match dtb__339 with
  | Frontend_dRast.C_Decl_DInstance (dtb__341, dtb__342, dtb__343, dtb__344) -> ((v_collectInstDecls dtb__340) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = dtb__344 }, mc1)))
  | _ -> ((v_collectInstDecls dtb__340) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Elab/Meta.vuna"
let v_paramNameOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__345, dtb__346) -> dtb__345
  | B_dData_dList.C_List_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgTermsGo = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__347 }, ((((v_methodArgTermsGo dtb__348) mc1) (mc2 + 1)) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Elab/Meta.vuna"
let v_methodArgTerms = (fun (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) -> ((((v_methodArgTermsGo rigs) nFields) 0) (B_dData_dList.v_length rigs)))

# 730 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_methodArgLams = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (Core_dTerm.C_Term_TLam (("x" ^ (bi_strFromInt mc1)), dtb__349, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_methodArgLams dtb__350) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 738 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldVarName = (fun (i : int) -> ("_f" ^ (bi_strFromInt i)))

# 747 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_fieldBinderGoGo = (fun (remaining : int) (n : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_fieldBinderGoGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldVarName (n - remaining)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, acc)))))

# 744 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderGo = (fun (n : int) (i : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fieldBinderGoGo (n - i)) n) acc))

# 741 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderNames = (fun (n : int) -> (((v_fieldBinderGo n) 0) B_dData_dList.C_List_Nil))

# 756 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findClassByMethod = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (if ((B_dData_dList.v_memName mc0) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (dtb__351).Elab_dTypes.f_DtClass_dtClassMethods)) then (B_dData_dMaybe.C_Maybe_Just (dtb__351)) else ((v_findClassByMethod mc0) dtb__352))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_allTeleArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__353, dtb__354) -> (match (B_dData_dPair.v_firstOf dtb__353) with
  | Core_dTerm.C_Term_TVar (dtb__355, dtb__356, dtb__357) -> (if (if (dtb__356 >= 0) then (dtb__356 < mc0) else false) then ((v_allTeleArgs mc0) dtb__354) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 768 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInstHead = (fun (n : int) (head : Core_dTerm.t_Term) -> (if (n <= 0) then false else (let nd_uscrut2 = (Elab_dTypes.v_flattenTaggedApp head) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (if (v_nonEmpty dtb__360) then ((v_allTeleArgs n) dtb__360) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 784 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInst = (fun (mc0 : Elab_dTypes.t_DtInst) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__361; Elab_dTypes.f_DtInst_dtInstSym = dtb__362; Elab_dTypes.f_DtInst_dtInstKey = dtb__363; Elab_dTypes.f_DtInst_dtInstTele = dtb__364; Elab_dTypes.f_DtInst_dtInstCtx = dtb__365; Elab_dTypes.f_DtInst_dtInstHead = dtb__366; Elab_dTypes.f_DtInst_dtInstSpan = dtb__367 } -> ((v_isBlanketInstHead (B_dData_dList.v_length dtb__364)) dtb__366)
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Elab/Meta.vuna"
let v_substClassParam = (fun (pname : string) (arg : Core_dTerm.t_Term) (ty : Core_dTerm.t_Term) -> (((Core_dTerm.v_substVarAt 0) arg) ty))

# 794 "Vuna/Compiler/Elab/Meta.vuna"
let v_litEqName = (fun (tyName : string) -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

# 838 "Vuna/Compiler/Elab/Meta.vuna"
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

# 846 "Vuna/Compiler/Elab/Meta.vuna"
let v_isHandleDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__371) -> (match dtb__371 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__372, dtb__373) -> (if (if (dtb__372 = "@vuna@Cell") then true else (dtb__372 = "@vuna@MArray")) then true else (dtb__372 = "@vuna@MBuffer"))
  | _ -> false
)
  | _ -> false
)))

# 852 "Vuna/Compiler/Elab/Meta.vuna"
let v_implicitBinderRig = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isStringImplicitDomain ec) dom) then Core_dTerm.C_Rig_RigOmega else (if ((v_isHandleDomain ec) dom) then Core_dTerm.C_Rig_RigOmega else Core_dTerm.C_Rig_Rig0)))

# 918 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxItemAt = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__374)) else ((v_ctxItemAt (mc0 - 1)) dtb__375))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 867 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderType = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let idx = ((d - lvl) - 1) in (if (lvl < 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (idx < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__376) -> (B_dData_dMaybe.C_Maybe_Just ((((Elab_dTypes.v_varTypeValue ctx) idx) (B_dData_dPair.v_secondOf dtb__376))))
  | _ -> failwith "DT: impossible branch"
))))))

# 944 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfQty = (fun (implicit : bool) (isTypeDom : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (if (if implicit then true else isTypeDom) then Core_dTerm.C_Rig_Rig0 else (let nd_uscrut3 = qty in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__377) -> (match dtb__377 with
  | Frontend_dAst.C_Qty_Q1 -> Core_dTerm.C_Rig_Rig1
  | Frontend_dAst.C_Qty_Q0 -> Core_dTerm.C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
))))

# 967 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeHeadOpaqueEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if (B_dData_dBool.v_not ((v_isDataFamilyName ec) name)) then (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name)) else false))

# 983 "Vuna/Compiler/Elab/Meta.vuna"
let v_isUniverseValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VType (dtb__378) -> true
  | _ -> false
))

# 974 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isFamilyKindFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (if (B_dData_dBool.v_not (v_isUniverseValue dtb__382)) then true else ((v_isFamilyKindFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__383) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__379, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 971 "Vuna/Compiler/Elab/Meta.vuna"
let v_isFamilyKindValue = (fun (v : Core_dTerm.t_Value) -> ((v_isFamilyKindFuel 64) v))

# 1000 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueHasImplicitPiFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__384, dtb__385, dtb__386, dtb__387, dtb__388) -> (if dtb__385 then true else ((v_valueHasImplicitPiFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__388) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__384, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 997 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueHasImplicitPi = (fun (v : Core_dTerm.t_Value) -> ((v_valueHasImplicitPiFuel 64) v))

# 1042 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeishValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VMeta (dtb__389, dtb__390) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__391) -> true
  | Core_dTerm.C_Value_VPi (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> true
  | Core_dTerm.C_Value_VType (dtb__397) -> true
  | _ -> false
))

# 1049 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> (if (dtb__398 = mc0) then true else ((v_memLevel mc0) dtb__399))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1009 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueOpaqueGo = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (match v with
  | Core_dTerm.C_Value_VType (dtb__400) -> false
  | Core_dTerm.C_Value_VMeta (dtb__401, dtb__402) -> false
  | Core_dTerm.C_Value_VNeutral (dtb__403) -> (match dtb__403 with
  | Core_dTerm.C_Neutral_NVar (dtb__404, dtb__405, dtb__406) -> (if (dtb__405 < depth) then (outerNVar dtb__405) else (if ((v_memLevel dtb__405) famLevels) then true else false))
  | Core_dTerm.C_Neutral_NGlobal (dtb__407, dtb__408) -> (if (headOpaque dtb__407) then true else ((((((v_valueOpaqueTypeSpine fuel) outerNVar) headOpaque) depth) famLevels) dtb__408))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__409, dtb__410, dtb__411, dtb__412, dtb__413) -> (let fam2 = (if (v_isFamilyKindValue dtb__412) then (B_dData_dList.C_List__x58__x58_ (depth, famLevels)) else famLevels) in (if ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__412) then true else ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) (depth + 1)) fam2) ((Core_dEval.v_applyClosure dtb__413) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__409, depth, B_dData_dList.C_List_Nil))))))))
  | _ -> true
)))
# 1031 "Vuna/Compiler/Elab/Meta.vuna"
and v_valueOpaqueTypeSpine = (fun (fuel : int) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match sp with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> (if (if (v_isTypeishValue dtb__414) then ((((((v_valueOpaqueGo (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__414) else false) then true else ((((((v_valueOpaqueTypeSpine (fuel - 1)) outerNVar) headOpaque) depth) famLevels) dtb__415))
  | _ -> failwith "DT: impossible branch"
)))

# 991 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueOpaqueScoped = (fun (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((((v_valueOpaqueGo 128) outerNVar) headOpaque) depth) famLevels) v))

# 1054 "Vuna/Compiler/Elab/Meta.vuna"
let v_nvarOpaqueCtx = (fun (ctx : Elab_dTypes.t_Ctx) (lvl : int) -> (let idx = (((Elab_dTypes.v_ctxDepth ctx) - 1) - lvl) in (if (idx < 0) then false else (let nd_uscrut3 = ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (v_isFamilyKindValue (((Elab_dTypes.v_varTypeValue ctx) idx) dtb__418))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1067 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkValueOnly = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1070 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyIn = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (((((v_valueOpaqueScoped (v_nvarOpaqueCtx ctx)) (v_isTypeHeadOpaqueEc ec)) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) ((v_zonkValueOnly ec) v)))

# 1079 "Vuna/Compiler/Elab/Meta.vuna"
let v_castErased = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_primEraseName)), t, Core_dTerm.C_Rig_Rig1)))

# 1129 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueVar = (fun (depth : int) (idxs : int B_dData_dList.t_List) (name : string) (i : int) -> (if (i < depth) then (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else (if ((v_memLevel (i - depth)) idxs) then (v_castErased (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) else (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))))

# 1088 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_wrapOpaqueUsesFuel = (fun (fuel : int) (depth : int) (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TVar (dtb__419, dtb__420, dtb__421) -> ((((v_wrapOpaqueVar depth) idxs) dtb__419) dtb__420)
  | Core_dTerm.C_Term_TGlobal (dtb__422) -> (Core_dTerm.C_Term_TGlobal (dtb__422))
  | Core_dTerm.C_Term_TMeta (dtb__423) -> (Core_dTerm.C_Term_TMeta (dtb__423))
  | Core_dTerm.C_Term_TType (dtb__424) -> (Core_dTerm.C_Term_TType (dtb__424))
  | Core_dTerm.C_Term_TInt (dtb__425) -> (Core_dTerm.C_Term_TInt (dtb__425))
  | Core_dTerm.C_Term_TStr (dtb__426) -> (Core_dTerm.C_Term_TStr (dtb__426))
  | Core_dTerm.C_Term_TFloat (dtb__427) -> (Core_dTerm.C_Term_TFloat (dtb__427))
  | Core_dTerm.C_Term_TBool (dtb__428) -> (Core_dTerm.C_Term_TBool (dtb__428))
  | Core_dTerm.C_Term_TPi (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (Core_dTerm.C_Term_TPi (dtb__429, dtb__430, dtb__431, ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__432), ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__433)))
  | Core_dTerm.C_Term_TLam (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438) -> (let slot2 = (let nd_uscrut9 = dtb__436 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> (match dtb__439 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (match dtb__441 with
  | { B_dData_dPair.f_Pair_first = dtb__442; B_dData_dPair.f_Pair_second = dtb__443 } -> (let bt2 = (match dtb__442 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__445) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__445)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__443 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__444) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__444)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__434, dtb__435, slot2, dtb__437, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__438))))
  | Core_dTerm.C_Term_TApp (dtb__446, dtb__447, dtb__448) -> (Core_dTerm.C_Term_TApp (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__446), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__447), dtb__448))
  | Core_dTerm.C_Term_TCon (dtb__449, dtb__450) -> (Core_dTerm.C_Term_TCon (dtb__449, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__450)))
  | Core_dTerm.C_Term_TMk (dtb__451, dtb__452) -> (Core_dTerm.C_Term_TMk (dtb__451, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__452)))
  | Core_dTerm.C_Term_TRecord (dtb__453, dtb__454) -> (Core_dTerm.C_Term_TRecord (dtb__453, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__454)))
  | Core_dTerm.C_Term_TProj (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (Core_dTerm.C_Term_TProj (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__455), dtb__456, dtb__457, dtb__458, dtb__459))
  | Core_dTerm.C_Term_TRecUpd (dtb__460, dtb__461, dtb__462, dtb__463, dtb__464) -> (Core_dTerm.C_Term_TRecUpd (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__460), dtb__461, dtb__462, dtb__463, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + (B_dData_dList.v_length dtb__462))) idxs) dtb__464)))
  | Core_dTerm.C_Term_TCase (dtb__465, dtb__466) -> (Core_dTerm.C_Term_TCase (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__465), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_wrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__466)))
  | Core_dTerm.C_Term_TIf (dtb__467, dtb__468, dtb__469) -> (Core_dTerm.C_Term_TIf (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__467), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__468), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__469)))
  | _ -> failwith "DT: impossible branch"
)))
# 1138 "Vuna/Compiler/Elab/Meta.vuna"
and v_wrapOpaqueAltFuel = (fun (mc0 : int) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__470; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__471; Core_dTerm.f_CaseAlt_caseAltBody = dtb__472 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__470; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__471; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_wrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (B_dData_dList.v_length dtb__471))) mc2) dtb__472) }
  | _ -> failwith "DT: impossible branch"
))

# 1085 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueUses = (fun (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_wrapOpaqueUsesFuel 512) 0) idxs) t))

# 1163 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataLinearName = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_dtDataLookup g) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__473) -> (Elab_dTypes.v_dtDataLinear dtb__473)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1169 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorLinearName = (fun (ec : Elab_dTypes.t_Ec) (c : string) -> (match ((v_dtCtorLookupEc ec) c) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__474) -> ((v_dataLinearName ec) (Elab_dTypes.v_dtCtorFamily dtb__474))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1146 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearTypeFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__475) -> (match dtb__475 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__476, dtb__477) -> ((v_dataLinearName ec) dtb__476)
  | Core_dTerm.C_Neutral_NVar (dtb__478, dtb__479, dtb__480) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__481, dtb__482) -> ((v_ctorLinearName ec) dtb__481)
  | _ -> false
)))

# 1143 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearType = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (Elab_dTypes.v_ecHasLinear ec) then (((v_isLinearTypeFuel 64) ec) v) else false))

# 1159 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyLinearVals = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__483, dtb__484) -> (if (((v_isLinearTypeFuel mc0) mc1) dtb__483) then true else (((v_anyLinearVals mc0) mc1) dtb__484))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1176 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigForLinearDomain = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (name : string) (rig : Core_dTerm.t_Rig) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then (match rig with
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (Core_dTerm.C_Rig_Rig1))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Base_dDiag.C_Check_OkC (rig))))

# 1186 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigCaseField = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (rig : Core_dTerm.t_Rig) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else rig))

# 1190 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfLinearValue = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_RigOmega))

# 1197 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxHasLinearItems = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__485, dtb__486) -> (match dtb__485 with
  | { B_dData_dPair.f_Pair_first = dtb__487; B_dData_dPair.f_Pair_second = dtb__488 } -> (if ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) mc3) dtb__488)) then true else ((((v_ctxHasLinearItems mc0) mc1) dtb__486) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1194 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctxHasLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) -> ((((v_ctxHasLinearItems ec) ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0))

# 1207 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_outerScan = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__489, dtb__490, dtb__491) -> (if (if ((((v_outerScan mc0) mc1) mc2) dtb__489) then true else ((((v_outerScan mc0) mc1) mc2) dtb__490)) then true else ((((v_outerScan mc0) mc1) mc2) dtb__491))
  | Core_dTerm.C_Term_TCase (dtb__492, dtb__493) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__492) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__493))
  | Core_dTerm.C_Term_TRecUpd (dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__494) then true else ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__496))) dtb__498))
  | Core_dTerm.C_Term_TRecord (dtb__499, dtb__500) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__500)
  | Core_dTerm.C_Term_TProj (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505) -> ((((v_outerScan mc0) mc1) mc2) dtb__501)
  | Core_dTerm.C_Term_TMk (dtb__506, dtb__507) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__507)
  | Core_dTerm.C_Term_TCon (dtb__508, dtb__509) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__509)
  | Core_dTerm.C_Term_TApp (dtb__510, dtb__511, dtb__512) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__510) then true else ((((v_outerScan mc0) mc1) mc2) dtb__511))
  | Core_dTerm.C_Term_TLam (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> ((((v_outerScan mc0) mc1) (mc2 + 1)) dtb__517)
  | Core_dTerm.C_Term_TPi (dtb__518, dtb__519, dtb__520, dtb__521, dtb__522) -> false
  | Core_dTerm.C_Term_TVar (dtb__523, dtb__524, dtb__525) -> (if (dtb__524 > mc2) then (let nd_uscrut7 = ((v_ctxItemAt (dtb__524 - mc2)) (mc1).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) (dtb__524 - mc2)) dtb__528))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
))
# 1229 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanArgs = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__529, dtb__530) -> (match dtb__529 with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> (if ((((v_outerScan mc0) mc1) mc2) dtb__531) then true else ((((v_outerScanArgs mc0) mc1) mc2) dtb__530))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1234 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanAlts = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__533, dtb__534) -> (match dtb__533 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__535; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__536; Core_dTerm.f_CaseAlt_caseAltBody = dtb__537 } -> (if ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__536))) dtb__537) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__534))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1204 "Vuna/Compiler/Elab/Meta.vuna"
let v_termHasOuterLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (t : Core_dTerm.t_Term) -> ((((v_outerScan ec) ctx) 0) t))

# 1242 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLayerValueFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VType (dtb__538) -> true
  | Core_dTerm.C_Value_VPi (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> (if ((v_isTypeLayerValueFuel (fuel - 1)) dtb__542) then ((v_isTypeLayerValueFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__543) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__539, 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 1239 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLayerValue = (fun (v : Core_dTerm.t_Value) -> ((v_isTypeLayerValueFuel 128) v))

# 937 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeDomain = (fun (v : Core_dTerm.t_Value) -> (v_isTypeLayerValue v))

# 940 "Vuna/Compiler/Elab/Meta.vuna"
let v_binderRig = (fun (implicit : bool) (dom : Core_dTerm.t_Value) -> ((Core_dTerm.v_rigOfBinder implicit) (v_isTypeDomain dom)))

# 1252 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataHead = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__544) -> (match dtb__544 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__545, dtb__546) -> (match ((v_dtDataLookup dtb__545) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__547) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 800 "Vuna/Compiler/Elab/Meta.vuna"
let v_isIndexDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (v_isTypeDomain dom) then true else ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) ((Elab_dTypes.v_forceVal ec) dom))))

# 860 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderIndexDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (match (((v_neutralBinderType ctx) ec) lvl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> ((v_isIndexDomain ec) dtb__548)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 899 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLikeWithCtx = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__549) -> true
  | Core_dTerm.C_Value_VPi (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> ((((v_isTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__554) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("ty", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__555) -> (match dtb__555 with
  | Core_dTerm.C_Neutral_NVar (dtb__556, dtb__557, dtb__558) -> (match (((v_neutralBinderType ctx) ec) dtb__557) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__559) -> (v_isTypeDomain dtb__559)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__560, dtb__561) -> ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) v)
  | _ -> false
)
  | Core_dTerm.C_Value_VMeta (dtb__562, dtb__563) -> true
  | _ -> false
)))

# 886 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isKindWithCtxFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__564) -> true
  | Core_dTerm.C_Value_VPi (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> (if ((((v_isTypeLikeWithCtx fuel) ctx) ec) dtb__568) then ((((v_isKindWithCtxFuel (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__569) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("kind", 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 883 "Vuna/Compiler/Elab/Meta.vuna"
let v_isKindWithCtx = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_isKindWithCtxFuel 64) ctx) ec) v))

# 815 "Vuna/Compiler/Elab/Meta.vuna"
let v_isImplicitDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isHandleDomain ec) dom) then true else (if ((v_isIndexDomain ec) dom) then true else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__570, dtb__571, dtb__572, dtb__573, dtb__574) -> (((v_isKindWithCtx ctx) ec) ((Elab_dTypes.v_forceVal ec) dom))
  | Core_dTerm.C_Value_VNeutral (dtb__575) -> (match dtb__575 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__576, dtb__577) -> (match dtb__577 with
  | B_dData_dList.C_List_Nil -> (dtb__576 = Base_dIntrinsics.v_strTypeName)
  | _ -> (match dtb__575 with
  | Core_dTerm.C_Neutral_NVar (dtb__578, dtb__579, dtb__580) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__579)
  | _ -> false
)
)
  | _ -> (match dtb__575 with
  | Core_dTerm.C_Neutral_NVar (dtb__581, dtb__582, dtb__583) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__582)
  | _ -> false
)
)
  | Core_dTerm.C_Value_VMeta (dtb__584, dtb__585) -> true
  | _ -> false
)))))

# 49 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_instantiateNullaryCtorFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })) else (let nd_uscrut4 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut4 with
  | Core_dTerm.C_Value_VPi (dtb__586, dtb__587, dtb__588, dtb__589, dtb__590) -> (if dtb__587 then (if (((v_isImplicitDomain ctx) ec) dtb__589) then (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__591; B_dData_dPair.f_Pair_second = dtb__592 } -> ((Base_dCommon.v_bind ((((v_instantiateNullaryCtorFuel (fuel - 1)) dtb__592) ctx) ((Core_dEval.v_applyClosure dtb__590) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__591)))) (fun (p : (Core_dTerm.t_Value, (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__593; B_dData_dPair.f_Pair_second = dtb__594 } -> (match dtb__594 with
  | { B_dData_dPair.f_Pair_first = dtb__595; B_dData_dPair.f_Pair_second = dtb__596 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__593; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__591, dtb__595)); B_dData_dPair.f_Pair_second = dtb__596 } }))
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

# 1262 "Vuna/Compiler/Elab/Meta.vuna"
let v_freshVarValue = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 1273 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralHeadName = (fun (mc0 : Core_dTerm.t_Neutral) -> (match mc0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__597, dtb__598) -> dtb__597
  | Core_dTerm.C_Neutral_NVar (dtb__599, dtb__600, dtb__601) -> dtb__599
  | _ -> failwith "DT: impossible branch"
))

# 1277 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolGlobal = (fun (name : string) -> (Base_dIntrinsics.v_isBoolCanonical name))

# 1269 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolType = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__602) -> (v_isBoolGlobal (v_neutralHeadName dtb__602))
  | _ -> false
))

# 1282 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortVal = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__603) -> true
  | _ -> false
))

# 478 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtor = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (if ((v_isSortVal mc0) dtb__604) then (match (((v_dualFamilyOf mc0) mc3) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__605) -> (Base_dDiag.C_Check_OkC (dtb__605))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__604)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__604)) mc3) mc4))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1347 "Vuna/Compiler/Elab/Meta.vuna"
let v_mkCtorTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData (Elab_dTypes.v_dtCtorFamily ctor)) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__606) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__606) then (Core_dTerm.C_Term_TMk (g, args)) else (Core_dTerm.C_Term_TCon (g, args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1370 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_shiftCtorArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__607, dtb__608) -> (match dtb__607 with
  | { B_dData_dPair.f_Pair_first = dtb__609; B_dData_dPair.f_Pair_second = dtb__610 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((Core_dTerm.v_shift 0) mc0) dtb__609); B_dData_dPair.f_Pair_second = dtb__610 }, ((v_shiftCtorArgs mc0) dtb__608)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1379 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_etaCtorLa = (fun (mc0 : string) (mc1 : int) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__611, dtb__612) -> (match dtb__611 with
  | { B_dData_dPair.f_Pair_first = dtb__613; B_dData_dPair.f_Pair_second = dtb__614 } -> (let binder = (Frontend_dReserved.v_etaBinderName mc1) in (Core_dTerm.C_Term_TLam (binder, dtb__614, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((((v_etaCtorLa mc0) (mc1 + 1)) dtb__612) ((B_dData_dList.v_append mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (binder, (B_dData_dList.v_length dtb__612), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__614 }, B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1392 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropCount = (fun (n : int) xs -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__615, dtb__616) -> ((v_dropCount (n - 1)) dtb__616)
  | _ -> failwith "DT: impossible branch"
)))

# 1362 "Vuna/Compiler/Elab/Meta.vuna"
let v_etaCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rest = ((v_dropCount (B_dData_dList.v_length args)) (Elab_dTypes.v_dtCtorTelescope ctor)) in (let k = (B_dData_dList.v_length rest) in ((((v_etaCtorLa (Elab_dTypes.v_dtCtorName ctor)) 0) rest) ((v_shiftCtorArgs k) args)))))

# 1295 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__617) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__617)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__617)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__617)) = 0) then (Core_dTerm.C_Term_TCon (name, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__617) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Meta.vuna"
let v_inferCtorRef = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (name : string) (tyTerm : Core_dTerm.t_Term) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__618) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__618)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__618)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } })) else (let ctorTy = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm) in (if ((v_hasNoExplicitPi ec) ctorTy) then (let nd_uscrut7 = (((v_instantiateNullaryCtor ec) ctx) ctorTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_ErrC (dtb__619) -> (Base_dDiag.C_Check_ErrC (dtb__619))
  | Base_dDiag.C_Check_OkC (dtb__620) -> (match dtb__620 with
  | { B_dData_dPair.f_Pair_first = dtb__621; B_dData_dPair.f_Pair_second = dtb__622 } -> (match dtb__622 with
  | { B_dData_dPair.f_Pair_first = dtb__623; B_dData_dPair.f_Pair_second = dtb__624 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_nullaryCtorTerm dtb__618) dtb__623); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__621; B_dData_dPair.f_Pair_second = dtb__624 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctorTy; B_dData_dPair.f_Pair_second = ec } })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1304 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> (match ((v_dtCtorLookup name) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__625) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__625)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__625)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__625)) = 0) then (Core_dTerm.C_Term_TCon (name, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__625) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 1401 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_foldAppTerms = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__626, dtb__627) -> (match dtb__626 with
  | { B_dData_dPair.f_Pair_first = dtb__628; B_dData_dPair.f_Pair_second = dtb__629 } -> ((v_foldAppTerms (Core_dTerm.C_Term_TApp (mc0, dtb__628, dtb__629))) dtb__627)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1318 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTermEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__630) -> (match ((v_dtCtorLookupEc mc0) dtb__630) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__631) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__631)) then (v_boolCtorTerm dtb__630) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__631))) then ((((v_mkCtorTerm (Elab_dTypes.v_ecDatas mc0)) dtb__631) dtb__630) mc2) else ((v_etaCtorTerm dtb__631) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__630))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1331 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTerm = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__632) -> (match ((v_dtCtorLookup dtb__632) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__633) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__633)) then (v_boolCtorTerm dtb__632) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__633))) then ((((v_mkCtorTerm mc0) dtb__633) dtb__632) mc2) else ((v_etaCtorTerm dtb__633) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__632))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1417 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__634, dtb__635, dtb__636) -> (match dtb__634 with
  | Frontend_dRast.C_Expr_EVar (dtb__637, dtb__638) -> (match dtb__637 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__639) -> (if (dtb__639 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
)
  | Frontend_dRast.C_Expr_EVar (dtb__640, dtb__641) -> (match dtb__640 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__642) -> (if (dtb__642 = "Type") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1412 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasFamParams = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EPi (dtb__643, dtb__644, dtb__645, dtb__646, dtb__647, dtb__648) -> (if (dtb__643 <> "_") then (v_isSortExpr dtb__646) else false)
  | _ -> false
))

# 1423 "Vuna/Compiler/Elab/Meta.vuna"
let v_baseNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 1430 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_explicitPiArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__649, dtb__650, dtb__651, dtb__652, dtb__653) -> (if dtb__650 then (v_explicitPiArity dtb__653) else (1 + (v_explicitPiArity dtb__653)))
  | _ -> 0
))

# 1458 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__654, dtb__655, dtb__656, dtb__657, dtb__658) -> (v_dropPis dtb__658)
  | _ -> mc0
))

# 1462 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyNonVarArg = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__659, dtb__660) -> (match dtb__659 with
  | Core_dTerm.C_Term_TVar (dtb__661, dtb__662, dtb__663) -> (v_anyNonVarArg dtb__660)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1453 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorResultIndexed = (fun (c : Elab_dTypes.t_DtCtor) -> (match (v_resultSpine (v_dropPis (Elab_dTypes.v_dtCtorType c))) with
  | { B_dData_dPair.f_Pair_first = dtb__664; B_dData_dPair.f_Pair_second = dtb__665 } -> (v_anyNonVarArg dtb__665)
  | _ -> failwith "DT: impossible branch"
))

# 1449 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyCtorIndexed = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__666, dtb__667) -> (if (v_ctorResultIndexed dtb__666) then true else (v_anyCtorIndexed dtb__667))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1446 "Vuna/Compiler/Elab/Meta.vuna"
let v_familyIndexed = (fun (d : Elab_dTypes.t_DtData) -> (v_anyCtorIndexed (Elab_dTypes.v_dtDataCtors d)))

# 1437 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyTable = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dBool.v_not (v_familyIndexed d)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (v_explicitPiArity (Elab_dTypes.v_dtCtorType c)) })) (Elab_dTypes.v_dtDataCtors d)) } })) (Elab_dTypes.v_ecDatas ec)))

# 1470 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCatchAllBody = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__668, dtb__669) -> (match dtb__668 with
  | { B_dData_dPair.f_Pair_first = dtb__670; B_dData_dPair.f_Pair_second = dtb__671 } -> (match dtb__670 with
  | Frontend_dRast.C_Pat_PCon (dtb__672, dtb__673, dtb__674) -> (v_findCatchAllBody dtb__669)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb__671))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
