open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
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
open Vuna_dCompiler_dLoader_dFixity
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
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons (((bi_concat "mc") (bi_strFromInt ((bi_sub n) remaining))), acc)))))))

let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo ((bi_sub n) 0)) n) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons (dtb__12, C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__13) mc1), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__14, dtb__15) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__16, dtb__17) -> ((bi_eq_str dtb__14) dtb__16)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__18, dtb__19) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__20) -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__21, dtb__22) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__23, dtb__24) -> ((bi_eq_int dtb__21) dtb__23)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__25, dtb__26) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__27) -> true
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__28, dtb__29) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__28, dtb__29))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__30, dtb__31) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__30, dtb__31))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__38, dtb__39, dtb__40) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__32)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (match dtb__46 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__48)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((v_Base_dList_dmemName mc1) (v_Base_dPair_dsecondOf dtb__50)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__50))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__51) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dallNamesIn = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (if ((v_Base_dList_dmemName dtb__52) mc1) then ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__53) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__54) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__56) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (match dtb__59 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__63, dtb__64, dtb__65) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__57)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (match dtb__70 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__72, dtb__73, dtb__74) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__67)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__66)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (match dtb__77 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__76)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__75)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> dtb__82
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__83) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__84, dtb__85) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (match dtb__88 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__90) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__86)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__95)), (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__92, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__92)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__98, dtb__99, dtb__100) -> ((v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dsecondOf f)))) dtb__99)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__101, dtb__102) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__103, dtb__104) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__105, dtb__106, dtb__107) -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__106)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__108) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__109, dtb__110, dtb__111) -> (C_Base_dList_dList_Base_dList_dCons (dtb__109, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__110)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__112, dtb__113) -> (C_Base_dList_dList_Base_dList_dCons (dtb__112, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (v_Base_dPair_dfirstOf dtb__114))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__115))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName -> (fun newName -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__116, dtb__117) -> (if ((bi_eq_str dtb__116) oldName) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (newName, dtb__117)) else e)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__118, dtb__119) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__118, dtb__119))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__120, dtb__121) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__120, dtb__121))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__122, dtb__123, dtb__124) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__122, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__122) dtb__123), dtb__124))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__125, dtb__126, dtb__127) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__125), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__126), dtb__127))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__128, dtb__129, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__130), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (C_Base_dList_dList_Base_dList_dCons (dtb__128, C_Base_dList_dList_Base_dList_dNil))) dtb__131), dtb__132))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__133, dtb__134, dtb__135, dtb__136) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__133), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__133)) dtb__134), dtb__135, dtb__136))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__137, dtb__138, dtb__139) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__137), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__138), dtb__139))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__140, dtb__141) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__140), dtb__141))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__142, dtb__143, dtb__144, dtb__145) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__142), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__143), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__144), dtb__145))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__146, dtb__147, dtb__148) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__146), dtb__147, dtb__148))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__149, dtb__150, dtb__151) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__149, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__150), dtb__151))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__152, dtb__153, dtb__154) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__152), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__153), dtb__154))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__155, dtb__156) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__155, dtb__156))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__157, dtb__158, dtb__159, dtb__160) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__157, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__158), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__159), dtb__160))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__161, dtb__162) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__161), dtb__162))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__163, dtb__164, dtb__165) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__163), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__164), dtb__165))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName -> (fun newName -> (fun names -> (fun body -> (if ((v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName -> (fun newName -> (fun bind -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf bind), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf bind)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName -> (fun newName -> (fun field -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf field), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (v_Base_dPair_dsecondOf field)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName -> (fun newName -> (fun clause -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf clause), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (v_Base_dPair_dfirstOf clause))) (v_Base_dPair_dsecondOf clause)))))))
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName -> (fun newName -> (fun alt -> ((fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (p, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (v_Base_dPair_dsecondOf alt))))) (v_Base_dPair_dfirstOf alt)))))

let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__166, dtb__167) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__166) mc0) mc2)
  | _ -> mc2
))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (match dtb__168 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (match dtb__170 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__169) mc3)
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__172) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__169) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__172) dtb__171))), mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__169) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit -> (fun pos -> (fun clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__174, dtb__175) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__174) mc0) mc2)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__176, dtb__177, dtb__178) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__176) mc0) mc2)
  | _ -> mc2
))))

