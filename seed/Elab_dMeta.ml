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
let[@tail_mod_cons] rec v_zipTeleRigs = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
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
  | Core_dTerm.C_Term_TRecord (dtb__44, dtb__45) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__45)
  | Core_dTerm.C_Term_TMk (dtb__46, dtb__47) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__47)
  | Core_dTerm.C_Term_TCon (dtb__48, dtb__49) -> ((B_dData_dList.v_concatMap (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__49)
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
let v_relevantMetas = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (v_termMetasRuntime (B_dData_dPair.v_secondOf (Obj.magic d))))) (Elab_dTypes.v_ecDefs ec))) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_concatMap v_termMetasAll) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorType) (Elab_dTypes.v_dtDataCtors d))))) (Elab_dTypes.v_ecDatas ec))))

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
let[@tail_mod_cons] rec v_dataNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
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
let[@tail_mod_cons] rec v_splitKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
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

# 579 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkTerm = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (t : Core_dTerm.t_Term) -> (let _u = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.zonk") 1) in ((((Core_dEval.v_substSolvedMetasAtTblFuel v_zonkFuelMax) (Elab_dTypes.v_ecSolTbl ec)) depth) t)))

# 593 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVar = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.v_hasNegativeVar t))

# 596 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarArgs = (fun (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarArgs args))

# 599 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarAlts = (fun (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarAlts alts))

# 607 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_prependFamParams = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Frontend_dAst.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (match dtb__286 with
  | Core_dTerm.C_Term_TType (dtb__288) -> (Frontend_dAst.C_Expr_EPi (dtb__283, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef mc2))), (((v_prependFamParams dtb__287) mc1) mc2), (Frontend_dAst.v_detachedNodeRef mc2)))
  | _ -> mc1
)
  | _ -> mc1
))

# 622 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (v_dropParams dtb__293)
  | _ -> mc0
))

# 626 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_ctorGlobals = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__294); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtCtorType dtb__294) }, (v_ctorGlobals dtb__295)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupDataHead = (fun (mc0 : string) (mc1 : t_DataHead B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (if ((dtb__296).f_DataHead_dataHeadName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__296).f_DataHead_dataHeadKind; B_dData_dPair.f_Pair_second = (dtb__296).f_DataHead_dataHeadArity })) else ((v_lookupDataHead mc0) dtb__297))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictTypeName = (fun (cname : string) -> ("Dict_" ^ cname))

# 655 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictCtorName = (fun (cname : string) -> ("MkDict_" ^ cname))

# 659 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectTraitDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (match dtb__298 with
  | Frontend_dAst.C_Decl_DTrait (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> ((v_collectTraitDecls dtb__299) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__298; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__304) }, mc1)))
  | _ -> ((v_collectTraitDecls dtb__299) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectInstDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (match dtb__305 with
  | Frontend_dAst.C_Decl_DInstance (dtb__307, dtb__308, dtb__309, dtb__310) -> ((v_collectInstDecls dtb__306) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__310) }, mc1)))
  | _ -> ((v_collectInstDecls dtb__306) mc1)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Elab/Meta.vuna"
