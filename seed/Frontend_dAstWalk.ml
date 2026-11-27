open Vuna_runtime
# 53 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_bindingSigExprs = (fun (mc0 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dList.C_List__x58__x58_ ((dtb__0).Frontend_dAst.f_BindingSig_sigType, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_clauseExprs = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (B_dData_dList.C_List__x58__x58_ ((dtb__1).Frontend_dAst.f_LocalClause_lcBody, (v_clauseExprs dtb__2)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_bindingValueExprs = (fun (mc0 : Frontend_dAst.t_BindingValue) -> (match mc0 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__3) -> (v_clauseExprs dtb__3)
  | Frontend_dAst.C_BindingValue_BVal (dtb__4) -> (B_dData_dList.C_List__x58__x58_ (dtb__4, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_bindingExprs = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> ((B_dData_dList.v_append (v_bindingValueExprs (dtb__5).Frontend_dAst.f_Binding_bindValue)) ((B_dData_dList.v_append (v_bindingSigExprs (dtb__5).Frontend_dAst.f_Binding_bindSig)) (v_bindingExprs dtb__6)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_doStmtExprs = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__9, dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, (v_doStmtExprs dtb__8)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__12, dtb__13) -> (B_dData_dList.C_List__x58__x58_ (dtb__12, (v_doStmtExprs dtb__8)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__14, dtb__15) -> ((B_dData_dList.v_append (v_bindingExprs dtb__14)) (v_doStmtExprs dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_interpExprs = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__18) -> (v_interpExprs dtb__17)
  | Frontend_dAst.C_InterpPart_IPHole (dtb__19) -> (B_dData_dList.C_List__x58__x58_ (dtb__19, (v_interpExprs dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_exprChildren = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__20, dtb__21) -> (v_interpExprs dtb__20)
  | Frontend_dAst.C_Expr_EDo (dtb__22, dtb__23) -> (v_doStmtExprs dtb__22)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__24, dtb__25, dtb__26) -> (B_dData_dList.C_List__x58__x58_ (dtb__24, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__25)))
  | Frontend_dAst.C_Expr_ERecord (dtb__27, dtb__28, dtb__29) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__28)
  | Frontend_dAst.C_Expr_EField (dtb__30, dtb__31, dtb__32) -> (B_dData_dList.C_List__x58__x58_ (dtb__30, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EIf (dtb__33, dtb__34, dtb__35, dtb__36) -> (B_dData_dList.C_List__x58__x58_ (dtb__33, (B_dData_dList.C_List__x58__x58_ (dtb__34, (B_dData_dList.C_List__x58__x58_ (dtb__35, B_dData_dList.C_List_Nil))))))
  | Frontend_dAst.C_Expr_ECase (dtb__37, dtb__38, dtb__39) -> (B_dData_dList.C_List__x58__x58_ (dtb__37, ((B_dData_dList.v_map Frontend_dAst.v_altBody) dtb__38)))
  | Frontend_dAst.C_Expr_ELet (dtb__40, dtb__41, dtb__42, dtb__43) -> ((B_dData_dList.v_append (v_bindingExprs dtb__40)) (B_dData_dList.C_List__x58__x58_ (dtb__41, B_dData_dList.C_List_Nil)))
  | Frontend_dAst.C_Expr_EPi (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (B_dData_dList.C_List__x58__x58_ (dtb__47, (B_dData_dList.C_List__x58__x58_ (dtb__48, B_dData_dList.C_List_Nil))))
  | Frontend_dAst.C_Expr_EApp (dtb__50, dtb__51, dtb__52) -> (B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51))
  | Frontend_dAst.C_Expr_ELam (dtb__53, dtb__54, dtb__55) -> (B_dData_dList.C_List__x58__x58_ (dtb__54, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EFloat (dtb__56, dtb__57) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__58, dtb__59) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EInt (dtb__60, dtb__61) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EVar (dtb__62, dtb__63) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_ctorTypes = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ ((dtb__64).Frontend_dAst.f_Ctor_ctorType, (v_ctorTypes dtb__65)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_fieldTypes = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (B_dData_dList.C_List__x58__x58_ ((dtb__66).Frontend_dAst.f_Field_fieldType, (v_fieldTypes dtb__67)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_traitMethodTypes = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (B_dData_dList.C_List__x58__x58_ ((dtb__68).Frontend_dAst.f_TraitMethod_traitMethodType, (v_traitMethodTypes dtb__69)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_paramKindExprs = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match (dtb__70).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_paramKindExprs dtb__71)
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dList.C_List__x58__x58_ (dtb__72, (v_paramKindExprs dtb__71)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_patChildren = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__73, dtb__74, dtb__75) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__74)
  | Frontend_dAst.C_Pat_PStr (dtb__76, dtb__77) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__78, dtb__79) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__80, dtb__81, dtb__82) -> dtb__81
  | Frontend_dAst.C_Pat_PWild (dtb__83) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__84, dtb__85, dtb__86) -> (B_dData_dList.C_List__x58__x58_ (dtb__85, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Pat_PVar (dtb__87, dtb__88) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_clausePats = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> ((B_dData_dList.v_append (dtb__89).Frontend_dAst.f_LocalClause_lcPats) (v_clausePats dtb__90))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_bindingValuePats = (fun (mc0 : Frontend_dAst.t_BindingValue) -> (match mc0 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__91) -> (v_clausePats dtb__91)
  | Frontend_dAst.C_BindingValue_BVal (dtb__92) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_bindingPats = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((dtb__93).Frontend_dAst.f_Binding_bindPat, (v_bindingValuePats (dtb__93).Frontend_dAst.f_Binding_bindValue)))) (v_bindingPats dtb__94))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_doStmtPats = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__95 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__97, dtb__98, dtb__99) -> (B_dData_dList.C_List__x58__x58_ (dtb__97, (v_doStmtPats dtb__96)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__100, dtb__101) -> (v_doStmtPats dtb__96)
  | Frontend_dAst.C_DoStmt_DLet (dtb__102, dtb__103) -> ((B_dData_dList.v_append (v_bindingPats dtb__102)) (v_doStmtPats dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_altPatOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altPat)

# 106 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_exprPats = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__104, dtb__105) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EDo (dtb__106, dtb__107) -> (v_doStmtPats dtb__106)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__108, dtb__109, dtb__110) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ERecord (dtb__111, dtb__112, dtb__113) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EField (dtb__114, dtb__115, dtb__116) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EIf (dtb__117, dtb__118, dtb__119, dtb__120) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ECase (dtb__121, dtb__122, dtb__123) -> ((B_dData_dList.v_map v_altPatOf) dtb__122)
  | Frontend_dAst.C_Expr_ELet (dtb__124, dtb__125, dtb__126, dtb__127) -> (v_bindingPats dtb__124)
  | Frontend_dAst.C_Expr_EPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EApp (dtb__134, dtb__135, dtb__136) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ELam (dtb__137, dtb__138, dtb__139) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EFloat (dtb__140, dtb__141) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__142, dtb__143) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EInt (dtb__144, dtb__145) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EVar (dtb__146, dtb__147) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_declExprs = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__148, dtb__149, dtb__150, dtb__151) -> ((B_dData_dList.v_append ((B_dData_dList.v_append dtb__148) (B_dData_dList.C_List__x58__x58_ (dtb__149, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_concatMap v_declExprs) dtb__150))
  | Frontend_dAst.C_Decl_DTrait (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((B_dData_dList.v_append ((B_dData_dList.v_append (v_paramKindExprs dtb__153)) dtb__154)) (v_traitMethodTypes dtb__155))
  | Frontend_dAst.C_Decl_DRecord (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (v_fieldTypes dtb__159)
  | Frontend_dAst.C_Decl_DFun (dtb__165, dtb__166, dtb__167, dtb__168) -> (B_dData_dList.C_List__x58__x58_ (dtb__167, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__169, dtb__170, dtb__171, dtb__172) -> ((B_dData_dList.v_append dtb__170) (B_dData_dList.C_List__x58__x58_ (dtb__171, B_dData_dList.C_List_Nil)))
  | Frontend_dAst.C_Decl_DExtern (dtb__173, dtb__174, dtb__175, dtb__176) -> (B_dData_dList.C_List__x58__x58_ (dtb__175, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__177, dtb__178, dtb__179) -> (B_dData_dList.C_List__x58__x58_ (dtb__178, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> (B_dData_dList.C_List__x58__x58_ (dtb__182, (v_ctorTypes dtb__183)))
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_declPats = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DTrait (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DRecord (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DSig (dtb__202, dtb__203, dtb__204, dtb__205) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DExtern (dtb__206, dtb__207, dtb__208, dtb__209) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DAxiom (dtb__210, dtb__211, dtb__212) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DData (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DInstance (dtb__222, dtb__223, dtb__224, dtb__225) -> ((B_dData_dList.v_concatMap v_declPats) dtb__224)
  | Frontend_dAst.C_Decl_DFun (dtb__226, dtb__227, dtb__228, dtb__229) -> dtb__227
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_walkFuel = 1000000

# 178 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_foldExprWork = (fun (fuel : int) f acc (work : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match work with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> ((((v_foldExprWork (fuel - 1)) f) ((f acc) dtb__230)) ((B_dData_dList.v_append (v_exprChildren dtb__230)) dtb__231))
  | _ -> failwith "DT: impossible branch"
)))

# 175 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_foldExpr = (fun f acc (e : Frontend_dAst.t_Expr) -> ((((v_foldExprWork v_walkFuel) f) acc) (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil))))

# 190 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_foldPatWork = (fun (fuel : int) f acc (work : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match work with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> ((((v_foldPatWork (fuel - 1)) f) ((f acc) dtb__232)) ((B_dData_dList.v_append (v_patChildren dtb__232)) dtb__233))
  | _ -> failwith "DT: impossible branch"
)))

# 187 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_foldPat = (fun f acc (p : Frontend_dAst.t_Pat) -> ((((v_foldPatWork v_walkFuel) f) acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil))))

# 206 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_foldExprPatWork = (fun (fuel : int) f g acc (work : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match work with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (let acc1 = ((f acc) dtb__234) in (let acc2 = ((((v_foldPatWork fuel) g) acc1) (v_exprPats dtb__234)) in (((((v_foldExprPatWork (fuel - 1)) f) g) acc2) ((B_dData_dList.v_append (v_exprChildren dtb__234)) dtb__235))))
  | _ -> failwith "DT: impossible branch"
)))

# 199 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_foldDecl = (fun f g acc (d : Frontend_dAst.t_Decl) -> (let accPats = ((((v_foldPatWork v_walkFuel) g) acc) (v_declPats d)) in (((((v_foldExprPatWork v_walkFuel) f) g) accPats) (v_declExprs d))))

# 264 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapExprList = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> ((Base_dCommon.v_bind (mc0 dtb__236)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapExprList mc0) dtb__237)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (e2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapBindingSigExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> ((Base_dCommon.v_bind (mc0 (dtb__238).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__238).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapClauseExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> ((Base_dCommon.v_bind (mc0 (dtb__239).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapClauseExpr mc0) dtb__240)) (fun (rest2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = (dtb__239).Frontend_dAst.f_LocalClause_lcPats; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (dtb__239).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb__239).Frontend_dAst.f_LocalClause_lcHead }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapBindingValueExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_BindingValue) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__241) -> ((Base_dCommon.v_bind ((v_mapClauseExpr mc0) dtb__241)) (fun (cls2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cls2))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__242) -> ((Base_dCommon.v_bind (mc0 dtb__242)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapBindingOneExpr = (fun (f : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (b : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_mapBindingValueExpr f) (b).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind ((v_mapBindingSigExpr f) (b).Frontend_dAst.f_Binding_bindSig)) (fun (s2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = (b).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = s2; Frontend_dAst.f_Binding_bindRef = (b).Frontend_dAst.f_Binding_bindRef })))))))

# 271 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapBindingExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> ((Base_dCommon.v_bind ((v_mapBindingOneExpr mc0) dtb__243)) (fun (b2 : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_mapBindingExpr mc0) dtb__244)) (fun (rest2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (b2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapAltExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> ((Base_dCommon.v_bind (mc0 (dtb__245).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapAltExpr mc0) dtb__246)) (fun (rest2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (dtb__245).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (dtb__245).Frontend_dAst.f_Alt_altRef }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapFieldExprs = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> ((Base_dCommon.v_bind (mc0 (B_dData_dPair.v_secondOf dtb__247))) (fun (v2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapFieldExprs mc0) dtb__248)) (fun (rest2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__247); B_dData_dPair.f_Pair_second = v2 }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapOneDoStmtExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__249, dtb__250) -> ((Base_dCommon.v_bind ((v_mapBindingExpr mc0) dtb__249)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (binds2, dtb__250))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__251, dtb__252) -> ((Base_dCommon.v_bind (mc0 dtb__251)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__252))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__253, dtb__254, dtb__255) -> ((Base_dCommon.v_bind (mc0 dtb__254)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (dtb__253, e2, dtb__255))))))
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapDoStmtExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> ((Base_dCommon.v_bind ((v_mapOneDoStmtExpr mc0) dtb__256)) (fun (s2 : Frontend_dAst.t_DoStmt) -> ((Base_dCommon.v_bind ((v_mapDoStmtExpr mc0) dtb__257)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (s2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapOneInterpExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__258) -> ((Base_dCommon.v_bind (mc0 dtb__258)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_InterpPart_IPHole (e2))))))
  | Frontend_dAst.C_InterpPart_IPText (dtb__259) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_InterpPart_IPText (dtb__259))))
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapInterpExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> ((Base_dCommon.v_bind ((v_mapOneInterpExpr mc0) dtb__260)) (fun (p2 : Frontend_dAst.t_InterpPart) -> ((Base_dCommon.v_bind ((v_mapInterpExpr mc0) dtb__261)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (p2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapExpr = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__262, dtb__263) -> ((Base_dCommon.v_bind ((v_mapInterpExpr mc0) dtb__262)) (fun (parts2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (parts2, dtb__263))))))
  | Frontend_dAst.C_Expr_EDo (dtb__264, dtb__265) -> ((Base_dCommon.v_bind ((v_mapDoStmtExpr mc0) dtb__264)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__265))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__266, dtb__267, dtb__268) -> ((Base_dCommon.v_bind (mc0 dtb__266)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapFieldExprs mc0) dtb__267)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__268))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__269, dtb__270, dtb__271) -> ((Base_dCommon.v_bind ((v_mapFieldExprs mc0) dtb__270)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__269, fields2, dtb__271))))))
  | Frontend_dAst.C_Expr_EField (dtb__272, dtb__273, dtb__274) -> ((Base_dCommon.v_bind (mc0 dtb__272)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__273, dtb__274))))))
  | Frontend_dAst.C_Expr_EIf (dtb__275, dtb__276, dtb__277, dtb__278) -> ((Base_dCommon.v_bind (mc0 dtb__275)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (mc0 dtb__276)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (mc0 dtb__277)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__278))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__279, dtb__280, dtb__281) -> ((Base_dCommon.v_bind (mc0 dtb__279)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapAltExpr mc0) dtb__280)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__281))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__282, dtb__283, dtb__284, dtb__285) -> ((Base_dCommon.v_bind ((v_mapBindingExpr mc0) dtb__282)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (mc0 dtb__283)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__284, dtb__285))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291) -> ((Base_dCommon.v_bind (mc0 dtb__289)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (mc0 dtb__290)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__286, dtb__287, dtb__288, dom2, cod2, dtb__291))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__292, dtb__293, dtb__294) -> ((Base_dCommon.v_bind (mc0 dtb__292)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapExprList mc0) dtb__293)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__294))))))))
  | Frontend_dAst.C_Expr_ELam (dtb__295, dtb__296, dtb__297) -> ((Base_dCommon.v_bind (mc0 dtb__296)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__295, body2, dtb__297))))))
  | Frontend_dAst.C_Expr_EFloat (dtb__298, dtb__299) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Expr_EStr (dtb__300, dtb__301) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Expr_EInt (dtb__302, dtb__303) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Expr_EVar (dtb__304, dtb__305) -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapBindingOneExprPat = (fun (f : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (g : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (b : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (g (b).Frontend_dAst.f_Binding_bindPat)) (fun (pat2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_mapBindingValueExpr f) (b).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind ((v_mapBindingSigExpr f) (b).Frontend_dAst.f_Binding_bindSig)) (fun (s2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = pat2; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = s2; Frontend_dAst.f_Binding_bindRef = (b).Frontend_dAst.f_Binding_bindRef })))))))))

