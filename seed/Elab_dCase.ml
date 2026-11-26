open Vuna_runtime
type t_BranchVerdict = C_BranchVerdict_BranchOk | C_BranchVerdict_BranchImpossibleIndex | C_BranchVerdict_BranchImpossibleEmptyCtx

# 38 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyErr = (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex) B_dData_dVec.C_Vec_Nil)))

# 70 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelMax = 1000000

# 106 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatCtor = (fun (c : string) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then true else (c = Base_dIntrinsics.v_natSuccCtor)))

# 97 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxIsNatHead = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VApp (dtb__0, dtb__1) -> (v_idxIsNatHead dtb__0)
  | Core_dTerm.C_Value_VNeutral (dtb__2) -> (match dtb__2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__3, dtb__4) -> (v_idxIsNatCtor dtb__3)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__5, dtb__6) -> (v_idxIsNatCtor dtb__5)
  | _ -> false
))

# 139 "Vuna/Compiler/Elab/Case.vuna"
let v_idxIsNatSuccHead = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__7) -> (match dtb__7 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__8, dtb__9) -> (dtb__8 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__10, dtb__11) -> (dtb__10 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
))

# 113 "Vuna/Compiler/Elab/Case.vuna"
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

# 110 "Vuna/Compiler/Elab/Case.vuna"
let v_idxNatPrefixDepth = (fun (v : Core_dTerm.t_Value) -> ((v_idxNatPrefixGo 100000) v))

# 73 "Vuna/Compiler/Elab/Case.vuna"
let rec v_idxNatDepthOfList = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (let d = (v_idxNatDepthNear dtb__23) in (let r = (v_idxNatDepthOfList dtb__24) in (if (d >= r) then d else r)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Elab/Case.vuna"
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

# 64 "Vuna/Compiler/Elab/Case.vuna"
let v_idxFuelFor = (fun (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> (let need = (512 + (4 * ((v_idxNatDepthOfList xs) + (v_idxNatDepthOfList ys)))) in (if (need > v_idxFuelMax) then v_idxFuelMax else need)))

# 202 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFreshLevel = (fun (depth : int) (lvl : int) -> (if (depth = lvl) then (lvl + 1) else depth))

# 175 "Vuna/Compiler/Elab/Case.vuna"
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
# 205 "Vuna/Compiler/Elab/Case.vuna"
and v_occursLevelList = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (if ((((v_occursLevel (mc0 - 1)) mc1) mc2) dtb__70) then true else ((((v_occursLevelList (mc0 - 1)) mc1) mc2) dtb__71))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Elab/Case.vuna"
let v_occursFuel = 1000000

# 253 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxConv = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__72) -> (Base_dDiag.C_Check_OkC (acc))
  | Base_dDiag.C_Check_ErrC (dtb__73) -> v_unifyErr
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Case.vuna"
let rec v_unifyIdxList = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (fuel : int) (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_IndexFuel) B_dData_dVec.C_Vec_Nil))) else ((((((v_unifyIdxListGo ec) acc) depth) fuel) xs) ys)))
# 46 "Vuna/Compiler/Elab/Case.vuna"
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
# 148 "Vuna/Compiler/Elab/Case.vuna"
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
# 216 "Vuna/Compiler/Elab/Case.vuna"
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

# 61 "Vuna/Compiler/Elab/Case.vuna"
let v_unifyIdxListSized = (fun (ec : Elab_dTypes.t_Ec) (acc : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (xs : Core_dTerm.t_Value B_dData_dList.t_List) (ys : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_unifyIdxList ec) acc) depth) ((v_idxFuelFor xs) ys)) xs) ys))

# 273 "Vuna/Compiler/Elab/Case.vuna"
let v_branchIsReachable = (fun (mc0 : t_BranchVerdict) -> (match mc0 with
  | C_BranchVerdict_BranchOk -> true
  | _ -> false
))

