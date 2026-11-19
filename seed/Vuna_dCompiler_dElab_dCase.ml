open Vuna_runtime
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx

# 37 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))

# 69 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_didxFuelMax = 1000000

# 105 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor = (fun (c : string) -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 96 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_didxIsNatHead = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__0, dtb__1) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead dtb__0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__2) -> (match dtb__2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__3, dtb__4) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor dtb__3)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__5, dtb__6) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor dtb__5)
  | _ -> false
))

# 138 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__7) -> (match dtb__7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__8, dtb__9) -> (dtb__8 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__10, dtb__11) -> (dtb__10 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)
  | _ -> false
))

# 112 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then 100000 else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__12, dtb__13) -> (if (dtb__12 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__14))
  | _ -> 0
)
  | _ -> 0
)) dtb__13) else 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__16) -> (match dtb__16 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__17, dtb__18) -> (if (dtb__17 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__19))
  | _ -> 0
)
  | _ -> 0
)) dtb__18) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__21, dtb__22) -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead dtb__21) then (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__22)) else 0)
  | _ -> 0
)))

# 109 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo 100000) v))

# 72 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> ((fun d -> ((fun r -> (if (d >= r) then d else r)) (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__24))) (v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear dtb__23))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 82 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead v) then (v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__25, dtb__26) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__26)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__29)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__30, dtb__31, dtb__32) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__32)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__33, dtb__34) -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead dtb__34) then (v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth dtb__34) else 0)
  | _ -> 0
)))

# 63 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_didxFuelFor = (fun (xs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (ys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> ((fun need -> (if (need > v_Vuna_dCompiler_dElab_dCase_didxFuelMax) then v_Vuna_dCompiler_dElab_dCase_didxFuelMax else need)) (512 + (4 * ((v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList xs) + (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList ys))))))

# 201 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel = (fun (depth : int) (lvl : int) -> (if (depth = lvl) then (lvl + 1) else depth))

# 174 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun (fuel : int) (depth : int) (lvl : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then true else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__35) -> (match dtb__35 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__36, dtb__37, dtb__38) -> (if (dtb__37 = lvl) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__39, dtb__40) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__44) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__45) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_occurs", ((v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel depth) lvl), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__46, dtb__47, dtb__48) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__48) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_occurs", ((v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel depth) lvl), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__49, dtb__50) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__51, dtb__52) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__52)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__53, dtb__54) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__53) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__54))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__55, dtb__56) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__55)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__57)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__62, dtb__63, dtb__64) -> (if (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__62) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__63)) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__64))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__65) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__66) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__67) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__68) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__69) -> false
  | _ -> failwith "DT: impossible branch"
)))
# 204 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (mc0 - 1)) mc1) mc2) dtb__70) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (mc0 - 1)) mc1) mc2) dtb__71))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_doccursFuel = 1000000

# 252 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (acc : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__72) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (acc : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depth : int) (fuel : int) (xs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (ys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IndexFuel) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))) else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys)))
# 45 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__74) dtb__76)) (fun (acc2 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__75) dtb__77)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
))
# 147 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (acc : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depth : int) (fuel : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IndexFuel) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__78) -> (match dtb__78 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__79, dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__82) -> (match dtb__82 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__83, dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__80 = dtb__84) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else (if (dtb__80 < dtb__84) then (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__84) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__84; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a2 }, acc))))) else (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 }, acc)))))))
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 }, acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__86) -> (match dtb__86 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__87, dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__88) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__88; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__90) -> (match dtb__90 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__91, dtb__92, dtb__93) -> (match dtb__93 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__92) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__94) -> (match dtb__94 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__95, dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__96) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)) a2)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
# 215 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (acc : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depth : int) (fuel : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__98) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__99) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__98) dtb__99) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__100) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__101) -> (if (dtb__100 = dtb__101) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__102) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__103) -> (if (dtb__102 = dtb__103) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__104) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__105) -> (if (dtb__104 = dtb__105) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__106) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__106) dtb__107) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__108) -> (match dtb__108 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__109, dtb__110) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__111) -> (match dtb__111 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__112, dtb__113) -> (if (dtb__109 = dtb__112) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__110) dtb__113) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__114, dtb__115) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__116, dtb__117) -> (if (dtb__114 = dtb__116) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__115) dtb__117) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) a)))

