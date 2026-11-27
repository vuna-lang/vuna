open Vuna_runtime
type t_BranchVerdict = C_BranchVerdict_BranchOk | C_BranchVerdict_BranchImpossibleIndex | C_BranchVerdict_BranchImpossibleEmptyCtx

# 38 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyErr = (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex) B_dData_dVec.C_Vec_Nil)))

# 70 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelMax = 1000000

# 106 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatCtor = (fun (dtb_u_u2 : string) -> (if (dtb_u_u2 = Base_dIntrinsics.v_natZeroCtor) then true else (dtb_u_u2 = Base_dIntrinsics.v_natSuccCtor)))

# 97 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxIsNatHead = (fun (dtb_u_u3 : Core_dTerm.t_Value) -> (match dtb_u_u3 with
  | Core_dTerm.C_Value_VApp (dtb_u_u4, dtb_u_u5) -> (v_idxIsNatHead dtb_u_u4)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u6) -> (match dtb_u_u6 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u7, dtb_u_u8) -> (v_idxIsNatCtor dtb_u_u7)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb_u_u9, dtb_u_u10) -> (v_idxIsNatCtor dtb_u_u9)
  | _ -> false
))

# 139 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatSuccHead = (fun (dtb_u_u11 : Core_dTerm.t_Value) -> (match dtb_u_u11 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u12) -> (match dtb_u_u12 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u13, dtb_u_u14) -> (dtb_u_u13 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb_u_u15, dtb_u_u16) -> (dtb_u_u15 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
))

# 113 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxNatPrefixGo = (fun (dtb_u_u17 : int) (dtb_u_u18 : Core_dTerm.t_Value) -> (if (dtb_u_u17 <= 0) then 100000 else (match dtb_u_u18 with
  | Core_dTerm.C_Value_VCon (dtb_u_u19, dtb_u_u20) -> (if (dtb_u_u19 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u21 = dtb_u_u20 in (match dtb_u_u21 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (match dtb_u_u23 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_idxNatPrefixGo (dtb_u_u17 - 1)) dtb_u_u22))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u24) -> (match dtb_u_u24 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u25, dtb_u_u26) -> (if (dtb_u_u25 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u27 = dtb_u_u26 in (match dtb_u_u27 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (match dtb_u_u29 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_idxNatPrefixGo (dtb_u_u17 - 1)) dtb_u_u28))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | _ -> 0
)
  | Core_dTerm.C_Value_VApp (dtb_u_u30, dtb_u_u31) -> (if (v_idxIsNatSuccHead dtb_u_u30) then (1 + ((v_idxNatPrefixGo (dtb_u_u17 - 1)) dtb_u_u31)) else 0)
  | _ -> 0
)))

# 110 "Vuna/Compiler/Elab/Case.vuna"
let v_idxNatPrefixDepth = (fun (dtb_u_u32 : Core_dTerm.t_Value) -> ((v_idxNatPrefixGo 100000) dtb_u_u32))

# 73 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxNatDepthOfList = (fun (dtb_u_u33 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (let dtb_u_u36 = (v_idxNatDepthNear dtb_u_u34) in (let dtb_u_u37 = (v_idxNatDepthOfList dtb_u_u35) in (if (dtb_u_u36 >= dtb_u_u37) then dtb_u_u36 else dtb_u_u37)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Elab/Case.vuna"
and v_idxNatDepthNear = (fun (dtb_u_u38 : Core_dTerm.t_Value) -> (if (v_idxIsNatHead dtb_u_u38) then (v_idxNatPrefixDepth dtb_u_u38) else (match dtb_u_u38 with
  | Core_dTerm.C_Value_VCon (dtb_u_u39, dtb_u_u40) -> (v_idxNatDepthOfList dtb_u_u40)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u41) -> (match dtb_u_u41 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u42, dtb_u_u43) -> (v_idxNatDepthOfList dtb_u_u43)
  | Core_dTerm.C_Neutral_NVar (dtb_u_u44, dtb_u_u45, dtb_u_u46) -> (v_idxNatDepthOfList dtb_u_u46)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VApp (dtb_u_u47, dtb_u_u48) -> (if (v_idxIsNatHead dtb_u_u48) then (v_idxNatPrefixDepth dtb_u_u48) else 0)
  | _ -> 0
)))

# 64 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelFor = (fun (dtb_u_u49 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u50 : Core_dTerm.t_Value B_dData_dList.t_List) -> (let dtb_u_u51 = (512 + (4 * ((v_idxNatDepthOfList dtb_u_u49) + (v_idxNatDepthOfList dtb_u_u50)))) in (if (dtb_u_u51 > v_idxFuelMax) then v_idxFuelMax else dtb_u_u51)))

# 202 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFreshLevel = (fun (dtb_u_u52 : int) (dtb_u_u53 : int) -> (if (dtb_u_u52 = dtb_u_u53) then (dtb_u_u53 + 1) else dtb_u_u52))