# 354 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapBindingExprPat = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__306, dtb__307) -> ((Base_dCommon.v_bind (((v_mapBindingOneExprPat mc0) mc1) dtb__306)) (fun (b2 : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (((v_mapBindingExprPat mc0) mc1) dtb__307)) (fun (rest2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (b2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapAltExprPat = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__308, dtb__309) -> ((Base_dCommon.v_bind (mc1 (dtb__308).Frontend_dAst.f_Alt_altPat)) (fun (pat2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (mc0 (dtb__308).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_mapAltExprPat mc0) mc1) dtb__309)) (fun (rest2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = pat2; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (dtb__308).Frontend_dAst.f_Alt_altRef }, rest2))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapOneDoStmtExprPat = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : Frontend_dAst.t_DoStmt) -> (match mc2 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__310, dtb__311) -> ((Base_dCommon.v_bind (((v_mapBindingExprPat mc0) mc1) dtb__310)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (binds2, dtb__311))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__312, dtb__313) -> ((Base_dCommon.v_bind (mc0 dtb__312)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__313))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__314, dtb__315, dtb__316) -> ((Base_dCommon.v_bind (mc1 dtb__314)) (fun (pat2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (mc0 dtb__315)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (pat2, e2, dtb__316))))))))
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapDoStmtExprPat = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__317, dtb__318) -> ((Base_dCommon.v_bind (((v_mapOneDoStmtExprPat mc0) mc1) dtb__317)) (fun (s2 : Frontend_dAst.t_DoStmt) -> ((Base_dCommon.v_bind (((v_mapDoStmtExprPat mc0) mc1) dtb__318)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (s2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapExprPat = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EDo (dtb__319, dtb__320) -> ((Base_dCommon.v_bind (((v_mapDoStmtExprPat mc0) mc1) dtb__319)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__320))))))
  | Frontend_dAst.C_Expr_ECase (dtb__321, dtb__322, dtb__323) -> ((Base_dCommon.v_bind (mc0 dtb__321)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_mapAltExprPat mc0) mc1) dtb__322)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__323))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__324, dtb__325, dtb__326, dtb__327) -> ((Base_dCommon.v_bind (((v_mapBindingExprPat mc0) mc1) dtb__324)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (mc0 dtb__325)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__326, dtb__327))))))))
  | _ -> ((v_mapExpr mc0) mc2)
))

