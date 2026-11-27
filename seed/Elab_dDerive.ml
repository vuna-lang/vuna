open Vuna_runtime
# 32 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitShortName = (fun (dtb_u_u1 : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u1))))

# 36 "Vuna/Compiler/Elab/Derive.vuna"
let v_showEqClassName = "Base.Trait.Eq.Eq"

# 39 "Vuna/Compiler/Elab/Derive.vuna"
let v_showOrdClassName = "Base.Trait.Ord.Ord"

# 44 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodGlobal = (fun (dtb_u_u2 : string) (dtb_u_u3 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u2)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u4; B_dData_dPair.f_Pair_second = dtb_u_u5 } -> (match dtb_u_u4 with
  | B_dData_dList.C_List_Nil -> dtb_u_u3
  | _ -> (String.concat "" [(Base_dSource.v_joinDots dtb_u_u4); "."; dtb_u_u3])
)
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyTraitHasMethod = (fun (dtb_u_u6 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u7 : string) (dtb_u_u8 : string) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (match dtb_u_u9 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u11, dtb_u_u12, dtb_u_u13, dtb_u_u14, dtb_u_u15) -> (if (if (dtb_u_u11 = dtb_u_u7) then ((B_dData_dList.v_memName dtb_u_u8) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb_u_u14)) else false) then true else (((v_anyTraitHasMethod dtb_u_u10) dtb_u_u7) dtb_u_u8))
  | _ -> (((v_anyTraitHasMethod dtb_u_u10) dtb_u_u7) dtb_u_u8)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodOf = (fun (dtb_u_u16 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u17 : string) (dtb_u_u18 : string) (dtb_u_u19 : string) -> (if (((v_anyTraitHasMethod dtb_u_u16) dtb_u_u17) dtb_u_u18) then dtb_u_u18 else (if (((v_anyTraitHasMethod dtb_u_u16) dtb_u_u17) dtb_u_u19) then dtb_u_u19 else dtb_u_u18)))

# 110 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordCtorOf = (fun (dtb_u_u20 : string) (dtb_u_u21 : string B_dData_dList.t_List) (dtb_u_u22 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u23 : Frontend_dAst.t_NodeRef) -> (let dtb_u_u24 = (Frontend_dAst.v_nodeRefSpan dtb_u_u23) in { Frontend_dAst.f_Ctor_ctorName = dtb_u_u20; Frontend_dAst.f_Ctor_ctorType = (((Elab_dRecords.v_recordArrowType dtb_u_u22) (((Elab_dRecords.v_recordRetType dtb_u_u20) dtb_u_u21) dtb_u_u24)) dtb_u_u24); Frontend_dAst.f_Ctor_ctorArity = (B_dData_dList.v_length dtb_u_u22); Frontend_dAst.f_Ctor_ctorRef = dtb_u_u23 }))

