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
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (match dtb__5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__7, dtb__8) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__7)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons (((bi_concat "mc") (bi_strFromInt ((bi_sub n) remaining))), acc)))))))

let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub n) 0)) n) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons (dtb__9, C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__10) mc1), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
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

let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun clauses -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (match dtb__29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__33)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)) clauses))

let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (if ((v_Base_dList_dmemName mc1) (v_Base_dPair_dsecondOf dtb__35)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__35))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__36) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dallNamesIn = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (if ((v_Base_dList_dmemName dtb__37) mc1) then ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__38) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun table -> (fun heads -> (match heads with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor table) dtb__39) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__41) heads)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__43)
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match dtb__46 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__48, dtb__49, dtb__50) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__43)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__42)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__55 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__57, dtb__58, dtb__59) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__52)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__51)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (match dtb__62 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__61)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__60)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun clauses -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (match dtb__64 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> dtb__67
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) clauses))

let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__68, dtb__69) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__70) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__75) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__72) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__71)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, dtb__80)), (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__78)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__77, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__78)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__77)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__83, dtb__84) -> (C_Base_dList_dList_Base_dList_dCons (dtb__83, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__85) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__86, dtb__87, dtb__88) -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__87)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__89, dtb__90) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__91, dtb__92) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__93, dtb__94, dtb__95) -> ((v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dsecondOf f)))) dtb__94)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dfirstOf dtb__96))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__97))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName -> (fun newName -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__98, dtb__99) -> (if ((bi_eq_str dtb__98) oldName) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (newName, dtb__99)) else e)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__100, dtb__101) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__100, dtb__101))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__102, dtb__103) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__102, dtb__103))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__104, dtb__105, dtb__106) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__104, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__104) dtb__105), dtb__106))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__107, dtb__108, dtb__109) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__107), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__108), dtb__109))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__110, dtb__111, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__112), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (C_Base_dList_dList_Base_dList_dCons (dtb__110, C_Base_dList_dList_Base_dList_dNil))) dtb__113), dtb__114))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__115, dtb__116, dtb__117, dtb__118) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__115), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__115)) dtb__116), dtb__117, dtb__118))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__119, dtb__120, dtb__121) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__119), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__120), dtb__121))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__122, dtb__123) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__122), dtb__123))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__124, dtb__125, dtb__126, dtb__127) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__124), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__125), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__126), dtb__127))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__128, dtb__129, dtb__130) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__128), dtb__129, dtb__130))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__131, dtb__132, dtb__133) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__131, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__132), dtb__133))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__134, dtb__135, dtb__136) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__134), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__135), dtb__136))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__137, dtb__138) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__137, dtb__138))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__139, dtb__140, dtb__141) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__139), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__140), dtb__141))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName -> (fun newName -> (fun names -> (fun body -> (if ((v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName -> (fun newName -> (fun bind -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf bind), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf bind)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName -> (fun newName -> (fun field -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf field), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf field)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName -> (fun newName -> (fun clause -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf clause), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (v_Base_dPair_dfirstOf clause))) (v_Base_dPair_dsecondOf clause)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName -> (fun newName -> (fun alt -> ((fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (p, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (v_Base_dPair_dsecondOf alt))))) (v_Base_dPair_dfirstOf alt)))))

let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun pos -> (fun p -> (fun body -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__142, dtb__143) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__142) pos) body)
  | _ -> body
))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun lit -> (fun pos -> (fun rows -> (fun acc -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__144 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match dtb__146 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__145) acc)
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches lit) dtb__148) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__145) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody pos) dtb__148) dtb__147))), acc))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) dtb__145) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse acc)
  | _ -> failwith "DT: impossible branch"
)) rows)))))

let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit -> (fun pos -> (fun clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars = (fun clauses -> (fun pos -> (fun inner -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (match dtb__152 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__151) pos) inner)
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (match dtb__154 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__156, dtb__157) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__151) pos) (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__156) pos) inner))
  | _ -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__151) pos) inner)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> inner
  | _ -> failwith "DT: impossible branch"
)) clauses))))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__159) mc1)
  | C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (match dtb__162 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__164, dtb__165, dtb__166) -> (if ((bi_eq_str dtb__164) mc1) then (v_Base_dList_dlength dtb__165) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__159) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__159) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__158)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos -> (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons (((bi_concat "_sc_") ((bi_concat pos) ((bi_concat "_") (bi_strFromInt ((bi_sub n) remaining))))), acc))))))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos -> (fun i -> (fun n -> (fun acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub n) i)) n) acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos -> (fun n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if ((bi_eq_str dtb__167) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168)) else (C_Base_dList_dList_Base_dList_dCons (dtb__167, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__168))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> (match dtb__171 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__170)
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__175, dtb__176, dtb__177) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__175) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__170))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__170)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__169)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179)
  | C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match dtb__182 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__184, dtb__185, dtb__186) -> (if ((bi_eq_str dtb__184) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__185) dtb__183), dtb__181)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__187, dtb__188) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__183), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__187) mc2) dtb__181))), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__189) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__183), dtb__181)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__179)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__178)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (match dtb__192 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__191)
  | C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__194) then (C_Base_dList_dList_Base_dList_dCons (dtb__190, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__191))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__190)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (match dtb__198 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__196, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__197)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (match dtb__200 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__202, dtb__203) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__202) mc0) dtb__199))), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__197)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__204) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__199)), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__197)))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (dtb__196, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__197)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__196)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__206) -> (match dtb__205 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> (match dtb__207 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dClauseTooManyPatterns) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__209, dtb__210) -> (match dtb__209 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__211, dtb__212) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__211) pos) inner)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__213) -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__206) pos) restParams) ((bi_sub fuel) 1))) (fun restExpr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__209) pos) clauses)) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__209), C_Base_dList_dList_Base_dList_dNil)))), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__209))), bodyExpr, restExpr, (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__209)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | _ -> failwith "DT: impossible branch"
)) clauses)))))))
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table -> (fun clauses -> (fun params -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dPatternFuel) C_Base_dVec_dVec_Base_dVec_dVNil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dClauseTooManyPatterns) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) dtb__215) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars clauses) dtb__214) inner))))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__214) dtb__215) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__214) dtb__215) fuel) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__214) dtb__215) ((bi_sub fuel) 1)))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) ((bi_sub fuel) 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), alts, caseSp)))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) ((bi_sub fuel) 1))) (fun fb -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), ((v_Base_dList_dappend alts) fb), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) ((bi_sub mc5) 1))) (fun bodyExpr -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__217) mc3) mc4) ((bi_sub mc5) 1))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__216, branchPats, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__216) branchPats) mc3) mc1))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (n, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) freshSubs))) ((v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__216)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table -> (fun pos -> (fun clauses -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | dtb__218 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__218) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), C_Base_dList_dList_Base_dList_dNil))))))
)))))))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table -> (fun clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> ((fun names -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) 200)) (fun body -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__219))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table -> (fun clauses -> (fun name -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (C_Base_dList_dList_Base_dList_dCons (name, C_Base_dList_dList_Base_dList_dNil))) 200))))