# 305 "Vuna/Compiler/Elab/Case.vuna"
let rec v_wildArgs = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild (Frontend_dAst.v_noNodeRef)), (v_wildArgs (n - 1))))))

# 309 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorExplicitArity = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if dtb__119 then (v_ctorExplicitArity dtb__122) else (1 + (v_ctorExplicitArity dtb__122)))
  | _ -> 0
))

# 344 "Vuna/Compiler/Elab/Case.vuna"
let rec v_rigidIdxVals = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (if (v_isRigidVal dtb__123) then (v_rigidIdxVals dtb__124) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 348 "Vuna/Compiler/Elab/Case.vuna"
and v_isRigidVal = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__125) -> true
  | Core_dTerm.C_Value_VFloat (dtb__126) -> true
  | Core_dTerm.C_Value_VStr (dtb__127) -> true
  | Core_dTerm.C_Value_VInt (dtb__128) -> true
  | Core_dTerm.C_Value_VType (dtb__129) -> true
  | Core_dTerm.C_Value_VCon (dtb__130, dtb__131) -> (v_rigidIdxVals dtb__131)
  | _ -> false
))

# 376 "Vuna/Compiler/Elab/Case.vuna"
let rec v_bindCtorGo = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Term) (subpats : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : Core_dTerm.t_Binder B_dData_dList.t_List) -> (match ty with
  | Core_dTerm.C_Term_TPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (let domVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__135) in (if dtb__133 then (let famName = (dtb__132 ^ "#fam") in (let ctx2 = (((Elab_dTypes.v_ctxBindValue famName) domVal) ctx) in ((((((v_bindCtorGo cname) fields) ctx2) dtb__136) subpats) (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.v_binderOfPair { B_dData_dPair.f_Pair_first = famName; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }), acc))))) else (match subpats with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CaseBranchTooFewArgs ("", ""))) (B_dData_dVec.C_Vec__x58__x58_ (cname, (B_dData_dVec.C_Vec__x58__x58_ (((B_dData_dString.v_join ", ") fields), B_dData_dVec.C_Vec_Nil)))))))
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match dtb__137 with
  | Frontend_dAst.C_Pat_PVar (dtb__139, dtb__140) -> ((((((((((v_bindCtorField cname) ((B_dData_dList.v_drop 1) fields)) ctx) dtb__134) domVal) dtb__136) dtb__139) ((Base_dSource.v_spanAtName dtb__139) (Frontend_dAst.v_nodeRefSpan dtb__140))) dtb__138) acc)
  | Frontend_dAst.C_Pat_PWild (dtb__141) -> ((((((((((v_bindCtorField cname) ((B_dData_dList.v_drop 1) fields)) ctx) dtb__134) domVal) dtb__136) "_") (Frontend_dAst.v_nodeRefSpan dtb__141)) dtb__138) acc)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__137)) Base_dDiagnostics_dTc.C_TcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ctx; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = subpats } }))
))
# 404 "Vuna/Compiler/Elab/Case.vuna"
and v_bindCtorField = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (rig : Core_dTerm.t_Rig) (domVal : Core_dTerm.t_Value) (cod : Core_dTerm.t_Term) (binderName : string) (binderSp : Base_dSource.t_Span) (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : Core_dTerm.t_Binder B_dData_dList.t_List) -> (let ctx2 = (((Elab_dTypes.v_ctxBindValue binderName) domVal) ctx) in ((((((v_bindCtorGo cname) fields) ctx2) cod) rest) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = binderName; Core_dTerm.f_Binder_binderRig = rig; Core_dTerm.f_Binder_binderSpan = binderSp }, acc)))))

# 373 "Vuna/Compiler/Elab/Case.vuna"
let v_bindCtorTele = (fun (cname : string) (fields : string B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Term) (subpats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((((((v_bindCtorGo cname) fields) ctx) ty) subpats) B_dData_dList.C_List_Nil))

# 399 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorExplicitNames = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> (if dtb__143 then (v_ctorExplicitNames dtb__146) else (B_dData_dList.C_List__x58__x58_ (dtb__142, (v_ctorExplicitNames dtb__146))))
  | _ -> B_dData_dList.C_List_Nil
))