# 152 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_exprMentionsName = (fun (dtb_u_u25 : string) (dtb_u_u26 : Frontend_dAst.t_Expr) -> (match dtb_u_u26 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u27, dtb_u_u28, dtb_u_u29, dtb_u_u30, dtb_u_u31, dtb_u_u32) -> (if ((v_exprMentionsName dtb_u_u25) dtb_u_u30) then true else ((v_exprMentionsName dtb_u_u25) dtb_u_u31))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u33, dtb_u_u34, dtb_u_u35) -> (if ((v_exprMentionsName dtb_u_u25) dtb_u_u33) then true else ((v_anyExprMentions dtb_u_u25) dtb_u_u34))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u36, dtb_u_u37) -> (dtb_u_u36 = dtb_u_u25)
  | _ -> false
))
# 158 "Vuna/Compiler/Elab/Derive.vuna"
and v_anyExprMentions = (fun (dtb_u_u38 : string) (dtb_u_u39 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (if ((v_exprMentionsName dtb_u_u38) dtb_u_u40) then true else ((v_anyExprMentions dtb_u_u38) dtb_u_u41))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyCtorMentions = (fun (dtb_u_u42 : string) (dtb_u_u43 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (match dtb_u_u44 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u46; Frontend_dAst.f_Ctor_ctorType = dtb_u_u47; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u48; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u49 } -> (if ((v_exprMentionsName dtb_u_u42) dtb_u_u47) then true else ((v_anyCtorMentions dtb_u_u42) dtb_u_u45))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_deriveCtxParams = (fun (dtb_u_u50 : string B_dData_dList.t_List) (dtb_u_u51 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> (if ((v_anyCtorMentions dtb_u_u52) dtb_u_u51) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u52, ((v_deriveCtxParams dtb_u_u53) dtb_u_u51))) else ((v_deriveCtxParams dtb_u_u53) dtb_u_u51))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_deriveFieldTypes = (fun (dtb_u_u54 : Frontend_dAst.t_Expr) -> (match dtb_u_u54 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u58, dtb_u_u59, dtb_u_u60) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u58, (v_deriveFieldTypes dtb_u_u59)))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u61, dtb_u_u62, dtb_u_u63) -> (match dtb_u_u61 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u64, dtb_u_u65) -> (if (dtb_u_u64 = "->") then (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u69 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u66, (v_deriveFieldTypes dtb_u_u68)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 248 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveFieldTypeName = (fun (dtb_u_u70 : Frontend_dAst.t_Expr) -> (match dtb_u_u70 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u71, dtb_u_u72, dtb_u_u73) -> (match dtb_u_u71 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u74, dtb_u_u75) -> dtb_u_u74
  | _ -> "?"
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u76, dtb_u_u77) -> dtb_u_u76
  | _ -> "?"
))

# 229 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapperCtor = (fun (dtb_u_u78 : string) (dtb_u_u79 : string) (dtb_u_u80 : string) (dtb_u_u81 : Frontend_dAst.t_Ctor) (dtb_u_u82 : Frontend_dAst.t_Expr) (dtb_u_u83 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u81 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u84; Frontend_dAst.f_Ctor_ctorType = dtb_u_u85; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u86; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u87 } -> (if (dtb_u_u86 = 1) then (match (v_deriveFieldTypes dtb_u_u85) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (match dtb_u_u89 with
  | B_dData_dList.C_List_Nil -> (if ((v_deriveFieldTypeName dtb_u_u88) = dtb_u_u80) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (B_dData_dList.C_List_Nil, dtb_u_u82, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u79, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u83)), B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u84, dtb_u_u83)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u83)), B_dData_dList.C_List_Nil)), dtb_u_u83)), dtb_u_u83)), B_dData_dList.C_List_Nil)), dtb_u_u83)))) else (((((Base_dDiagnostics_dTc.v_tcErr3 (Frontend_dAst.v_nodeRefSpan dtb_u_u83)) (Base_dDiagnostics_dTc.C_TcErr_DeriveFieldType ((v_traitShortName dtb_u_u78), dtb_u_u80, (v_deriveFieldTypeName dtb_u_u88)))) (v_traitShortName dtb_u_u78)) dtb_u_u80) (v_deriveFieldTypeName dtb_u_u88)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u83)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName dtb_u_u78)))) (v_traitShortName dtb_u_u78))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u83)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName dtb_u_u78)))) (v_traitShortName dtb_u_u78))
  | _ -> failwith "DT: impossible branch"
) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u83)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName dtb_u_u78)))) (v_traitShortName dtb_u_u78)))
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapper = (fun (dtb_u_u90 : string) (dtb_u_u91 : string) (dtb_u_u92 : string) (dtb_u_u93 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u94 : Frontend_dAst.t_Expr) (dtb_u_u95 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u96, dtb_u_u97) -> (match dtb_u_u97 with
  | B_dData_dList.C_List_Nil -> ((((((v_deriveWrapperCtor dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u96) dtb_u_u94) dtb_u_u95)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u95)) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName dtb_u_u90)))) (v_traitShortName dtb_u_u90))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u95)) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName dtb_u_u90)))) (v_traitShortName dtb_u_u90))
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Elab/Derive.vuna"
let v_applyTypeParams = (fun (dtb_u_u98 : Frontend_dAst.t_Expr) (dtb_u_u99 : string B_dData_dList.t_List) (dtb_u_u100 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u99 with
  | B_dData_dList.C_List_Nil -> dtb_u_u98
  | _ -> (Frontend_dAst.C_Expr_EApp (dtb_u_u98, ((B_dData_dList.v_map (fun (dtb_u_u101 : string) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u101, dtb_u_u100)))) dtb_u_u99), dtb_u_u100))
))