# 175 "Vuna/Compiler/Elab/Case.vuna"
let rec v_occursLevel = (fun (dtb_u_u54 : int) (dtb_u_u55 : int) (dtb_u_u56 : int) (dtb_u_u57 : Core_dTerm.t_Value) -> (if (dtb_u_u54 <= 0) then true else (match dtb_u_u57 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u58) -> (match dtb_u_u58 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u59, dtb_u_u60, dtb_u_u61) -> (if (dtb_u_u60 = dtb_u_u56) then true else ((((v_occursLevelList (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u61))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u62, dtb_u_u63) -> ((((v_occursLevelList (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u63)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb_u_u64, dtb_u_u65, dtb_u_u66, dtb_u_u67, dtb_u_u68) -> (if ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u67) then true else ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) ((Core_dEval.v_applyClosure dtb_u_u68) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_occurs", ((v_occursFreshLevel dtb_u_u55) dtb_u_u56), B_dData_dList.C_List_Nil)))))))
  | Core_dTerm.C_Value_VLam (dtb_u_u69, dtb_u_u70, dtb_u_u71) -> ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) ((Core_dEval.v_applyClosure dtb_u_u71) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_occurs", ((v_occursFreshLevel dtb_u_u55) dtb_u_u56), B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VMeta (dtb_u_u72, dtb_u_u73) -> ((((v_occursLevelList (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u73)
  | Core_dTerm.C_Value_VCon (dtb_u_u74, dtb_u_u75) -> ((((v_occursLevelList (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u75)
  | Core_dTerm.C_Value_VApp (dtb_u_u76, dtb_u_u77) -> (if ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u76) then true else ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u77))
  | Core_dTerm.C_Value_VCase (dtb_u_u78, dtb_u_u79) -> ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u78)
  | Core_dTerm.C_Value_VProj (dtb_u_u80, dtb_u_u81, dtb_u_u82, dtb_u_u83, dtb_u_u84) -> ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u80)
  | Core_dTerm.C_Value_VIf (dtb_u_u85, dtb_u_u86, dtb_u_u87) -> (if (if ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u85) then true else ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u86)) then true else ((((v_occursLevel (dtb_u_u54 - 1)) dtb_u_u55) dtb_u_u56) dtb_u_u87))
  | Core_dTerm.C_Value_VType (dtb_u_u88) -> false
  | Core_dTerm.C_Value_VInt (dtb_u_u89) -> false
  | Core_dTerm.C_Value_VStr (dtb_u_u90) -> false
  | Core_dTerm.C_Value_VFloat (dtb_u_u91) -> false
  | Core_dTerm.C_Value_VBool (dtb_u_u92) -> false
  | _ -> failwith "DT: impossible branch"
)))
# 205 "Vuna/Compiler/Elab/Case.vuna"
and v_occursLevelList = (fun (dtb_u_u93 : int) (dtb_u_u94 : int) (dtb_u_u95 : int) (dtb_u_u96 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u96 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u97, dtb_u_u98) -> (if ((((v_occursLevel (dtb_u_u93 - 1)) dtb_u_u94) dtb_u_u95) dtb_u_u97) then true else ((((v_occursLevelList (dtb_u_u93 - 1)) dtb_u_u94) dtb_u_u95) dtb_u_u98))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFuel = 1000000

# 253 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxConv = (fun (dtb_u_u99 : Elab_dTypes.t_Ec) (dtb_u_u100 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u101 : int) (dtb_u_u102 : Core_dTerm.t_Value) (dtb_u_u103 : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u99)) (Elab_dTypes.v_ecSolsP dtb_u_u99)) dtb_u_u101) dtb_u_u102) dtb_u_u103) with
  | Base_dDiag.C_Check_OkC (dtb_u_u104) -> (Base_dDiag.C_Check_OkC (dtb_u_u100))
  | Base_dDiag.C_Check_ErrC (dtb_u_u105) -> v_unifyErr
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Case.vuna"
let rec v_unifyIdxList = (fun (dtb_u_u106 : Elab_dTypes.t_Ec) (dtb_u_u107 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u108 : int) (dtb_u_u109 : int) (dtb_u_u110 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u111 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u109 <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_IndexFuel) B_dData_dVec.C_Vec_Nil))) else ((((((v_unifyIdxListGo dtb_u_u106) dtb_u_u107) dtb_u_u108) dtb_u_u109) dtb_u_u110) dtb_u_u111)))
# 46 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdxListGo = (fun (dtb_u_u112 : Elab_dTypes.t_Ec) (dtb_u_u113 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u114 : int) (dtb_u_u115 : int) (dtb_u_u116 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u117 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u116 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u120, dtb_u_u121) -> ((Base_dCommon.v_bind ((((((v_unifyIdx dtb_u_u112) dtb_u_u113) dtb_u_u114) (dtb_u_u115 - 1)) dtb_u_u118) dtb_u_u120)) (fun (dtb_u_u122 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_unifyIdxList dtb_u_u112) dtb_u_u122) dtb_u_u114) (dtb_u_u115 - 1)) dtb_u_u119) dtb_u_u121)))
  | _ -> v_unifyErr
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u117 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u113))
  | _ -> v_unifyErr
)
  | _ -> failwith "DT: impossible branch"
))
# 148 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdx = (fun (dtb_u_u123 : Elab_dTypes.t_Ec) (dtb_u_u124 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u125 : int) (dtb_u_u126 : int) (dtb_u_u127 : Core_dTerm.t_Value) (dtb_u_u128 : Core_dTerm.t_Value) -> (if (dtb_u_u126 <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_IndexFuel) B_dData_dVec.C_Vec_Nil))) else (let dtb_u_u129 = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl dtb_u_u123)) (Elab_dTypes.v_ecSolsP dtb_u_u123)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue dtb_u_u124) Core_dTerm.v_defaultFuel) dtb_u_u127)) in (let dtb_u_u130 = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl dtb_u_u123)) (Elab_dTypes.v_ecSolsP dtb_u_u123)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue dtb_u_u124) Core_dTerm.v_defaultFuel) dtb_u_u128)) in (let dtb_u_u131 = dtb_u_u129 in (match dtb_u_u131 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u132) -> (match dtb_u_u132 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u133, dtb_u_u134, dtb_u_u135) -> (match dtb_u_u135 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u136 = dtb_u_u130 in (match dtb_u_u136 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u137) -> (match dtb_u_u137 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u138, dtb_u_u139, dtb_u_u140) -> (match dtb_u_u140 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u134 = dtb_u_u139) then (Base_dDiag.C_Check_OkC (dtb_u_u124)) else (if (dtb_u_u134 < dtb_u_u139) then (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u139) dtb_u_u129) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u139; B_dData_dPair.f_Pair_second = dtb_u_u129 }, dtb_u_u124))))) else (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u134) dtb_u_u130) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u130 }, dtb_u_u124)))))))
  | _ -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u134) dtb_u_u130) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u130 }, dtb_u_u124)))))
)
  | _ -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u134) dtb_u_u130) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u130 }, dtb_u_u124)))))
)
  | _ -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u134) dtb_u_u130) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u130 }, dtb_u_u124)))))
))
  | _ -> (let dtb_u_u141 = dtb_u_u130 in (match dtb_u_u141 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u142) -> (match dtb_u_u142 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u143, dtb_u_u144, dtb_u_u145) -> (match dtb_u_u145 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u144) dtb_u_u129) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u144; B_dData_dPair.f_Pair_second = dtb_u_u129 }, dtb_u_u124)))))
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
))
)
  | _ -> (let dtb_u_u146 = dtb_u_u130 in (match dtb_u_u146 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u147) -> (match dtb_u_u147 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u148, dtb_u_u149, dtb_u_u150) -> (match dtb_u_u150 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u149) dtb_u_u129) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u149; B_dData_dPair.f_Pair_second = dtb_u_u129 }, dtb_u_u124)))))
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
))
)
  | _ -> (let dtb_u_u151 = dtb_u_u130 in (match dtb_u_u151 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u152) -> (match dtb_u_u152 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u153, dtb_u_u154, dtb_u_u155) -> (match dtb_u_u155 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) dtb_u_u125) dtb_u_u154) dtb_u_u129) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u154; B_dData_dPair.f_Pair_second = dtb_u_u129 }, dtb_u_u124)))))
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
)
  | _ -> ((((((v_unifyIdxRigid dtb_u_u123) dtb_u_u124) dtb_u_u125) (dtb_u_u126 - 1)) dtb_u_u129) dtb_u_u130)
))
))))))
# 216 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdxRigid = (fun (dtb_u_u156 : Elab_dTypes.t_Ec) (dtb_u_u157 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u158 : int) (dtb_u_u159 : int) (dtb_u_u160 : Core_dTerm.t_Value) (dtb_u_u161 : Core_dTerm.t_Value) -> (if (dtb_u_u159 <= 0) then v_unifyErr else (let dtb_u_u162 = dtb_u_u160 in (match dtb_u_u162 with
  | Core_dTerm.C_Value_VBool (dtb_u_u163) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VBool (dtb_u_u164) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u163) dtb_u_u164) then (Base_dDiag.C_Check_OkC (dtb_u_u157)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VFloat (dtb_u_u165) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u166) -> (if (dtb_u_u165 = dtb_u_u166) then (Base_dDiag.C_Check_OkC (dtb_u_u157)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VStr (dtb_u_u167) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VStr (dtb_u_u168) -> (if (dtb_u_u167 = dtb_u_u168) then (Base_dDiag.C_Check_OkC (dtb_u_u157)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VInt (dtb_u_u169) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VInt (dtb_u_u170) -> (if (dtb_u_u169 = dtb_u_u170) then (Base_dDiag.C_Check_OkC (dtb_u_u157)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VType (dtb_u_u171) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VType (dtb_u_u172) -> (if ((Core_dTerm.v_levelEq dtb_u_u171) dtb_u_u172) then (Base_dDiag.C_Check_OkC (dtb_u_u157)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u173) -> (match dtb_u_u173 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u174, dtb_u_u175) -> (let dtb_u_u176 = dtb_u_u161 in (match dtb_u_u176 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u177) -> (match dtb_u_u177 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u178, dtb_u_u179) -> (if (dtb_u_u174 = dtb_u_u178) then ((((((v_unifyIdxList dtb_u_u156) dtb_u_u157) dtb_u_u158) (dtb_u_u159 - 1)) dtb_u_u175) dtb_u_u179) else (((((v_unifyIdxConv dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u160) dtb_u_u161))
  | _ -> (((((v_unifyIdxConv dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u160) dtb_u_u161)
)
  | _ -> (((((v_unifyIdxConv dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u160) dtb_u_u161)
))
  | _ -> (((((v_unifyIdxConv dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u160) dtb_u_u161)
)
  | Core_dTerm.C_Value_VCon (dtb_u_u180, dtb_u_u181) -> (match dtb_u_u161 with
  | Core_dTerm.C_Value_VCon (dtb_u_u182, dtb_u_u183) -> (if (dtb_u_u180 = dtb_u_u182) then ((((((v_unifyIdxList dtb_u_u156) dtb_u_u157) dtb_u_u158) (dtb_u_u159 - 1)) dtb_u_u181) dtb_u_u183) else v_unifyErr)
  | _ -> v_unifyErr
)
  | _ -> (((((v_unifyIdxConv dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u160) dtb_u_u161)
))))

# 61 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxListSized = (fun (dtb_u_u184 : Elab_dTypes.t_Ec) (dtb_u_u185 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u186 : int) (dtb_u_u187 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u188 : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_unifyIdxList dtb_u_u184) dtb_u_u185) dtb_u_u186) ((v_idxFuelFor dtb_u_u187) dtb_u_u188)) dtb_u_u187) dtb_u_u188))

# 273 "Vuna/Compiler/Elab/Case.vuna"
let v_branchIsReachable = (fun (dtb_u_u189 : t_BranchVerdict) -> (match dtb_u_u189 with
  | C_BranchVerdict_BranchOk -> true
  | _ -> false
))

# 305 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_wildArgs = (fun (dtb_u_u190 : int) -> (if (dtb_u_u190 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild (Frontend_dAst.v_noNodeRef)), (v_wildArgs (dtb_u_u190 - 1))))))

# 309 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorExplicitArity = (fun (dtb_u_u191 : Core_dTerm.t_Term) -> (match dtb_u_u191 with
  | Core_dTerm.C_Term_TPi (dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196) -> (if dtb_u_u193 then (v_ctorExplicitArity dtb_u_u196) else (1 + (v_ctorExplicitArity dtb_u_u196)))
  | _ -> 0
))

# 344 "Vuna/Compiler/Elab/Case.vuna"
let rec v_rigidIdxVals = (fun (dtb_u_u197 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u198, dtb_u_u199) -> (if (v_isRigidVal dtb_u_u198) then (v_rigidIdxVals dtb_u_u199) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 348 "Vuna/Compiler/Elab/Case.vuna"
and v_isRigidVal = (fun (dtb_u_u200 : Core_dTerm.t_Value) -> (match dtb_u_u200 with
  | Core_dTerm.C_Value_VBool (dtb_u_u201) -> true
  | Core_dTerm.C_Value_VFloat (dtb_u_u202) -> true
  | Core_dTerm.C_Value_VStr (dtb_u_u203) -> true
  | Core_dTerm.C_Value_VInt (dtb_u_u204) -> true
  | Core_dTerm.C_Value_VType (dtb_u_u205) -> true
  | Core_dTerm.C_Value_VCon (dtb_u_u206, dtb_u_u207) -> (v_rigidIdxVals dtb_u_u207)
  | _ -> false
))

# 376 "Vuna/Compiler/Elab/Case.vuna"
let rec v_bindCtorGo = (fun (dtb_u_u208 : string) (dtb_u_u209 : string B_dData_dList.t_List) (dtb_u_u210 : Elab_dTypes.t_Ctx) (dtb_u_u211 : Core_dTerm.t_Term) (dtb_u_u212 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u213 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (match dtb_u_u211 with
  | Core_dTerm.C_Term_TPi (dtb_u_u214, dtb_u_u215, dtb_u_u216, dtb_u_u217, dtb_u_u218) -> (let dtb_u_u219 = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u210)) dtb_u_u217) in (if dtb_u_u215 then (let dtb_u_u220 = (dtb_u_u214 ^ "#fam") in (let dtb_u_u221 = (((Elab_dTypes.v_ctxBindValue dtb_u_u220) dtb_u_u219) dtb_u_u210) in ((((((v_bindCtorGo dtb_u_u208) dtb_u_u209) dtb_u_u221) dtb_u_u218) dtb_u_u212) (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.v_binderOfPair { B_dData_dPair.f_Pair_first = dtb_u_u220; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }), dtb_u_u213))))) else (match dtb_u_u212 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CaseBranchTooFewArgs ("", ""))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u208, (B_dData_dVec.C_Vec__x58__x58_ (((B_dData_dString.v_join ", ") dtb_u_u209), B_dData_dVec.C_Vec_Nil)))))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u222, dtb_u_u223) -> (match dtb_u_u222 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u224, dtb_u_u225) -> ((((((((((v_bindCtorField dtb_u_u208) ((B_dData_dList.v_drop 1) dtb_u_u209)) dtb_u_u210) dtb_u_u216) dtb_u_u219) dtb_u_u218) dtb_u_u224) ((Base_dSource.v_spanAtName dtb_u_u224) (Frontend_dAst.v_nodeRefSpan dtb_u_u225))) dtb_u_u223) dtb_u_u213)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u226) -> ((((((((((v_bindCtorField dtb_u_u208) ((B_dData_dList.v_drop 1) dtb_u_u209)) dtb_u_u210) dtb_u_u216) dtb_u_u219) dtb_u_u218) "_") (Frontend_dAst.v_nodeRefSpan dtb_u_u226)) dtb_u_u223) dtb_u_u213)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u222)) Base_dDiagnostics_dTc.C_TcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u213); B_dData_dPair.f_Pair_second = dtb_u_u212 } }))
))
# 404 "Vuna/Compiler/Elab/Case.vuna"
and v_bindCtorField = (fun (dtb_u_u227 : string) (dtb_u_u228 : string B_dData_dList.t_List) (dtb_u_u229 : Elab_dTypes.t_Ctx) (dtb_u_u230 : Core_dTerm.t_Rig) (dtb_u_u231 : Core_dTerm.t_Value) (dtb_u_u232 : Core_dTerm.t_Term) (dtb_u_u233 : string) (dtb_u_u234 : Base_dSource.t_Span) (dtb_u_u235 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u236 : Core_dTerm.t_Binder B_dData_dList.t_List) -> (let dtb_u_u237 = (((Elab_dTypes.v_ctxBindValue dtb_u_u233) dtb_u_u231) dtb_u_u229) in ((((((v_bindCtorGo dtb_u_u227) dtb_u_u228) dtb_u_u237) dtb_u_u232) dtb_u_u235) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = dtb_u_u233; Core_dTerm.f_Binder_binderRig = dtb_u_u230; Core_dTerm.f_Binder_binderSpan = dtb_u_u234 }, dtb_u_u236)))))