let v_paramNameOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> dtb__311
  | B_dData_dList.C_List_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_methodArgTermsGo = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__313, dtb__314) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (("x" ^ (string_of_int mc2)), (mc1 + ((mc3 - 1) - mc2)), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__313 }, ((((v_methodArgTermsGo dtb__314) mc1) (mc2 + 1)) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Elab/Meta.vuna"
let v_methodArgTerms = (fun (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) -> ((((v_methodArgTermsGo rigs) nFields) 0) (B_dData_dList.v_length rigs)))

# 689 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_methodArgLams = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__315, dtb__316) -> (Core_dTerm.C_Term_TLam (("x" ^ (string_of_int mc1)), dtb__315, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_methodArgLams dtb__316) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldVarName = (fun (i : int) -> ("_f" ^ (string_of_int i)))

# 706 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_fieldBinderGoGo = (fun (remaining : int) (n : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_fieldBinderGoGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldVarName (n - remaining)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, acc)))))

# 703 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderGo = (fun (n : int) (i : int) (acc : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fieldBinderGoGo (n - i)) n) acc))

# 700 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderNames = (fun (n : int) -> (((v_fieldBinderGo n) 0) B_dData_dList.C_List_Nil))

# 715 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findClassByMethod = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__317, dtb__318) -> (if ((B_dData_dList.v_memName mc0) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (dtb__317).Elab_dTypes.f_DtClass_dtClassMethods)) then (B_dData_dMaybe.C_Maybe_Just (dtb__317)) else ((v_findClassByMethod mc0) dtb__318))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 736 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_allTeleArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (match (B_dData_dPair.v_firstOf dtb__319) with
  | Core_dTerm.C_Term_TVar (dtb__321, dtb__322, dtb__323) -> (if (if (dtb__322 >= 0) then (dtb__322 < mc0) else false) then ((v_allTeleArgs mc0) dtb__320) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInstHead = (fun (n : int) (head : Core_dTerm.t_Term) -> (if (n <= 0) then false else (let nd_uscrut2 = (Elab_dTypes.v_flattenTaggedApp head) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (match dtb__324 with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> (if (v_nonEmpty dtb__326) then ((v_allTeleArgs n) dtb__326) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 743 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInst = (fun (mc0 : Elab_dTypes.t_DtInst) -> (match mc0 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__327; Elab_dTypes.f_DtInst_dtInstSym = dtb__328; Elab_dTypes.f_DtInst_dtInstKey = dtb__329; Elab_dTypes.f_DtInst_dtInstTele = dtb__330; Elab_dTypes.f_DtInst_dtInstCtx = dtb__331; Elab_dTypes.f_DtInst_dtInstHead = dtb__332; Elab_dTypes.f_DtInst_dtInstSpan = dtb__333 } -> ((v_isBlanketInstHead (B_dData_dList.v_length dtb__330)) dtb__332)
  | _ -> failwith "DT: impossible branch"
))

# 749 "Vuna/Compiler/Elab/Meta.vuna"
let v_substClassParam = (fun (pname : string) (arg : Core_dTerm.t_Term) (ty : Core_dTerm.t_Term) -> (((Core_dTerm.v_substVarAt 0) arg) ty))

# 753 "Vuna/Compiler/Elab/Meta.vuna"
let v_litEqName = (fun (tyName : string) -> (if (tyName = Base_dIntrinsics.v_strTypeName) then "bi_eq_str" else "bi_eq_int"))

# 795 "Vuna/Compiler/Elab/Meta.vuna"
let v_isStringImplicitDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__334) -> (match dtb__334 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__335, dtb__336) -> (match dtb__336 with
  | B_dData_dList.C_List_Nil -> (dtb__335 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 801 "Vuna/Compiler/Elab/Meta.vuna"
let v_implicitBinderRig = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isStringImplicitDomain ec) dom) then Core_dTerm.C_Rig_RigOmega else Core_dTerm.C_Rig_Rig0))

# 864 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxItemAt = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__337, dtb__338) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__337)) else ((v_ctxItemAt (mc0 - 1)) dtb__338))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 813 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderType = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let idx = ((d - lvl) - 1) in (if (lvl < 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (idx < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__339) -> (B_dData_dMaybe.C_Maybe_Just ((((Elab_dTypes.v_varTypeValue ctx) idx) (B_dData_dPair.v_secondOf dtb__339))))
  | _ -> failwith "DT: impossible branch"
))))))

# 890 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfQty = (fun (implicit : bool) (isTypeDom : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (if (if implicit then true else isTypeDom) then Core_dTerm.C_Rig_Rig0 else (let nd_uscrut3 = qty in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__340) -> (match dtb__340 with
  | Frontend_dAst.C_Qty_Q1 -> Core_dTerm.C_Rig_Rig1
  | Frontend_dAst.C_Qty_Q0 -> Core_dTerm.C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
))))

# 913 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeHeadOpaqueEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (if (B_dData_dBool.v_not ((v_isDataFamilyName ec) name)) then (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name)) else false))

# 929 "Vuna/Compiler/Elab/Meta.vuna"
let v_isUniverseValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VType (dtb__341) -> true
  | _ -> false
))

# 920 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isFamilyKindFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> (if (B_dData_dBool.v_not (v_isUniverseValue dtb__345)) then true else ((v_isFamilyKindFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__346) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__342, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 917 "Vuna/Compiler/Elab/Meta.vuna"
let v_isFamilyKindValue = (fun (v : Core_dTerm.t_Value) -> ((v_isFamilyKindFuel 64) v))

# 951 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueHasImplicitPiFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VPi (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> (if dtb__348 then true else ((v_valueHasImplicitPiFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__351) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__347, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 948 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueHasImplicitPi = (fun (v : Core_dTerm.t_Value) -> ((v_valueHasImplicitPiFuel 64) v))

# 992 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeishValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VMeta (dtb__352, dtb__353) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__354) -> true
  | Core_dTerm.C_Value_VPi (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> true
  | Core_dTerm.C_Value_VType (dtb__360) -> true
  | _ -> false
))

