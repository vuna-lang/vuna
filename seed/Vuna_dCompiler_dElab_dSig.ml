open Vuna_runtime
open Vuna_builtins
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
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dDebug
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
let rec v_Vuna_dCompiler_dElab_dSig_darityFun = (fun n -> (fun res -> (if ((bi_le_int n) 0) then res else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))), ((v_Vuna_dCompiler_dElab_dSig_darityFun ((bi_sub n) 1)) res))))))

let rec v_Vuna_dCompiler_dElab_dSig_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((bi_ge_int dtb__0) (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity = (fun pname -> (fun e -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__2)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__5, dtb__6, dtb__7) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__5)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__8, dtb__9, dtb__10) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (fun p -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf p)))) dtb__9))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__11, dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__11)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__14, dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__14), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__15), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__16), C_Base_dList_dList_Nil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__18, dtb__19, dtb__20) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__18), ((v_Base_dList_dmap (fun a -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf a)))) dtb__19))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__21, dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__22), ((v_Base_dList_dmap (fun b -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf b)))) dtb__21))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__27), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__28), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__30, dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__31)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__33, dtb__34, dtb__35) -> (match dtb__33 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__36, dtb__37) -> (if ((bi_eq_str dtb__36) pname) then (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons ((v_Base_dList_dlength dtb__34), ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__34)))) else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__34)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) dtb__33), ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname)) dtb__34))))
)
  | _ -> 0
)) e)))

let v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity = (fun pname -> (fun methods -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((v_Base_dList_dmap (fun m -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf m)))) methods))))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKind = (fun pname -> (fun methods -> ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity pname) methods)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))))))

let rec v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo = (fun rigOf -> (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> ((fun domVal -> ((fun v -> (C_Base_dList_dList_Cons (((rigOf dtb__39) domVal), (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) dtb__42) (C_Base_dList_dList_Cons (v, env)))))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__38, (v_Base_dList_dlength env), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__41))
  | _ -> C_Base_dList_dList_Nil
))))

let v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf = (fun rigOf -> (fun ty -> (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) ty) C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOut = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (if (mc0 dtb__43) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__44) else (C_Base_dList_dList_Cons (dtb__43, ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__44))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dSig_dquantify = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__45, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dSig_dquantify dtb__46) mc1) mc2), mc2))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr = (fun k -> (fun sp -> (if ((bi_le_int k) 0) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi ("_", false, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)), ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((bi_sub k) 1)) sp), sp)))))

let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__47, true, ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__47) mc1)) mc3), ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds dtb__48) mc1) mc2) mc3), mc3))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dSig_dpiBoundNames = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> (C_Base_dList_dList_Cons (dtb__49, (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames dtb__52)))
  | _ -> C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dSig_disLowerIdent = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((bi_ge_int dtb__54) 97) then ((bi_le_int dtb__54) 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprLowerVars = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__56, dtb__57) -> (if (v_Vuna_dCompiler_dElab_dSig_disLowerIdent dtb__56) then (C_Base_dList_dList_Cons (dtb__56, C_Base_dList_dList_Nil)) else C_Base_dList_dList_Nil)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__58, dtb__59, dtb__60) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__58)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) dtb__59))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__61, dtb__62, dtb__63) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__62)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__66)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__67))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__69, dtb__70, dtb__71, dtb__72) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__69)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__70)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__71)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__73, dtb__74, dtb__75, dtb__76) -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun b -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf b)))) dtb__73)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__74))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__77, dtb__78, dtb__79) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__77)) ((v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf a)))) dtb__78))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__80, dtb__81, dtb__82) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__80)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__83, dtb__84, dtb__85) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (v_Base_dPair_dsecondOf p)))) dtb__84)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__86, dtb__87, dtb__88) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__86)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__89, dtb__90, dtb__91) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__89)
  | _ -> C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dSig_ddedupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((v_Base_dList_dmemName dtb__92) dtb__93) then (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__93) else (C_Base_dList_dList_Cons (dtb__92, (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__93))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dlowerVarNames = (fun e -> (v_Vuna_dCompiler_dElab_dSig_ddedupNames (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars e)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((bi_eq_str dtb__94) mc0) then ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__95) else (C_Base_dList_dList_Cons (dtb__94, ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__95))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropPiBound = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound ((v_Vuna_dCompiler_dElab_dSig_ddropName dtb__96) mc0)) dtb__97)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dSig_dfreeNames = (fun inScope -> (fun ty -> ((v_Vuna_dCompiler_dElab_dSig_dkeepOut inScope) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound (v_Vuna_dCompiler_dElab_dSig_dlowerVarNames ty)) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty)))))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig = (fun inScope -> (fun ty -> (fun sp -> (((v_Vuna_dCompiler_dElab_dSig_dquantify ((v_Vuna_dCompiler_dElab_dSig_dfreeNames inScope) ty)) ty) sp))))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__98) mc0) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__99) else (C_Base_dList_dList_Cons (dtb__98, ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__99))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig = (fun banned -> (fun ty -> (fun sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl banned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))))

let v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames = fun () -> (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("show", (C_Base_dList_dList_Cons ("eq", (C_Base_dList_dList_Cons ("neq", (C_Base_dList_dList_Cons ("lt", (C_Base_dList_dList_Cons ("le", (C_Base_dList_dList_Cons ("gt", (C_Base_dList_dList_Cons ("ge", (C_Base_dList_dList_Cons ("Type", (C_Base_dList_dList_Cons ("->", (C_Base_dList_dList_Cons ("_", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned = (fun defined -> (v_Vuna_dCompiler_dCommon_dtblOfNames ((v_Base_dList_dappend defined) (v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames ()))))

let rec v_Vuna_dCompiler_dElab_dSig_ddefinedNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__102, dtb__103, dtb__104, dtb__105) -> (C_Base_dList_dList_Cons (dtb__102, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__101)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__101)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
