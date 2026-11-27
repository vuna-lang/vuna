open Vuna_runtime
# 32 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_runtimeIndexGo = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc2 <= 0) then (if dtb__0 then (B_dData_dMaybe.C_Maybe_Just (mc0)) else B_dData_dMaybe.C_Maybe_Nothing) else (((v_runtimeIndexGo (if dtb__0 then (mc0 + 1) else mc0)) dtb__1) (mc2 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Lowering/Erased.vuna"
let v_runtimeIndexAt = (fun (ctx : bool B_dData_dList.t_List) (i : int) -> (((v_runtimeIndexGo 0) ctx) i))

# 40 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_countKept = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if dtb__2 then (1 + (v_countKept dtb__3)) else (v_countKept dtb__3))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Lowering/Erased.vuna"
let v_binderKept = (fun (b : Core_dTerm.t_Binder) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (Core_dTerm.v_binderRigOf b))))

# 57 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_eraseTermIn = (fun (allowErased : bool) (ctx : bool B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match t with
  | Core_dTerm.C_Term_TVar (dtb__4, dtb__5, dtb__6) -> (match ((v_runtimeIndexAt ctx) dtb__5) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb__4, dtb__7, dtb__6))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if allowErased then (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb__4, dtb__5, dtb__6)))) else (Base_dDiag.v_icInternal (String.concat "" ["erased core: erased binder "; dtb__4; " used at runtime"])))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__8) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb__8))))
  | Core_dTerm.C_Term_TInt (dtb__9) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb__9))))
  | Core_dTerm.C_Term_TStr (dtb__10) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb__10))))
  | Core_dTerm.C_Term_TFloat (dtb__11) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb__11))))
  | Core_dTerm.C_Term_TBool (dtb__12) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb__12))))
  | Core_dTerm.C_Term_TIf (dtb__13, dtb__14, dtb__15) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__13)) (fun (c2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__14)) (fun (th2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__15)) (fun (el2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (c2, th2, el2))))))))))
  | Core_dTerm.C_Term_TLam (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) (B_dData_dList.C_List__x58__x58_ ((B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__17)), ctx))) dtb__20)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb__16, dtb__17, dtb__18, dtb__19, body2))))))
  | Core_dTerm.C_Term_TApp (dtb__21, dtb__22, dtb__23) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__21)) (fun (f2 : Core_dTerm.t_Term) -> (if (Core_dTerm.v_rigIsErased dtb__23) then (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, dtb__22, dtb__23)))) else ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__22)) (fun (a2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, a2, dtb__23)))))))))
  | Core_dTerm.C_Term_TCon (dtb__24, dtb__25) -> (((((v_eraseCtorArgs allowErased) ctx) dtb__24) dtb__25) false)
  | Core_dTerm.C_Term_TMk (dtb__26, dtb__27) -> (((((v_eraseCtorArgs allowErased) ctx) dtb__26) dtb__27) true)
  | Core_dTerm.C_Term_TRecord (dtb__28, dtb__29) -> ((Base_dCommon.v_bind (((v_eraseArgs allowErased) ctx) dtb__29)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb__28, args2))))))
  | Core_dTerm.C_Term_TProj (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__30)) (fun (base2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (base2, dtb__31, dtb__32, dtb__33, dtb__34))))))
  | Core_dTerm.C_Term_TRecUpd (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (let ctx2 = ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map (fun (_u : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> false)) dtb__37))) ctx) in ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__35)) (fun (base2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn true) ctx2) dtb__39)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (base2, dtb__36, dtb__37, dtb__38, body2)))))))))
  | Core_dTerm.C_Term_TCase (dtb__40, dtb__41) -> ((Base_dCommon.v_bind (((v_eraseTermIn allowErased) ctx) dtb__40)) (fun (scrut2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseAlts allowErased) ctx) dtb__41)) (fun (alts2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (scrut2, alts2))))))))
  | Core_dTerm.C_Term_TPi (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46))))
  | Core_dTerm.C_Term_TType (dtb__47) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb__47))))
  | Core_dTerm.C_Term_TMeta (dtb__48) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta (dtb__48))))
  | _ -> failwith "DT: impossible branch"
))
# 112 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseAlts = (fun (mc0 : bool) (mc1 : bool B_dData_dList.t_List) (mc2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__51; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__52; Core_dTerm.f_CaseAlt_caseAltBody = dtb__53 } -> (let ctx2 = ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_binderKept) dtb__52))) mc1) in ((Base_dCommon.v_bind (((v_eraseTermIn mc0) ctx2) dtb__53)) (fun (body2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseAlts mc0) mc1) dtb__50)) (fun (rest2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__51; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__52; Core_dTerm.f_CaseAlt_caseAltBody = body2 }, rest2)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 121 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseCtorArgs = (fun (allowErased : bool) (ctx : bool B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (isMk : bool) -> ((Base_dCommon.v_bind (((v_eraseArgs allowErased) ctx) args)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if isMk then (Core_dTerm.C_Term_TMk (c, args2)) else (Core_dTerm.C_Term_TCon (c, args2))))))))
# 128 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseArgs = (fun (mc0 : bool) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__54)) then ((Base_dCommon.v_bind (((v_eraseArgs mc0) mc1) dtb__55)) (fun (rest2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__54); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__54) }, rest2)))))) else ((Base_dCommon.v_bind (((v_eraseTermIn mc0) mc1) (B_dData_dPair.v_firstOf dtb__54))) (fun (a2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseArgs mc0) mc1) dtb__55)) (fun (rest2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = a2; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__54) }, rest2)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_validateErasedIn = (fun (ctx : bool B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match t with
  | Core_dTerm.C_Term_TVar (dtb__56, dtb__57, dtb__58) -> (if (if (dtb__57 < 0) then true else (dtb__57 >= (v_countKept ctx))) then (Base_dDiag.v_icInternal "erased core: runtime variable out of scope") else (Base_dDiag.C_Check_OkC (0)))
  | Core_dTerm.C_Term_TGlobal (dtb__59) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb__60) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb__61) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb__62) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb__63) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TIf (dtb__64, dtb__65, dtb__66) -> ((Base_dCommon.v_bind ((v_validateErasedIn ctx) dtb__64)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_validateErasedIn ctx) dtb__65)) (fun (_u : int) -> ((v_validateErasedIn ctx) dtb__66)))))
  | Core_dTerm.C_Term_TLam (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> ((v_validateErasedIn (B_dData_dList.C_List__x58__x58_ ((B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__68)), ctx))) dtb__71)
  | Core_dTerm.C_Term_TApp (dtb__72, dtb__73, dtb__74) -> ((Base_dCommon.v_bind ((v_validateErasedIn ctx) dtb__72)) (fun (_u : int) -> (if (Core_dTerm.v_rigIsErased dtb__74) then (Base_dDiag.C_Check_OkC (0)) else ((v_validateErasedIn ctx) dtb__73))))
  | Core_dTerm.C_Term_TCon (dtb__75, dtb__76) -> ((v_validateErasedArgs ctx) dtb__76)
  | Core_dTerm.C_Term_TMk (dtb__77, dtb__78) -> ((v_validateErasedArgs ctx) dtb__78)
  | Core_dTerm.C_Term_TRecord (dtb__79, dtb__80) -> ((v_validateErasedArgs ctx) dtb__80)
  | Core_dTerm.C_Term_TProj (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> ((v_validateErasedIn ctx) dtb__81)
  | Core_dTerm.C_Term_TRecUpd (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> ((v_validateErasedIn ctx) dtb__86)
  | Core_dTerm.C_Term_TCase (dtb__91, dtb__92) -> ((Base_dCommon.v_bind ((v_validateErasedIn ctx) dtb__91)) (fun (_u : int) -> ((v_validateErasedAlts ctx) dtb__92)))
  | Core_dTerm.C_Term_TPi (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (Base_dDiag.v_icInternal "erased core: Pi at runtime")
  | Core_dTerm.C_Term_TType (dtb__98) -> (Base_dDiag.v_icInternal "erased core: Type at runtime")
  | Core_dTerm.C_Term_TMeta (dtb__99) -> (Base_dDiag.v_icInternal "erased core: unsolved meta at runtime")
  | _ -> failwith "DT: impossible branch"
))
# 183 "Vuna/Compiler/Lowering/Erased.vuna"
and v_validateErasedArgs = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__100)) then ((v_validateErasedArgs mc0) dtb__101) else ((Base_dCommon.v_bind ((v_validateErasedIn mc0) (B_dData_dPair.v_firstOf dtb__100))) (fun (_u : int) -> ((v_validateErasedArgs mc0) dtb__101))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 193 "Vuna/Compiler/Lowering/Erased.vuna"
and v_validateErasedAlts = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__102 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__104; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__105; Core_dTerm.f_CaseAlt_caseAltBody = dtb__106 } -> ((Base_dCommon.v_bind ((v_validateErasedIn ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_binderKept) dtb__105))) mc0)) dtb__106)) (fun (_u : int) -> ((v_validateErasedAlts mc0) dtb__103)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Lowering/Erased.vuna"
let v_eraseTerm = (fun (t : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn false) B_dData_dList.C_List_Nil) t)) (fun (t2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_validateErasedIn B_dData_dList.C_List_Nil) t2)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (t2)))))))

# 144 "Vuna/Compiler/Lowering/Erased.vuna"
let v_validateErased = (fun (t : Core_dTerm.t_Term) -> ((v_validateErasedIn B_dData_dList.C_List_Nil) t))
