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
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
let v_Vuna_dCompiler_dDtDerive_dtraitShortName = (fun tname -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot tname))))

let v_Vuna_dCompiler_dDtDerive_dtraitMethodGlobal = (fun tname -> (fun methodName -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot tname)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Base_dList_dList_Nil -> methodName
  | _ -> ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__0)) ((bi_concat ".") methodName))
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtDerive_dinstHead = (fun tn -> (fun dname -> (fun params -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (tn, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dname, sp)), ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (p, sp)))) params))), sp))))))

let v_Vuna_dCompiler_dDtDerive_dshowOne = (fun proj -> (fun v -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (proj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (v, sp)), C_Base_dList_dList_Nil)), sp)))))

let rec v_Vuna_dCompiler_dDtDerive_dshowFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match dtb__3 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dshowOne mc0) dtb__2) mc2), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (")", mc2)), C_Base_dList_dList_Nil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dshowOne mc0) dtb__2) mc2), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (" ", mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dshowFields mc0) dtb__3) mc2), C_Base_dList_dList_Nil)))), mc2)), C_Base_dList_dList_Nil)))), mc2))
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtDerive_dshowCtor = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (mc1, mc3))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc3)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (((bi_concat "(") ((bi_concat mc1) " ")), mc3)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dshowFields mc0) mc2) mc3), C_Base_dList_dList_Nil)))), mc3))
)))))

let rec v_Vuna_dCompiler_dDtDerive_dvarNamesAt = (fun prefix -> (fun i -> (fun n -> (if ((bi_ge_int i) n) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (((bi_concat prefix) (bi_strFromInt i)), (((v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix) ((bi_add i) 1)) n)))))))

let v_Vuna_dCompiler_dDtDerive_dvarNames = (fun prefix -> (fun n -> (((v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix) 0) n)))

let rec v_Vuna_dCompiler_dDtDerive_dshowAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__6, dtb__7, dtb__8, dtb__9) -> ((fun vs -> ((fun pat -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, ((((v_Vuna_dCompiler_dDtDerive_dshowCtor mc0) dtb__6) vs) mc2))), (((v_Vuna_dCompiler_dDtDerive_dshowAlts mc0) dtb__5) mc2)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__6, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc2)))) vs), mc2)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtDerive_dshowBody = (fun proj -> (fun ctors -> (fun scrut -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (scrut, sp)), (((v_Vuna_dCompiler_dDtDerive_dshowAlts proj) ctors) sp), sp))))))

let v_Vuna_dCompiler_dDtDerive_dgtBody = (fun ltProj -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp))))

let v_Vuna_dCompiler_dDtDerive_dgeBody = (fun leProj -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (leProj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp))))

let v_Vuna_dCompiler_dDtDerive_dboolTrue = (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dDtDerive_dboolFalse = (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (0, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), C_Base_dList_dList_Nil)))), sp)))

let rec v_Vuna_dCompiler_dDtDerive_dconjFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__11 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__10, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__12, mc2)), C_Base_dList_dList_Nil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("&&", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__10, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__12, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dconjFields dtb__11) dtb__13) mc2), C_Base_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDtDerive_dboolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtDerive_deqInner = (fun cn -> (fun ar -> (fun sp -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (cn, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, sp)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") ar)), sp)), (((v_Vuna_dCompiler_dDtDerive_dconjFields ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") ar)) sp))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp))), C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dDtDerive_deqAlt = (fun c -> (fun sp -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__14, dtb__15, dtb__16, dtb__17) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dPair_dPair_Base_dPair_dPair (pat, body))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (((v_Vuna_dCompiler_dDtDerive_deqInner dtb__14) dtb__16) sp), sp)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__14, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, sp)))) vs), sp)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__16))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtDerive_deqBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dDtDerive_deqAlt c) sp))) ctors), sp))))

let v_Vuna_dCompiler_dDtDerive_dneqBody = (fun eqProj -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (eqProj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp), (v_Vuna_dCompiler_dDtDerive_dboolTrue sp), sp))))

