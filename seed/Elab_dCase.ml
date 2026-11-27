open Vuna_runtime
type t_BranchVerdict = C_BranchVerdict_BranchOk | C_BranchVerdict_BranchImpossibleIndex | C_BranchVerdict_BranchImpossibleEmptyCtx

# 44 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyErr = (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex) B_dData_dVec.C_Vec_Nil)))

# 76 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelMax = 1000000

# 112 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatCtor = (fun (c : string) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then true else (c = Base_dIntrinsics.v_natSuccCtor)))

# 103 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxIsNatHead = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VApp (dtb__0, dtb__1) -> (v_idxIsNatHead dtb__0)
  | Core_dTerm.C_Value_VNeutral (dtb__2) -> (match dtb__2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__3, dtb__4) -> (v_idxIsNatCtor dtb__3)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__5, dtb__6) -> (v_idxIsNatCtor dtb__5)
  | _ -> false
))

# 145 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatSuccHead = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__7) -> (match dtb__7 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__8, dtb__9) -> (dtb__8 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__10, dtb__11) -> (dtb__10 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
))

# 119 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxNatPrefixGo = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 100000 else (match v with
  | Core_dTerm.C_Value_VCon (dtb__12, dtb__13) -> (if (dtb__12 = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut4 = dtb__13 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_idxNatPrefixGo (fuel - 1)) dtb__14))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | Core_dTerm.C_Value_VNeutral (dtb__16) -> (match dtb__16 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__17, dtb__18) -> (if (dtb__17 = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut5 = dtb__18 in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_idxNatPrefixGo (fuel - 1)) dtb__19))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | _ -> 0
)
  | Core_dTerm.C_Value_VApp (dtb__21, dtb__22) -> (if (v_idxIsNatSuccHead dtb__21) then (1 + ((v_idxNatPrefixGo (fuel - 1)) dtb__22)) else 0)
  | _ -> 0
)))

# 116 "Vuna/Compiler/Elab/Case.vuna"
let v_idxNatPrefixDepth = (fun (v : Core_dTerm.t_Value) -> ((v_idxNatPrefixGo 100000) v))

# 79 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxNatDepthOfList = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (let d = (v_idxNatDepthNear dtb__23) in (let r = (v_idxNatDepthOfList dtb__24) in (if (d >= r) then d else r)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 89 "Vuna/Compiler/Elab/Case.vuna"
and v_idxNatDepthNear = (fun (v : Core_dTerm.t_Value) -> (if (v_idxIsNatHead v) then (v_idxNatPrefixDepth v) else (match v with
  | Core_dTerm.C_Value_VCon (dtb__25, dtb__26) -> (v_idxNatDepthOfList dtb__26)
  | Core_dTerm.C_Value_VNeutral (dtb__27) -> (match dtb__27 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__28, dtb__29) -> (v_idxNatDepthOfList dtb__29)
  | Core_dTerm.C_Neutral_NVar (dtb__30, dtb__31, dtb__32) -> (v_idxNatDepthOfList dtb__32)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VApp (dtb__33, dtb__34) -> (if (v_idxIsNatHead dtb__34) then (v_idxNatPrefixDepth dtb__34) else 0)
  | _ -> 0
)))

# 70 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelFor = (fun (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> (let need = (512 + (4 * ((v_idxNatDepthOfList xs) + (v_idxNatDepthOfList ys)))) in (if (need > v_idxFuelMax) then v_idxFuelMax else need)))

# 208 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFreshLevel = (fun (depth : int) (lvl : int) -> (if (depth = lvl) then (lvl + 1) else depth))