let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (match dtb__179 with
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__181), C_Base_dList_dList_Base_dList_dNil))) dtb__182), (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__181) dtb__180)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> (match dtb__183 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> (match dtb__185 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__184) mc1) mc2)
  | C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> (match dtb__187 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__189, dtb__190) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__184) mc1) (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__189) mc1) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__184) mc1) mc2)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> (match dtb__193 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__192) mc1)
  | C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (match dtb__195 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__197, dtb__198, dtb__199) -> (if ((bi_eq_str dtb__197) mc1) then (v_Base_dList_dlength dtb__198) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__192) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__192) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__191)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos -> (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons (((bi_concat "_sc_") ((bi_concat pos) ((bi_concat "_") (bi_strFromInt ((bi_sub n) remaining))))), acc))))))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos -> (fun i -> (fun n -> (fun acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) ((bi_sub n) i)) n) acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos -> (fun n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (if ((bi_eq_str dtb__200) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201)) else (C_Base_dList_dList_Base_dList_dCons (dtb__200, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__201))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__204, dtb__205) -> (match dtb__204 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__203)
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__208, dtb__209, dtb__210) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__208) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__203))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__203)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__202)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> (match dtb__213 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212)
  | C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (match dtb__215 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__217, dtb__218, dtb__219) -> (if ((bi_eq_str dtb__217) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__218) dtb__216), dtb__214)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__220, dtb__221) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__216), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__220) mc2) dtb__214))), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__222) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) dtb__216), dtb__214)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__212)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__211)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__225, dtb__226) -> (match dtb__225 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__224)
  | C_Base_dList_dList_Base_dList_dCons (dtb__227, dtb__228) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__227) then (C_Base_dList_dList_Base_dList_dCons (dtb__223, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__224))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__224))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__223)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__231, dtb__232) -> (match dtb__231 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__229, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__230)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (match dtb__233 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__235, dtb__236) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__235) mc0) dtb__232))), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__230)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__237) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, dtb__232)), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__230)))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (dtb__229, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__230)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__229)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (match dtb__240 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dClauseTooManyPatterns) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (match dtb__242 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__244, dtb__245) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__244) pos) inner)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__246) -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) ((bi_sub fuel) 1))
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__239) pos) restParams) ((bi_sub fuel) 1))) (fun restExpr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__242) pos) clauses)) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__242), C_Base_dList_dList_Base_dList_dNil)))), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__242))), bodyExpr, restExpr, (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__242)))))))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__247) dtb__248) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) dtb__248) ((bi_sub fuel) 1))) (fun inner -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars clauses) dtb__247) inner))))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__247) dtb__248) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__247) dtb__248) fuel) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__247) dtb__248) ((bi_sub fuel) 1))))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dPatternFuel) C_Base_dVec_dVec_Base_dVec_dVNil))) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (C_Base_dList_dList_Base_dList_dCons (pos, restParams))) ((bi_sub fuel) 1))) (fun e -> (C_Base_dResult_dResult_Base_dResult_dOk (e))))))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) ((bi_sub fuel) 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), alts, caseSp)))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) ((bi_sub fuel) 1))) (fun fb -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), ((v_Base_dList_dappend alts) fb), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table -> (fun clauses -> (fun pos -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fuel)))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) ((bi_sub mc5) 1))) (fun bodyExpr -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__250) mc3) mc4) ((bi_sub mc5) 1))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__249, branchPats, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__249) branchPats) mc3) mc1))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (n, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) freshSubs))) ((v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__249)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc5) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table -> (fun pos -> (fun clauses -> (fun restParams -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | dtb__251 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__251) restParams) ((bi_sub fuel) 1))) (fun bodyExpr -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), C_Base_dList_dList_Base_dList_dNil))))))
)))))))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table -> (fun clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> ((fun names -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) 200)) (fun body -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__252))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table -> (fun clauses -> (fun name -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (C_Base_dList_dList_Base_dList_dCons (name, C_Base_dList_dList_Base_dList_dNil))) 200))))