# 999 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__361, dtb__362) -> (if (dtb__361 = mc0) then true else ((v_memLevel mc0) dtb__362))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 960 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueOpaqueGo = (fun (fuel : int) (forceV : (Core_dTerm.t_Value) -> Core_dTerm.t_Value) (metaOpaque : bool) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (match (forceV v) with
  | Core_dTerm.C_Value_VType (dtb__363) -> false
  | Core_dTerm.C_Value_VMeta (dtb__364, dtb__365) -> metaOpaque
  | Core_dTerm.C_Value_VNeutral (dtb__366) -> (match dtb__366 with
  | Core_dTerm.C_Neutral_NVar (dtb__367, dtb__368, dtb__369) -> (if (dtb__368 < depth) then (outerNVar dtb__368) else (if ((v_memLevel dtb__368) famLevels) then true else false))
  | Core_dTerm.C_Neutral_NGlobal (dtb__370, dtb__371) -> (if (headOpaque dtb__370) then true else ((((((((v_valueOpaqueTypeSpine fuel) forceV) metaOpaque) outerNVar) headOpaque) depth) famLevels) dtb__371))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> (let fam2 = (if (v_isFamilyKindValue (forceV dtb__375)) then (B_dData_dList.C_List__x58__x58_ (depth, famLevels)) else famLevels) in (if ((((((((v_valueOpaqueGo (fuel - 1)) forceV) metaOpaque) outerNVar) headOpaque) depth) famLevels) dtb__375) then true else ((((((((v_valueOpaqueGo (fuel - 1)) forceV) metaOpaque) outerNVar) headOpaque) (depth + 1)) fam2) ((Core_dEval.v_applyClosure dtb__376) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__372, depth, B_dData_dList.C_List_Nil))))))))
  | _ -> true
)))
# 981 "Vuna/Compiler/Elab/Meta.vuna"
and v_valueOpaqueTypeSpine = (fun (fuel : int) (forceV : (Core_dTerm.t_Value) -> Core_dTerm.t_Value) (metaOpaque : bool) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match sp with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__377, dtb__378) -> (if (if (v_isTypeishValue dtb__377) then ((((((((v_valueOpaqueGo (fuel - 1)) forceV) metaOpaque) outerNVar) headOpaque) depth) famLevels) dtb__377) else false) then true else ((((((((v_valueOpaqueTypeSpine (fuel - 1)) forceV) metaOpaque) outerNVar) headOpaque) depth) famLevels) dtb__378))
  | _ -> failwith "DT: impossible branch"
)))

# 942 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueOpaqueScoped = (fun (forceV : (Core_dTerm.t_Value) -> Core_dTerm.t_Value) (metaOpaque : bool) (outerNVar : (int) -> bool) (headOpaque : (string) -> bool) (depth : int) (famLevels : int B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((((((v_valueOpaqueGo 128) forceV) metaOpaque) outerNVar) headOpaque) depth) famLevels) v))

# 1004 "Vuna/Compiler/Elab/Meta.vuna"
let v_nvarOpaqueCtx = (fun (ctx : Elab_dTypes.t_Ctx) (lvl : int) -> (let idx = (((Elab_dTypes.v_ctxDepth ctx) - 1) - lvl) in (if (idx < 0) then false else (let nd_uscrut3 = ((v_ctxItemAt idx) (ctx).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (match dtb__379 with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (v_isFamilyKindValue (((Elab_dTypes.v_varTypeValue ctx) idx) dtb__381))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1017 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkValueOnly = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1020 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyIn = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (((((((v_valueOpaqueScoped (v_zonkValueOnly ec)) true) (v_nvarOpaqueCtx ctx)) (v_isTypeHeadOpaqueEc ec)) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) v))

# 1034 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyDecl = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (((((((v_valueOpaqueScoped (fun (x : Core_dTerm.t_Value) -> x)) false) (v_nvarOpaqueCtx ctx)) (v_isTypeHeadOpaqueEc ec)) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) ((v_zonkValueOnly ec) v)))

# 1047 "Vuna/Compiler/Elab/Meta.vuna"
let v_opaqueRuntimeBinder = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (rig : Core_dTerm.t_Rig) (dom : Core_dTerm.t_Value) -> (if (Core_dTerm.v_rigIsErased rig) then false else (((v_isOpaqueRuntimeTyIn ec) ctx) dom)))

# 1051 "Vuna/Compiler/Elab/Meta.vuna"
let v_castErased = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_primEraseName)), t, Core_dTerm.C_Rig_Rig1)))