# 181 "Vuna/Compiler/Elab/Case.vuna"
let rec v_occursLevel = (fun (fuel : int) (depth : int) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then true else (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__35) -> (match dtb__35 with
  | Core_dTerm.C_Neutral_NVar (dtb__36, dtb__37, dtb__38) -> (if (dtb__37 = lvl) then true else ((((v_occursLevelList (fuel - 1)) depth) lvl) dtb__38))
  | Core_dTerm.C_Neutral_NGlobal (dtb__39, dtb__40) -> ((((v_occursLevelList (fuel - 1)) depth) lvl) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__44) then true else ((((v_occursLevel (fuel - 1)) depth) lvl) ((Core_dEval.v_applyClosure dtb__45) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_occurs", ((v_occursFreshLevel depth) lvl), B_dData_dList.C_List_Nil)))))))
  | Core_dTerm.C_Value_VLam (dtb__46, dtb__47, dtb__48) -> ((((v_occursLevel (fuel - 1)) depth) lvl) ((Core_dEval.v_applyClosure dtb__48) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_occurs", ((v_occursFreshLevel depth) lvl), B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VMeta (dtb__49, dtb__50) -> ((((v_occursLevelList (fuel - 1)) depth) lvl) dtb__50)
  | Core_dTerm.C_Value_VCon (dtb__51, dtb__52) -> ((((v_occursLevelList (fuel - 1)) depth) lvl) dtb__52)
  | Core_dTerm.C_Value_VApp (dtb__53, dtb__54) -> (if ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__53) then true else ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__54))
  | Core_dTerm.C_Value_VCase (dtb__55, dtb__56) -> ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__55)
  | Core_dTerm.C_Value_VProj (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__57)
  | Core_dTerm.C_Value_VIf (dtb__62, dtb__63, dtb__64) -> (if (if ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__62) then true else ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__63)) then true else ((((v_occursLevel (fuel - 1)) depth) lvl) dtb__64))
  | Core_dTerm.C_Value_VType (dtb__65) -> false
  | Core_dTerm.C_Value_VInt (dtb__66) -> false
  | Core_dTerm.C_Value_VStr (dtb__67) -> false
  | Core_dTerm.C_Value_VFloat (dtb__68) -> false
  | Core_dTerm.C_Value_VBool (dtb__69) -> false
  | _ -> failwith "DT: impossible branch"
)))
# 211 "Vuna/Compiler/Elab/Case.vuna"
and v_occursLevelList = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (if ((((v_occursLevel (mc0 - 1)) mc1) mc2) dtb__70) then true else ((((v_occursLevelList (mc0 - 1)) mc1) mc2) dtb__71))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFuel = 1000000