# 373 "Vuna/Compiler/Elab/Case.vuna"
let v_bindCtorTele = (fun (dtb_u_u238 : string) (dtb_u_u239 : string B_dData_dList.t_List) (dtb_u_u240 : Elab_dTypes.t_Ctx) (dtb_u_u241 : Core_dTerm.t_Term) (dtb_u_u242 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((((((v_bindCtorGo dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) B_dData_dList.C_List_Nil))

# 399 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_ctorExplicitNames = (fun (dtb_u_u243 : Core_dTerm.t_Term) -> (match dtb_u_u243 with
  | Core_dTerm.C_Term_TPi (dtb_u_u244, dtb_u_u245, dtb_u_u246, dtb_u_u247, dtb_u_u248) -> (if dtb_u_u245 then (v_ctorExplicitNames dtb_u_u248) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u244, (v_ctorExplicitNames dtb_u_u248))))
  | _ -> B_dData_dList.C_List_Nil
))

# 411 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_freshTeleVals = (fun (dtb_u_u249 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u250 : int) (dtb_u_u251 : int) -> (match dtb_u_u249 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u252, dtb_u_u253) -> (match dtb_u_u252 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u254; B_dData_dPair.f_Pair_second = dtb_u_u255 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u254, (dtb_u_u250 + dtb_u_u251), B_dData_dList.C_List_Nil)))), (((v_freshTeleVals dtb_u_u253) dtb_u_u250) (dtb_u_u251 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultTerms = (fun (dtb_u_u256 : Elab_dTypes.t_DtCtor) -> (match (Elab_dMeta.v_resultSpine (Elab_dTypes.v_dtCtorType dtb_u_u256)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u257; B_dData_dPair.f_Pair_second = dtb_u_u258 } -> dtb_u_u258
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultVals = (fun (dtb_u_u259 : Elab_dTypes.t_DtCtor) (dtb_u_u260 : int) -> (let dtb_u_u261 = (Elab_dTypes.v_dtCtorTelescope dtb_u_u259) in (let dtb_u_u262 = (B_dData_dList.v_reverse (((v_freshTeleVals dtb_u_u261) dtb_u_u260) 0)) in ((B_dData_dList.v_map (fun (dtb_u_u263 : Core_dTerm.t_Term) -> ((Core_dEval.v_eval dtb_u_u262) dtb_u_u263))) (v_ctorResultTerms dtb_u_u259)))))

# 360 "Vuna/Compiler/Elab/Case.vuna"
let rec v_allCtorsUnsatisfiableGo = (fun (dtb_u_u264 : Elab_dTypes.t_Ec) (dtb_u_u265 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u266 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u267 : int) -> (match dtb_u_u265 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u268, dtb_u_u269) -> (match (((((v_unifyIdxListSized dtb_u_u264) B_dData_dList.C_List_Nil) dtb_u_u267) ((v_ctorResultVals dtb_u_u268) dtb_u_u267)) dtb_u_u266) with
  | Base_dDiag.C_Check_OkC (dtb_u_u270) -> false
  | Base_dDiag.C_Check_ErrC (dtb_u_u271) -> ((((v_allCtorsUnsatisfiableGo dtb_u_u264) dtb_u_u269) dtb_u_u266) dtb_u_u267)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Elab/Case.vuna"
let v_allCtorsUnsatisfiable = (fun (dtb_u_u272 : Elab_dTypes.t_Ec) (dtb_u_u273 : Elab_dTypes.t_DtData) (dtb_u_u274 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u275 : int) -> ((((v_allCtorsUnsatisfiableGo dtb_u_u272) (Elab_dTypes.v_dtDataCtors dtb_u_u273)) dtb_u_u274) dtb_u_u275))

# 326 "Vuna/Compiler/Elab/Case.vuna"
let v_isEmptyFamilyValue = (fun (dtb_u_u276 : Elab_dTypes.t_Ec) (dtb_u_u277 : int) (dtb_u_u278 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u276) dtb_u_u278) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u279) -> (match dtb_u_u279 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u280, dtb_u_u281) -> (if (B_dData_dBool.v_not (v_rigidIdxVals dtb_u_u281)) then false else (match ((Elab_dMeta.v_dtDataLookup dtb_u_u280) (Elab_dTypes.v_ecDatas dtb_u_u276)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u282) -> ((((v_allCtorsUnsatisfiable dtb_u_u276) dtb_u_u282) dtb_u_u281) dtb_u_u277)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

# 318 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctxHasEmptyBinderAt = (fun (dtb_u_u283 : Elab_dTypes.t_Ec) (dtb_u_u284 : Elab_dTypes.t_Ctx) (dtb_u_u285 : int) (dtb_u_u286 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u286 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u287, dtb_u_u288) -> (match dtb_u_u287 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u289; B_dData_dPair.f_Pair_second = dtb_u_u290 } -> (if (((v_isEmptyFamilyValue dtb_u_u283) (Elab_dTypes.v_ctxDepth dtb_u_u284)) (((Elab_dTypes.v_varTypeValue dtb_u_u284) dtb_u_u285) dtb_u_u290)) then true else ((((v_ctxHasEmptyBinderAt dtb_u_u283) dtb_u_u284) (dtb_u_u285 + 1)) dtb_u_u288))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Elab/Case.vuna"
let v_ctxHasEmptyBinder = (fun (dtb_u_u291 : Elab_dTypes.t_Ec) (dtb_u_u292 : Elab_dTypes.t_Ctx) -> ((((v_ctxHasEmptyBinderAt dtb_u_u291) dtb_u_u292) 0) (dtb_u_u292).Elab_dTypes.f_Ctx_ctxItems))

# 278 "Vuna/Compiler/Elab/Case.vuna"
let v_branchAfterUnify = (fun (dtb_u_u293 : Elab_dTypes.t_Ec) (dtb_u_u294 : Elab_dTypes.t_Ctx) (dtb_u_u295 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((v_ctxHasEmptyBinder dtb_u_u293) ((Elab_dTypes.v_ctxRefine dtb_u_u294) dtb_u_u295)) then C_BranchVerdict_BranchImpossibleEmptyCtx else C_BranchVerdict_BranchOk))

# 426 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultValsIn = (fun (dtb_u_u296 : Elab_dTypes.t_Ctx) (dtb_u_u297 : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (dtb_u_u298 : Core_dTerm.t_Term) -> ((Elab_dTypes.v_evalCtx dtb_u_u296) dtb_u_u298))) (v_ctorResultTerms dtb_u_u297)))

# 285 "Vuna/Compiler/Elab/Case.vuna"
let v_branchVerdict = (fun (dtb_u_u299 : Elab_dTypes.t_Ctx) (dtb_u_u300 : Elab_dTypes.t_Ec) (dtb_u_u301 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u302 : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((v_bindCtorTele (Elab_dTypes.v_dtCtorName dtb_u_u302)) (v_ctorExplicitNames (Elab_dTypes.v_dtCtorType dtb_u_u302))) dtb_u_u299) (Elab_dTypes.v_dtCtorType dtb_u_u302)) (v_wildArgs (v_ctorExplicitArity (Elab_dTypes.v_dtCtorType dtb_u_u302))))) (fun (dtb_u_u303 : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dAst.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u304 = dtb_u_u303 in (match dtb_u_u304 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u305; B_dData_dPair.f_Pair_second = dtb_u_u306 } -> (match dtb_u_u306 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = dtb_u_u308 } -> (if (Elab_dMeta.v_nonEmpty dtb_u_u308) then (Base_dDiag.v_icInternal "case coverage: constructor telescope arity mismatch") else (match (((((v_unifyIdxListSized dtb_u_u300) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb_u_u305)) ((v_ctorResultValsIn dtb_u_u305) dtb_u_u302)) ((B_dData_dList.v_map (fun (dtb_u_u309 : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) dtb_u_u309))) dtb_u_u301)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u310) -> (if ((dtb_u_u310).Base_dDiag.f_Diagnostic_diagCode = (Base_dDiagnostics_dTc.v_tcCode Base_dDiagnostics_dTc.C_TcErr_IndexFuel)) then (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchOk)) else (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchImpossibleIndex)))
  | Base_dDiag.C_Check_OkC (dtb_u_u311) -> (Base_dDiag.C_Check_OkC ((((v_branchAfterUnify dtb_u_u300) dtb_u_u305) dtb_u_u311)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 301 "Vuna/Compiler/Elab/Case.vuna"
let v_branchReachable = (fun (dtb_u_u312 : Elab_dTypes.t_Ctx) (dtb_u_u313 : Elab_dTypes.t_Ec) (dtb_u_u314 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u315 : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind ((((v_branchVerdict dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u315)) (fun (dtb_u_u316 : t_BranchVerdict) -> (Base_dDiag.C_Check_OkC ((v_branchIsReachable dtb_u_u316))))))

# 443 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_teleValsFrom = (fun (dtb_u_u317 : int) (dtb_u_u318 : int) -> (if (dtb_u_u318 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_tele", dtb_u_u317, B_dData_dList.C_List_Nil)))), ((v_teleValsFrom (dtb_u_u317 + 1)) (dtb_u_u318 - 1))))))

# 437 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorValueIn = (fun (dtb_u_u319 : Elab_dTypes.t_Ctx) (dtb_u_u320 : Elab_dTypes.t_DtCtor) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName dtb_u_u320), ((v_teleValsFrom ((Elab_dTypes.v_ctxDepth dtb_u_u319) - (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u320)))) (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u320))))))

# 455 "Vuna/Compiler/Elab/Case.vuna"
let v_reflectScrutinee = (fun (dtb_u_u321 : Elab_dTypes.t_Ec) (dtb_u_u322 : int) (dtb_u_u323 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u324 : Core_dTerm.t_Value) (dtb_u_u325 : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl dtb_u_u321)) (Elab_dTypes.v_ecSolsP dtb_u_u321)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue dtb_u_u323) Core_dTerm.v_defaultFuel) dtb_u_u325)) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u326) -> (let dtb_u_u327 = dtb_u_u326 in (match dtb_u_u327 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u328, dtb_u_u329, dtb_u_u330) -> (match dtb_u_u330 with
  | B_dData_dList.C_List_Nil -> ((((((v_unifyIdx dtb_u_u321) dtb_u_u323) dtb_u_u322) Core_dTerm.v_defaultFuel) (Core_dTerm.C_Value_VNeutral (dtb_u_u326))) dtb_u_u324)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u323))
)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u323))
))
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u323))
))

