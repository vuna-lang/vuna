open Vuna_runtime
# 32 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_runtimeIndexGo = (fun (dtb_u_u1 : int) (dtb_u_u2 : bool B_dData_dList.t_List) (dtb_u_u3 : int) -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u5) -> (if (dtb_u_u3 <= 0) then (if dtb_u_u4 then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1)) else B_dData_dMaybe.C_Maybe_Nothing) else (((v_runtimeIndexGo (if dtb_u_u4 then (dtb_u_u1 + 1) else dtb_u_u1)) dtb_u_u5) (dtb_u_u3 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Lowering/Erased.vuna"
let v_runtimeIndexAt = (fun (dtb_u_u6 : bool B_dData_dList.t_List) (dtb_u_u7 : int) -> (((v_runtimeIndexGo 0) dtb_u_u6) dtb_u_u7))

# 40 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_countKept = (fun (dtb_u_u8 : bool B_dData_dList.t_List) -> (match dtb_u_u8 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (if dtb_u_u9 then (1 + (v_countKept dtb_u_u10)) else (v_countKept dtb_u_u10))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Lowering/Erased.vuna"
let v_binderKept = (fun (dtb_u_u11 : Core_dTerm.t_Binder) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (Core_dTerm.v_binderRigOf dtb_u_u11))))