# 411 "Vuna/Compiler/Elab/Case.vuna"
let rec v_freshTeleVals = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__149, (mc1 + mc2), B_dData_dList.C_List_Nil)))), (((v_freshTeleVals dtb__148) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultTerms = (fun (c : Elab_dTypes.t_DtCtor) -> (match (Elab_dMeta.v_resultSpine (Elab_dTypes.v_dtCtorType c)) with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultVals = (fun (c : Elab_dTypes.t_DtCtor) (base : int) -> (let tele = (Elab_dTypes.v_dtCtorTelescope c) in (let env = (B_dData_dList.v_reverse (((v_freshTeleVals tele) base) 0)) in ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Core_dEval.v_eval env) t))) (v_ctorResultTerms c)))))

# 360 "Vuna/Compiler/Elab/Case.vuna"
let rec v_allCtorsUnsatisfiableGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match (((((v_unifyIdxListSized mc0) B_dData_dList.C_List_Nil) mc3) ((v_ctorResultVals dtb__153) mc3)) mc2) with
  | Base_dDiag.C_Check_OkC (dtb__155) -> false
  | Base_dDiag.C_Check_ErrC (dtb__156) -> ((((v_allCtorsUnsatisfiableGo mc0) dtb__154) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Elab/Case.vuna"
let v_allCtorsUnsatisfiable = (fun (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (depth : int) -> ((((v_allCtorsUnsatisfiableGo ec) (Elab_dTypes.v_dtDataCtors dd)) idxs) depth))

# 326 "Vuna/Compiler/Elab/Case.vuna"
let v_isEmptyFamilyValue = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__157) -> (match dtb__157 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__158, dtb__159) -> (if (B_dData_dBool.v_not (v_rigidIdxVals dtb__159)) then false else (match ((Elab_dMeta.v_dtDataLookup dtb__158) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> ((((v_allCtorsUnsatisfiable ec) dtb__160) dtb__159) depth)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

# 318 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctxHasEmptyBinderAt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (if (((v_isEmptyFamilyValue mc0) (Elab_dTypes.v_ctxDepth mc1)) (((Elab_dTypes.v_varTypeValue mc1) mc2) dtb__164)) then true else ((((v_ctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__162))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Elab/Case.vuna"
let v_ctxHasEmptyBinder = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) -> ((((v_ctxHasEmptyBinderAt ec) ctx) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 278 "Vuna/Compiler/Elab/Case.vuna"
let v_branchAfterUnify = (fun (ec : Elab_dTypes.t_Ec) (branchCtx : Elab_dTypes.t_Ctx) (refs : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((v_ctxHasEmptyBinder ec) ((Elab_dTypes.v_ctxRefine branchCtx) refs)) then C_BranchVerdict_BranchImpossibleEmptyCtx else C_BranchVerdict_BranchOk))

# 426 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorResultValsIn = (fun (ctx : Elab_dTypes.t_Ctx) (c : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Elab_dTypes.v_evalCtx ctx) t))) (v_ctorResultTerms c)))

# 285 "Vuna/Compiler/Elab/Case.vuna"
let v_branchVerdict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((v_bindCtorTele (Elab_dTypes.v_dtCtorName ctor)) (v_ctorExplicitNames (Elab_dTypes.v_dtCtorType ctor))) ctx) (Elab_dTypes.v_dtCtorType ctor)) (v_wildArgs (v_ctorExplicitArity (Elab_dTypes.v_dtCtorType ctor))))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dAst.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut5 = p in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (match dtb__166 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (if (Elab_dMeta.v_nonEmpty dtb__168) then (Base_dDiag.v_icInternal "case coverage: constructor telescope arity mismatch") else (match (((((v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__165)) ((v_ctorResultValsIn dtb__165) ctor)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)) with
  | Base_dDiag.C_Check_ErrC (dtb__169) -> (if ((dtb__169).Base_dDiag.f_Diagnostic_diagCode = (Base_dDiagnostics_dTc.v_tcCode Base_dDiagnostics_dTc.C_TcErr_IndexFuel)) then (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchOk)) else (Base_dDiag.C_Check_OkC (C_BranchVerdict_BranchImpossibleIndex)))
  | Base_dDiag.C_Check_OkC (dtb__170) -> (Base_dDiag.C_Check_OkC ((((v_branchAfterUnify ec) dtb__165) dtb__170)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 301 "Vuna/Compiler/Elab/Case.vuna"
let v_branchReachable = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (ctor : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind ((((v_branchVerdict ctx) ec) idxs) ctor)) (fun (v : t_BranchVerdict) -> (Base_dDiag.C_Check_OkC ((v_branchIsReachable v))))))

# 443 "Vuna/Compiler/Elab/Case.vuna"
let rec v_teleValsFrom = (fun (low : int) (k : int) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_tele", low, B_dData_dList.C_List_Nil)))), ((v_teleValsFrom (low + 1)) (k - 1))))))

# 437 "Vuna/Compiler/Elab/Case.vuna"
let v_ctorValueIn = (fun (ctx : Elab_dTypes.t_Ctx) (c : Elab_dTypes.t_DtCtor) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName c), ((v_teleValsFrom ((Elab_dTypes.v_ctxDepth ctx) - (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope c)))) (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope c))))))

# 455 "Vuna/Compiler/Elab/Case.vuna"
let v_reflectScrutinee = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (refs : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctorVal : Core_dTerm.t_Value) (scrutVal : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) (((Elab_dTypes.v_refineValue refs) Core_dTerm.v_defaultFuel) scrutVal)) with
  | Core_dTerm.C_Value_VNeutral (dtb__171) -> (let nd_uscrut6 = dtb__171 in (match nd_uscrut6 with
  | Core_dTerm.C_Neutral_NVar (dtb__172, dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List_Nil -> ((((((v_unifyIdx ec) refs) depth) Core_dTerm.v_defaultFuel) (Core_dTerm.C_Value_VNeutral (dtb__171))) ctorVal)
  | _ -> (Base_dDiag.C_Check_OkC (refs))
)
  | _ -> (Base_dDiag.C_Check_OkC (refs))
))
  | _ -> (Base_dDiag.C_Check_OkC (refs))
))