# 1101 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueVar = (fun (depth : int) (idxs : int B_dData_dList.t_List) (name : string) (i : int) -> (if (i < depth) then (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else (if ((v_memLevel (i - depth)) idxs) then (v_castErased (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) else (Core_dTerm.C_Term_TVar (name, i, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))))

# 1060 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_wrapOpaqueUsesFuel = (fun (fuel : int) (depth : int) (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TVar (dtb__382, dtb__383, dtb__384) -> ((((v_wrapOpaqueVar depth) idxs) dtb__382) dtb__383)
  | Core_dTerm.C_Term_TGlobal (dtb__385) -> (Core_dTerm.C_Term_TGlobal (dtb__385))
  | Core_dTerm.C_Term_TMeta (dtb__386) -> (Core_dTerm.C_Term_TMeta (dtb__386))
  | Core_dTerm.C_Term_TType (dtb__387) -> (Core_dTerm.C_Term_TType (dtb__387))
  | Core_dTerm.C_Term_TInt (dtb__388) -> (Core_dTerm.C_Term_TInt (dtb__388))
  | Core_dTerm.C_Term_TStr (dtb__389) -> (Core_dTerm.C_Term_TStr (dtb__389))
  | Core_dTerm.C_Term_TFloat (dtb__390) -> (Core_dTerm.C_Term_TFloat (dtb__390))
  | Core_dTerm.C_Term_TBool (dtb__391) -> (Core_dTerm.C_Term_TBool (dtb__391))
  | Core_dTerm.C_Term_TPi (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> (Core_dTerm.C_Term_TPi (dtb__392, dtb__393, dtb__394, ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__395), ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__396)))
  | Core_dTerm.C_Term_TLam (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> (let slot2 = (let nd_uscrut9 = dtb__399 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__402) -> (match dtb__402 with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (match dtb__404 with
  | { B_dData_dPair.f_Pair_first = dtb__405; B_dData_dPair.f_Pair_second = dtb__406 } -> (let bt2 = (match dtb__405 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__408)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__406 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__407) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__407)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__397, dtb__398, slot2, dtb__400, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + 1)) idxs) dtb__401))))
  | Core_dTerm.C_Term_TApp (dtb__409, dtb__410, dtb__411) -> (Core_dTerm.C_Term_TApp (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__409), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__410), dtb__411))
  | Core_dTerm.C_Term_TCon (dtb__412, dtb__413) -> (Core_dTerm.C_Term_TCon (dtb__412, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__413)))
  | Core_dTerm.C_Term_TMk (dtb__414, dtb__415) -> (Core_dTerm.C_Term_TMk (dtb__414, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__415)))
  | Core_dTerm.C_Term_TRecord (dtb__416, dtb__417) -> (Core_dTerm.C_Term_TRecord (dtb__416, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__417)))
  | Core_dTerm.C_Term_TProj (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (Core_dTerm.C_Term_TProj (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__418), dtb__419, dtb__420, dtb__421, dtb__422))
  | Core_dTerm.C_Term_TRecUpd (dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> (Core_dTerm.C_Term_TRecUpd (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__423), dtb__424, dtb__425, dtb__426, ((((v_wrapOpaqueUsesFuel (fuel - 1)) (depth + (B_dData_dList.v_length dtb__425))) idxs) dtb__427)))
  | Core_dTerm.C_Term_TCase (dtb__428, dtb__429) -> (Core_dTerm.C_Term_TCase (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__428), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_wrapOpaqueAltFuel (fuel - 1)) depth) idxs) alt))) dtb__429)))
  | Core_dTerm.C_Term_TIf (dtb__430, dtb__431, dtb__432) -> (Core_dTerm.C_Term_TIf (((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__430), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__431), ((((v_wrapOpaqueUsesFuel (fuel - 1)) depth) idxs) dtb__432)))
  | _ -> failwith "DT: impossible branch"
)))
# 1110 "Vuna/Compiler/Elab/Meta.vuna"
and v_wrapOpaqueAltFuel = (fun (mc0 : int) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__433; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__434; Core_dTerm.f_CaseAlt_caseAltBody = dtb__435 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__433; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__434; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_wrapOpaqueUsesFuel (mc0 - 1)) (mc1 + (B_dData_dList.v_length dtb__434))) mc2) dtb__435) }
  | _ -> failwith "DT: impossible branch"
))

# 1057 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueUses = (fun (idxs : int B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_wrapOpaqueUsesFuel 512) 0) idxs) t))