# 60 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (acc : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depth : int) (xs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (ys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((v_Vuna_dCompiler_dElab_dCase_didxFuelFor xs) ys)) xs) ys))

# 272 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable = (fun (mc0 : t_Vuna_dCompiler_dElab_dCase_dBranchVerdict) -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> true
  | _ -> false
))

# 304 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun (n : int) -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild ({ Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (v_Vuna_dCompiler_dElab_dCase_dwildArgs (n - 1))))))

# 308 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if dtb__119 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__122) else (1 + (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__122)))
  | _ -> 0
))

# 343 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__123) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__124) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 347 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__125) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__126) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__127) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__128) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__129) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__130, dtb__131) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__131)
  | _ -> false
))

# 375 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (subpats : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match ty with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> ((fun domVal -> (if dtb__133 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__136) subpats) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair { Base_dData_dPair.f_Base_dData_dPair_dPair_first = famName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) (dtb__132 ^ "#fam")) else (match subpats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CaseBranchTooFewArgs) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (match dtb__137 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__139, dtb__140) -> ((((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__134) domVal) dtb__136) dtb__139) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__139) dtb__140)) dtb__138) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__141) -> ((((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__134) domVal) dtb__136) "_") dtb__141) dtb__138) acc)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dpatSpan dtb__137)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__135))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ctx; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = subpats } }))
))
# 397 "Vuna/Compiler/Elab/Case.vuna"
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) (domVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (cod : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (binderName : string) (binderSp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = binderName; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = rig; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = binderSp }, acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx)))

# 372 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (subpats : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 404 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__144; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__144, (mc1 + mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__143) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__146; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) (base : int) -> ((fun tele -> ((fun env -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (Base_dData_dList.v_Base_dData_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

# 359 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (match (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) mc3) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__148) mc3)) mc2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__150) -> false
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__151) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__149) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dd : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (depth : int) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth))

# 325 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__152) -> (match dtb__152 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__153, dtb__154) -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__154)) then false else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__153) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__155) dtb__154) depth)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

# 317 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (match dtb__156 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__158; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__159 } -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__159)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

# 277 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (branchCtx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (refs : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk))

# 419 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c)))

# 284 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (ctor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))) (fun (p : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__160; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__161 } -> (match dtb__161 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__162; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__163 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__163) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "case coverage: constructor telescope arity mismatch") else (match (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized ec) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__160)) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__160) ctor)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dData_dList.C_Base_dData_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164) -> (if ((dtb__164).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCode = (Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcCode Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IndexFuel)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__160) dtb__165)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 300 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (ctor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor)) (fun (v : t_Vuna_dCompiler_dElab_dCase_dBranchVerdict) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable v))))))

# 436 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun (low : int) (k : int) -> (if (k <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_tele", low, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom (low + 1)) (k - 1))))))

# 430 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))))

# 448 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (depth : int) (refs : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ctorVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (scrutVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__166) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__167, dtb__168, dtb__169) -> (match dtb__169 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__166))) ctorVal)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (refs))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (refs))
)) dtb__166)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (refs))
))

# 467 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__170) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__171, dtb__172) -> true
  | _ -> false
))

# 472 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__173) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__174) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun (mc0 : string) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__177; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 } -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__179, dtb__180, dtb__181) -> (if (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__179) = mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__180) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__176))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__176)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__182, dtb__183) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__184, dtb__185) -> (dtb__182 = dtb__184)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__186, dtb__187) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__188, dtb__189) -> (dtb__186 = dtb__188)
  | _ -> false
)
  | _ -> false
))