# 474 "Vuna/Compiler/Elab/Case.vuna"
let v_patIrrefutable = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__175) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__176, dtb__177) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Case.vuna"
let rec v_patsAllIrrefutable = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if (v_patIrrefutable dtb__178) then (v_patsAllIrrefutable dtb__179) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Elab/Case.vuna"
let rec v_ctorHeadCovered = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (match dtb__180 with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> (match dtb__182 with
  | Frontend_dAst.C_Pat_PCon (dtb__184, dtb__185, dtb__186) -> (if (if (dtb__184 = mc0) then (v_patsAllIrrefutable dtb__185) else false) then true else ((v_ctorHeadCovered mc0) dtb__181))
  | _ -> ((v_ctorHeadCovered mc0) dtb__181)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Case.vuna"
let v_litPatEq = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__187, dtb__188) -> (match mc1 with
  | Frontend_dAst.C_Pat_PStr (dtb__189, dtb__190) -> (dtb__187 = dtb__189)
  | _ -> false
)
  | Frontend_dAst.C_Pat_PInt (dtb__191, dtb__192) -> (match mc1 with
  | Frontend_dAst.C_Pat_PInt (dtb__193, dtb__194) -> (dtb__191 = dtb__193)
  | _ -> false
)
  | _ -> false
))

# 490 "Vuna/Compiler/Elab/Case.vuna"
let rec v_litHeadCovered = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (if ((v_litPatEq mc0) dtb__197) then true else ((v_litHeadCovered mc0) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Case.vuna"
let v_litLabel = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__199, dtb__200) -> (String.concat "" ["\""; dtb__199; "\""])
  | Frontend_dAst.C_Pat_PInt (dtb__201, dtb__202) -> (bi_strFromInt dtb__201)
  | _ -> ""
))