# 254 "Vuna/Compiler/Elab/Derive.vuna"
let v_instHead = (fun (dtb_u_u102 : string) (dtb_u_u103 : string) (dtb_u_u104 : string B_dData_dList.t_List) (dtb_u_u105 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u102, dtb_u_u105)), (B_dData_dList.C_List__x58__x58_ ((((v_applyTypeParams (Frontend_dAst.C_Expr_EVar (dtb_u_u103, dtb_u_u105))) dtb_u_u104) dtb_u_u105), B_dData_dList.C_List_Nil)), dtb_u_u105)))

# 294 "Vuna/Compiler/Elab/Derive.vuna"
let v_showOne = (fun (dtb_u_u106 : string) (dtb_u_u107 : string) (dtb_u_u108 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u106, dtb_u_u108)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u107, dtb_u_u108)), B_dData_dList.C_List_Nil)), dtb_u_u108)))

# 283 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showFields = (fun (dtb_u_u109 : string) (dtb_u_u110 : string B_dData_dList.t_List) (dtb_u_u111 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u110 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> (match dtb_u_u113 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", dtb_u_u111)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne dtb_u_u109) dtb_u_u112) dtb_u_u111), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (")", dtb_u_u111)), B_dData_dList.C_List_Nil)))), dtb_u_u111))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", dtb_u_u111)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne dtb_u_u109) dtb_u_u112) dtb_u_u111), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", dtb_u_u111)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (" ", dtb_u_u111)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields dtb_u_u109) dtb_u_u113) dtb_u_u111), B_dData_dList.C_List_Nil)))), dtb_u_u111)), B_dData_dList.C_List_Nil)))), dtb_u_u111))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr (")", dtb_u_u111))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Elab/Derive.vuna"
let v_showCtor = (fun (dtb_u_u114 : string) (dtb_u_u115 : string) (dtb_u_u116 : string B_dData_dList.t_List) (dtb_u_u117 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u116 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ((Frontend_dAst.v_ctorShortName dtb_u_u115), dtb_u_u117))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", dtb_u_u117)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr ((String.concat "" ["("; (Frontend_dAst.v_ctorShortName dtb_u_u115); " "]), dtb_u_u117)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields dtb_u_u114) dtb_u_u116) dtb_u_u117), B_dData_dList.C_List_Nil)))), dtb_u_u117))
))

# 318 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashFields = (fun (dtb_u_u118 : string) (dtb_u_u119 : string) (dtb_u_u120 : string B_dData_dList.t_List) (dtb_u_u121 : Frontend_dAst.t_Expr) (dtb_u_u122 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u120 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u123, dtb_u_u124) -> (((((v_hashFields dtb_u_u118) dtb_u_u119) dtb_u_u124) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u119, dtb_u_u122)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u121, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u118, dtb_u_u122)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u123, dtb_u_u122)), B_dData_dList.C_List_Nil)), dtb_u_u122)), B_dData_dList.C_List_Nil)))), dtb_u_u122))) dtb_u_u122)
  | B_dData_dList.C_List_Nil -> dtb_u_u121
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_varNamesAtGo = (fun (dtb_u_u125 : int) (dtb_u_u126 : string) (dtb_u_u127 : int) -> (if (dtb_u_u125 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((dtb_u_u126 ^ (string_of_int (dtb_u_u127 - dtb_u_u125))), (((v_varNamesAtGo (dtb_u_u125 - 1)) dtb_u_u126) dtb_u_u127)))))

# 429 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNamesAt = (fun (dtb_u_u128 : string) (dtb_u_u129 : int) (dtb_u_u130 : int) -> (((v_varNamesAtGo (dtb_u_u130 - dtb_u_u129)) dtb_u_u128) dtb_u_u130))