# 259 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxConv = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__72) -> (Base_dDiag.C_Check_OkC (acc))
  | Base_dDiag.C_Check_ErrC (dtb__73) -> v_unifyErr
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Case.vuna"
let rec v_unifyIdxList = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (fuel : int) (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_IndexFuel) B_dData_dVec.C_Vec_Nil))) else ((((((v_unifyIdxListGo ec) acc) depth) fuel) xs) ys)))
# 52 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdxListGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : int) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((Base_dCommon.v_bind ((((((v_unifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__74) dtb__76)) (fun (acc2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_unifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__75) dtb__77)))
  | _ -> v_unifyErr
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> v_unifyErr
)
  | _ -> failwith "DT: impossible branch"
))
# 154 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdx = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_IndexFuel) B_dData_dVec.C_Vec_Nil))) else (let a2 = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue acc) Core_dTerm.v_defaultFuel) a)) in (let b2 = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue acc) Core_dTerm.v_defaultFuel) b)) in (let nd_uscrut8 = a2 in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__78) -> (match dtb__78 with
  | Core_dTerm.C_Neutral_NVar (dtb__79, dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut14 = b2 in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VNeutral (dtb__82) -> (match dtb__82 with
  | Core_dTerm.C_Neutral_NVar (dtb__83, dtb__84, dtb__85) -> (match dtb__85 with
  | B_dData_dList.C_List_Nil -> (if (dtb__80 = dtb__84) then (Base_dDiag.C_Check_OkC (acc)) else (if (dtb__80 < dtb__84) then (if ((((v_occursLevel v_occursFuel) depth) dtb__84) a2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = a2 }, acc))))) else (if ((((v_occursLevel v_occursFuel) depth) dtb__80) b2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = b2 }, acc)))))))
  | _ -> (if ((((v_occursLevel v_occursFuel) depth) dtb__80) b2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_occursLevel v_occursFuel) depth) dtb__80) b2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_occursLevel v_occursFuel) depth) dtb__80) b2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = b2 }, acc)))))
))
  | _ -> (let nd_uscrut13 = b2 in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__86) -> (match dtb__86 with
  | Core_dTerm.C_Neutral_NVar (dtb__87, dtb__88, dtb__89) -> (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) depth) dtb__88) a2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = a2 }, acc)))))
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
))
)
  | _ -> (let nd_uscrut10 = b2 in (match nd_uscrut10 with
  | Core_dTerm.C_Value_VNeutral (dtb__90) -> (match dtb__90 with
  | Core_dTerm.C_Neutral_NVar (dtb__91, dtb__92, dtb__93) -> (match dtb__93 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) depth) dtb__92) a2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = a2 }, acc)))))
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
))
)
  | _ -> (let nd_uscrut9 = b2 in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VNeutral (dtb__94) -> (match dtb__94 with
  | Core_dTerm.C_Neutral_NVar (dtb__95, dtb__96, dtb__97) -> (match dtb__97 with
  | B_dData_dList.C_List_Nil -> (if ((((v_occursLevel v_occursFuel) depth) dtb__96) a2) then v_unifyErr else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = a2 }, acc)))))
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_unifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
))
))))))
# 222 "Vuna/Compiler/Elab/Case.vuna"
and v_unifyIdxRigid = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then v_unifyErr else (let nd_uscrut6 = a in (match nd_uscrut6 with
  | Core_dTerm.C_Value_VBool (dtb__98) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__99) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__98) dtb__99) then (Base_dDiag.C_Check_OkC (acc)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VFloat (dtb__100) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__101) -> (if (dtb__100 = dtb__101) then (Base_dDiag.C_Check_OkC (acc)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VStr (dtb__102) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__103) -> (if (dtb__102 = dtb__103) then (Base_dDiag.C_Check_OkC (acc)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VInt (dtb__104) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__105) -> (if (dtb__104 = dtb__105) then (Base_dDiag.C_Check_OkC (acc)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VType (dtb__106) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__107) -> (if ((Core_dTerm.v_levelEq dtb__106) dtb__107) then (Base_dDiag.C_Check_OkC (acc)) else v_unifyErr)
  | _ -> v_unifyErr
)
  | Core_dTerm.C_Value_VNeutral (dtb__108) -> (match dtb__108 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__109, dtb__110) -> (let nd_uscrut10 = b in (match nd_uscrut10 with
  | Core_dTerm.C_Value_VNeutral (dtb__111) -> (match dtb__111 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__112, dtb__113) -> (if (dtb__109 = dtb__112) then ((((((v_unifyIdxList ec) acc) depth) (fuel - 1)) dtb__110) dtb__113) else (((((v_unifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_unifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_unifyIdxConv ec) acc) depth) a) b)
))
  | _ -> (((((v_unifyIdxConv ec) acc) depth) a) b)
)
  | Core_dTerm.C_Value_VCon (dtb__114, dtb__115) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__116, dtb__117) -> (if (dtb__114 = dtb__116) then ((((((v_unifyIdxList ec) acc) depth) (fuel - 1)) dtb__115) dtb__117) else v_unifyErr)
  | _ -> v_unifyErr
)
  | _ -> (((((v_unifyIdxConv ec) acc) depth) a) b)
))))

# 67 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxListSized = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_unifyIdxList ec) acc) depth) ((v_idxFuelFor xs) ys)) xs) ys))

# 279 "Vuna/Compiler/Elab/Case.vuna"
let v_branchIsReachable = (fun (mc0 : t_BranchVerdict) -> (match mc0 with
  | C_BranchVerdict_BranchOk -> true
  | _ -> false
))

# 321 "Vuna/Compiler/Elab/Case.vuna"
let rec v_firstColumnEnv = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) -> (let dtnat__118 = mc0 in (if (dtnat__118 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb__119 = (dtnat__118 - 1) in (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if dtb__121 then (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__120) dtb__123) mc2) in (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__120, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in ((((v_firstColumnEnv dtb__119) mc1) ctx2) ((Core_dEval.v_applyClosure dtb__124) v)))) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__123 })))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))))