# 514 "Vuna/Compiler/Elab/Case.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__203, dtb__204, dtb__205) -> (v_stripAsPat dtb__204)
  | _ -> mc0
))

# 519 "Vuna/Compiler/Elab/Case.vuna"
let rec v_stripAsPats = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | { B_dData_dPair.f_Pair_first = dtb__208; B_dData_dPair.f_Pair_second = dtb__209 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripAsPat dtb__208); B_dData_dPair.f_Pair_second = dtb__209 }, (v_stripAsPats dtb__207)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasLitHead = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | { B_dData_dPair.f_Pair_first = dtb__212; B_dData_dPair.f_Pair_second = dtb__213 } -> (match dtb__212 with
  | Frontend_dAst.C_Pat_PInt (dtb__214, dtb__215) -> true
  | Frontend_dAst.C_Pat_PStr (dtb__216, dtb__217) -> true
  | _ -> (v_hasLitHead dtb__211)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Compiler/Elab/Case.vuna"
let rec v_altNames = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (match dtb__220 with
  | Frontend_dAst.C_Pat_PCon (dtb__222, dtb__223, dtb__224) -> (B_dData_dList.C_List__x58__x58_ (dtb__222, (v_altNames dtb__219)))
  | _ -> (v_altNames dtb__219)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Elab/Case.vuna"
let rec v_hasCatchAll = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match dtb__225 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> (match dtb__227 with
  | Frontend_dAst.C_Pat_PVar (dtb__229, dtb__230) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__231) -> true
  | _ -> (v_hasCatchAll dtb__226)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedArg = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | Frontend_dAst.C_Pat_PVar (dtb__234, dtb__235) -> (v_anyNestedArg dtb__233)
  | Frontend_dAst.C_Pat_PWild (dtb__236) -> (v_anyNestedArg dtb__233)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Elab/Case.vuna"
let v_nestedInPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PCon (dtb__237, dtb__238, dtb__239) -> (v_anyNestedArg dtb__238)
  | _ -> false
))

# 603 "Vuna/Compiler/Elab/Case.vuna"
let rec v_anyNestedPat = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> (if (v_nestedInPat dtb__242) then true else (v_anyNestedPat dtb__241))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Elab/Case.vuna"
let rec v_missingCtors = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtCtorName dtb__244)) mc3) then (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__245) else ((Base_dCommon.v_bind ((((v_branchReachable mc0) mc1) mc2) dtb__244)) (fun (reachable : bool) -> (if reachable then ((Base_dCommon.v_bind (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__245)) (fun (tail : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorDisplayName (Elab_dTypes.v_dtCtorName dtb__244)); B_dData_dPair.f_Pair_second = (dtb__244).Elab_dTypes.f_DtCtor_dtCtorSpan }, tail)))))) else (((((v_missingCtors mc0) mc1) mc2) mc3) dtb__245)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCovered = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (written : string B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_missingCtors ctx) ec) idxs) written) ctors)) (fun (missing : (string, Base_dSource.t_Span B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length missing) = 0) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dTc.v_tcCoverageMissing sp) missing)))))

# 626 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCoverage = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((v_checkCovered ctx) ec) dd) idxs) (v_altNames alts)) alts) sp) (Elab_dTypes.v_dtDataCtors dd)))

# 646 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseDone = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (scrutTerm : Core_dTerm.t_Term) (altTerms : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (v_hasCatchAll alts) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (scrutTerm, altTerms)); B_dData_dPair.f_Pair_second = ec })) else ((Base_dCommon.v_bind ((((((v_checkCoverage ctx) ec) dd) idxs) alts) sp)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (scrutTerm, altTerms)); B_dData_dPair.f_Pair_second = ec }))))))