# 403 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapPatList = (fun (mc0 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> ((Base_dCommon.v_bind (mc0 dtb__328)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_mapPatList mc0) dtb__329)) (fun (rest2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (p2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapPatFields = (fun (mc0 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__330, dtb__331) -> ((Base_dCommon.v_bind (mc0 (B_dData_dPair.v_secondOf dtb__330))) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_mapPatFields mc0) dtb__331)) (fun (rest2 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__330); B_dData_dPair.f_Pair_second = p2 }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapPat = (fun (mc0 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__332, dtb__333, dtb__334) -> ((Base_dCommon.v_bind ((v_mapPatFields mc0) dtb__333)) (fun (fields2 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb__332, fields2, dtb__334))))))
  | Frontend_dAst.C_Pat_PCon (dtb__335, dtb__336, dtb__337) -> ((Base_dCommon.v_bind ((v_mapPatList mc0) dtb__336)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__335, pats2, dtb__337))))))
  | Frontend_dAst.C_Pat_PAs (dtb__338, dtb__339, dtb__340) -> ((Base_dCommon.v_bind (mc0 dtb__339)) (fun (inner2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__338, inner2, dtb__340))))))
  | Frontend_dAst.C_Pat_PStr (dtb__341, dtb__342) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Pat_PInt (dtb__343, dtb__344) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Pat_PWild (dtb__345) -> (Base_dDiag.C_Check_OkC (mc1))
  | Frontend_dAst.C_Pat_PVar (dtb__346, dtb__347) -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapCtors = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__348, dtb__349) -> ((Base_dCommon.v_bind (mc0 (dtb__348).Frontend_dAst.f_Ctor_ctorType)) (fun (ty2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapCtors mc0) dtb__349)) (fun (rest2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Ctor_ctorName = (dtb__348).Frontend_dAst.f_Ctor_ctorName; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = (dtb__348).Frontend_dAst.f_Ctor_ctorArity; Frontend_dAst.f_Ctor_ctorRef = (dtb__348).Frontend_dAst.f_Ctor_ctorRef }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapFields = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__350, dtb__351) -> ((Base_dCommon.v_bind (mc0 (dtb__350).Frontend_dAst.f_Field_fieldType)) (fun (ty2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapFields mc0) dtb__351)) (fun (rest2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Field_fieldName = (dtb__350).Frontend_dAst.f_Field_fieldName; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = (dtb__350).Frontend_dAst.f_Field_fieldRef }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapTraitMethods = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__352, dtb__353) -> ((Base_dCommon.v_bind (mc0 (dtb__352).Frontend_dAst.f_TraitMethod_traitMethodType)) (fun (ty2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapTraitMethods mc0) dtb__353)) (fun (rest2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitMethod_traitMethodName = (dtb__352).Frontend_dAst.f_TraitMethod_traitMethodName; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = (dtb__352).Frontend_dAst.f_TraitMethod_traitMethodRef }, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapTraitParams = (fun (mc0 : (Frontend_dAst.t_TraitParam) -> Frontend_dAst.t_TraitParam Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> ((Base_dCommon.v_bind (mc0 dtb__354)) (fun (p2 : Frontend_dAst.t_TraitParam) -> ((Base_dCommon.v_bind ((v_mapTraitParams mc0) dtb__355)) (fun (rest2 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (p2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_mapDeclsWith = (fun (mc0 : (Frontend_dAst.t_Decl) -> Frontend_dAst.t_Decl Base_dDiag.t_Check) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__356, dtb__357) -> ((Base_dCommon.v_bind (mc0 dtb__356)) (fun (d2 : Frontend_dAst.t_Decl) -> ((Base_dCommon.v_bind ((v_mapDeclsWith mc0) dtb__357)) (fun (rest2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (d2, rest2))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_mapDeclWith = (fun (mc0 : (Frontend_dAst.t_Expr) -> Frontend_dAst.t_Expr Base_dDiag.t_Check) (mc1 : (Frontend_dAst.t_Pat) -> Frontend_dAst.t_Pat Base_dDiag.t_Check) (mc2 : (Frontend_dAst.t_Decl) -> Frontend_dAst.t_Decl Base_dDiag.t_Check) (mc3 : (Frontend_dAst.t_TraitParam) -> Frontend_dAst.t_TraitParam Base_dDiag.t_Check) (mc4 : Frontend_dAst.t_Decl) -> (match mc4 with
  | Frontend_dAst.C_Decl_DInstance (dtb__358, dtb__359, dtb__360, dtb__361) -> ((Base_dCommon.v_bind ((v_mapExprList mc0) dtb__358)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (mc0 dtb__359)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapDeclsWith mc2) dtb__360)) (fun (methods2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, methods2, dtb__361))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366) -> ((Base_dCommon.v_bind ((v_mapTraitParams mc3) dtb__363)) (fun (params2 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_mapExprList mc0) dtb__364)) (fun (supers2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_mapTraitMethods mc0) dtb__365)) (fun (methods2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__362, params2, supers2, methods2, dtb__366))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> ((Base_dCommon.v_bind ((v_mapFields mc0) dtb__369)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__367, dtb__368, fields2, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374))))))
  | Frontend_dAst.C_Decl_DFun (dtb__375, dtb__376, dtb__377, dtb__378) -> ((Base_dCommon.v_bind ((v_mapPatList mc1) dtb__376)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind (mc0 dtb__377)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__375, pats2, body2, dtb__378))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__379, dtb__380, dtb__381, dtb__382) -> ((Base_dCommon.v_bind ((v_mapExprList mc0) dtb__380)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (mc0 dtb__381)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__379, ctx2, ty2, dtb__382))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__383, dtb__384, dtb__385, dtb__386) -> ((Base_dCommon.v_bind (mc0 dtb__385)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__383, dtb__384, ty2, dtb__386))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__387, dtb__388, dtb__389) -> ((Base_dCommon.v_bind (mc0 dtb__388)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__387, ty2, dtb__389))))))
  | Frontend_dAst.C_Decl_DData (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398) -> ((Base_dCommon.v_bind (mc0 dtb__392)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_mapCtors mc0) dtb__393)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__390, dtb__391, kind2, ctors2, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398))))))))
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_sameScope = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__399, dtb__400) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__399 }, ((v_sameScope mc0) dtb__400)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Frontend/AstWalk.vuna"
let rec v_patBinders = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__401, dtb__402, dtb__403) -> ((B_dData_dList.v_concatMap (fun (field : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinders (B_dData_dPair.v_secondOf (Obj.magic field))))) dtb__402)
  | Frontend_dAst.C_Pat_PStr (dtb__404, dtb__405) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__406, dtb__407) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__408, dtb__409, dtb__410) -> ((B_dData_dList.v_concatMap v_patBinders) dtb__409)
  | Frontend_dAst.C_Pat_PWild (dtb__411) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__412, dtb__413, dtb__414) -> (B_dData_dList.C_List__x58__x58_ (dtb__412, (v_patBinders dtb__413)))
  | Frontend_dAst.C_Pat_PVar (dtb__415, dtb__416) -> (B_dData_dList.C_List__x58__x58_ (dtb__415, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Frontend/AstWalk.vuna"
let[@tail_mod_cons] rec v_scopedAlts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__417, dtb__418) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (v_patBinders (dtb__417).Frontend_dAst.f_Alt_altPat)) mc0); B_dData_dPair.f_Pair_second = (dtb__417).Frontend_dAst.f_Alt_altBody }, ((v_scopedAlts mc0) dtb__418)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/AstWalk.vuna"
let v_scopedExprChildren = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__419, dtb__420) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) (v_interpExprs dtb__419))))
  | Frontend_dAst.C_Expr_EDo (dtb__421, dtb__422) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__423, dtb__424, dtb__425) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) (B_dData_dList.C_List__x58__x58_ (dtb__423, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__424))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__426, dtb__427, dtb__428) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__427))))
  | Frontend_dAst.C_Expr_EField (dtb__429, dtb__430, dtb__431) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) (B_dData_dList.C_List__x58__x58_ (dtb__429, B_dData_dList.C_List_Nil)))))
  | Frontend_dAst.C_Expr_EIf (dtb__432, dtb__433, dtb__434, dtb__435) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) (B_dData_dList.C_List__x58__x58_ (dtb__432, (B_dData_dList.C_List__x58__x58_ (dtb__433, (B_dData_dList.C_List__x58__x58_ (dtb__434, B_dData_dList.C_List_Nil)))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__436, dtb__437, dtb__438) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__436 }, ((v_scopedAlts mc0) dtb__437)))))
  | Frontend_dAst.C_Expr_ELet (dtb__439, dtb__440, dtb__441, dtb__442) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dAst.C_Expr_EPi (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__446 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__443, mc0)); B_dData_dPair.f_Pair_second = dtb__447 }, B_dData_dList.C_List_Nil))))))
  | Frontend_dAst.C_Expr_EApp (dtb__449, dtb__450, dtb__451) -> (B_dData_dMaybe.C_Maybe_Just (((v_sameScope mc0) (B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450)))))
  | Frontend_dAst.C_Expr_ELam (dtb__452, dtb__453, dtb__454) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__452)) mc0); B_dData_dPair.f_Pair_second = dtb__453 }, B_dData_dList.C_List_Nil))))
  | Frontend_dAst.C_Expr_EFloat (dtb__455, dtb__456) -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EStr (dtb__457, dtb__458) -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EInt (dtb__459, dtb__460) -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EVar (dtb__461, dtb__462) -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