# 356 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_wildArgs = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild (Frontend_dAst.v_noNodeRef)), (v_wildArgs (n - 1))))))

# 360 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorExplicitArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> (if dtb__126 then (v_ctorExplicitArity dtb__129) else (1 + (v_ctorExplicitArity dtb__129)))
  | _ -> 0
))

# 395 "Vuna/Compiler/Elab/Case.vuna"
let rec v_rigidIdxVals = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (if (v_isRigidVal dtb__130) then (v_rigidIdxVals dtb__131) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 399 "Vuna/Compiler/Elab/Case.vuna"
and v_isRigidVal = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__132) -> true
  | Core_dTerm.C_Value_VFloat (dtb__133) -> true
  | Core_dTerm.C_Value_VStr (dtb__134) -> true
  | Core_dTerm.C_Value_VInt (dtb__135) -> true
  | Core_dTerm.C_Value_VType (dtb__136) -> true
  | Core_dTerm.C_Value_VCon (dtb__137, dtb__138) -> (v_rigidIdxVals dtb__138)
  | _ -> false
))

# 427 "Vuna/Compiler/Elab/Case.vuna"
let rec v_bindCtorGo = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Term) (subpats : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : Core_dTerm.t_Binder B_dData_dList.t_List) -> (match ty with
  | Core_dTerm.C_Term_TPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> (let domVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__142) in (if dtb__140 then (let famName = (dtb__139 ^ "#fam") in (let ctx2 = (((Elab_dTypes.v_ctxBindValue famName) domVal) ctx) in ((((((v_bindCtorGo cname) fields) ctx2) dtb__143) subpats) (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.v_binderOfPair { B_dData_dPair.f_Pair_first = famName; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }), acc))))) else (match subpats with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CaseBranchTooFewArgs ("", ""))) (B_dData_dVec.C_Vec__x58__x58_ (cname, (B_dData_dVec.C_Vec__x58__x58_ (((B_dData_dString.v_join ", ") fields), B_dData_dVec.C_Vec_Nil)))))))
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | Frontend_dAst.C_Pat_PVar (dtb__146, dtb__147) -> ((((((((((v_bindCtorField cname) ((B_dData_dList.v_drop 1) fields)) ctx) dtb__141) domVal) dtb__143) dtb__146) ((Base_dSource.v_spanAtName dtb__146) (Frontend_dAst.v_nodeRefSpan dtb__147))) dtb__145) acc)
  | Frontend_dAst.C_Pat_PWild (dtb__148) -> ((((((((((v_bindCtorField cname) ((B_dData_dList.v_drop 1) fields)) ctx) dtb__141) domVal) dtb__143) "_") (Frontend_dAst.v_nodeRefSpan dtb__148)) dtb__145) acc)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__144)) Base_dDiagnostics_dTc.C_TcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ctx; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = subpats } }))
))
# 455 "Vuna/Compiler/Elab/Case.vuna"
and v_bindCtorField = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (rig : Core_dTerm.t_Rig) (domVal : Core_dTerm.t_Value) (cod : Core_dTerm.t_Term) (binderName : string) (binderSp : Base_dSource.t_Span) (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : Core_dTerm.t_Binder B_dData_dList.t_List) -> (let ctx2 = (((Elab_dTypes.v_ctxBindValue binderName) domVal) ctx) in ((((((v_bindCtorGo cname) fields) ctx2) cod) rest) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = binderName; Core_dTerm.f_Binder_binderRig = rig; Core_dTerm.f_Binder_binderSpan = binderSp }, acc)))))

# 424 "Vuna/Compiler/Elab/Case.vuna"
let v_bindCtorTele = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Term) (subpats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((((((v_bindCtorGo cname) fields) ctx) ty) subpats) B_dData_dList.C_List_Nil))

# 450 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_ctorExplicitNames = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (if dtb__150 then (v_ctorExplicitNames dtb__153) else (B_dData_dList.C_List__x58__x58_ (dtb__149, (v_ctorExplicitNames dtb__153))))
  | _ -> B_dData_dList.C_List_Nil
))