# 426 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNames = (fun (dtb_u_u131 : string) (dtb_u_u132 : int) -> (((v_varNamesAt dtb_u_u131) 0) dtb_u_u132))

# 268 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showAlts = (fun (dtb_u_u133 : string) (dtb_u_u134 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u135 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u134 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (match dtb_u_u136 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u138; Frontend_dAst.f_Ctor_ctorType = dtb_u_u139; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u140; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u141 } -> (let dtb_u_u142 = ((v_varNames "fa") dtb_u_u140) in (let dtb_u_u143 = (Frontend_dAst.C_Pat_PCon (dtb_u_u138, ((B_dData_dList.v_map (fun (dtb_u_u144 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u144, dtb_u_u135)))) dtb_u_u142), dtb_u_u135)) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u143; Frontend_dAst.f_Alt_altBody = ((((v_showCtor dtb_u_u133) dtb_u_u138) dtb_u_u142) dtb_u_u135); Frontend_dAst.f_Alt_altRef = dtb_u_u135 }, (((v_showAlts dtb_u_u133) dtb_u_u137) dtb_u_u135)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Derive.vuna"
let v_showBody = (fun (dtb_u_u145 : string) (dtb_u_u146 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u147 : string) (dtb_u_u148 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (dtb_u_u147, dtb_u_u148)), (((v_showAlts dtb_u_u145) dtb_u_u146) dtb_u_u148), dtb_u_u148)))

# 308 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashAlts = (fun (dtb_u_u149 : string) (dtb_u_u150 : string) (dtb_u_u151 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u152 : int) (dtb_u_u153 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u151 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (match dtb_u_u154 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u156; Frontend_dAst.f_Ctor_ctorType = dtb_u_u157; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u158; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u159 } -> (let dtb_u_u160 = ((v_varNames "fa") dtb_u_u158) in (let dtb_u_u161 = (Frontend_dAst.C_Pat_PCon (dtb_u_u156, ((B_dData_dList.v_map (fun (dtb_u_u163 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u163, dtb_u_u153)))) dtb_u_u160), dtb_u_u153)) in (let dtb_u_u162 = (((((v_hashFields dtb_u_u149) dtb_u_u150) dtb_u_u160) (Frontend_dAst.C_Expr_EInt (dtb_u_u152, dtb_u_u153))) dtb_u_u153) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u161; Frontend_dAst.f_Alt_altBody = dtb_u_u162; Frontend_dAst.f_Alt_altRef = dtb_u_u153 }, (((((v_hashAlts dtb_u_u149) dtb_u_u150) dtb_u_u155) (dtb_u_u152 + 1)) dtb_u_u153))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Derive.vuna"
let v_hashBody = (fun (dtb_u_u164 : string) (dtb_u_u165 : string) (dtb_u_u166 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u167 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u167)), (((((v_hashAlts dtb_u_u164) dtb_u_u165) dtb_u_u166) 0) dtb_u_u167), dtb_u_u167)))

# 440 "Vuna/Compiler/Elab/Derive.vuna"
let v_gtBody = (fun (dtb_u_u168 : string) (dtb_u_u169 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u168, dtb_u_u169)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u169)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u169)), B_dData_dList.C_List_Nil)))), dtb_u_u169)))

# 443 "Vuna/Compiler/Elab/Derive.vuna"
let v_geBody = (fun (dtb_u_u170 : string) (dtb_u_u171 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u170, dtb_u_u171)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u171)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u171)), B_dData_dList.C_List_Nil)))), dtb_u_u171)))

# 452 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolTrue = (fun (dtb_u_u172 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_boolTrueCtor, dtb_u_u172)))

# 455 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolFalse = (fun (dtb_u_u173 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_boolFalseCtor, dtb_u_u173)))

