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
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match dtb__5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__7, dtb__8) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__7)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Cons (((bi_concat "mc") (bi_strFromInt ((bi_sub n) remaining))), acc)))))))

let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub n) 0)) n) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Cons (dtb__9, C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__10) mc1), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun lit -> (fun p -> (match lit with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__11, dtb__12) -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__13, dtb__14) -> ((bi_eq_int dtb__11) dtb__13)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__15, dtb__16) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__17) -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__18, dtb__19) -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__20, dtb__21) -> ((bi_eq_str dtb__18) dtb__20)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__22, dtb__23) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__24) -> true
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__25, dtb__26) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__25, dtb__26))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__27, dtb__28) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__27, dtb__28))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
))

let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun clauses -> (match clauses with
  | C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (match dtb__29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__33)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if ((v_Base_dList_dmemName mc1) (v_Base_dPair_dsecondOf dtb__35)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__35))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__36) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dallNamesIn = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if ((v_Base_dList_dmemName dtb__37) mc1) then ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__38) mc1) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun table -> (fun heads -> (match heads with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor table) dtb__39) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__41) heads)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__42, dtb__43) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__43)
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__46 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__48, dtb__49, dtb__50) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__43)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__42)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__51, dtb__52) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__55 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__57, dtb__58, dtb__59) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__52)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__51)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (match dtb__62 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__61)
  | _ -> false
)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun clauses -> (match clauses with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__64 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> dtb__67
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__68, dtb__69) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__70) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__71, dtb__72) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__75) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__72) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__71)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, dtb__80)), (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__78)))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (dtb__77, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__78)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__77)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__83, dtb__84) -> (C_Base_dList_dList_Cons (dtb__83, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__85) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__86, dtb__87, dtb__88) -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__87)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__89, dtb__90) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__91, dtb__92) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__93, dtb__94, dtb__95) -> ((v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dsecondOf f)))) dtb__94)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dfirstOf dtb__96))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__97))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName -> (fun newName -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__98, dtb__99) -> (if ((bi_eq_str dtb__98) oldName) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (newName, dtb__99)) else e)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__100, dtb__101) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__100, dtb__101))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__102, dtb__103) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__102, dtb__103))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__104, dtb__105, dtb__106) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__104, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__104) dtb__105), dtb__106))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__107, dtb__108, dtb__109) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__107), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__108), dtb__109))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__110, dtb__111, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__112), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (C_Base_dList_dList_Cons (dtb__110, C_Base_dList_dList_Nil))) dtb__113), dtb__114))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__115, dtb__116, dtb__117, dtb__118) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__115), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__115)) dtb__116), dtb__117, dtb__118))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__119, dtb__120, dtb__121) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__119), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__120), dtb__121))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__122, dtb__123, dtb__124, dtb__125) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__122), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__123), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__124), dtb__125))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__126, dtb__127, dtb__128) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__126), dtb__127, dtb__128))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__129, dtb__130, dtb__131) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__129, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__130), dtb__131))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__132, dtb__133, dtb__134) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__132), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__133), dtb__134))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__135, dtb__136, dtb__137) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__135), dtb__136, dtb__137))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__138, dtb__139) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__138, dtb__139))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__140, dtb__141, dtb__142) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__140), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__141), dtb__142))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName -> (fun newName -> (fun names -> (fun body -> (if ((v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName -> (fun newName -> (fun bind -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf bind), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf bind)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName -> (fun newName -> (fun field -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf field), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf field)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName -> (fun newName -> (fun alt -> ((fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (p, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (v_Base_dPair_dsecondOf alt))))) (v_Base_dPair_dfirstOf alt)))))

let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun pos -> (fun p -> (fun body -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__143, dtb__144) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__143) pos) body)
  | _ -> body
))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun lit -> (fun pos -> (fun rows -> (fun acc -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__145 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (match dtb__147 with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__146) acc)
  | C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches lit) dtb__149) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__146) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody pos) dtb__149) dtb__148))), acc))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__146) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse acc)
  | _ -> failwith "DT: impossible branch"
)) rows)))))