# 1135 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataLinearName = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_dtDataLookup g) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (Elab_dTypes.v_dtDataLinear dtb__436)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1141 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorLinearName = (fun (ec : Elab_dTypes.t_Ec) (c : string) -> (match ((v_dtCtorLookupEc ec) c) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> ((v_dataLinearName ec) (Elab_dTypes.v_dtCtorFamily dtb__437))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1118 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearTypeFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__438) -> (match dtb__438 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__439, dtb__440) -> ((v_dataLinearName ec) dtb__439)
  | Core_dTerm.C_Neutral_NVar (dtb__441, dtb__442, dtb__443) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__444, dtb__445) -> ((v_ctorLinearName ec) dtb__444)
  | _ -> false
)))

# 1115 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearType = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (Elab_dTypes.v_ecHasLinear ec) then (((v_isLinearTypeFuel 64) ec) v) else false))

# 1131 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyLinearVals = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__446, dtb__447) -> (if (((v_isLinearTypeFuel mc0) mc1) dtb__446) then true else (((v_anyLinearVals mc0) mc1) dtb__447))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1148 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigForLinearDomain = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (name : string) (rig : Core_dTerm.t_Rig) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then (match rig with
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (Core_dTerm.C_Rig_Rig1))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearValueNeedsLinearBinder (name))) name)
) else (Base_dDiag.C_Check_OkC (rig))))

# 1158 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigCaseField = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (rig : Core_dTerm.t_Rig) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else rig))

# 1162 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfLinearValue = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isLinearType ec) dom) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_RigOmega))

# 1169 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxHasLinearItems = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__448, dtb__449) -> (match dtb__448 with
  | { B_dData_dPair.f_Pair_first = dtb__450; B_dData_dPair.f_Pair_second = dtb__451 } -> (if ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) mc3) dtb__451)) then true else ((((v_ctxHasLinearItems mc0) mc1) dtb__449) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1166 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctxHasLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) -> ((((v_ctxHasLinearItems ec) ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0))

# 1179 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_outerScan = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__452, dtb__453, dtb__454) -> (if (if ((((v_outerScan mc0) mc1) mc2) dtb__452) then true else ((((v_outerScan mc0) mc1) mc2) dtb__453)) then true else ((((v_outerScan mc0) mc1) mc2) dtb__454))
  | Core_dTerm.C_Term_TCase (dtb__455, dtb__456) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__455) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__456))
  | Core_dTerm.C_Term_TRecUpd (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__457) then true else ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__459))) dtb__461))
  | Core_dTerm.C_Term_TRecord (dtb__462, dtb__463) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__463)
  | Core_dTerm.C_Term_TProj (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468) -> ((((v_outerScan mc0) mc1) mc2) dtb__464)
  | Core_dTerm.C_Term_TMk (dtb__469, dtb__470) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__470)
  | Core_dTerm.C_Term_TCon (dtb__471, dtb__472) -> ((((v_outerScanArgs mc0) mc1) mc2) dtb__472)
  | Core_dTerm.C_Term_TApp (dtb__473, dtb__474, dtb__475) -> (if ((((v_outerScan mc0) mc1) mc2) dtb__473) then true else ((((v_outerScan mc0) mc1) mc2) dtb__474))
  | Core_dTerm.C_Term_TLam (dtb__476, dtb__477, dtb__478, dtb__479, dtb__480) -> ((((v_outerScan mc0) mc1) (mc2 + 1)) dtb__480)
  | Core_dTerm.C_Term_TPi (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485) -> false
  | Core_dTerm.C_Term_TVar (dtb__486, dtb__487, dtb__488) -> (if (dtb__487 > mc2) then (let nd_uscrut7 = ((v_ctxItemAt (dtb__487 - mc2)) (mc1).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__489) -> (match dtb__489 with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> ((v_isLinearType mc0) (((Elab_dTypes.v_varTypeValue mc1) (dtb__487 - mc2)) dtb__491))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
))
# 1201 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanArgs = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__492, dtb__493) -> (match dtb__492 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> (if ((((v_outerScan mc0) mc1) mc2) dtb__494) then true else ((((v_outerScanArgs mc0) mc1) mc2) dtb__493))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1206 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanAlts = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__496, dtb__497) -> (match dtb__496 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__498; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__499; Core_dTerm.f_CaseAlt_caseAltBody = dtb__500 } -> (if ((((v_outerScan mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__499))) dtb__500) then true else ((((v_outerScanAlts mc0) mc1) mc2) dtb__497))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1176 "Vuna/Compiler/Elab/Meta.vuna"
let v_termHasOuterLinear = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (t : Core_dTerm.t_Term) -> ((((v_outerScan ec) ctx) 0) t))