# 474 "Vuna/Compiler/Elab/Case.vuna"
let v_patIrrefutable = (fun (dtb_u_u331 : Frontend_dAst.t_Pat) -> (match dtb_u_u331 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u332) -> true
  | Frontend_dAst.C_Pat_PVar (dtb_u_u333, dtb_u_u334) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Case.vuna"
let rec v_patsAllIrrefutable = (fun (dtb_u_u335 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u335 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u336, dtb_u_u337) -> (if (v_patIrrefutable dtb_u_u336) then (v_patsAllIrrefutable dtb_u_u337) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorHeadCovered = (fun (dtb_u_u338 : string) (dtb_u_u339 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u339 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u340, dtb_u_u341) -> (match dtb_u_u340 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u342; B_dData_dPair.f_Pair_second = dtb_u_u343 } -> (match dtb_u_u342 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u344, dtb_u_u345, dtb_u_u346) -> (if (if (dtb_u_u344 = dtb_u_u338) then (v_patsAllIrrefutable dtb_u_u345) else false) then true else ((v_ctorHeadCovered dtb_u_u338) dtb_u_u341))
  | _ -> ((v_ctorHeadCovered dtb_u_u338) dtb_u_u341)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Case.vuna"
let v_litPatEq = (fun (dtb_u_u347 : Frontend_dAst.t_Pat) (dtb_u_u348 : Frontend_dAst.t_Pat) -> (match dtb_u_u347 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u349, dtb_u_u350) -> (match dtb_u_u348 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u351, dtb_u_u352) -> (dtb_u_u349 = dtb_u_u351)
  | _ -> false
)
  | Frontend_dAst.C_Pat_PInt (dtb_u_u353, dtb_u_u354) -> (match dtb_u_u348 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u355, dtb_u_u356) -> (dtb_u_u353 = dtb_u_u355)
  | _ -> false
)
  | _ -> false
))

# 490 "Vuna/Compiler/Elab/Case.vuna"
let rec v_litHeadCovered = (fun (dtb_u_u357 : Frontend_dAst.t_Pat) (dtb_u_u358 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u358 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u359, dtb_u_u360) -> (match dtb_u_u359 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u361; B_dData_dPair.f_Pair_second = dtb_u_u362 } -> (if ((v_litPatEq dtb_u_u357) dtb_u_u361) then true else ((v_litHeadCovered dtb_u_u357) dtb_u_u360))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Case.vuna"
let v_litLabel = (fun (dtb_u_u363 : Frontend_dAst.t_Pat) -> (match dtb_u_u363 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u364, dtb_u_u365) -> (String.concat "" ["\""; dtb_u_u364; "\""])
  | Frontend_dAst.C_Pat_PInt (dtb_u_u366, dtb_u_u367) -> (string_of_int dtb_u_u366)
  | _ -> ""
))

# 514 "Vuna/Compiler/Elab/Case.vuna"
let rec v_stripAsPat = (fun (dtb_u_u368 : Frontend_dAst.t_Pat) -> (match dtb_u_u368 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u369, dtb_u_u370, dtb_u_u371) -> (v_stripAsPat dtb_u_u370)
  | _ -> dtb_u_u368
))

