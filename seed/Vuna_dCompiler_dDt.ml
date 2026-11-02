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
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dCoreCodegen
let v_Vuna_dCompiler_dDt_ddtLoad = (fun roots -> (fun entry -> ((v_Vuna_dCompiler_dLoader_dloadProgramRawOrdered roots) entry)))

let v_Vuna_dCompiler_dDt_ddtProjectDecls = (fun parts -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))) (v_Base_dPair_dfirstOf parts)))

let v_Vuna_dCompiler_dDt_ddtLoadProject = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject project)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dDt_ddtProjectDecls parts))))))))))

let v_Vuna_dCompiler_dDt_ddtTrustsTermination = (fun pkg -> (if (if ((bi_eq_str pkg) "vuna") then true else ((bi_eq_str pkg) "vuna-compiler")) then true else ((bi_eq_str pkg) "vuna-base")))

let rec v_Vuna_dCompiler_dDt_ddtModulesTrusted = (fun modules -> (match modules with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (v_Vuna_dCompiler_dDt_ddtTrustsTermination (v_Vuna_dCompiler_dLoader_dmodulePackageOf dtb__0)) then (v_Vuna_dCompiler_dDt_ddtModulesTrusted dtb__1) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDt_ddtLibraryTrust = (fun entryPkg -> (fun modules -> (if (v_Vuna_dCompiler_dDt_ddtTrustsTermination entryPkg) then true else (v_Vuna_dCompiler_dDt_ddtModulesTrusted modules))))

let v_Vuna_dCompiler_dDt_ddtLoadModuleSet = (fun roots -> (fun entryPkg -> (fun names -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProjectModules roots) entryPkg) names)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject project)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDt_ddtProjectDecls parts), ((v_Vuna_dCompiler_dDt_ddtLibraryTrust entryPkg) (v_Base_dPair_dsecondOf parts)))))))))))))

let v_Vuna_dCompiler_dDt_ddtCheckDecls = (fun trusted -> (fun loaded -> ((v_Base_dResult_dandThen loaded) (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramWith trusted) decls)) (fun program -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram program)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))))))))))

let v_Vuna_dCompiler_dDt_ddtCompileDecls = (fun trusted -> (fun loaded -> (fun printResult -> ((v_Base_dResult_dandThen loaded) (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramWith trusted) decls)) (fun program -> ((v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram program) printResult))))))))

let v_Vuna_dCompiler_dDt_ddtCheckFile = (fun roots -> (fun entry -> ((v_Vuna_dCompiler_dDt_ddtCheckDecls false) ((v_Vuna_dCompiler_dDt_ddtLoad roots) entry))))

let v_Vuna_dCompiler_dDt_ddtCompileFile = (fun roots -> (fun entry -> (fun printResult -> (((v_Vuna_dCompiler_dDt_ddtCompileDecls false) ((v_Vuna_dCompiler_dDt_ddtLoad roots) entry)) printResult))))

let v_Vuna_dCompiler_dDt_ddtCheckProject = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Vuna_dCompiler_dDt_ddtCheckDecls (v_Vuna_dCompiler_dDt_ddtTrustsTermination entryPkg)) (((v_Vuna_dCompiler_dDt_ddtLoadProject roots) entryPkg) entry)))))

let v_Vuna_dCompiler_dDt_ddtCompileProject = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> (((v_Vuna_dCompiler_dDt_ddtCompileDecls (v_Vuna_dCompiler_dDt_ddtTrustsTermination entryPkg)) (((v_Vuna_dCompiler_dDt_ddtLoadProject roots) entryPkg) entry)) printResult)))))

let v_Vuna_dCompiler_dDt_ddtCheckLibrary = (fun roots -> (fun entryPkg -> (fun names -> (match (((v_Vuna_dCompiler_dDt_ddtLoadModuleSet roots) entryPkg) names) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__2) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__2))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__3) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dDt_ddtCheckDecls dtb__5) (C_Base_dResult_dResult_Base_dResult_dOk (dtb__4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDt_dreplExprName = fun () -> "vuna_repl_expr"

let v_Vuna_dCompiler_dDt_dsplitReplExpr = (fun decls -> (match (v_Base_dList_dreverse decls) with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__6 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__8, dtb__9, dtb__10, dtb__11) -> (if ((bi_eq_str dtb__8) (v_Vuna_dCompiler_dDt_dreplExprName ())) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__7), dtb__10)))) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression definition is not last")))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
))

let v_Vuna_dCompiler_dDt_ddtEvalExpr = (fun roots -> (fun program -> (fun exprSource -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProgramRawOrderedSource roots) "<repl>") ((bi_concat program) ((bi_concat "\n") ((bi_concat (v_Vuna_dCompiler_dDt_dreplExprName ())) ((bi_concat " = ") ((bi_concat exprSource) "\n"))))))) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_dsplitReplExpr decls)) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgramFull (v_Base_dPair_dfirstOf p))) (fun prog -> ((v_Vuna_dCompiler_dElab_ddtEvalExprIn prog) (v_Base_dPair_dsecondOf p)))))))))))

let v_Vuna_dCompiler_dDt_dlastName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDt_disIOType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__14, dtb__15, dtb__16) -> (v_Vuna_dCompiler_dDt_disIOType dtb__14)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__17) -> ((bi_eq_str (v_Vuna_dCompiler_dDt_dlastName dtb__17)) "IO")
  | _ -> false
))

let rec v_Vuna_dCompiler_dDt_dfindMainDef = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDefName dtb__18)) "main") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18)) else (v_Vuna_dCompiler_dDt_dfindMainDef dtb__19))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDt_ddefTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName dtb__20), (v_Vuna_dCompiler_dElab_ddtDefBody dtb__20))), (v_Vuna_dCompiler_dDt_ddefTableOf dtb__21)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDt_devalDtMain = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (match (v_Vuna_dCompiler_dDt_dfindMainDef dtb__23) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> ((fun table -> ((fun mainVal -> (if (v_Vuna_dCompiler_dDt_disIOType (v_Vuna_dCompiler_dElab_ddtDefType dtb__24)) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: interp cannot execute effects (main : IO a); compile and run the program instead")) else (match mainVal with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__25) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__25)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__26) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dshowValue mainVal)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__27) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dshowValue mainVal)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: main does not reduce to a value"))
))) ((((v_Vuna_dCompiler_dCore_dnormalize table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("main", C_Base_dList_dList_Nil))))))) (v_Vuna_dCompiler_dDt_ddefTableOf dtb__23))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDt_ddtEvalFile = (fun roots -> (fun entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDt_ddtLoad roots) entry)) (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramWith false) decls)) (fun program -> (v_Vuna_dCompiler_dDt_devalDtMain program)))))))

let v_Vuna_dCompiler_dDt_ddtProjectParts = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject project)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf parts), (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))))))))))))

let v_Vuna_dCompiler_dDt_ddtSplitProject = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDt_ddtProjectParts roots) entryPkg) entry)) (fun parts -> ((fun entryDecls -> ((fun modules -> ((fun allDecls -> ((fun trusted -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramFullWith trusted) allDecls)) (fun program -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenerateDtSplitProgram ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dmoduleNameOf m), (v_Vuna_dCompiler_dLoader_dmoduleDeclsOf m))))) modules)) entryDecls) program) printResult)))) (v_Vuna_dCompiler_dDt_ddtTrustsTermination entryPkg))) ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) modules)) entryDecls))) (v_Base_dPair_dsecondOf parts))) (v_Base_dPair_dfirstOf parts))))))))