# 354 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_conjFields = (fun (dtb_u_u174 : string B_dData_dList.t_List) (dtb_u_u175 : string B_dData_dList.t_List) (dtb_u_u176 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u174 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u177, dtb_u_u178) -> (match dtb_u_u175 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u179, dtb_u_u180) -> (match dtb_u_u178 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u177, dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u179, dtb_u_u176)), B_dData_dList.C_List_Nil)))), dtb_u_u176))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u177, dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u179, dtb_u_u176)), B_dData_dList.C_List_Nil)))), dtb_u_u176)), (B_dData_dList.C_List__x58__x58_ ((((v_conjFields dtb_u_u178) dtb_u_u180) dtb_u_u176), B_dData_dList.C_List_Nil)))), dtb_u_u176))
)
  | _ -> (v_boolFalse dtb_u_u176)
)
  | B_dData_dList.C_List_Nil -> (v_boolTrue dtb_u_u176)
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqInner = (fun (dtb_u_u181 : string) (dtb_u_u182 : int) (dtb_u_u183 : Frontend_dAst.t_NodeRef) -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb_u_u181, ((B_dData_dList.v_map (fun (dtb_u_u184 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u184, dtb_u_u183)))) ((v_varNames "fb") dtb_u_u182)), dtb_u_u183)); Frontend_dAst.f_Alt_altBody = (((v_conjFields ((v_varNames "fa") dtb_u_u182)) ((v_varNames "fb") dtb_u_u182)) dtb_u_u183); Frontend_dAst.f_Alt_altRef = dtb_u_u183 }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PWild (dtb_u_u183)); Frontend_dAst.f_Alt_altBody = (v_boolFalse dtb_u_u183); Frontend_dAst.f_Alt_altRef = dtb_u_u183 }, B_dData_dList.C_List_Nil)))))

# 335 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqAlt = (fun (dtb_u_u185 : Frontend_dAst.t_Ctor) (dtb_u_u186 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u185 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u187; Frontend_dAst.f_Ctor_ctorType = dtb_u_u188; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u189; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u190 } -> (let dtb_u_u191 = ((v_varNames "fa") dtb_u_u189) in (let dtb_u_u192 = (Frontend_dAst.C_Pat_PCon (dtb_u_u187, ((B_dData_dList.v_map (fun (dtb_u_u194 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u194, dtb_u_u186)))) dtb_u_u191), dtb_u_u186)) in (let dtb_u_u193 = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u186)), (((v_eqInner dtb_u_u187) dtb_u_u189) dtb_u_u186), dtb_u_u186)) in { Frontend_dAst.f_Alt_altPat = dtb_u_u192; Frontend_dAst.f_Alt_altBody = dtb_u_u193; Frontend_dAst.f_Alt_altRef = dtb_u_u186 })))
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqBody = (fun (dtb_u_u195 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u196 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u196)), ((B_dData_dList.v_map (fun (dtb_u_u197 : Frontend_dAst.t_Ctor) -> ((v_eqAlt dtb_u_u197) dtb_u_u196))) dtb_u_u195), dtb_u_u196)))

# 367 "Vuna/Compiler/Elab/Derive.vuna"
let v_neqBody = (fun (dtb_u_u198 : string) (dtb_u_u199 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u198, dtb_u_u199)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u199)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u199)), B_dData_dList.C_List_Nil)))), dtb_u_u199)), (v_boolFalse dtb_u_u199), (v_boolTrue dtb_u_u199), dtb_u_u199)))