# 519 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_stripAsPats = (fun (dtb_u_u372 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u372 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u374) -> (match dtb_u_u373 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u375; B_dData_dPair.f_Pair_second = dtb_u_u376 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripAsPat dtb_u_u375); B_dData_dPair.f_Pair_second = dtb_u_u376 }, (v_stripAsPats dtb_u_u374)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasLitHead = (fun (dtb_u_u377 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u377 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u378, dtb_u_u379) -> (match dtb_u_u378 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u380; B_dData_dPair.f_Pair_second = dtb_u_u381 } -> (match dtb_u_u380 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u382, dtb_u_u383) -> true
  | Frontend_dAst.C_Pat_PStr (dtb_u_u384, dtb_u_u385) -> true
  | _ -> (v_hasLitHead dtb_u_u379)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_altNames = (fun (dtb_u_u386 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u386 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u387, dtb_u_u388) -> (match dtb_u_u387 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u389; B_dData_dPair.f_Pair_second = dtb_u_u390 } -> (match dtb_u_u389 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u391, dtb_u_u392, dtb_u_u393) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u391, (v_altNames dtb_u_u388)))
  | _ -> (v_altNames dtb_u_u388)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasCatchAll = (fun (dtb_u_u394 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u394 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u395, dtb_u_u396) -> (match dtb_u_u395 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u397; B_dData_dPair.f_Pair_second = dtb_u_u398 } -> (match dtb_u_u397 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u399, dtb_u_u400) -> true
  | Frontend_dAst.C_Pat_PWild (dtb_u_u401) -> true
  | _ -> (v_hasCatchAll dtb_u_u396)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedArg = (fun (dtb_u_u402 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u402 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u403, dtb_u_u404) -> (match dtb_u_u403 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u405, dtb_u_u406) -> (v_anyNestedArg dtb_u_u404)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u407) -> (v_anyNestedArg dtb_u_u404)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Elab/Case.vuna"
let v_nestedInPat = (fun (dtb_u_u408 : Frontend_dAst.t_Pat) -> (match dtb_u_u408 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u409, dtb_u_u410, dtb_u_u411) -> (v_anyNestedArg dtb_u_u410)
  | _ -> false
))