# 57 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_eraseTermIn = (fun (dtb_u_u12 : bool) (dtb_u_u13 : bool B_dData_dList.t_List) (dtb_u_u14 : Core_dTerm.t_Term) -> (match dtb_u_u14 with
  | Core_dTerm.C_Term_TVar (dtb_u_u15, dtb_u_u16, dtb_u_u17) -> (match ((v_runtimeIndexAt dtb_u_u13) dtb_u_u16) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u18) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb_u_u15, dtb_u_u18, dtb_u_u17))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if dtb_u_u12 then (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb_u_u15, dtb_u_u16, dtb_u_u17)))) else (Base_dDiag.v_icInternal (String.concat "" ["erased core: erased binder "; dtb_u_u15; " used at runtime"])))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u19) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb_u_u19))))
  | Core_dTerm.C_Term_TInt (dtb_u_u20) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb_u_u20))))
  | Core_dTerm.C_Term_TStr (dtb_u_u21) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb_u_u21))))
  | Core_dTerm.C_Term_TFloat (dtb_u_u22) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb_u_u22))))
  | Core_dTerm.C_Term_TBool (dtb_u_u23) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb_u_u23))))
  | Core_dTerm.C_Term_TIf (dtb_u_u24, dtb_u_u25, dtb_u_u26) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u24)) (fun (dtb_u_u27 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u25)) (fun (dtb_u_u28 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u26)) (fun (dtb_u_u29 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (dtb_u_u27, dtb_u_u28, dtb_u_u29))))))))))
  | Core_dTerm.C_Term_TLam (dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u34) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) (B_dData_dList.C_List__x58__x58_ ((B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u31)), dtb_u_u13))) dtb_u_u34)) (fun (dtb_u_u35 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u35))))))
  | Core_dTerm.C_Term_TApp (dtb_u_u36, dtb_u_u37, dtb_u_u38) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u36)) (fun (dtb_u_u39 : Core_dTerm.t_Term) -> (if (Core_dTerm.v_rigIsErased dtb_u_u38) then (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (dtb_u_u39, dtb_u_u37, dtb_u_u38)))) else ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u37)) (fun (dtb_u_u40 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (dtb_u_u39, dtb_u_u40, dtb_u_u38)))))))))
  | Core_dTerm.C_Term_TCon (dtb_u_u41, dtb_u_u42) -> (((((v_eraseCtorArgs dtb_u_u12) dtb_u_u13) dtb_u_u41) dtb_u_u42) false)
  | Core_dTerm.C_Term_TMk (dtb_u_u43, dtb_u_u44) -> (((((v_eraseCtorArgs dtb_u_u12) dtb_u_u13) dtb_u_u43) dtb_u_u44) true)
  | Core_dTerm.C_Term_TRecord (dtb_u_u45, dtb_u_u46) -> ((Base_dCommon.v_bind (((v_eraseArgs dtb_u_u12) dtb_u_u13) dtb_u_u46)) (fun (dtb_u_u47 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb_u_u45, dtb_u_u47))))))
  | Core_dTerm.C_Term_TProj (dtb_u_u48, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u48)) (fun (dtb_u_u53 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (dtb_u_u53, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52))))))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u54, dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u58) -> (let dtb_u_u59 = ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map (fun (dtb_u_u62 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> false)) dtb_u_u56))) dtb_u_u13) in ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u54)) (fun (dtb_u_u60 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn true) dtb_u_u59) dtb_u_u58)) (fun (dtb_u_u61 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (dtb_u_u60, dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u61)))))))))
  | Core_dTerm.C_Term_TCase (dtb_u_u63, dtb_u_u64) -> ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u12) dtb_u_u13) dtb_u_u63)) (fun (dtb_u_u65 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseAlts dtb_u_u12) dtb_u_u13) dtb_u_u64)) (fun (dtb_u_u66 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (dtb_u_u65, dtb_u_u66))))))))
  | Core_dTerm.C_Term_TPi (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71))))
  | Core_dTerm.C_Term_TType (dtb_u_u72) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb_u_u72))))
  | Core_dTerm.C_Term_TMeta (dtb_u_u73) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta (dtb_u_u73))))
  | _ -> failwith "DT: impossible branch"
))
# 112 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseAlts = (fun (dtb_u_u74 : bool) (dtb_u_u75 : bool B_dData_dList.t_List) (dtb_u_u76 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (match dtb_u_u77 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u79; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u80; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u81 } -> (let dtb_u_u82 = ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_binderKept) dtb_u_u80))) dtb_u_u75) in ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u74) dtb_u_u82) dtb_u_u81)) (fun (dtb_u_u83 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseAlts dtb_u_u74) dtb_u_u75) dtb_u_u78)) (fun (dtb_u_u84 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u79; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u80; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u83 }, dtb_u_u84)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 121 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseCtorArgs = (fun (dtb_u_u85 : bool) (dtb_u_u86 : bool B_dData_dList.t_List) (dtb_u_u87 : string) (dtb_u_u88 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u89 : bool) -> ((Base_dCommon.v_bind (((v_eraseArgs dtb_u_u85) dtb_u_u86) dtb_u_u88)) (fun (dtb_u_u90 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if dtb_u_u89 then (Core_dTerm.C_Term_TMk (dtb_u_u87, dtb_u_u90)) else (Core_dTerm.C_Term_TCon (dtb_u_u87, dtb_u_u90))))))))
# 128 "Vuna/Compiler/Lowering/Erased.vuna"
and v_eraseArgs = (fun (dtb_u_u91 : bool) (dtb_u_u92 : bool B_dData_dList.t_List) (dtb_u_u93 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u94, dtb_u_u95) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u94)) then ((Base_dCommon.v_bind (((v_eraseArgs dtb_u_u91) dtb_u_u92) dtb_u_u95)) (fun (dtb_u_u96 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u94); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u94) }, dtb_u_u96)))))) else ((Base_dCommon.v_bind (((v_eraseTermIn dtb_u_u91) dtb_u_u92) (B_dData_dPair.v_firstOf dtb_u_u94))) (fun (dtb_u_u97 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseArgs dtb_u_u91) dtb_u_u92) dtb_u_u95)) (fun (dtb_u_u98 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u97; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u94) }, dtb_u_u98)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Lowering/Erased.vuna"
let rec v_validateErasedIn = (fun (dtb_u_u99 : bool B_dData_dList.t_List) (dtb_u_u100 : Core_dTerm.t_Term) -> (match dtb_u_u100 with
  | Core_dTerm.C_Term_TVar (dtb_u_u101, dtb_u_u102, dtb_u_u103) -> (if (if (dtb_u_u102 < 0) then true else (dtb_u_u102 >= (v_countKept dtb_u_u99))) then (Base_dDiag.v_icInternal "erased core: runtime variable out of scope") else (Base_dDiag.C_Check_OkC (0)))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u104) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb_u_u105) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb_u_u106) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb_u_u107) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb_u_u108) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TIf (dtb_u_u109, dtb_u_u110, dtb_u_u111) -> ((Base_dCommon.v_bind ((v_validateErasedIn dtb_u_u99) dtb_u_u109)) (fun (dtb_u_u112 : int) -> ((Base_dCommon.v_bind ((v_validateErasedIn dtb_u_u99) dtb_u_u110)) (fun (dtb_u_u113 : int) -> ((v_validateErasedIn dtb_u_u99) dtb_u_u111)))))
  | Core_dTerm.C_Term_TLam (dtb_u_u114, dtb_u_u115, dtb_u_u116, dtb_u_u117, dtb_u_u118) -> ((v_validateErasedIn (B_dData_dList.C_List__x58__x58_ ((B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u115)), dtb_u_u99))) dtb_u_u118)
  | Core_dTerm.C_Term_TApp (dtb_u_u119, dtb_u_u120, dtb_u_u121) -> ((Base_dCommon.v_bind ((v_validateErasedIn dtb_u_u99) dtb_u_u119)) (fun (dtb_u_u122 : int) -> (if (Core_dTerm.v_rigIsErased dtb_u_u121) then (Base_dDiag.C_Check_OkC (0)) else ((v_validateErasedIn dtb_u_u99) dtb_u_u120))))
  | Core_dTerm.C_Term_TCon (dtb_u_u123, dtb_u_u124) -> ((v_validateErasedArgs dtb_u_u99) dtb_u_u124)
  | Core_dTerm.C_Term_TMk (dtb_u_u125, dtb_u_u126) -> ((v_validateErasedArgs dtb_u_u99) dtb_u_u126)
  | Core_dTerm.C_Term_TRecord (dtb_u_u127, dtb_u_u128) -> ((v_validateErasedArgs dtb_u_u99) dtb_u_u128)
  | Core_dTerm.C_Term_TProj (dtb_u_u129, dtb_u_u130, dtb_u_u131, dtb_u_u132, dtb_u_u133) -> ((v_validateErasedIn dtb_u_u99) dtb_u_u129)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u134, dtb_u_u135, dtb_u_u136, dtb_u_u137, dtb_u_u138) -> ((v_validateErasedIn dtb_u_u99) dtb_u_u134)
  | Core_dTerm.C_Term_TCase (dtb_u_u139, dtb_u_u140) -> ((Base_dCommon.v_bind ((v_validateErasedIn dtb_u_u99) dtb_u_u139)) (fun (dtb_u_u141 : int) -> ((v_validateErasedAlts dtb_u_u99) dtb_u_u140)))
  | Core_dTerm.C_Term_TPi (dtb_u_u142, dtb_u_u143, dtb_u_u144, dtb_u_u145, dtb_u_u146) -> (Base_dDiag.v_icInternal "erased core: Pi at runtime")
  | Core_dTerm.C_Term_TType (dtb_u_u147) -> (Base_dDiag.v_icInternal "erased core: Type at runtime")
  | Core_dTerm.C_Term_TMeta (dtb_u_u148) -> (Base_dDiag.v_icInternal "erased core: unsolved meta at runtime")
  | _ -> failwith "DT: impossible branch"
))
# 183 "Vuna/Compiler/Lowering/Erased.vuna"
and v_validateErasedArgs = (fun (dtb_u_u149 : bool B_dData_dList.t_List) (dtb_u_u150 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u151)) then ((v_validateErasedArgs dtb_u_u149) dtb_u_u152) else ((Base_dCommon.v_bind ((v_validateErasedIn dtb_u_u149) (B_dData_dPair.v_firstOf dtb_u_u151))) (fun (dtb_u_u153 : int) -> ((v_validateErasedArgs dtb_u_u149) dtb_u_u152))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 193 "Vuna/Compiler/Lowering/Erased.vuna"
and v_validateErasedAlts = (fun (dtb_u_u154 : bool B_dData_dList.t_List) (dtb_u_u155 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u155 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u156, dtb_u_u157) -> (match dtb_u_u156 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u158; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u159; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u160 } -> ((Base_dCommon.v_bind ((v_validateErasedIn ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_binderKept) dtb_u_u159))) dtb_u_u154)) dtb_u_u160)) (fun (dtb_u_u161 : int) -> ((v_validateErasedAlts dtb_u_u154) dtb_u_u157)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Lowering/Erased.vuna"
let v_eraseTerm = (fun (dtb_u_u162 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_eraseTermIn false) B_dData_dList.C_List_Nil) dtb_u_u162)) (fun (dtb_u_u163 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_validateErasedIn B_dData_dList.C_List_Nil) dtb_u_u163)) (fun (dtb_u_u164 : int) -> (Base_dDiag.C_Check_OkC (dtb_u_u163)))))))

# 144 "Vuna/Compiler/Lowering/Erased.vuna"
let v_validateErased = (fun (dtb_u_u165 : Core_dTerm.t_Term) -> ((v_validateErasedIn B_dData_dList.C_List_Nil) dtb_u_u165))