# 1214 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLayerValueFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VType (dtb__501) -> true
  | Core_dTerm.C_Value_VPi (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> (if ((v_isTypeLayerValueFuel (fuel - 1)) dtb__505) then ((v_isTypeLayerValueFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__506) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__502, 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 1211 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLayerValue = (fun (v : Core_dTerm.t_Value) -> ((v_isTypeLayerValueFuel 128) v))

# 883 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeDomain = (fun (v : Core_dTerm.t_Value) -> (v_isTypeLayerValue v))

# 886 "Vuna/Compiler/Elab/Meta.vuna"
let v_piBinderRig = (fun (implicit : bool) (dom : Core_dTerm.t_Value) -> ((Core_dTerm.v_rigOfBinder implicit) (v_isTypeDomain dom)))

# 1224 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataHead = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__507) -> (match dtb__507 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__508, dtb__509) -> (match ((v_dtDataLookup dtb__508) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 759 "Vuna/Compiler/Elab/Meta.vuna"
let v_isIndexDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (v_isTypeDomain dom) then true else ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) ((Elab_dTypes.v_forceVal ec) dom))))

# 806 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderIndexDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (lvl : int) -> (match (((v_neutralBinderType ctx) ec) lvl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> ((v_isIndexDomain ec) dtb__511)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 845 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLikeWithCtx = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__512) -> true
  | Core_dTerm.C_Value_VPi (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> ((((v_isTypeLikeWithCtx (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__517) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("ty", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__518) -> (match dtb__518 with
  | Core_dTerm.C_Neutral_NVar (dtb__519, dtb__520, dtb__521) -> (match (((v_neutralBinderType ctx) ec) dtb__520) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__522) -> (v_isTypeDomain dtb__522)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__523, dtb__524) -> ((v_isDataHead (Elab_dTypes.v_ecDatas ec)) v)
  | _ -> false
)
  | Core_dTerm.C_Value_VMeta (dtb__525, dtb__526) -> true
  | _ -> false
)))

# 832 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isKindWithCtxFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__527) -> true
  | Core_dTerm.C_Value_VPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if ((((v_isTypeLikeWithCtx fuel) ctx) ec) dtb__531) then ((((v_isKindWithCtxFuel (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__532) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("kind", 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 829 "Vuna/Compiler/Elab/Meta.vuna"
let v_isKindWithCtx = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_isKindWithCtxFuel 64) ctx) ec) v))

# 774 "Vuna/Compiler/Elab/Meta.vuna"
let v_isImplicitDomain = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isIndexDomain ec) dom) then true else (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (((v_isKindWithCtx ctx) ec) ((Elab_dTypes.v_forceVal ec) dom))
  | Core_dTerm.C_Value_VNeutral (dtb__538) -> (match dtb__538 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__539, dtb__540) -> (match dtb__540 with
  | B_dData_dList.C_List_Nil -> (dtb__539 = Base_dIntrinsics.v_strTypeName)
  | _ -> (match dtb__538 with
  | Core_dTerm.C_Neutral_NVar (dtb__541, dtb__542, dtb__543) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__542)
  | _ -> false
)
)
  | _ -> (match dtb__538 with
  | Core_dTerm.C_Neutral_NVar (dtb__544, dtb__545, dtb__546) -> (((v_neutralBinderIndexDomain ctx) ec) dtb__545)
  | _ -> false
)
)
  | Core_dTerm.C_Value_VMeta (dtb__547, dtb__548) -> true
  | _ -> false
))))

# 49 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_instantiateNullaryCtorFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ec } })) else (let nd_uscrut4 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut4 with
  | Core_dTerm.C_Value_VPi (dtb__549, dtb__550, dtb__551, dtb__552, dtb__553) -> (if dtb__550 then (if (((v_isImplicitDomain ctx) ec) dtb__552) then (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 } -> ((Base_dCommon.v_bind ((((v_instantiateNullaryCtorFuel (fuel - 1)) dtb__555) ctx) ((Core_dEval.v_applyClosure dtb__553) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__554)))) (fun (p : (Core_dTerm.t_Value, (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = dtb__557 } -> (match dtb__557 with
  | { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = dtb__559 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__554, dtb__558)); B_dData_dPair.f_Pair_second = dtb__559 } }))
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

# 1234 "Vuna/Compiler/Elab/Meta.vuna"
let v_freshVarValue = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 1245 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralHeadName = (fun (mc0 : Core_dTerm.t_Neutral) -> (match mc0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__560, dtb__561) -> dtb__560
  | Core_dTerm.C_Neutral_NVar (dtb__562, dtb__563, dtb__564) -> dtb__562
  | _ -> failwith "DT: impossible branch"
))

