open Vuna_runtime
# 69 "Vuna/Compiler/Elab/Data.vuna"
let rec v_kindResultLevel = (fun (dtb_u_u1 : Core_dTerm.t_Term) -> (match dtb_u_u1 with
  | Core_dTerm.C_Term_TType (dtb_u_u2) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2))
  | Core_dTerm.C_Term_TPi (dtb_u_u3, dtb_u_u4, dtb_u_u5, dtb_u_u6, dtb_u_u7) -> (v_kindResultLevel dtb_u_u7)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 94 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countSurfacePis = (fun (dtb_u_u8 : Frontend_dAst.t_Expr) -> (match dtb_u_u8 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u9, dtb_u_u10, dtb_u_u11) -> (match dtb_u_u9 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u12, dtb_u_u13) -> (if (dtb_u_u12 = "->") then (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u15 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> (match dtb_u_u17 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countSurfacePis dtb_u_u16))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u18, dtb_u_u19, dtb_u_u20, dtb_u_u21, dtb_u_u22, dtb_u_u23) -> (1 + (v_countSurfacePis dtb_u_u22))
  | _ -> 0
))

# 100 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countTelePis = (fun (dtb_u_u24 : Core_dTerm.t_Term) -> (match dtb_u_u24 with
  | Core_dTerm.C_Term_TPi (dtb_u_u25, dtb_u_u26, dtb_u_u27, dtb_u_u28, dtb_u_u29) -> (1 + (v_countTelePis dtb_u_u29))
  | _ -> 0
))

# 104 "Vuna/Compiler/Elab/Data.vuna"
let rec v_ctorFieldSortsGo = (fun (dtb_u_u30 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u31 : Elab_dTypes.t_Ctx) (dtb_u_u32 : Elab_dTypes.t_Ec) (dtb_u_u33 : int) (dtb_u_u34 : int) (dtb_u_u35 : Core_dTerm.t_Level) (dtb_u_u36 : string) (dtb_u_u37 : Base_dSource.t_Span) (dtb_u_u38 : Frontend_dAst.t_Expr) -> (match dtb_u_u38 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u39, dtb_u_u40, dtb_u_u41) -> (match dtb_u_u39 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u42, dtb_u_u43) -> (if (dtb_u_u42 = "->") then (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (match dtb_u_u45 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u46, dtb_u_u47) -> (match dtb_u_u47 with
  | B_dData_dList.C_List_Nil -> (((((((((((v_ctorFieldSortsBinder dtb_u_u30) dtb_u_u31) dtb_u_u32) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u37) "_") dtb_u_u44) dtb_u_u46)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u32))
)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u32))
)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u32))
) else (Base_dDiag.C_Check_OkC (dtb_u_u32)))
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u32))
)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u48, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53) -> (((((((((((v_ctorFieldSortsBinder dtb_u_u30) dtb_u_u31) dtb_u_u32) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u37) dtb_u_u48) dtb_u_u51) dtb_u_u52)
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u32))
))
# 111 "Vuna/Compiler/Elab/Data.vuna"
and v_ctorFieldSortsBinder = (fun (dtb_u_u54 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u55 : Elab_dTypes.t_Ctx) (dtb_u_u56 : Elab_dTypes.t_Ec) (dtb_u_u57 : int) (dtb_u_u58 : int) (dtb_u_u59 : Core_dTerm.t_Level) (dtb_u_u60 : string) (dtb_u_u61 : Base_dSource.t_Span) (dtb_u_u62 : string) (dtb_u_u63 : Frontend_dAst.t_Expr) (dtb_u_u64 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u54) dtb_u_u55) dtb_u_u56) dtb_u_u63)) (fun (dtb_u_u65 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u66 = dtb_u_u65 in (match dtb_u_u66 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u67; B_dData_dPair.f_Pair_second = dtb_u_u68 } -> (match dtb_u_u68 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = dtb_u_u70 } -> (let dtb_u_u71 = (((Elab_dTypes.v_ctxBind dtb_u_u62) dtb_u_u67) dtb_u_u55) in (if (dtb_u_u57 < dtb_u_u58) then (((((((((v_ctorFieldSortsGo dtb_u_u54) dtb_u_u71) dtb_u_u70) (dtb_u_u57 + 1)) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u61) dtb_u_u64) else (if (if ((Core_dTerm.v_levelLt dtb_u_u69) dtb_u_u59) then true else ((Core_dTerm.v_levelEq dtb_u_u69) dtb_u_u59)) then (((((((((v_ctorFieldSortsGo dtb_u_u54) dtb_u_u71) dtb_u_u70) (dtb_u_u57 + 1)) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u61) dtb_u_u64) else (let dtb_u_u72 = (dtb_u_u57 - dtb_u_u58) in (let dtb_u_u73 = (String.concat "" ["field #"; (string_of_int dtb_u_u72); ": its type sorts into Type "; (string_of_int (Core_dTerm.v_levelToInt dtb_u_u69)); ", above the family level Type "; (string_of_int (Core_dTerm.v_levelToInt dtb_u_u59))]) in ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u61) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName dtb_u_u60), dtb_u_u73))) (Frontend_dAst.v_ctorDisplayName dtb_u_u60)) dtb_u_u73))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 80 "Vuna/Compiler/Elab/Data.vuna"
let v_checkCtorFieldSorts = (fun (dtb_u_u74 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u75 : Elab_dTypes.t_Ctx) (dtb_u_u76 : Elab_dTypes.t_Ec) (dtb_u_u77 : int) (dtb_u_u78 : Core_dTerm.t_Level) (dtb_u_u79 : string) (dtb_u_u80 : Base_dSource.t_Span) (dtb_u_u81 : int) (dtb_u_u82 : Frontend_dAst.t_Expr) -> (let dtb_u_u83 = (v_countSurfacePis dtb_u_u82) in (if (dtb_u_u83 <> dtb_u_u81) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u80) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName dtb_u_u79), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) dtb_u_u79) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_ctorFieldSortsGo dtb_u_u74) dtb_u_u75) dtb_u_u76) 0) dtb_u_u77) dtb_u_u78) dtb_u_u79) dtb_u_u80) dtb_u_u82))))