# 404 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ltFields = (fun (dtb_u_u200 : string) (dtb_u_u201 : string B_dData_dList.t_List) (dtb_u_u202 : string B_dData_dList.t_List) (dtb_u_u203 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u204, dtb_u_u205) -> (match dtb_u_u202 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u206, dtb_u_u207) -> (match dtb_u_u205 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("<", dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u204, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u206, dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("||", dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("<", dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u204, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u206, dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u200, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u204, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u206, dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u200, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u206, dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u204, dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203)), (B_dData_dList.C_List__x58__x58_ (((((v_ltFields dtb_u_u200) dtb_u_u205) dtb_u_u207) dtb_u_u203), B_dData_dList.C_List_Nil)))), dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203)), B_dData_dList.C_List_Nil)))), dtb_u_u203))
)
  | _ -> (v_boolFalse dtb_u_u203)
)
  | B_dData_dList.C_List_Nil -> (v_boolFalse dtb_u_u203)
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordInnerGo = (fun (dtb_u_u208 : string) (dtb_u_u209 : int) (dtb_u_u210 : int) (dtb_u_u211 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u212 : int) (dtb_u_u213 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u211 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u214, dtb_u_u215) -> (match dtb_u_u214 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u216; Frontend_dAst.f_Ctor_ctorType = dtb_u_u217; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u218; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u219 } -> (let dtb_u_u220 = ((v_varNames "fb") dtb_u_u218) in (let dtb_u_u221 = (Frontend_dAst.C_Pat_PCon (dtb_u_u216, ((B_dData_dList.v_map (fun (dtb_u_u223 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u223, dtb_u_u213)))) dtb_u_u220), dtb_u_u213)) in (let dtb_u_u222 = (if (dtb_u_u212 = dtb_u_u209) then ((((v_ltFields dtb_u_u208) ((v_varNames "fa") dtb_u_u210)) dtb_u_u220) dtb_u_u213) else (if (dtb_u_u212 < dtb_u_u209) then (v_boolFalse dtb_u_u213) else (v_boolTrue dtb_u_u213))) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u221; Frontend_dAst.f_Alt_altBody = dtb_u_u222; Frontend_dAst.f_Alt_altRef = dtb_u_u213 }, ((((((v_ordInnerGo dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u215) (dtb_u_u212 + 1)) dtb_u_u213))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordInner = (fun (dtb_u_u224 : string) (dtb_u_u225 : int) (dtb_u_u226 : int) (dtb_u_u227 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u228 : Frontend_dAst.t_NodeRef) -> ((((((v_ordInnerGo dtb_u_u224) dtb_u_u225) dtb_u_u226) dtb_u_u227) 0) dtb_u_u228))

# 377 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordAlts = (fun (dtb_u_u229 : string) (dtb_u_u230 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u231 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u232 : int) (dtb_u_u233 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u231 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (match dtb_u_u234 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u236; Frontend_dAst.f_Ctor_ctorType = dtb_u_u237; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u238; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u239 } -> (let dtb_u_u240 = ((v_varNames "fa") dtb_u_u238) in (let dtb_u_u241 = (Frontend_dAst.C_Pat_PCon (dtb_u_u236, ((B_dData_dList.v_map (fun (dtb_u_u243 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u243, dtb_u_u233)))) dtb_u_u240), dtb_u_u233)) in (let dtb_u_u242 = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u233)), (((((v_ordInner dtb_u_u229) dtb_u_u232) dtb_u_u238) dtb_u_u230) dtb_u_u233), dtb_u_u233)) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u241; Frontend_dAst.f_Alt_altBody = dtb_u_u242; Frontend_dAst.f_Alt_altRef = dtb_u_u233 }, (((((v_ordAlts dtb_u_u229) dtb_u_u230) dtb_u_u235) (dtb_u_u232 + 1)) dtb_u_u233))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordBody = (fun (dtb_u_u244 : string) (dtb_u_u245 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u246 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u246)), (((((v_ordAlts dtb_u_u244) dtb_u_u245) dtb_u_u245) 0) dtb_u_u246), dtb_u_u246)))

# 419 "Vuna/Compiler/Elab/Derive.vuna"
let v_leBody = (fun (dtb_u_u247 : string) (dtb_u_u248 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("||", dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u247, dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u248)), B_dData_dList.C_List_Nil)))), dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u247, dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", dtb_u_u248)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", dtb_u_u248)), B_dData_dList.C_List_Nil)))), dtb_u_u248)), (v_boolFalse dtb_u_u248), (v_boolTrue dtb_u_u248), dtb_u_u248)), B_dData_dList.C_List_Nil)))), dtb_u_u248)))