# 1249 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolGlobal = (fun (name : string) -> (Base_dIntrinsics.v_isBoolCanonical name))

# 1241 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolType = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__565) -> (v_isBoolGlobal (v_neutralHeadName dtb__565))
  | _ -> false
))

# 1254 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortVal = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VType (dtb__566) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtor = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__567) -> (if ((v_isSortVal mc0) dtb__567) then (match (((v_dualFamilyOf mc0) mc3) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__568) -> (Base_dDiag.C_Check_OkC (dtb__568))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__567)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
) else (((((v_resolveOverCtorGo mc0) mc1) ((v_expectedFamilyOf mc0) dtb__567)) mc3) mc4))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver mc0) mc1) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1316 "Vuna/Compiler/Elab/Meta.vuna"
let v_mkCtorTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData (Elab_dTypes.v_dtCtorFamily ctor)) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__569) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__569) then (Core_dTerm.C_Term_TMk (g, args)) else (Core_dTerm.C_Term_TCon (g, args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TCon (g, args))
  | _ -> failwith "DT: impossible branch"
))

# 1339 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_shiftCtorArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__570, dtb__571) -> (match dtb__570 with
  | { B_dData_dPair.f_Pair_first = dtb__572; B_dData_dPair.f_Pair_second = dtb__573 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((Core_dTerm.v_shift 0) mc0) dtb__572); B_dData_dPair.f_Pair_second = dtb__573 }, ((v_shiftCtorArgs mc0) dtb__571)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1348 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_etaCtorLa = (fun (mc0 : string) (mc1 : int) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575) -> (match dtb__574 with
  | { B_dData_dPair.f_Pair_first = dtb__576; B_dData_dPair.f_Pair_second = dtb__577 } -> (let binder = (Frontend_dReserved.v_etaBinderName mc1) in (Core_dTerm.C_Term_TLam (binder, dtb__577, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((((v_etaCtorLa mc0) (mc1 + 1)) dtb__575) ((B_dData_dList.v_append mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (binder, (B_dData_dList.v_length dtb__575), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__577 }, B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropCount = (fun (n : int) xs -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__578, dtb__579) -> ((v_dropCount (n - 1)) dtb__579)
  | _ -> failwith "DT: impossible branch"
)))

# 1331 "Vuna/Compiler/Elab/Meta.vuna"
let v_etaCtorTerm = (fun (ctor : Elab_dTypes.t_DtCtor) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rest = ((v_dropCount (B_dData_dList.v_length args)) (Elab_dTypes.v_dtCtorTelescope ctor)) in (let k = (B_dData_dList.v_length rest) in ((((v_etaCtorLa (Elab_dTypes.v_dtCtorName ctor)) 0) rest) ((v_shiftCtorArgs k) args)))))

# 1268 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermOf = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__580) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__580)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__580)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__580)) = 0) then (Core_dTerm.C_Term_TCon (mc1, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb__580) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1276 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermEc = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> ((v_ctorRefTermOf ((v_dtCtorLookupEc ec) name)) name))

# 97 "Vuna/Compiler/Elab/Meta.vuna"
let v_inferCtorRef = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (name : string) (tyTerm : Core_dTerm.t_Term) -> (match ((v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__581) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__581)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb__581)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } })) else (let ctorTy = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm) in (if ((v_hasNoExplicitPi ec) ctorTy) then (let nd_uscrut7 = (((v_instantiateNullaryCtor ec) ctx) ctorTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_ErrC (dtb__582) -> (Base_dDiag.C_Check_ErrC (dtb__582))
  | Base_dDiag.C_Check_OkC (dtb__583) -> (match dtb__583 with
  | { B_dData_dPair.f_Pair_first = dtb__584; B_dData_dPair.f_Pair_second = dtb__585 } -> (match dtb__585 with
  | { B_dData_dPair.f_Pair_first = dtb__586; B_dData_dPair.f_Pair_second = dtb__587 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_nullaryCtorTerm dtb__581) dtb__586); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__584; B_dData_dPair.f_Pair_second = dtb__587 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ctorTy; B_dData_dPair.f_Pair_second = ec } })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc ec) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
))

# 1279 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTerm = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> ((v_ctorRefTermOf ((v_dtCtorLookup name) datas)) name))