# 657 "Vuna/Compiler/Elab/Case.vuna"
let v_branchRemovalSpan = (fun (patSpan : Base_dSource.t_Span) (body : Frontend_dAst.t_Expr) -> { Base_dSource.f_Span_spanFile = (Base_dSource.v_spanFile patSpan); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine patSpan); Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = ((Base_dSource.v_spanEndLine (Frontend_dAst.v_exprSpan body)) + 1); Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = ((Base_dSource.v_spanStartOffset patSpan) - ((Base_dSource.v_spanStartCol patSpan) - 1)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset (Frontend_dAst.v_exprSpan body)) })

# 669 "Vuna/Compiler/Elab/Case.vuna"
let v_removeBranchSuggest = (fun (title : string) (patSpan : Base_dSource.t_Span) (body : Frontend_dAst.t_Expr) (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = title; Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = ((v_branchRemovalSpan patSpan) body); Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) d))

# 562 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCatchAll = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (mc3 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> (if (v_hasLitHead mc3) then (let ec1 = ((((Elab_dUsage.v_warnAt0Mod mc0) (((v_removeBranchSuggest "remove unreachable branch") mc4) (B_dData_dPair.v_secondOf mc2))) mc4) Base_dDiagnostics_dWarning.C_WarnErr_WarnBranchAfterCatchAll) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = ec1 }))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast))
))

# 527 "Vuna/Compiler/Elab/Case.vuna"
let rec v_checkCaseAltsGo = (fun (ec : Elab_dTypes.t_Ec) (prevs : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = alts in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (match dtb__248 with
  | Frontend_dAst.C_Pat_PCon (dtb__250, dtb__251, dtb__252) -> (if ((v_ctorHeadCovered dtb__250) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant constructor branch") (Frontend_dAst.v_nodeRefSpan dtb__252)) dtb__249)) (Frontend_dAst.v_nodeRefSpan dtb__252)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantCtorBranch (dtb__250))) dtb__250) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247))
  | Frontend_dAst.C_Pat_PInt (dtb__253, dtb__254) -> (if ((v_litHeadCovered dtb__248) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb__254)) dtb__249)) (Frontend_dAst.v_nodeRefSpan dtb__254)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb__248)))) (v_litLabel dtb__248)) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247))
  | Frontend_dAst.C_Pat_PStr (dtb__255, dtb__256) -> (if ((v_litHeadCovered dtb__248) prevs) then (let ec1 = (((((Elab_dUsage.v_warnAt1Mod ec) (((v_removeBranchSuggest "remove redundant literal branch") (Frontend_dAst.v_nodeRefSpan dtb__256)) dtb__249)) (Frontend_dAst.v_nodeRefSpan dtb__256)) (Base_dDiagnostics_dWarning.C_WarnErr_WarnRedundantLiteralBranch ((v_litLabel dtb__248)))) (v_litLabel dtb__248)) in (((v_checkCaseAltsGo ec1) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247)) else (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247))
  | Frontend_dAst.C_Pat_PAs (dtb__257, dtb__258, dtb__259) -> (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247)
  | Frontend_dAst.C_Pat_PVar (dtb__260, dtb__261) -> (((((v_checkCatchAll ec) prevs) { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }) dtb__247) (Frontend_dAst.v_nodeRefSpan dtb__261))
  | Frontend_dAst.C_Pat_PWild (dtb__262) -> (((((v_checkCatchAll ec) prevs) { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }) dtb__247) (Frontend_dAst.v_nodeRefSpan dtb__262))
  | Frontend_dAst.C_Pat_PRecord (dtb__263, dtb__264, dtb__265) -> (((v_checkCaseAltsGo ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 }, prevs))) dtb__247)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = ec }))
  | _ -> failwith "DT: impossible branch"
)))

# 524 "Vuna/Compiler/Elab/Case.vuna"
let v_checkCaseAltsFlat = (fun (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkCaseAltsGo ec) B_dData_dList.C_List_Nil) (v_stripAsPats alts)))