# 165 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveInstance = (fun (dtb_u_u249 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u250 : string) (dtb_u_u251 : string B_dData_dList.t_List) (dtb_u_u252 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u253 : string) (dtb_u_u254 : Frontend_dAst.t_NodeRef) -> (let dtb_u_u255 = ((((v_instHead dtb_u_u253) dtb_u_u250) dtb_u_u251) dtb_u_u254) in (let dtb_u_u256 = ((v_deriveCtxParams dtb_u_u251) dtb_u_u252) in (let dtb_u_u257 = ((B_dData_dList.v_map (fun (dtb_u_u272 : string) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u253, dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u272, dtb_u_u254)), B_dData_dList.C_List_Nil)), dtb_u_u254)))) dtb_u_u256) in (if (dtb_u_u253 = "Base.Trait.Show.Show") then (let dtb_u_u258 = ((v_traitMethodGlobal dtb_u_u253) "show") in (let dtb_u_u259 = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun ("show", (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), B_dData_dList.C_List_Nil)), ((((v_showBody dtb_u_u258) dtb_u_u252) "sx") dtb_u_u254), dtb_u_u254)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u257, dtb_u_u255, dtb_u_u259, dtb_u_u254)))))) else (if (dtb_u_u253 = "Base.Trait.Eq.Eq") then (let dtb_u_u260 = ((((v_traitMethodOf dtb_u_u249) v_showEqClassName) "==") "eq") in (let dtb_u_u261 = ((((v_traitMethodOf dtb_u_u249) v_showEqClassName) "/=") "neq") in (let dtb_u_u262 = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u260, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), ((v_eqBody dtb_u_u252) dtb_u_u254), dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u261, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), ((v_neqBody "==") dtb_u_u254), dtb_u_u254)), B_dData_dList.C_List_Nil)))) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u257, dtb_u_u255, dtb_u_u262, dtb_u_u254))))))) else (if (dtb_u_u253 = "Base.Trait.Ord.Ord") then (let dtb_u_u263 = ((((v_traitMethodOf dtb_u_u249) v_showOrdClassName) "<") "lt") in (let dtb_u_u264 = ((((v_traitMethodOf dtb_u_u249) v_showOrdClassName) "<=") "le") in (let dtb_u_u265 = ((((v_traitMethodOf dtb_u_u249) v_showOrdClassName) ">") "gt") in (let dtb_u_u266 = ((((v_traitMethodOf dtb_u_u249) v_showOrdClassName) ">=") "ge") in (let dtb_u_u267 = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u263, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), (((v_ordBody "<=") dtb_u_u252) dtb_u_u254), dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u264, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), ((v_leBody "<") dtb_u_u254), dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u265, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), ((v_gtBody "<") dtb_u_u254), dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (dtb_u_u266, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", dtb_u_u254)), B_dData_dList.C_List_Nil)))), ((v_geBody "<=") dtb_u_u254), dtb_u_u254)), B_dData_dList.C_List_Nil)))))))) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u257, dtb_u_u255, dtb_u_u267, dtb_u_u254))))))))) else (if (dtb_u_u253 = "Base.Trait.Hashable.Hashable") then (let dtb_u_u268 = ((v_traitMethodGlobal dtb_u_u253) "hash") in (let dtb_u_u269 = ((v_traitMethodGlobal dtb_u_u253) "hashCombine") in (let dtb_u_u270 = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun ("hash", (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", dtb_u_u254)), B_dData_dList.C_List_Nil)), ((((v_hashBody dtb_u_u268) dtb_u_u269) dtb_u_u252) dtb_u_u254), dtb_u_u254)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u257, dtb_u_u255, dtb_u_u270, dtb_u_u254))))))) else (if (dtb_u_u253 = "Base.Trait.FromString.FromString") then ((((((v_deriveWrapper dtb_u_u253) "fromString") "String") dtb_u_u252) dtb_u_u255) dtb_u_u254) else (if (dtb_u_u253 = "Base.Trait.FromInt.FromInt") then ((((((v_deriveWrapper dtb_u_u253) "fromInt") "Int") dtb_u_u252) dtb_u_u255) dtb_u_u254) else (if (dtb_u_u253 = "Base.Data.Float.FromFloat") then ((((((v_deriveWrapper dtb_u_u253) "fromFloat") "Float") dtb_u_u252) dtb_u_u255) dtb_u_u254) else (let dtb_u_u271 = dtb_u_u253 in (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u254)) (Base_dDiagnostics_dTc.C_TcErr_DeriveUnsupportedKind (dtb_u_u271))) dtb_u_u271)))))))))))))

