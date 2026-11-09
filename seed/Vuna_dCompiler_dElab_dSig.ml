open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dSig_darityFun = (fun n res -> (if (n <= 0) then res else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dSig_darityFun (n - 1)) res)))))

let rec v_Vuna_dCompiler_dElab_dSig_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (dtb__0 >= (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__5, dtb__6, dtb__7) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (fun p -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))) dtb__6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__8, dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__11, dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__11), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__12), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__13), Base_dList.C_Base_dList_dList_Nil)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__15), ((Base_dList.v_Base_dList_dmap (fun a -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf a)))) dtb__16))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__19), ((Base_dList.v_Base_dList_dmap (fun b -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf b)))) dtb__18))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__25), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__26), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__28, dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__29)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__34, dtb__35) -> (if (dtb__34 = mc0) then (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons ((Base_dList.v_Base_dList_dlength dtb__32), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))) else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__31), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32))))
)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity = (fun pname methods -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (fun m -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (Base_dPair.v_Base_dPair_dsecondOf m)))) methods)))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity pname) methods)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKind = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods))

let rec v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((fun domVal -> ((fun v -> (Base_dList.C_Base_dList_dList_Cons (dtb__38, (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo mc0) dtb__40) (Base_dList.C_Base_dList_dList_Cons (v, mc2)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__36, (Base_dList.v_Base_dList_dlength mc2), Base_dList.C_Base_dList_dList_Nil)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval mc2) dtb__39))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf = (fun rigOf ty -> (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) ty) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOut = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (mc0 dtb__41) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42) else (Base_dList.C_Base_dList_dList_Cons (dtb__41, ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dquantify = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__43, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dSig_dquantify dtb__44) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr = (fun k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi ("_", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", sp)), ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr (k - 1)) sp), sp))))

let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__45, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__45) mc1)) mc3), ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds dtb__46) mc1) mc2) mc3), mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dpiBoundNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (Base_dList.C_Base_dList_dList_Cons (dtb__47, (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames dtb__51)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dSig_disLowerIdent = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (if (dtb__53 >= 97) then (dtb__53 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprLowerVars = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__55, dtb__56, dtb__57) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__55)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__58, dtb__59, dtb__60) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf p)))) dtb__59)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__61, dtb__62, dtb__63) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__61)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__64, dtb__65, dtb__66) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__64)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf a)))) dtb__65))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__67, dtb__68, dtb__69, dtb__70) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun b -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf b)))) dtb__67)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__68))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__71, dtb__72, dtb__73, dtb__74) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__71)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__72)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__73)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__78)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__79))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__81, dtb__82, dtb__83) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__82)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__84, dtb__85, dtb__86) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__84)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) dtb__85))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88) -> (if (v_Vuna_dCompiler_dElab_dSig_disLowerIdent dtb__87) then (Base_dList.C_Base_dList_dList_Cons (dtb__87, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dSig_ddedupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (if ((Base_dList.v_Base_dList_dmemName dtb__89) dtb__90) then (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__90) else (Base_dList.C_Base_dList_dList_Cons (dtb__89, (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__90))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dlowerVarNames = (fun e -> (v_Vuna_dCompiler_dElab_dSig_ddedupNames (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars e)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (if (dtb__91 = mc0) then ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__92) else (Base_dList.C_Base_dList_dList_Cons (dtb__91, ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__92))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_ddropPiBound = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound ((v_Vuna_dCompiler_dElab_dSig_ddropName dtb__93) mc0)) dtb__94)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dfreeNames = (fun inScope ty -> ((v_Vuna_dCompiler_dElab_dSig_dkeepOut inScope) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound (v_Vuna_dCompiler_dElab_dSig_dlowerVarNames ty)) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig = (fun inScope ty sp -> (((v_Vuna_dCompiler_dElab_dSig_dquantify ((v_Vuna_dCompiler_dElab_dSig_dfreeNames inScope) ty)) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__95, dtb__96) -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__95)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if ((v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf dtb__97) = (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf mc0)) then (Base_dList.C_Base_dList_dList_Cons (dtb__97, ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__98))) else ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__98))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedKey = (fun prefix name -> (String.concat "" [prefix; "\t"; name]))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl = (fun defined -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf n)) n), true)))) defined)) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__99) mc2) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__100) else (if ((Base_dHashMap.v_Base_dHashMap_dmember ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey mc0) dtb__99)) mc1) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__100) else (Base_dList.C_Base_dList_dList_Cons (dtb__99, ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__100)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached = (fun prefix banned preludeBanned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached = (fun prefix banned preludeBanned ctx ty sp -> ((fun combined -> ((fun lower -> ((fun names -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds names) combined) ty) sp)) ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound lower) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))) (v_Vuna_dCompiler_dElab_dSig_ddedupNames ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) ctx)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars ty))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#sig", sp)), ((Base_dList.v_Base_dList_dappend ctx) (Base_dList.C_Base_dList_dList_Cons (ty, Base_dList.C_Base_dList_dList_Nil))), sp))))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__101) mc0) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__102) else (Base_dList.C_Base_dList_dList_Cons (dtb__101, ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__102))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig = (fun banned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl banned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("Type", (Base_dList.C_Base_dList_dList_Cons ("->", (Base_dList.C_Base_dList_dList_Cons ("_", Base_dList.C_Base_dList_dList_Nil))))))) ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned = (fun defined -> (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dappend defined) v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames)))

let v_Vuna_dCompiler_dElab_dSig_dbannedForModule = (fun sigName defined -> (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule sigName) defined)))

let rec v_Vuna_dCompiler_dElab_dSig_ddefinedNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__105, dtb__106, dtb__107, dtb__108) -> (Base_dList.C_Base_dList_dList_Cons (dtb__105, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__104)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__109, dtb__110, dtb__111) -> (Base_dList.C_Base_dList_dList_Cons (dtb__109, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__104)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__112, dtb__113, dtb__114, dtb__115) -> (Base_dList.C_Base_dList_dList_Cons (dtb__112, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__104)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__104)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