# 1370 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_foldAppTerms = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__588, dtb__589) -> (match dtb__588 with
  | { B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = dtb__591 } -> ((v_foldAppTerms (Core_dTerm.C_Term_TApp (mc0, dtb__590, dtb__591))) dtb__589)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1287 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTermEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__592) -> (match ((v_dtCtorLookupEc mc0) dtb__592) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__593) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__593)) then (v_boolCtorTerm dtb__592) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__593))) then ((((v_mkCtorTerm (Elab_dTypes.v_ecDatas mc0)) dtb__593) dtb__592) mc2) else ((v_etaCtorTerm dtb__593) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__592))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1300 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTerm = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TGlobal (dtb__594) -> (match ((v_dtCtorLookup dtb__594) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__595) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb__595)) then (v_boolCtorTerm dtb__594) else (if ((B_dData_dList.v_length mc2) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb__595))) then ((((v_mkCtorTerm mc0) dtb__595) dtb__594) mc2) else ((v_etaCtorTerm dtb__595) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb__594))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms mc1) mc2)
))

# 1386 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__596, dtb__597, dtb__598) -> (match dtb__596 with
  | Frontend_dAst.C_Expr_EVar (dtb__599, dtb__600) -> (if (dtb__599 = "Type") then true else false)
  | _ -> false
)
  | Frontend_dAst.C_Expr_EVar (dtb__601, dtb__602) -> (if (dtb__601 = "Type") then true else false)
  | _ -> false
))

# 1381 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasFamParams = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608) -> (if (dtb__603 <> "_") then (v_isSortExpr dtb__606) else false)
  | _ -> false
))

# 1392 "Vuna/Compiler/Elab/Meta.vuna"
let v_baseNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 1399 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_explicitPiArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__609, dtb__610, dtb__611, dtb__612, dtb__613) -> (if dtb__610 then (v_explicitPiArity dtb__613) else (1 + (v_explicitPiArity dtb__613)))
  | _ -> 0
))

# 1427 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__614, dtb__615, dtb__616, dtb__617, dtb__618) -> (v_dropPis dtb__618)
  | _ -> mc0
))

# 1431 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyNonVarArg = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__619, dtb__620) -> (match dtb__619 with
  | Core_dTerm.C_Term_TVar (dtb__621, dtb__622, dtb__623) -> (v_anyNonVarArg dtb__620)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1422 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorResultIndexed = (fun (c : Elab_dTypes.t_DtCtor) -> (match (v_resultSpine (v_dropPis (Elab_dTypes.v_dtCtorType c))) with
  | { B_dData_dPair.f_Pair_first = dtb__624; B_dData_dPair.f_Pair_second = dtb__625 } -> (v_anyNonVarArg dtb__625)
  | _ -> failwith "DT: impossible branch"
))

# 1418 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyCtorIndexed = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__626, dtb__627) -> (if (v_ctorResultIndexed dtb__626) then true else (v_anyCtorIndexed dtb__627))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1415 "Vuna/Compiler/Elab/Meta.vuna"
let v_familyIndexed = (fun (d : Elab_dTypes.t_DtData) -> (v_anyCtorIndexed (Elab_dTypes.v_dtDataCtors d)))

# 1406 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyTable = (fun (ec : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dBool.v_not (v_familyIndexed d)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (v_explicitPiArity (Elab_dTypes.v_dtCtorType c)) })) (Elab_dTypes.v_dtDataCtors d)) } })) (Elab_dTypes.v_ecDatas ec)))

# 1439 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCatchAllBody = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__628, dtb__629) -> (match dtb__628 with
  | { B_dData_dPair.f_Pair_first = dtb__630; B_dData_dPair.f_Pair_second = dtb__631 } -> (match dtb__630 with
  | Frontend_dAst.C_Pat_PCon (dtb__632, dtb__633, dtb__634) -> (v_findCatchAllBody dtb__629)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb__631))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadName = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__635; f_DataHead_dataHeadKind = dtb__636; f_DataHead_dataHeadArity = dtb__637 } -> dtb__635
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadKind = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__638; f_DataHead_dataHeadKind = dtb__639; f_DataHead_dataHeadArity = dtb__640 } -> dtb__639
  | _ -> failwith "DT: impossible branch"
))

# 633 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadArity = (fun (p : t_DataHead) -> (match p with
  | { f_DataHead_dataHeadName = dtb__641; f_DataHead_dataHeadKind = dtb__642; f_DataHead_dataHeadArity = dtb__643 } -> dtb__643
  | _ -> failwith "DT: impossible branch"
))