# 125 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_derivingsForGo = (fun (dtb_u_u273 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u274 : string) (dtb_u_u275 : string B_dData_dList.t_List) (dtb_u_u276 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u277 : string B_dData_dList.t_List) (dtb_u_u278 : Frontend_dAst.t_NodeRef) (dtb_u_u279 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u280, dtb_u_u281) -> (if (dtb_u_u280 = Loader_dSelectors.v_selectorDerivingName) then (((((((v_derivingsForGo dtb_u_u273) dtb_u_u274) dtb_u_u275) dtb_u_u276) dtb_u_u281) dtb_u_u278) dtb_u_u279) else ((Base_dCommon.v_bind ((((((v_deriveInstance dtb_u_u273) dtb_u_u274) dtb_u_u275) dtb_u_u276) dtb_u_u280) dtb_u_u278)) (fun (dtb_u_u282 : Frontend_dAst.t_Decl) -> (((((((v_derivingsForGo dtb_u_u273) dtb_u_u274) dtb_u_u275) dtb_u_u276) dtb_u_u281) dtb_u_u278) (B_dData_dList.C_List__x58__x58_ (dtb_u_u282, dtb_u_u279))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u279)))
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Derive.vuna"
let v_derivingsFor = (fun (dtb_u_u283 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u284 : string) (dtb_u_u285 : string B_dData_dList.t_List) (dtb_u_u286 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u287 : string B_dData_dList.t_List) (dtb_u_u288 : Frontend_dAst.t_NodeRef) -> (((((((v_derivingsForGo dtb_u_u283) dtb_u_u284) dtb_u_u285) dtb_u_u286) dtb_u_u287) dtb_u_u288) B_dData_dList.C_List_Nil))

# 117 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordDerivingsFor = (fun (dtb_u_u289 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u290 : string) (dtb_u_u291 : string B_dData_dList.t_List) (dtb_u_u292 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u293 : string B_dData_dList.t_List) (dtb_u_u294 : Frontend_dAst.t_NodeRef) -> ((((((v_derivingsFor dtb_u_u289) dtb_u_u290) dtb_u_u291) (B_dData_dList.C_List__x58__x58_ (((((v_recordCtorOf dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u294), B_dData_dList.C_List_Nil))) dtb_u_u293) dtb_u_u294))

# 84 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_collectDerivings = (fun (dtb_u_u295 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u296 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u296 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u297, dtb_u_u298) -> (match dtb_u_u297 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u299, dtb_u_u300, dtb_u_u301, dtb_u_u302, dtb_u_u303, dtb_u_u304, dtb_u_u305, dtb_u_u306, dtb_u_u307) -> (if dtb_u_u304 then ((v_collectDerivings dtb_u_u295) dtb_u_u298) else (if ((B_dData_dList.v_length dtb_u_u303) = 0) then ((v_collectDerivings dtb_u_u295) dtb_u_u298) else ((Base_dCommon.v_bind ((((((v_derivingsFor dtb_u_u295) dtb_u_u299) dtb_u_u300) dtb_u_u302) dtb_u_u303) dtb_u_u307)) (fun (dtb_u_u308 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings dtb_u_u295) dtb_u_u298)) (fun (dtb_u_u309 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u308) dtb_u_u309)))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314, dtb_u_u315, dtb_u_u316, dtb_u_u317) -> (if dtb_u_u314 then ((v_collectDerivings dtb_u_u295) dtb_u_u298) else (if ((B_dData_dList.v_length dtb_u_u313) = 0) then ((v_collectDerivings dtb_u_u295) dtb_u_u298) else ((Base_dCommon.v_bind ((((((v_recordDerivingsFor dtb_u_u295) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u317)) (fun (dtb_u_u318 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings dtb_u_u295) dtb_u_u298)) (fun (dtb_u_u319 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u318) dtb_u_u319)))))))))
  | _ -> ((v_collectDerivings dtb_u_u295) dtb_u_u298)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Derive.vuna"
let v_expandDerivings = (fun (dtb_u_u320 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings dtb_u_u320) dtb_u_u320)) (fun (dtb_u_u321 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u320) dtb_u_u321))))))
