open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
let rec v_Vuna_dCompiler_dDtQuant_dkeepOut = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 dtb__0) then ((v_Vuna_dCompiler_dDtQuant_dkeepOut mc0) dtb__1) else (C_Base_dList_dList_Cons (dtb__0, ((v_Vuna_dCompiler_dDtQuant_dkeepOut mc0) dtb__1))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtQuant_dquantify = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__2, true, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dDtQuant_dquantify dtb__3) mc1) mc2), mc2))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDtQuant_dkindArrowExpr = (fun k -> (fun sp -> (if ((bi_le_int k) 0) then (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", sp)) else (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi ("_", false, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", sp)), ((v_Vuna_dCompiler_dDtQuant_dkindArrowExpr ((bi_sub k) 1)) sp), sp)))))

let rec v_Vuna_dCompiler_dDtQuant_dquantifyTopKinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__4, true, ((v_Vuna_dCompiler_dDtQuant_dkindArrowExpr ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity dtb__4) mc1)) mc3), ((((v_Vuna_dCompiler_dDtQuant_dquantifyTopKinds dtb__5) mc1) mc2) mc3), mc3))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDtQuant_dpiBoundNames = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> (C_Base_dList_dList_Cons (dtb__6, (v_Vuna_dCompiler_dDtQuant_dpiBoundNames dtb__9)))
  | _ -> C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dDtQuant_disLowerIdent = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if ((bi_ge_int dtb__11) 97) then ((bi_le_int dtb__11) 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDtQuant_dexprLowerVars = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dDtQuant_disLowerIdent dtb__13) then (C_Base_dList_dList_Cons (dtb__13, C_Base_dList_dList_Nil)) else C_Base_dList_dList_Nil)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__15, dtb__16, dtb__17) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__15)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dDtQuant_dexprLowerVars) dtb__16))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__18, dtb__19, dtb__20) -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__19)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__23)) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__24))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__26, dtb__27, dtb__28, dtb__29) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__26)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__27)) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__28)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__30, dtb__31, dtb__32, dtb__33) -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun b -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf b)))) dtb__30)) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__31))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__34, dtb__35, dtb__36) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__34)) ((v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf a)))) dtb__35))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__37, dtb__38, dtb__39) -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__37)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__40, dtb__41, dtb__42) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf p)))) dtb__41)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__43, dtb__44, dtb__45) -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__43)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__46, dtb__47, dtb__48) -> (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dtb__46)
  | _ -> C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dDtQuant_ddedupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if ((v_Base_dList_dmemName dtb__49) dtb__50) then (v_Vuna_dCompiler_dDtQuant_ddedupNames dtb__50) else (C_Base_dList_dList_Cons (dtb__49, (v_Vuna_dCompiler_dDtQuant_ddedupNames dtb__50))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtQuant_dlowerVarNames = (fun e -> (v_Vuna_dCompiler_dDtQuant_ddedupNames (v_Vuna_dCompiler_dDtQuant_dexprLowerVars e)))

let rec v_Vuna_dCompiler_dDtQuant_ddropName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if ((bi_eq_str dtb__51) mc0) then ((v_Vuna_dCompiler_dDtQuant_ddropName mc0) dtb__52) else (C_Base_dList_dList_Cons (dtb__51, ((v_Vuna_dCompiler_dDtQuant_ddropName mc0) dtb__52))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtQuant_ddropPiBound = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> ((v_Vuna_dCompiler_dDtQuant_ddropPiBound ((v_Vuna_dCompiler_dDtQuant_ddropName dtb__53) mc0)) dtb__54)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtQuant_dfreeNames = (fun inScope -> (fun ty -> ((v_Vuna_dCompiler_dDtQuant_dkeepOut inScope) ((v_Vuna_dCompiler_dDtQuant_ddropPiBound (v_Vuna_dCompiler_dDtQuant_dlowerVarNames ty)) (v_Vuna_dCompiler_dDtQuant_dpiBoundNames ty)))))

let v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig = (fun inScope -> (fun ty -> (fun sp -> (((v_Vuna_dCompiler_dDtQuant_dquantify ((v_Vuna_dCompiler_dDtQuant_dfreeNames inScope) ty)) ty) sp))))

let rec v_Vuna_dCompiler_dDtQuant_dkeepOutList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if ((v_Base_dList_dmemName dtb__55) mc0) then ((v_Vuna_dCompiler_dDtQuant_dkeepOutList mc0) dtb__56) else (C_Base_dList_dList_Cons (dtb__55, ((v_Vuna_dCompiler_dDtQuant_dkeepOutList mc0) dtb__56))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtQuant_dtopPreludeNames = fun () -> (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("show", (C_Base_dList_dList_Cons ("eq", (C_Base_dList_dList_Cons ("neq", (C_Base_dList_dList_Cons ("lt", (C_Base_dList_dList_Cons ("le", (C_Base_dList_dList_Cons ("gt", (C_Base_dList_dList_Cons ("ge", (C_Base_dList_dList_Cons ("Type", (C_Base_dList_dList_Cons ("->", (C_Base_dList_dList_Cons ("_", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDtQuant_dquantifyTopSig = (fun defined -> (fun ty -> (fun sp -> ((((v_Vuna_dCompiler_dDtQuant_dquantifyTopKinds ((v_Vuna_dCompiler_dDtQuant_dkeepOutList ((v_Base_dList_dappend defined) (v_Vuna_dCompiler_dDtQuant_dtopPreludeNames ()))) ((v_Vuna_dCompiler_dDtQuant_dfreeNames (fun n -> false)) ty))) ty) ty) sp))))

let rec v_Vuna_dCompiler_dDtQuant_ddefinedNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__59, dtb__60, dtb__61, dtb__62) -> (C_Base_dList_dList_Cons (dtb__59, (v_Vuna_dCompiler_dDtQuant_ddefinedNames dtb__58)))
  | _ -> (v_Vuna_dCompiler_dDtQuant_ddefinedNames dtb__58)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