# 25 "Vuna/Compiler/Elab/Data.vuna"
let v_elabCtor = (fun (dtb_u_u84 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u85 : string) (dtb_u_u86 : int) (dtb_u_u87 : Core_dTerm.t_Level) (dtb_u_u88 : Elab_dTypes.t_Ec) (dtb_u_u89 : Frontend_dAst.t_Ctor) -> (match dtb_u_u89 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u90; Frontend_dAst.f_Ctor_ctorType = dtb_u_u91; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u92; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u93 } -> (let dtb_u_u94 = (match ((Elab_dMeta.v_globalLookup dtb_u_u85) dtb_u_u84) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> dtb_u_u107
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u95 = (if (Elab_dMeta.v_hasFamParams dtb_u_u91) then dtb_u_u91 else (((Elab_dMeta.v_prependFamParams dtb_u_u94) dtb_u_u91) (Frontend_dAst.v_nodeRefSpan dtb_u_u93))) in (let dtb_u_u96 = ((B_dData_dList.v_append dtb_u_u84) (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecGlobalsTbl dtb_u_u88))) in ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u96) Elab_dTypes.v_emptyCtx) dtb_u_u88) dtb_u_u95)) (fun (dtb_u_u97 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u98 = dtb_u_u97 in (match dtb_u_u98 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u99; B_dData_dPair.f_Pair_second = dtb_u_u100 } -> (match dtb_u_u100 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u101; B_dData_dPair.f_Pair_second = dtb_u_u102 } -> (let dtb_u_u103 = (((Elab_dMeta.v_zonkTerm dtb_u_u102) 0) dtb_u_u99) in (match (Elab_dMeta.v_resultSpine (Elab_dMeta.v_dropParams dtb_u_u103)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u104; B_dData_dPair.f_Pair_second = dtb_u_u105 } -> (if (dtb_u_u104 <> dtb_u_u85) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u93)) (Base_dDiagnostics_dTc.C_TcErr_CtorDoesNotReturn ((Frontend_dAst.v_ctorDisplayName dtb_u_u90), dtb_u_u85))) (Frontend_dAst.v_ctorDisplayName dtb_u_u90)) dtb_u_u85) else (if ((B_dData_dList.v_length dtb_u_u105) <> dtb_u_u86) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u93)) (Base_dDiagnostics_dTc.C_TcErr_CtorWrongIndices ((Frontend_dAst.v_ctorDisplayName dtb_u_u90), dtb_u_u85))) (Frontend_dAst.v_ctorDisplayName dtb_u_u90)) dtb_u_u85) else ((Base_dCommon.v_bind (((((((((v_checkCtorFieldSorts dtb_u_u96) Elab_dTypes.v_emptyCtx) dtb_u_u102) dtb_u_u86) dtb_u_u87) dtb_u_u90) (Frontend_dAst.v_nodeRefSpan dtb_u_u93)) (v_countTelePis dtb_u_u103)) dtb_u_u95)) (fun (dtb_u_u106 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u90; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u85; Elab_dTypes.f_DtCtor_dtCtorTelescope = (Elab_dMeta.v_teleOfType dtb_u_u103); Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u103; Elab_dTypes.f_DtCtor_dtCtorSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u93))) }; B_dData_dPair.f_Pair_second = dtb_u_u102 }))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabCtors = (fun (dtb_u_u108 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u109 : string) (dtb_u_u110 : int) (dtb_u_u111 : Core_dTerm.t_Level) (dtb_u_u112 : Elab_dTypes.t_Ec) (dtb_u_u113 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u113 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> ((Base_dCommon.v_bind ((((((v_elabCtor dtb_u_u108) dtb_u_u109) dtb_u_u110) dtb_u_u111) dtb_u_u112) dtb_u_u114)) (fun (dtb_u_u116 : (Elab_dTypes.t_DtCtor, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u117; B_dData_dPair.f_Pair_second = dtb_u_u118 } -> ((Base_dCommon.v_bind ((((((v_elabCtors dtb_u_u108) dtb_u_u109) dtb_u_u110) dtb_u_u111) dtb_u_u118) dtb_u_u115)) (fun (dtb_u_u119 : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u119 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u120; B_dData_dPair.f_Pair_second = dtb_u_u121 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u117, dtb_u_u120)); B_dData_dPair.f_Pair_second = dtb_u_u121 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u112 }))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHead = (fun (dtb_u_u122 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u123 : Elab_dTypes.t_Ec) (dtb_u_u124 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u124 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u125; B_dData_dPair.f_Pair_second = dtb_u_u126 } -> (match dtb_u_u125 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u127, dtb_u_u128, dtb_u_u129, dtb_u_u130, dtb_u_u131, dtb_u_u132, dtb_u_u133, dtb_u_u134, dtb_u_u135) -> (if ((B_dData_dList.v_memName dtb_u_u127) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u135)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb_u_u127))) dtb_u_u127) else ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u122) Elab_dTypes.v_emptyCtx) dtb_u_u123) dtb_u_u129)) (fun (dtb_u_u136 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u137 = dtb_u_u136 in (match dtb_u_u137 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u138; B_dData_dPair.f_Pair_second = dtb_u_u139 } -> (match dtb_u_u139 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u140; B_dData_dPair.f_Pair_second = dtb_u_u141 } -> (let dtb_u_u142 = ((Elab_dPrelude.v_prependParams dtb_u_u128) (((Elab_dMeta.v_zonkTerm dtb_u_u141) 0) dtb_u_u138)) in (let dtb_u_u143 = (Elab_dMeta.v_splitKind dtb_u_u142) in (let dtb_u_u144 = (B_dData_dList.v_length dtb_u_u143) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed dtb_u_u142)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u135)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb_u_u127; Elab_dMeta.f_DataHead_dataHeadKind = dtb_u_u142; Elab_dMeta.f_DataHead_dataHeadArity = dtb_u_u144 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u127; B_dData_dPair.f_Pair_second = dtb_u_u142 }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u141 } }))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u145, dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152) -> (if ((B_dData_dList.v_memName dtb_u_u145) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u152)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb_u_u145))) dtb_u_u145) else (let dtb_u_u153 = ((Elab_dPrelude.v_prependParams dtb_u_u146) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))) in (let dtb_u_u154 = (B_dData_dList.v_length dtb_u_u146) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed dtb_u_u153)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u152)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb_u_u145; Elab_dMeta.f_DataHead_dataHeadKind = dtb_u_u153; Elab_dMeta.f_DataHead_dataHeadArity = dtb_u_u154 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u145; B_dData_dPair.f_Pair_second = dtb_u_u153 }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u123 } }))))))
  | _ -> ((Elab_dTypes.v_errAt dtb_u_u126) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsRound = (fun (dtb_u_u155 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u156 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u157 : Elab_dTypes.t_Ec) (dtb_u_u158 : Elab_dMeta.t_DataHead B_dData_dList.t_List) (dtb_u_u159 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u155 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u160, dtb_u_u161) -> (let dtb_u_u162 = (((v_elabDataHead dtb_u_u156) dtb_u_u157) dtb_u_u160) in (match dtb_u_u162 with
  | Base_dDiag.C_Check_OkC (dtb_u_u163) -> (match dtb_u_u163 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u164; B_dData_dPair.f_Pair_second = dtb_u_u165 } -> (match dtb_u_u165 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u166; B_dData_dPair.f_Pair_second = dtb_u_u167 } -> (((((v_elabDataHeadsRound dtb_u_u161) ((B_dData_dList.v_append dtb_u_u156) dtb_u_u166)) dtb_u_u167) (B_dData_dList.C_List__x58__x58_ (dtb_u_u164, dtb_u_u158))) dtb_u_u159)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u168) -> (((((v_elabDataHeadsRound dtb_u_u161) dtb_u_u156) dtb_u_u157) dtb_u_u158) (B_dData_dList.C_List__x58__x58_ (dtb_u_u160, dtb_u_u159)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u158; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u156; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u157; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u159) } } }
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeadsNoProgress = (fun (dtb_u_u169 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u170 : Elab_dTypes.t_Ec) (dtb_u_u171 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u171 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u172, dtb_u_u173) -> (match (((v_elabDataHead dtb_u_u169) dtb_u_u170) dtb_u_u172) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u174) -> (Base_dDiag.C_Check_ErrC (dtb_u_u174))
  | Base_dDiag.C_Check_OkC (dtb_u_u175) -> (Base_dDiag.v_icInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsFuel = (fun (dtb_u_u176 : int) (dtb_u_u177 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u178 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u179 : Elab_dTypes.t_Ec) (dtb_u_u180 : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (if (dtb_u_u176 <= 0) then (Base_dDiag.v_icInternal "data head registration fuel exhausted") else (match dtb_u_u177 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u180); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u178; B_dData_dPair.f_Pair_second = dtb_u_u179 } }))
  | _ -> (let dtb_u_u181 = (((((v_elabDataHeadsRound dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u180) B_dData_dList.C_List_Nil) in (match dtb_u_u181 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u182; B_dData_dPair.f_Pair_second = dtb_u_u183 } -> (match dtb_u_u183 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u184; B_dData_dPair.f_Pair_second = dtb_u_u185 } -> (match dtb_u_u185 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u186; B_dData_dPair.f_Pair_second = dtb_u_u187 } -> (match dtb_u_u187 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u182); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u184; B_dData_dPair.f_Pair_second = dtb_u_u186 } }))
  | _ -> (if ((B_dData_dList.v_length dtb_u_u187) = (B_dData_dList.v_length dtb_u_u177)) then (((v_elabDataHeadsNoProgress dtb_u_u178) dtb_u_u179) dtb_u_u187) else (((((v_elabDataHeadsFuel (dtb_u_u176 - 1)) dtb_u_u187) dtb_u_u184) dtb_u_u186) dtb_u_u182))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 176 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeads = (fun (dtb_u_u188 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u189 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u190 : Elab_dTypes.t_Ec) (dtb_u_u191 : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (((((v_elabDataHeadsFuel 64) dtb_u_u188) dtb_u_u189) dtb_u_u190) dtb_u_u191))

# 214 "Vuna/Compiler/Elab/Data.vuna"
let rec v_skipParamPis = (fun (dtb_u_u192 : int) (dtb_u_u193 : Core_dTerm.t_Term) -> (match dtb_u_u193 with
  | Core_dTerm.C_Term_TPi (dtb_u_u194, dtb_u_u195, dtb_u_u196, dtb_u_u197, dtb_u_u198) -> (if (dtb_u_u192 <= 0) then dtb_u_u193 else ((v_skipParamPis (dtb_u_u192 - 1)) dtb_u_u198))
  | _ -> dtb_u_u193
))

# 220 "Vuna/Compiler/Elab/Data.vuna"
let v_recordFieldIndependent = (fun (dtb_u_u199 : int) (dtb_u_u200 : Core_dTerm.t_Term) -> (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar (((Core_dTerm.v_shift 0) (0 - dtb_u_u199)) dtb_u_u200))))

# 223 "Vuna/Compiler/Elab/Data.vuna"
let rec v_dtFieldsOfRecordGo = (fun (dtb_u_u201 : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (dtb_u_u202 : int) (dtb_u_u203 : Core_dTerm.t_Term) -> (match dtb_u_u201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u204, dtb_u_u205) -> (match dtb_u_u203 with
  | Core_dTerm.C_Term_TPi (dtb_u_u206, dtb_u_u207, dtb_u_u208, dtb_u_u209, dtb_u_u210) -> (if (B_dData_dBool.v_not ((v_recordFieldIndependent dtb_u_u202) dtb_u_u209)) then (Base_dDiag.v_icInternal (String.concat "" ["record field `"; (dtb_u_u204).Elab_dRecords.f_RecordFieldMeta_recordFieldName; "` references a previous field"])) else ((Base_dCommon.v_bind (((v_dtFieldsOfRecordGo dtb_u_u205) (dtb_u_u202 + 1)) dtb_u_u210)) (fun (dtb_u_u211 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = (dtb_u_u204).Elab_dRecords.f_RecordFieldMeta_recordFieldName; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb_u_u202; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((Core_dTerm.v_shift 0) (0 - dtb_u_u202)) dtb_u_u209) }, dtb_u_u211)))))))
  | _ -> (Base_dDiag.v_icInternal "record field table is longer than the constructor telescope")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Data.vuna"