# 462 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_freshTeleVals = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__156, (mc1 + mc2), B_dData_dList.C_List_Nil)))), (((v_freshTeleVals dtb__155) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultTerms = (fun (c : Elab_dTypes.t_DtCtor) -> (match (Elab_dMeta.v_resultSpine (Elab_dTypes.v_dtCtorType c)) with
  | { B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = dtb__159 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultVals = (fun (c : Elab_dTypes.t_DtCtor) (base : int) -> (let tele = (Elab_dTypes.v_dtCtorTelescope c) in (let env = (B_dData_dList.v_reverse (((v_freshTeleVals tele) base) 0)) in ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Core_dEval.v_eval env) t))) (v_ctorResultTerms c)))))

# 411 "Vuna/Compiler/Elab/Case.vuna"
let rec v_allCtorsUnsatisfiableGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (match (((((v_unifyIdxListSized mc0) B_dData_dList.C_List_Nil) mc3) ((v_ctorResultVals dtb__160) mc3)) mc2) with
  | Base_dDiag.C_Check_OkC (dtb__162) -> false
  | Base_dDiag.C_Check_ErrC (dtb__163) -> ((((v_allCtorsUnsatisfiableGo mc0) dtb__161) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Elab/Case.vuna"
let v_allCtorsUnsatisfiable = (fun (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (depth : int) -> ((((v_allCtorsUnsatisfiableGo ec) (Elab_dTypes.v_dtDataCtors dd)) idxs) depth))

# 377 "Vuna/Compiler/Elab/Case.vuna"
let v_isEmptyFamilyValue = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__164) -> (match dtb__164 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__165, dtb__166) -> (if (B_dData_dBool.v_not (v_rigidIdxVals dtb__166)) then false else (match ((Elab_dMeta.v_dtDataLookup dtb__165) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> ((((v_allCtorsUnsatisfiable ec) dtb__167) dtb__166) depth)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

# 369 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctxHasEmptyBinderAt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (if (((v_isEmptyFamilyValue mc0) (Elab_dTypes.v_ctxDepth mc1)) (((Elab_dTypes.v_varTypeValue mc1) mc2) dtb__171)) then true else ((((v_ctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Elab/Case.vuna"
let v_ctxHasEmptyBinder = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) -> ((((v_ctxHasEmptyBinderAt ec) ctx) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 284 "Vuna/Compiler/Elab/Case.vuna"
let v_branchAfterUnify = (fun (ec : Elab_dTypes.t_Ec) (branchCtx : Elab_dTypes.t_Ctx) (refs : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((v_ctxHasEmptyBinder ec) ((Elab_dTypes.v_ctxRefine branchCtx) refs)) then C_BranchVerdict_BranchImpossibleEmptyCtx else C_BranchVerdict_BranchOk))

# 477 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultValsIn = (fun (ctx : Elab_dTypes.t_Ctx) (c : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Elab_dTypes.v_evalCtx ctx) t))) (v_ctorResultTerms c)))

# 291 "Vuna/Compiler/Elab/Case.vuna"
let v_branchVerdict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((v_bindCtorTele (Elab_dTypes.v_dtCtorName ctor)) (v_ctorExplicitNames (Elab_dTypes.v_dtCtorType ctor))) ctx) (Elab_dTypes.v_dtCtorType ctor)) (v_wildArgs (v_ctorExplicitArity (Elab_dTypes.v_dtCtorType ctor))))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dAst.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut5 = p in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> (match dtb__173 with
  | { B_dData_dPair.f_Pair_first = dtb__174; B_dData_dPair.f_Pair_second = dtb__175 } -> (if (Elab_dMeta.v_nonEmpty dtb__175) then (Base_dDiag.v_icInternal "case coverage: constructor telescope arity mismatch") else (match (((((v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__172)) ((v_ctorResultValsIn dtb__172) ctor)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)) with
  | Base_dDiag.C_Check_ErrC (dtb__176) -> (if ((dtb__176).Base_dDiag.f_Diagnostic_diagCode = (Base_dDiagnostics_dTc.v_tcCode Base_dDiagnostics_dTc.C_TcErr_IndexFuel)) then (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchOk)) else (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchImpossibleIndex)))
  | Base_dDiag.C_Check_OkC (dtb__177) -> (Base_dDiag.C_Check_OkC ((((v_branchAfterUnify ec) dtb__172) dtb__177)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 307 "Vuna/Compiler/Elab/Case.vuna"
let v_branchReachable = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind ((((v_branchVerdict ctx) ec) idxs) ctor)) (fun (v : t_BranchVerdict) -> (Base_dDiag.C_Check_OkC ((v_branchIsReachable v))))))

# 349 "Vuna/Compiler/Elab/Case.vuna"
let rec v_firstColumnCoverGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc4 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> ((Base_dCommon.v_bind ((((v_branchReachable mc0) mc1) mc2) dtb__178)) (fun (ok : bool) -> ((((((v_firstColumnCoverGo mc0) mc1) mc2) dtb__179) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__178); B_dData_dPair.f_Pair_second = (v_ctorExplicitArity (Elab_dTypes.v_dtCtorType dtb__178)) }, mc4))) (if ok then (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtCtorName dtb__178), mc5)) else mc5))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc5) }))))
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Case.vuna"
let v_firstColumnCover = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) -> (let nd_uscrut3 = ((((v_firstColumnEnv (bi_natFromInt 512)) ec) ctx) ty) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (match dtb__180 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (let nd_uscrut10 = ((Elab_dTypes.v_forceVal ec) dtb__182) in (match nd_uscrut10 with
  | Core_dTerm.C_Value_VNeutral (dtb__183) -> (match dtb__183 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__184, dtb__185) -> (match ((Elab_dMeta.v_dtDataLookup dtb__184) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> ((((((v_firstColumnCoverGo dtb__181) ec) dtb__185) (Elab_dTypes.v_dtDataCtors dtb__186)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 494 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_teleValsFrom = (fun (low : int) (k : int) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_tele", low, B_dData_dList.C_List_Nil)))), ((v_teleValsFrom (low + 1)) (k - 1))))))

# 488 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorValueIn = (fun (ctx : Elab_dTypes.t_Ctx) (c : Elab_dTypes.t_DtCtor) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName c), ((v_teleValsFrom ((Elab_dTypes.v_ctxDepth ctx) - (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope c)))) (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope c))))))

# 506 "Vuna/Compiler/Elab/Case.vuna"
let v_reflectScrutinee = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (refs : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctorVal : Core_dTerm.t_Value) (scrutVal : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue refs) Core_dTerm.v_defaultFuel) scrutVal)) with
  | Core_dTerm.C_Value_VNeutral (dtb__187) -> (let nd_uscrut6 = dtb__187 in (match nd_uscrut6 with
  | Core_dTerm.C_Neutral_NVar (dtb__188, dtb__189, dtb__190) -> (match dtb__190 with
  | B_dData_dList.C_List_Nil -> ((((((v_unifyIdx ec) refs) depth) Core_dTerm.v_defaultFuel) (Core_dTerm.C_Value_VNeutral (dtb__187))) ctorVal)
  | _ -> (Base_dDiag.C_Check_OkC (refs))
)
  | _ -> (Base_dDiag.C_Check_OkC (refs))
))
  | _ -> (Base_dDiag.C_Check_OkC (refs))
))

# 525 "Vuna/Compiler/Elab/Case.vuna"
let v_patIrrefutable = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__191) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__192, dtb__193) -> true
  | _ -> false
))

# 530 "Vuna/Compiler/Elab/Case.vuna"
let rec v_patsAllIrrefutable = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (if (v_patIrrefutable dtb__194) then (v_patsAllIrrefutable dtb__195) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorHeadCovered = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> (match dtb__198 with
  | Frontend_dAst.C_Pat_PCon (dtb__200, dtb__201, dtb__202) -> (if (if (dtb__200 = mc0) then (v_patsAllIrrefutable dtb__201) else false) then true else ((v_ctorHeadCovered mc0) dtb__197))
  | _ -> ((v_ctorHeadCovered mc0) dtb__197)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Case.vuna"
let v_litPatEq = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__203, dtb__204) -> (match mc1 with
  | Frontend_dAst.C_Pat_PStr (dtb__205, dtb__206) -> (dtb__203 = dtb__205)
  | _ -> false
)
  | Frontend_dAst.C_Pat_PInt (dtb__207, dtb__208) -> (match mc1 with
  | Frontend_dAst.C_Pat_PInt (dtb__209, dtb__210) -> (dtb__207 = dtb__209)
  | _ -> false
)
  | _ -> false
))