# 484 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match dtb__190 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__192; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__193 } -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__192) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__194, dtb__195) -> (String.concat "" ["\""; dtb__194; "\""])
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__196, dtb__197) -> (bi_strFromInt dtb__196)
  | _ -> ""
))

# 508 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPat = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__198, dtb__199, dtb__200) -> (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__199)
  | _ -> mc0
))

# 513 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPats = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (match dtb__201 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__203; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__203); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 }, (v_Vuna_dCompiler_dElab_dCase_dstripAsPats dtb__202)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__207; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__208 } -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__209, dtb__210) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__211, dtb__212) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__206)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (match dtb__213 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__215; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__216 } -> (match dtb__215 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__217, dtb__218, dtb__219) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__217), (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__214)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__214)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (match dtb__220 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__222; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__223 } -> (match dtb__222 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__224, dtb__225) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__226) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__221)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__227, dtb__228) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__229, dtb__230) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__228)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__231) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__228)
  | _ -> true
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__232, dtb__233, dtb__234) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__233)
  | _ -> false
))

# 597 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (match dtb__235 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__237) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dmissingCtors = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__239)) mc3) then (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__240) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc2) dtb__239)) (fun (reachable : bool) -> (if reachable then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__240)) (fun (tail : (string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__239)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__239).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan }, tail)))))) else (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__240)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dd : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (written : string Base_dData_dList.t_Base_dData_dList_dList) (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors ctx) ec) idxs) written) ctors)) (fun (missing : (string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength missing) = 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcCoverageMissing sp) missing)))))

# 620 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (dd : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

# 640 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ctx : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (dd : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (idxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (expected : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (scrutTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (altTerms : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec })) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))))))

# 651 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan = (fun (patSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (body : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile patSpan); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine patSpan); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndLine (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dexprSpan body)) + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset patSpan) - ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol patSpan) - 1)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dexprSpan body)) })

# 663 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest = (fun (title : string) (patSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (body : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSuggestion { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionTitle = title; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionEdits = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editSpan = ((v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan patSpan) body); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editNewText = "" }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }) d))

# 556 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc3 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> (if (v_Vuna_dCompiler_dElab_dCase_dhasLitHead mc3) then ((fun ec1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec1 }))) ((((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dwarnAt0Mod mc0) (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove unreachable branch") mc4) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc2))) mc4) Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_WarnBranchAfterCatchAll)) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CatchAllNotLast))
))

# 521 "Vuna/Compiler/Elab/Case.vuna"
let rec v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (prevs : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (match dtb__241 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 } -> (match dtb__243 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__245, dtb__246, dtb__247) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__245)) prevs) then ((fun ec1 -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242)) (((((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod ec) (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant constructor branch") dtb__247) dtb__244)) dtb__247) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_WarnRedundantCtorBranch ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__245)))) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__245))) else (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__248, dtb__249) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__243) prevs) then ((fun ec1 -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242)) (((((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod ec) (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant literal branch") dtb__249) dtb__244)) dtb__249) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_WarnRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__243)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__243))) else (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__250, dtb__251) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__243) prevs) then ((fun ec1 -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242)) (((((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod ec) (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant literal branch") dtb__251) dtb__244)) dtb__251) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_WarnRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__243)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__243))) else (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__252, dtb__253, dtb__254) -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__255, dtb__256) -> (((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll ec) prevs) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }) dtb__242) dtb__256)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__257) -> (((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll ec) prevs) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }) dtb__242) dtb__257)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__258, dtb__259, dtb__260) -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__243; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__244 }, prevs))) dtb__242)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | _ -> failwith "DT: impossible branch"
)) alts))

# 518 "Vuna/Compiler/Elab/Case.vuna"
let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo ec) Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dCase_dstripAsPats alts)))
