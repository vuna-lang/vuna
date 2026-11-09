open Vuna_runtime
let v_Vuna_dCompiler_dElab_dInstName_dinstanceHeadName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__3, dtb__4) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__5, dtb__6) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dInstName_dargSuffix = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (String.concat "" ["_"; (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__7); (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__8)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dInstName_dexprNameFor = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__9, dtb__10) -> dtb__9
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__11, dtb__12) -> (bi_strFromInt dtb__11)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__13, dtb__14) -> dtb__13
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__15) ^ (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__16))
  | _ -> "X"
))

let v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> ((v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__18) ^ (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__19))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dInstName_dderivedInstName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__20, dtb__21, dtb__22) -> (v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail dtb__21)
  | _ -> (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor mc0)
))

let v_Vuna_dCompiler_dElab_dInstName_dinstanceName = (fun cname headExpr -> (String.concat "" [(Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf cname); "_"; (v_Vuna_dCompiler_dElab_dInstName_dderivedInstName headExpr)]))

let v_Vuna_dCompiler_dElab_dInstName_dargNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__23, dtb__24) -> dtb__23
  | _ -> "Int"
))