# 603 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedPat = (fun (dtb_u_u412 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u412 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u413, dtb_u_u414) -> (match dtb_u_u413 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u415; B_dData_dPair.f_Pair_second = dtb_u_u416 } -> (if (v_nestedInPat dtb_u_u415) then true else (v_anyNestedPat dtb_u_u414))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Elab/Case.vuna"
let rec v_missingCtors = (fun (dtb_u_u417 : Elab_dTypes.t_Ctx) (dtb_u_u418 : Elab_dTypes.t_Ec) (dtb_u_u419 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u420 : string B_dData_dList.t_List) (dtb_u_u421 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u421 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u422, dtb_u_u423) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtCtorName dtb_u_u422)) dtb_u_u420) then (((((v_missingCtors dtb_u_u417) dtb_u_u418) dtb_u_u419) dtb_u_u420) dtb_u_u423) else ((Base_dCommon.v_bind ((((v_branchReachable dtb_u_u417) dtb_u_u418) dtb_u_u419) dtb_u_u422)) (fun (dtb_u_u424 : bool) -> (if dtb_u_u424 then ((Base_dCommon.v_bind (((((v_missingCtors dtb_u_u417) dtb_u_u418) dtb_u_u419) dtb_u_u420) dtb_u_u423)) (fun (dtb_u_u425 : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorDisplayName (Elab_dTypes.v_dtCtorName dtb_u_u422)); B_dData_dPair.f_Pair_second = (dtb_u_u422).Elab_dTypes.f_DtCtor_dtCtorSpan }, dtb_u_u425)))))) else (((((v_missingCtors dtb_u_u417) dtb_u_u418) dtb_u_u419) dtb_u_u420) dtb_u_u423)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCovered = (fun (dtb_u_u426 : Elab_dTypes.t_Ctx) (dtb_u_u427 : Elab_dTypes.t_Ec) (dtb_u_u428 : Elab_dTypes.t_DtData) (dtb_u_u429 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u430 : string B_dData_dList.t_List) (dtb_u_u431 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u432 : Base_dSource.t_Span) (dtb_u_u433 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_missingCtors dtb_u_u426) dtb_u_u427) dtb_u_u429) dtb_u_u430) dtb_u_u433)) (fun (dtb_u_u434 : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u434) = 0) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dTc.v_tcCoverageMissing dtb_u_u432) dtb_u_u434)))))