let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit -> (fun pos -> (fun clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars = (fun clauses -> (fun pos -> (fun inner -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__151 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__153, dtb__154) -> (match dtb__153 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__152) pos) inner)
  | C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__157, dtb__158) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__152) pos) (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__157) pos) inner))
  | _ -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__152) pos) inner)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> inner
  | _ -> failwith "DT: impossible branch"
)) clauses))))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__159, dtb__160) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__161, dtb__162) -> (match dtb__161 with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__160) mc1)
  | C_Base_dList_dList_Cons (dtb__163, dtb__164) -> (match dtb__163 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__165, dtb__166, dtb__167) -> (if ((bi_eq_str dtb__165) mc1) then (v_Base_dList_dlength dtb__166) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__160) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__160) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__159)
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos -> (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Cons (((bi_concat "_sc_") ((bi_concat pos) ((bi_concat "_") (bi_strFromInt ((bi_sub n) remaining))))), acc))))))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos -> (fun i -> (fun n -> (fun acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub n) i)) n) acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos -> (fun n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (if ((bi_eq_str dtb__168) mc0) then (C_Base_dList_dList_Cons (dtb__168, dtb__169)) else (C_Base_dList_dList_Cons (dtb__168, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__169))))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (mc0, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__170, dtb__171) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__172, dtb__173) -> (match dtb__172 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__171)
  | C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (match dtb__174 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__176, dtb__177, dtb__178) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__176) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__171))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__171)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__170)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__179, dtb__180) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> (match dtb__181 with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180)
  | C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match dtb__183 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__185, dtb__186, dtb__187) -> (if ((bi_eq_str dtb__185) mc0) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__186) dtb__184), dtb__182)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__188, dtb__189) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__184), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__188) mc2) dtb__182))), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__190) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__184), dtb__182)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__180)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__179)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__191, dtb__192) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> (match dtb__193 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__192)
  | C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__195) then (C_Base_dList_dList_Cons (dtb__191, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__192))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__192))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__191)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__197, dtb__198) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> (match dtb__199 with
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (dtb__197, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__198)))
  | C_Base_dList_dList_Cons (dtb__201, dtb__202) -> (match dtb__201 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__203, dtb__204) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__203) mc0) dtb__200))), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__198)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__205) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, dtb__200)), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__198)))
  | _ -> (C_Base_dList_dList_Cons (dtb__197, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__198)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__197)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (match dtb__208 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dClauseTooManyPatterns) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__212, dtb__213) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__212) pos) inner)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__214) -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__207) pos) restParams) ((bi_sub fuel) 1))) (fun restExpr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__210) pos) clauses)) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__210), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__210))), bodyExpr, restExpr, (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__210)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dIntStringCaseNeedsFallback) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | _ -> failwith "DT: impossible branch"
)) clauses)))))))
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table -> (fun clauses -> (fun params -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dPatternFuel) C_Base_dVec_dVec_Base_dVec_dVNil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dClauseTooManyPatterns) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) dtb__216) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars clauses) dtb__215) inner))))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__215) dtb__216) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__215) dtb__216) fuel) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__215) dtb__216) ((bi_sub fuel) 1)))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) ((bi_sub fuel) 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), alts, caseSp)))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) ((bi_sub fuel) 1))) (fun fb -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), ((v_Base_dList_dappend alts) fb), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) ((bi_sub mc5) 1))) (fun bodyExpr -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__218) mc3) mc4) ((bi_sub mc5) 1))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__217, branchPats, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__217) branchPats) mc3) mc1))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (n, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) freshSubs))) ((v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__217)))
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table -> (fun pos -> (fun clauses -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | dtb__219 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__219) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), C_Base_dList_dList_Nil))))))
)))))))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table -> (fun clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dFunctionNoClauses) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> ((fun names -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) 200)) (fun body -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__220))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table -> (fun clauses -> (fun name -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (C_Base_dList_dList_Cons (name, C_Base_dList_dList_Nil))) 200))))