let rec v_Vuna_dCompiler_dDtDerive_dltFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__19 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__18, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__20, mc2)), C_Base_dList_dList_Nil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("||", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__18, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__20, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("&&", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__18, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__20, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dltFields dtb__19) dtb__21) mc2), C_Base_dList_dList_Nil)))), mc2)), C_Base_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDtDerive_dordInnerGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__22 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__24, dtb__25, dtb__26, dtb__27) -> ((fun gs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), (((((v_Vuna_dCompiler_dDtDerive_dordInnerGo mc0) mc1) dtb__23) ((bi_add mc3) 1)) mc4)))) (if ((bi_eq_int mc3) mc0) then (((v_Vuna_dCompiler_dDtDerive_dltFields ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") mc1)) gs) mc4) else (if ((bi_lt_int mc3) mc0) then (v_Vuna_dCompiler_dDtDerive_dboolFalse mc4) else (v_Vuna_dCompiler_dDtDerive_dboolTrue mc4))))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__24, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc4)))) gs), mc4)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dDtDerive_dordInner = (fun i -> (fun ar -> (fun all -> (fun sp -> (((((v_Vuna_dCompiler_dDtDerive_dordInnerGo i) ar) all) 0) sp)))))

let rec v_Vuna_dCompiler_dDtDerive_dordAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match dtb__28 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__30, dtb__31, dtb__32, dtb__33) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), ((((v_Vuna_dCompiler_dDtDerive_dordAlts mc0) dtb__29) ((bi_add mc2) 1)) mc3)))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", mc3)), ((((v_Vuna_dCompiler_dDtDerive_dordInner mc2) dtb__32) mc0) mc3), mc3)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__30, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc3)))) vs), mc3)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__32))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDtDerive_dordBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), ((((v_Vuna_dCompiler_dDtDerive_dordAlts ctors) ctors) 0) sp), sp))))

let v_Vuna_dCompiler_dDtDerive_dleBody = (fun ltProj -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("||", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Nil)))), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp), (v_Vuna_dCompiler_dDtDerive_dboolTrue sp), sp)), C_Base_dList_dList_Nil)))), sp))))

let v_Vuna_dCompiler_dDtDerive_dderiveInstance = (fun dname -> (fun params -> (fun ctors -> (fun tn -> (fun sp -> ((fun hd -> (if ((bi_eq_str (v_Vuna_dCompiler_dDtDerive_dtraitShortName tn)) "Show") then ((fun proj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("show", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dDtDerive_dshowBody proj) ctors) "sx") sp), sp)), C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dDtDerive_dtraitMethodGlobal tn) "show")) else (if ((bi_eq_str (v_Vuna_dCompiler_dDtDerive_dtraitShortName tn)) "Eq") then ((fun eqProj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("eq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_deqBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("neq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dneqBody eqProj) sp), sp)), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dDtDerive_dtraitMethodGlobal tn) "eq")) else (if ((bi_eq_str (v_Vuna_dCompiler_dDtDerive_dtraitShortName tn)) "Ord") then ((fun ltProj -> ((fun leProj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("lt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dordBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("le", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dleBody ltProj) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("gt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dgtBody ltProj) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("ge", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dgeBody leProj) sp), sp)), C_Base_dList_dList_Nil)))))))))) ((v_Vuna_dCompiler_dDtDerive_dtraitMethodGlobal tn) "le"))) ((v_Vuna_dCompiler_dDtDerive_dtraitMethodGlobal tn) "lt")) else ((fun kind -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot derive `") ((bi_concat kind) "` (supported: Show, Eq, Ord)")))))) (v_Vuna_dCompiler_dDtDerive_dtraitShortName tn)))))) ((((v_Vuna_dCompiler_dDtDerive_dinstHead tn) dname) params) sp)))))))

let rec v_Vuna_dCompiler_dDtDerive_dderivingsForGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match mc1 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dDtDerive_dderiveInstance mc0) mc1) mc2) dtb__34) mc4)) (fun decl -> ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo mc0) mc1) mc2) dtb__35) mc4) (C_Base_dList_dList_Cons (decl, mc5)))))
  | _ -> (if ((bi_eq_str (v_Vuna_dCompiler_dDtDerive_dtraitShortName dtb__34)) "Eq") then ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo mc0) mc1) mc2) dtb__35) mc4) mc5) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc mc4)) ((bi_concat ": DT: deriving ") ((bi_concat (v_Vuna_dCompiler_dDtDerive_dtraitShortName dtb__34)) " is only supported for non-parameterized data types (M23)"))))))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc5)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dDtDerive_dderivingsFor = (fun dname -> (fun params -> (fun ctors -> (fun derivings -> (fun sp -> ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo dname) params) ctors) derivings) sp) C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dDtDerive_dcollectDerivings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (if ((bi_eq_generic dtb__42) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__37) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dDtDerive_dderivingsFor dtb__38) dtb__39) dtb__41) dtb__42) dtb__43)) (fun insts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__37)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend insts) more))))))))
  | _ -> (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__37)
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtDerive_dexpandDerivings = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings decls)) (fun insts -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend decls) insts))))))