# 541 "Vuna/Compiler/Elab/Case.vuna"
let rec v_litHeadCovered = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (if ((v_litPatEq mc0) dtb__213) then true else ((v_litHeadCovered mc0) dtb__212))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 556 "Vuna/Compiler/Elab/Case.vuna"
let v_litLabel = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__215, dtb__216) -> (String.concat "" ["\""; dtb__215; "\""])
  | Frontend_dAst.C_Pat_PInt (dtb__217, dtb__218) -> (string_of_int dtb__217)
  | _ -> ""
))

# 565 "Vuna/Compiler/Elab/Case.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__219, dtb__220, dtb__221) -> (v_stripAsPat dtb__220)
  | _ -> mc0
))

# 570 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_stripAsPats = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | { B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__225 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripAsPat dtb__224); B_dData_dPair.f_Pair_second = dtb__225 }, (v_stripAsPats dtb__223)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasLitHead = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> (match dtb__228 with
  | Frontend_dAst.C_Pat_PInt (dtb__230, dtb__231) -> true
  | Frontend_dAst.C_Pat_PStr (dtb__232, dtb__233) -> true
  | _ -> (v_hasLitHead dtb__227)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Elab/Case.vuna"
let[@tail_mod_cons] rec v_altNames = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (match dtb__236 with
  | Frontend_dAst.C_Pat_PCon (dtb__238, dtb__239, dtb__240) -> (B_dData_dList.C_List__x58__x58_ (dtb__238, (v_altNames dtb__235)))
  | _ -> (v_altNames dtb__235)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasCatchAll = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match dtb__241 with
  | { B_dData_dPair.f_Pair_first = dtb__243; B_dData_dPair.f_Pair_second = dtb__244 } -> (match dtb__243 with
  | Frontend_dAst.C_Pat_PVar (dtb__245, dtb__246) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__247) -> true
  | _ -> (v_hasCatchAll dtb__242)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedArg = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> (match dtb__248 with
  | Frontend_dAst.C_Pat_PVar (dtb__250, dtb__251) -> (v_anyNestedArg dtb__249)
  | Frontend_dAst.C_Pat_PWild (dtb__252) -> (v_anyNestedArg dtb__249)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Case.vuna"
let v_nestedInPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PCon (dtb__253, dtb__254, dtb__255) -> (v_anyNestedArg dtb__254)
  | _ -> false
))