# 626 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCoverage = (fun (dtb_u_u435 : Elab_dTypes.t_Ctx) (dtb_u_u436 : Elab_dTypes.t_Ec) (dtb_u_u437 : Elab_dTypes.t_DtData) (dtb_u_u438 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u439 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u440 : Base_dSource.t_Span) -> ((((((((v_checkCovered dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u438) (v_altNames dtb_u_u439)) dtb_u_u439) dtb_u_u440) (Elab_dTypes.v_dtDataCtors dtb_u_u437)))

# 646 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseDone = (fun (dtb_u_u441 : Elab_dTypes.t_Ec) (dtb_u_u442 : Elab_dTypes.t_Ctx) (dtb_u_u443 : Elab_dTypes.t_DtData) (dtb_u_u444 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u445 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u446 : Core_dTerm.t_Value) (dtb_u_u447 : Base_dSource.t_Span) (dtb_u_u448 : Core_dTerm.t_Term) (dtb_u_u449 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (v_hasCatchAll dtb_u_u445) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (dtb_u_u448, dtb_u_u449)); B_dData_dPair.f_Pair_second = dtb_u_u441 })) else ((Base_dCommon.v_bind ((((((v_checkCoverage dtb_u_u442) dtb_u_u441) dtb_u_u443) dtb_u_u444) dtb_u_u445) dtb_u_u447)) (fun (dtb_u_u450 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (dtb_u_u448, dtb_u_u449)); B_dData_dPair.f_Pair_second = dtb_u_u441 }))))))

