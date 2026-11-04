open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
let rec v_Vuna_dCompiler_dElab_dSig_darityFun = (fun n -> (fun res -> (if ((bi_le_int n) 0) then res else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dSig_darityFun ((bi_sub n) 1)) res))))))

let rec v_Vuna_dCompiler_dElab_dSig_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((bi_ge_int dtb__0) (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity = (fun pname -> (fun e -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__2)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__5, dtb__6, dtb__7) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (fun p -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf p)))) dtb__6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__8, dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__8)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__11, dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__11), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__12), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__13), C_Base_dList_dList_Base_dList_dNil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__15), ((v_Base_dList_dmap (fun a -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf a)))) dtb__16))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__19), ((v_Base_dList_dmap (fun b -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf b)))) dtb__18))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__24), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__25), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__27, dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__28)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__30, dtb__31, dtb__32) -> (match dtb__30 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__33, dtb__34) -> (if ((bi_eq_str dtb__33) pname) then (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons ((v_Base_dList_dlength dtb__31), ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__31)))) else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__31)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__30), ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__31))))
)
  | _ -> 0
)) e)))

let v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity = (fun pname -> (fun methods -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (fun m -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf m)))) methods))))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKind = (fun pname -> (fun methods -> ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity pname) methods)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))

let rec v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo = (fun rigOf -> (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> ((fun domVal -> ((fun v -> (C_Base_dList_dList_Base_dList_dCons (((rigOf dtb__36) domVal), (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) dtb__39) (C_Base_dList_dList_Base_dList_dCons (v, env)))))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__35, (v_Base_dList_dlength env), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__38))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))))

let v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf = (fun rigOf -> (fun ty -> (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) ty) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOut = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (if (mc0 dtb__40) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__41) else (C_Base_dList_dList_Base_dList_dCons (dtb__40, ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__41))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dSig_dquantify = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__42, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dSig_dquantify dtb__43) mc1) mc2), mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr = (fun k -> (fun sp -> (if ((bi_le_int k) 0) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi ("_", false, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)), ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((bi_sub k) 1)) sp), sp)))))

let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__44, true, ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__44) mc1)) mc3), ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds dtb__45) mc1) mc2) mc3), mc3))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dSig_dpiBoundNames = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (C_Base_dList_dList_Base_dList_dCons (dtb__46, (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames dtb__49)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dSig_disLowerIdent = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (if ((bi_ge_int dtb__51) 97) then ((bi_le_int dtb__51) 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprLowerVars = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__53, dtb__54) -> (if (v_Vuna_dCompiler_dElab_dSig_disLowerIdent dtb__53) then (C_Base_dList_dList_Base_dList_dCons (dtb__53, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__55, dtb__56, dtb__57) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__55)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) dtb__56))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__58, dtb__59, dtb__60) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__59)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__63)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__64))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__66, dtb__67, dtb__68, dtb__69) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__66)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__67)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__68)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__70, dtb__71, dtb__72, dtb__73) -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun b -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf b)))) dtb__70)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__71))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__74, dtb__75, dtb__76) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__74)) ((v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf a)))) dtb__75))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__77, dtb__78, dtb__79) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__77)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__80, dtb__81, dtb__82) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf p)))) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__83, dtb__84, dtb__85) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__83)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dSig_ddedupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> (if ((v_Base_dList_dmemName dtb__86) dtb__87) then (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__87) else (C_Base_dList_dList_Base_dList_dCons (dtb__86, (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__87))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dlowerVarNames = (fun e -> (v_Vuna_dCompiler_dElab_dSig_ddedupNames (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars e)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (if ((bi_eq_str dtb__88) mc0) then ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__89) else (C_Base_dList_dList_Base_dList_dCons (dtb__88, ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__89))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropPiBound = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound ((v_Vuna_dCompiler_dElab_dSig_ddropName dtb__90) mc0)) dtb__91)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dSig_dfreeNames = (fun inScope -> (fun ty -> ((v_Vuna_dCompiler_dElab_dSig_dkeepOut inScope) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound (v_Vuna_dCompiler_dElab_dSig_dlowerVarNames ty)) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty)))))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig = (fun inScope -> (fun ty -> (fun sp -> (((v_Vuna_dCompiler_dElab_dSig_dquantify ((v_Vuna_dCompiler_dElab_dSig_dfreeNames inScope) ty)) ty) sp))))

let v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (v_Vuna_dCompiler_dCommon_djoinDots dtb__92)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf dtb__94)) (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf mc0)) then (C_Base_dList_dList_Base_dList_dCons (dtb__94, ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__95))) else ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__95))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedKey = (fun prefix -> (fun name -> ((bi_concat prefix) ((bi_concat "\t") name))))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl = (fun defined -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf n)) n), true)))) defined)) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__96) mc2) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__97) else (if ((v_Vuna_dCompiler_dCommon_dtblMem ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey mc0) dtb__96)) mc1) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__97) else (C_Base_dList_dList_Base_dList_dCons (dtb__96, ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__97)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached = (fun prefix -> (fun banned -> (fun preludeBanned -> (fun ty -> (fun sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))))))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__98) mc0) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__99) else (C_Base_dList_dList_Base_dList_dCons (dtb__98, ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__99))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig = (fun banned -> (fun ty -> (fun sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl banned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))))

let v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames = ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ("Type", (C_Base_dList_dList_Base_dList_dCons ("->", (C_Base_dList_dList_Base_dList_dCons ("_", C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dappend v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames) v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned = (fun defined -> (v_Vuna_dCompiler_dCommon_dtblOfNames ((v_Base_dList_dappend defined) v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames)))

let v_Vuna_dCompiler_dElab_dSig_dbannedForModule = (fun sigName -> (fun defined -> (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule sigName) defined))))

let rec v_Vuna_dCompiler_dElab_dSig_ddefinedNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__102, dtb__103, dtb__104, dtb__105) -> (C_Base_dList_dList_Base_dList_dCons (dtb__102, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__101)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__106, dtb__107, dtb__108) -> (C_Base_dList_dList_Base_dList_dCons (dtb__106, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__101)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__101)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