# 654 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedPat = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match dtb__256 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (if (v_nestedInPat dtb__258) then true else (v_anyNestedPat dtb__257))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 692 "Vuna/Compiler/Elab/Case.vuna"
let rec v_missingCtors = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtCtorName dtb__260)) mc3) then (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__261) else ((Base_dCommon.v_bind ((((v_branchReachable mc0) mc1) mc2) dtb__260)) (fun (reachable : bool) -> (if reachable then ((Base_dCommon.v_bind (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__261)) (fun (tail : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorDisplayName (Elab_dTypes.v_dtCtorName dtb__260)); B_dData_dPair.f_Pair_second = (dtb__260).Elab_dTypes.f_DtCtor_dtCtorSpan }, tail)))))) else (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__261)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCovered = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (written : string B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_missingCtors ctx) ec) idxs) written) ctors)) (fun (missing : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length missing) = 0) then (Base_dDiag.C_Check_OkC (Elab_dCoverage.C_CoverVerdict_CoverProved)) else ((Base_dDiagnostics_dTc.v_tcCoverageMissing sp) missing)))))

# 682 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCoverage = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((v_checkCovered ctx) ec) dd) idxs) (v_altNames alts)) alts) sp) (Elab_dTypes.v_dtDataCtors dd)))

# 702 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseDone = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (scrutTerm : Core_dTerm.t_Term) (altTerms : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (v_hasCatchAll alts) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (scrutTerm, altTerms)); B_dData_dPair.f_Pair_second = ec })) else ((Base_dCommon.v_bind ((((((v_checkCoverage ctx) ec) dd) idxs) alts) sp)) (fun (_u : Elab_dCoverage.t_CoverVerdict) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (scrutTerm, altTerms)); B_dData_dPair.f_Pair_second = ec }))))))