let v_dtFieldsOfRecord = (fun (dtb_u_u212 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u213 : string) (dtb_u_u214 : int) (dtb_u_u215 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match ((Elab_dRecords.v_lookupRecord dtb_u_u213) dtb_u_u212) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u216) -> (let dtb_u_u217 = dtb_u_u215 in (match dtb_u_u217 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u218, dtb_u_u219) -> (match dtb_u_u219 with
  | B_dData_dList.C_List_Nil -> (((v_dtFieldsOfRecordGo (dtb_u_u216).Elab_dRecords.f_RecordMeta_recordMetaFields) 0) ((v_skipParamPis dtb_u_u214) (Elab_dTypes.v_dtCtorType dtb_u_u218)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
))
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Data.vuna"
let v_sameCtorSet = (fun (dtb_u_u220 : string B_dData_dList.t_List) (dtb_u_u221 : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u220) = (B_dData_dList.v_length dtb_u_u221)) then ((B_dData_dList.v_allMem dtb_u_u220) dtb_u_u221) else false))

# 237 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataBodies = (fun (dtb_u_u222 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u223 : Elab_dMeta.t_DataHead B_dData_dList.t_List) (dtb_u_u224 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u225 : Elab_dTypes.t_Ec) (dtb_u_u226 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u227 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match dtb_u_u222 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u226); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u224; B_dData_dPair.f_Pair_second = dtb_u_u225 } }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229) -> (match dtb_u_u228 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u230; B_dData_dPair.f_Pair_second = dtb_u_u231 } -> (match dtb_u_u230 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u232, dtb_u_u233, dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237, dtb_u_u238, dtb_u_u239, dtb_u_u240) -> (let dtb_u_u241 = ((Elab_dMeta.v_lookupDataHead dtb_u_u232) dtb_u_u223) in (match dtb_u_u241 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u242) -> (match dtb_u_u242 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u243; B_dData_dPair.f_Pair_second = dtb_u_u244 } -> (let dtb_u_u245 = (Elab_dMeta.v_splitKind dtb_u_u243) in (let dtb_u_u246 = (match (v_kindResultLevel dtb_u_u243) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> dtb_u_u254
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (if dtb_u_u237 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u240)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else ((Base_dCommon.v_bind ((((((v_elabCtors dtb_u_u224) dtb_u_u232) dtb_u_u244) dtb_u_u246) dtb_u_u225) dtb_u_u235)) (fun (dtb_u_u247 : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u247 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u248; B_dData_dPair.f_Pair_second = dtb_u_u249 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord dtb_u_u227) dtb_u_u232) (B_dData_dList.v_length dtb_u_u245)) dtb_u_u248)) (fun (dtb_u_u250 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let dtb_u_u251 = (if dtb_u_u237 then dtb_u_u236 else B_dData_dList.C_List_Nil) in (let dtb_u_u252 = { Elab_dTypes.f_DtData_dtDataName = dtb_u_u232; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u245; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u248; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u243; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u251; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u239; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u238; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u250; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb_u_u232) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u253) -> (if ((v_sameCtorSet dtb_u_u253) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb_u_u248)) then ((((((v_elabDataBodies dtb_u_u229) dtb_u_u223) ((B_dData_dList.v_append dtb_u_u224) (Elab_dMeta.v_ctorGlobals dtb_u_u248))) ((Elab_dTypes.v_ecAddData dtb_u_u249) dtb_u_u252)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u252, dtb_u_u226))) dtb_u_u227) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u240)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb_u_u232))) dtb_u_u232))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb_u_u229) dtb_u_u223) ((B_dData_dList.v_append dtb_u_u224) (Elab_dMeta.v_ctorGlobals dtb_u_u248))) ((Elab_dTypes.v_ecAddData dtb_u_u249) dtb_u_u252)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u252, dtb_u_u226))) dtb_u_u227)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb_u_u240)) ("DT: internal: missing data head for " ^ dtb_u_u232))
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u255, dtb_u_u256, dtb_u_u257, dtb_u_u258, dtb_u_u259, dtb_u_u260, dtb_u_u261, dtb_u_u262) -> (let dtb_u_u263 = ((Elab_dMeta.v_lookupDataHead dtb_u_u255) dtb_u_u223) in (match dtb_u_u263 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u264) -> (match dtb_u_u264 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u265; B_dData_dPair.f_Pair_second = dtb_u_u266 } -> (let dtb_u_u267 = (Elab_dMeta.v_splitKind dtb_u_u265) in (let dtb_u_u268 = (match (v_kindResultLevel dtb_u_u265) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u278) -> dtb_u_u278
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u269 = ((((Elab_dRecords.v_recordCtorType dtb_u_u256) dtb_u_u257) (((Elab_dRecords.v_recordRetType dtb_u_u255) dtb_u_u256) (Frontend_dAst.v_nodeRefSpan dtb_u_u262))) (Frontend_dAst.v_nodeRefSpan dtb_u_u262)) in (let dtb_u_u270 = { Frontend_dAst.f_Ctor_ctorName = dtb_u_u255; Frontend_dAst.f_Ctor_ctorType = dtb_u_u269; Frontend_dAst.f_Ctor_ctorArity = (B_dData_dList.v_length dtb_u_u257); Frontend_dAst.f_Ctor_ctorRef = dtb_u_u262 } in ((Base_dCommon.v_bind ((((((v_elabCtors dtb_u_u224) dtb_u_u255) dtb_u_u266) dtb_u_u268) dtb_u_u225) (B_dData_dList.C_List__x58__x58_ (dtb_u_u270, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u271 : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u271 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u272; B_dData_dPair.f_Pair_second = dtb_u_u273 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord dtb_u_u227) dtb_u_u255) (B_dData_dList.v_length dtb_u_u267)) dtb_u_u272)) (fun (dtb_u_u274 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let dtb_u_u275 = (if dtb_u_u259 then dtb_u_u258 else B_dData_dList.C_List_Nil) in (let dtb_u_u276 = { Elab_dTypes.f_DtData_dtDataName = dtb_u_u255; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u267; Elab_dTypes.f_DtData_dtDataCtors = dtb_u_u272; Elab_dTypes.f_DtData_dtDataKind = dtb_u_u265; Elab_dTypes.f_DtData_dtDataViaClasses = dtb_u_u275; Elab_dTypes.f_DtData_dtDataLinear = dtb_u_u261; Elab_dTypes.f_DtData_dtDataRepr = dtb_u_u260; Elab_dTypes.f_DtData_dtDataFields = dtb_u_u274; Elab_dTypes.f_DtData_dtDataIsRecord = true } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb_u_u255) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u277) -> (if ((v_sameCtorSet dtb_u_u277) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb_u_u272)) then ((((((v_elabDataBodies dtb_u_u229) dtb_u_u223) ((B_dData_dList.v_append dtb_u_u224) (Elab_dMeta.v_ctorGlobals dtb_u_u272))) ((Elab_dTypes.v_ecAddData dtb_u_u273) dtb_u_u276)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u276, dtb_u_u226))) dtb_u_u227) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u262)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb_u_u255))) dtb_u_u255))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb_u_u229) dtb_u_u223) ((B_dData_dList.v_append dtb_u_u224) (Elab_dMeta.v_ctorGlobals dtb_u_u272))) ((Elab_dTypes.v_ecAddData dtb_u_u273) dtb_u_u276)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u276, dtb_u_u226))) dtb_u_u227)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb_u_u262)) ("DT: internal: missing data head for " ^ dtb_u_u255))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((v_elabDataBodies dtb_u_u229) dtb_u_u223) dtb_u_u224) dtb_u_u225) dtb_u_u226) dtb_u_u227)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Data.vuna"
let v_reprIsAlias = (fun (dtb_u_u279 : Frontend_dAst.t_ReprTier) -> (match dtb_u_u279 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 368 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOkWith = (fun (dtb_u_u280 : string) (dtb_u_u281 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u282 : string B_dData_dList.t_List) (dtb_u_u283 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dtb_u_u280) dtb_u_u282) then (let dtb_u_u284 = ((Elab_dRepresentation.v_lookupUnboxedInfo dtb_u_u280) dtb_u_u283) in (match dtb_u_u284 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u285) -> (match dtb_u_u285 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u286; B_dData_dPair.f_Pair_second = dtb_u_u287 } -> (match ((Elab_dRepresentation.v_findDtData dtb_u_u280) dtb_u_u281) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u288) -> (dtb_u_u287 = (B_dData_dList.v_length (dtb_u_u288).Elab_dTypes.f_DtData_dtDataParams))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))

# 352 "Vuna/Compiler/Elab/Data.vuna"
let v_viaFieldOk = (fun (dtb_u_u289 : Frontend_dAst.t_ReprTier) (dtb_u_u290 : string) (dtb_u_u291 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u292 : string B_dData_dList.t_List) (dtb_u_u293 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u289 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> false
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((((v_viaShapeOkWith dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((((v_viaShapeOkWith dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293)
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Data.vuna"
let rec v_checkViaDataDeclsGo = (fun (dtb_u_u294 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u295 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u296 : string B_dData_dList.t_List) (dtb_u_u297 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u294 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u298, dtb_u_u299) -> (match dtb_u_u298 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u300; B_dData_dPair.f_Pair_second = dtb_u_u301 } -> (match dtb_u_u300 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u302, dtb_u_u303, dtb_u_u304, dtb_u_u305, dtb_u_u306, dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310) -> (if dtb_u_u307 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u310)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else (if (if (v_reprIsAlias dtb_u_u308) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u302) dtb_u_u296)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u310)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else ((((v_checkViaDataDeclsGo dtb_u_u299) dtb_u_u295) dtb_u_u296) dtb_u_u297)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314, dtb_u_u315, dtb_u_u316, dtb_u_u317, dtb_u_u318) -> (if (if (v_reprIsAlias dtb_u_u316) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u311) dtb_u_u296)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u318)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else (if dtb_u_u315 then (if (((((v_viaFieldOk dtb_u_u316) dtb_u_u311) dtb_u_u295) dtb_u_u296) dtb_u_u297) then ((((v_checkViaDataDeclsGo dtb_u_u299) dtb_u_u295) dtb_u_u296) dtb_u_u297) else ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u318)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaUnboxedRequired)) else ((((v_checkViaDataDeclsGo dtb_u_u299) dtb_u_u295) dtb_u_u296) dtb_u_u297)))
  | _ -> ((((v_checkViaDataDeclsGo dtb_u_u299) dtb_u_u295) dtb_u_u296) dtb_u_u297)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Elab/Data.vuna"
let v_checkViaDataDecls = (fun (dtb_u_u319 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u320 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_checkViaDataDeclsGo dtb_u_u319) dtb_u_u320) (Elab_dRepresentation.v_unboxedFamilySet dtb_u_u320)) (Elab_dRepresentation.v_unboxedInfoOf dtb_u_u320)))

# 365 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOk = (fun (dtb_u_u321 : string) (dtb_u_u322 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_viaShapeOkWith dtb_u_u321) dtb_u_u322) (Elab_dRepresentation.v_unboxedFamilySet dtb_u_u322)) (Elab_dRepresentation.v_unboxedInfoOf dtb_u_u322)))

# 382 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDatas = (fun (dtb_u_u323 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u324 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u325 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u326 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((v_elabDataHeads dtb_u_u323) dtb_u_u325) dtb_u_u326) B_dData_dList.C_List_Nil)) (fun (dtb_u_u327 : (Elab_dMeta.t_DataHead B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u328 = dtb_u_u327 in (match dtb_u_u328 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u329; B_dData_dPair.f_Pair_second = dtb_u_u330 } -> (match dtb_u_u330 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u331; B_dData_dPair.f_Pair_second = dtb_u_u332 } -> ((Base_dCommon.v_bind ((((((v_elabDataBodies dtb_u_u323) dtb_u_u329) dtb_u_u331) dtb_u_u332) B_dData_dList.C_List_Nil) dtb_u_u324)) (fun (dtb_u_u333 : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match dtb_u_u333 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u334; B_dData_dPair.f_Pair_second = dtb_u_u335 } -> ((Base_dCommon.v_bind ((v_checkViaDataDecls dtb_u_u323) dtb_u_u334)) (fun (dtb_u_u336 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u334; B_dData_dPair.f_Pair_second = dtb_u_u335 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