# 657 "Vuna/Compiler/Elab/Case.vuna"
let v_branchRemovalSpan = (fun (dtb_u_u451 : Base_dSource.t_Span) (dtb_u_u452 : Frontend_dAst.t_Expr) -> { Base_dSource.f_Span_spanFile = (Base_dSource.v_spanFile dtb_u_u451); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine dtb_u_u451); Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = ((Base_dSource.v_spanEndLine (Frontend_dAst.v_exprSpan dtb_u_u452)) + 1); Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = ((Base_dSource.v_spanStartOffset dtb_u_u451) - ((Base_dSource.v_spanStartCol dtb_u_u451) - 1)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset (Frontend_dAst.v_exprSpan dtb_u_u452)) })

# 669 "Vuna/Compiler/Elab/Case.vuna"
let v_removeBranchSuggest = (fun (dtb_u_u453 : string) (dtb_u_u454 : Base_dSource.t_Span) (dtb_u_u455 : Frontend_dAst.t_Expr) (dtb_u_u456 : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = dtb_u_u453; Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = ((v_branchRemovalSpan dtb_u_u454) dtb_u_u455); Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) dtb_u_u456))

# 562 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCatchAll = (fun (dtb_u_u457 : Elab_dTypes.t_Ec) (dtb_u_u458 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u459 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (dtb_u_u460 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u461 : Base_dSource.t_Span) -> (match dtb_u_u460 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u457 }))
  | _ -> (if (v_hasLitHead dtb_u_u460) then (let dtb_u_u462 = ((((Elab_dUsage.v_warnAt0Mod dtb_u_u457) (((v_removeBranchSuggest "remove unreachable branch") dtb_u_u461) (B_dData_dPair.v_secondOf dtb_u_u459))) dtb_u_u461) Base_dDiagnostics_dWarning.C_WarnErr_WarnBranchAfterCatchAll) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u462 }))) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u461) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast))
))

# 527 "Vuna/Compiler/Elab/Case.vuna"
let rec v_checkCaseAltsGo = (fun (dtb_u_u463 : Elab_dTypes.t_Ec) (dtb_u_u464 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u465 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u466 = dtb_u_u465 in (match dtb_u_u466 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u467, dtb_u_u468) -> (match dtb_u_u467 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 } -> (match dtb_u_u469 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u471, dtb_u_u472, dtb_u_u473) -> (if ((v_ctorHeadCovered dtb_u_u471) dtb_u_u464) then (let dtb_u_u474 = (((((Elab_dUsage.v_warnAt1Mod dtb_u_u463) (((v_removeBranchSuggest "remove redundant constructor branch") (Frontend_dAst.v_nodeRefSpan dtb_u_u473)) dtb_u_u470)) (Frontend_dAst.v_nodeRefSpan dtb_u_u473)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantCtorBranch (dtb_u_u471))) dtb_u_u471) in (((v_checkCaseAltsGo dtb_u_u474) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468)) else (((v_checkCaseAltsGo dtb_u_u463) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u475, dtb_u_u476) -> (if ((v_litHeadCovered dtb_u_u469) dtb_u_u464) then (let dtb_u_u477 = (((((Elab_dUsage.v_warnAt1Mod dtb_u_u463) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb_u_u476)) dtb_u_u470)) (Frontend_dAst.v_nodeRefSpan dtb_u_u476)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb_u_u469)))) (v_litLabel dtb_u_u469)) in (((v_checkCaseAltsGo dtb_u_u477) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468)) else (((v_checkCaseAltsGo dtb_u_u463) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u478, dtb_u_u479) -> (if ((v_litHeadCovered dtb_u_u469) dtb_u_u464) then (let dtb_u_u480 = (((((Elab_dUsage.v_warnAt1Mod dtb_u_u463) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb_u_u479)) dtb_u_u470)) (Frontend_dAst.v_nodeRefSpan dtb_u_u479)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb_u_u469)))) (v_litLabel dtb_u_u469)) in (((v_checkCaseAltsGo dtb_u_u480) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468)) else (((v_checkCaseAltsGo dtb_u_u463) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u481, dtb_u_u482, dtb_u_u483) -> (((v_checkCaseAltsGo dtb_u_u463) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u484, dtb_u_u485) -> (((((v_checkCatchAll dtb_u_u463) dtb_u_u464) { B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }) dtb_u_u468) (Frontend_dAst.v_nodeRefSpan dtb_u_u485))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u486) -> (((((v_checkCatchAll dtb_u_u463) dtb_u_u464) { B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }) dtb_u_u468) (Frontend_dAst.v_nodeRefSpan dtb_u_u486))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u487, dtb_u_u488, dtb_u_u489) -> (((v_checkCaseAltsGo dtb_u_u463) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 }, dtb_u_u464))) dtb_u_u468)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u463 }))
  | _ -> failwith "DT: impossible branch"
)))

# 524 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseAltsFlat = (fun (dtb_u_u490 : Elab_dTypes.t_Ec) (dtb_u_u491 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkCaseAltsGo dtb_u_u490) B_dData_dList.C_List_Nil) (v_stripAsPats dtb_u_u491)))