# 713 "Vuna/Compiler/Elab/Case.vuna"
let v_branchRemovalSpan = (fun (patSpan : Base_dSource.t_Span) (body : Frontend_dAst.t_Expr) -> { Base_dSource.f_Span_spanFile = (Base_dSource.v_spanFile patSpan); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine patSpan); Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = ((Base_dSource.v_spanEndLine (Frontend_dAst.v_exprSpan body)) + 1); Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = ((Base_dSource.v_spanStartOffset patSpan) - ((Base_dSource.v_spanStartCol patSpan) - 1)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset (Frontend_dAst.v_exprSpan body)) })

# 725 "Vuna/Compiler/Elab/Case.vuna"
let v_removeBranchSuggest = (fun (title : string) (patSpan : Base_dSource.t_Span) (body : Frontend_dAst.t_Expr) (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = title; Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = ((v_branchRemovalSpan patSpan) body); Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) d))

# 613 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCatchAll = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (mc3 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> (if (v_hasLitHead mc3) then (let ec1 = ((((Elab_dUsage.v_warnAt0Mod mc0) (((v_removeBranchSuggest "remove unreachable branch") mc4) (B_dData_dPair.v_secondOf mc2))) mc4) Base_dDiagnostics_dWarning.C_WarnErr_WarnBranchAfterCatchAll) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = ec1 }))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast))
))

# 578 "Vuna/Compiler/Elab/Case.vuna"
let rec v_checkCaseAltsGo = (fun (ec : Elab_dTypes.t_Ec) (prevs : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = alts in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (match dtb__264 with
  | Frontend_dAst.C_Pat_PCon (dtb__266, dtb__267, dtb__268) -> (if ((v_ctorHeadCovered dtb__266) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant constructor branch") (Frontend_dAst.v_nodeRefSpan dtb__268)) dtb__265)) (Frontend_dAst.v_nodeRefSpan dtb__268)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantCtorBranch (dtb__266))) dtb__266) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263))
  | Frontend_dAst.C_Pat_PInt (dtb__269, dtb__270) -> (if ((v_litHeadCovered dtb__264) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb__270)) dtb__265)) (Frontend_dAst.v_nodeRefSpan dtb__270)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb__264)))) (v_litLabel dtb__264)) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263))
  | Frontend_dAst.C_Pat_PStr (dtb__271, dtb__272) -> (if ((v_litHeadCovered dtb__264) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb__272)) dtb__265)) (Frontend_dAst.v_nodeRefSpan dtb__272)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb__264)))) (v_litLabel dtb__264)) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263))
  | Frontend_dAst.C_Pat_PAs (dtb__273, dtb__274, dtb__275) -> (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263)
  | Frontend_dAst.C_Pat_PVar (dtb__276, dtb__277) -> (((((v_checkCatchAll ec) prevs) { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }) dtb__263) (Frontend_dAst.v_nodeRefSpan dtb__277))
  | Frontend_dAst.C_Pat_PWild (dtb__278) -> (((((v_checkCatchAll ec) prevs) { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }) dtb__263) (Frontend_dAst.v_nodeRefSpan dtb__278))
  | Frontend_dAst.C_Pat_PRecord (dtb__279, dtb__280, dtb__281) -> (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 }, prevs))) dtb__263)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = ec }))
  | _ -> failwith "DT: impossible branch"
)))

# 575 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseAltsFlat = (fun (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkCaseAltsGo ec) B_dData_dList.C_List_Nil) (v_stripAsPats alts)))
