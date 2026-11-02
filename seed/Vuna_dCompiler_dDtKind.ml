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
let rec v_Vuna_dCompiler_dDtKind_darityFun = (fun n -> (fun res -> (if ((bi_le_int n) 0) then res else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), ((v_Vuna_dCompiler_dDtKind_darityFun ((bi_sub n) 1)) res))))))

let rec v_Vuna_dCompiler_dDtKind_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((bi_ge_int dtb__0) (v_Vuna_dCompiler_dDtKind_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dDtKind_dmaxIntList dtb__1))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDtKind_dexprMaxAppArity = (fun pname -> (fun e -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__2)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__5, dtb__6, dtb__7) -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__5)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__8, dtb__9, dtb__10) -> (v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Base_dList_dmap (fun p -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf p)))) dtb__9))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__11, dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__11)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__14, dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__14), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__15), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__16), C_Base_dList_dList_Nil)))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__18, dtb__19, dtb__20) -> (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__18), ((v_Base_dList_dmap (fun a -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf a)))) dtb__19))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__21, dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__22), ((v_Base_dList_dmap (fun b -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf b)))) dtb__21))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__27), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__28), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__30, dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__31)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__33, dtb__34, dtb__35) -> (match dtb__33 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__36, dtb__37) -> (if ((bi_eq_str dtb__36) pname) then (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons ((v_Base_dList_dlength dtb__34), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname)) dtb__34)))) else (v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname)) dtb__34)))
  | _ -> (v_Vuna_dCompiler_dDtKind_dmaxIntList (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) dtb__33), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname)) dtb__34))))
)
  | _ -> 0
)) e)))

let v_Vuna_dCompiler_dDtKind_dmethodMaxAppArity = (fun pname -> (fun methods -> (v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Base_dList_dmap (fun m -> ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) (v_Base_dPair_dsecondOf m)))) methods))))

let v_Vuna_dCompiler_dDtKind_dclassParamKind = (fun pname -> (fun methods -> ((v_Vuna_dCompiler_dDtKind_darityFun ((v_Vuna_dCompiler_dDtKind_dmethodMaxAppArity pname) methods)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))))))

let rec v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo = (fun rigOf -> (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> ((fun domVal -> ((fun v -> (C_Base_dList_dList_Cons (((rigOf dtb__39) domVal), (((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo rigOf) dtb__42) (C_Base_dList_dList_Cons (v, env)))))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__38, (v_Base_dList_dlength env), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dCore_deval env) dtb__41))
  | _ -> C_Base_dList_dList_Nil
))))

let v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf = (fun rigOf -> (fun ty -> (((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo rigOf) ty) C_Base_dList_dList_Nil)))
