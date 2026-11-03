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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
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
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dProgram
open Vuna_dCompiler_dDriver_dSplit
type t_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta = C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta of ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string t_Base_dList_dList)

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan = fun () -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner = fun () -> "Main"

let v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner = fun () -> "Vuna_builtins"

let v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit = fun () -> "Vuna_runtime"

let v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinUnit = fun () -> "Vuna_builtins"

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule = (fun modName -> (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

let v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinClassNames = fun () -> (C_Base_dList_dList_Cons ("Show", (C_Base_dList_dList_Cons ("Eq", (C_Base_dList_dList_Cons ("Ord", C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinMethodNames = fun () -> (C_Base_dList_dList_Cons ("show", (C_Base_dList_dList_Cons ("eq", (C_Base_dList_dList_Cons ("neq", (C_Base_dList_dList_Cons ("lt", (C_Base_dList_dList_Cons ("le", (C_Base_dList_dList_Cons ("gt", (C_Base_dList_dList_Cons ("ge", C_Base_dList_dList_Nil))))))))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_disBuiltinClassName = (fun n -> ((v_Base_dList_dmemName n) (v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinClassNames ())))

let v_Vuna_dCompiler_dCodegen_dSplit_disBuiltinInstanceName = (fun n -> (if (if ((v_Base_dString_dstartsWith "Show_Show_") n) then true else ((v_Base_dString_dstartsWith "Eq_Eq_") n)) then true else ((v_Base_dString_dstartsWith "Ord_Ord_") n)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitAnonInstName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> ((v_Base_dString_dstartsWith "#") dtb__1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> (if ((bi_eq_generic dtb__2) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__2)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitExprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__4, dtb__5) -> dtb__4
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__6, dtb__7) -> (bi_strFromInt dtb__6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__8, dtb__9) -> dtb__8
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitArgSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dCodegen_dSplit_dsplitExprNameFor dtb__10)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitArgSuffix dtb__11)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__12, dtb__13, dtb__14) -> (match dtb__12 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__15, dtb__16) -> ((bi_concat dtb__15) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitArgSuffix dtb__13))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__17, dtb__18) -> dtb__17
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (if (v_Vuna_dCompiler_dCodegen_dSplit_dsplitAnonInstName dtb__19) then ((bi_concat (v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstPrefixOf dtb__19)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedInstName headExpr)))) else dtb__19)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__20, dtb__21, dtb__22) -> (match dtb__20 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__23, dtb__24) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__25, dtb__26) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> (v_Vuna_dCompiler_dCommon_djoinDots dtb__27)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (match dtb__29 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__31, dtb__32, dtb__33) -> (C_Base_dList_dList_Cons (dtb__31, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__34, dtb__35, dtb__36, dtb__37) -> (C_Base_dList_dList_Cons (dtb__34, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (C_Base_dList_dList_Cons (dtb__38, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> (C_Base_dList_dList_Cons (dtb__44, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__49, dtb__50, dtb__51, dtb__52) -> (C_Base_dList_dList_Cons (dtb__49, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__30)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (C_Base_dList_dList_Cons (dtb__55, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__54)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> (C_Base_dList_dList_Cons (dtb__61, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__54)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__54)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> ((fun headExpr -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceName dtb__66) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) headExpr), mc0)), ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) mc1) mc2) dtb__67)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__66, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc1, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan ()))), ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (p, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan ()))))) mc2))), (v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan ()))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf = (fun owner -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (match (v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName dtb__70) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceName dtb__73) dtb__68) dtb__70), owner)), C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners owner) dtb__74) dtb__75) dtb__78)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners owner) dtb__80) dtb__81) dtb__83)
  | _ -> C_Base_dList_dList_Nil
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__85, dtb__86) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf mc0) dtb__85)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo mc0) dtb__86))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (match dtb__87 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__89)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__90))) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo dtb__89) dtb__90)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules dtb__88)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__91 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__93)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__94))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules dtb__92))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDictClass = (fun name -> (if ((v_Base_dString_dstartsWith "Dict_") name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Base_dString_dsubstring 5) ((bi_sub (bi_strLength name)) 5)) name))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf = (fun pairs -> (fun name -> ((v_Base_dList_dlookupPair name) pairs)))

let v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr = (fun knownModules -> (fun what -> (fun name -> ((fun prefix -> (if ((v_Base_dList_dmemName prefix) knownModules) then (C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: `") ((bi_concat what) ((bi_concat "` ") ((bi_concat name) ((bi_concat " has module prefix `") ((bi_concat prefix) "` but no such module")))))))))) (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf = (fun dataOwners -> (fun knownModules -> (fun entryDataNames -> (fun d -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf dataOwners) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__95))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDictClass (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (if (v_Vuna_dCompiler_dCodegen_dSplit_disBuiltinClassName dtb__96) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner ()))) else (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr knownModules) "data") dtb__96))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr knownModules) "data") (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) else (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) entryDataNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for data `") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) "`"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (if ((v_Base_dString_dstartsWith ((bi_concat "Show_Show_") dtb__99)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Eq_Eq_") dtb__99)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Ord_Ord_") dtb__99)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100)) else ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwnerOf dtb__98) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf = (fun defOwners -> (fun dataOwners -> (fun knownModules -> (fun entryNames -> (fun name -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf defOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__101) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__101))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinMethodNames ())) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner ()))) else (match ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwnerOf dataOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__102))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr knownModules) "definition") name) else (if ((v_Base_dList_dmemName name) entryNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ()))) else (if (v_Vuna_dCompiler_dCodegen_dSplit_disBuiltinInstanceName name) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for definition `") ((bi_concat name) "`")))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmDefOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmDataOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmEntryNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf = (fun modules -> (fun entryDecls -> ((fun knownModules -> ((fun entryNames -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (defOwners, dataOwners, knownModules, entryNames))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules modules)) ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ()))))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames entryDecls))))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules modules)) ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ()))))) entryNames)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo (v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ())) entryDecls))))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames entryDecls))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dfirstOf p))) modules))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__119, dtb__120) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf (v_Vuna_dCompiler_dCodegen_dSplit_dsmDefOwners mc0)) (v_Vuna_dCompiler_dCodegen_dSplit_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCodegen_dSplit_dsmEntryNames mc0)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__119))) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs mc0) dtb__120)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__119), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf (v_Vuna_dCompiler_dCodegen_dSplit_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCodegen_dSplit_dsmEntryNames mc0)) dtb__121)) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas mc0) dtb__122)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__121), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dmapOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (if ((bi_eq_str dtb__125) mc1) then dtb__126 else ((v_Vuna_dCompiler_dCodegen_dSplit_dmapOwnerOf dtb__124) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit = (fun pairs -> (fun u -> (fun datas -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCodegen_dSplit_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) u))) datas))))

let v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit = (fun pairs -> (fun u -> (fun defs -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCodegen_dSplit_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) u))) defs))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dopenHeader = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> ((bi_concat "open ") ((bi_concat dtb__127) ((bi_concat "\n") (v_Vuna_dCompiler_dCodegen_dSplit_dopenHeader dtb__128))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitText = (fun allDatas -> (fun allDefs -> (fun unitDatas -> (fun unitDefs -> (fun bridgeText -> (fun opens -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf allDatas) unitDatas)) (fun typeText -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs unitDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency unitDefs)) ((v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCodegen_dSplit_dopenHeader opens)) ((bi_concat typeText) ((bi_concat bridgeText) ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__129)) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitListBridgeFor = (fun allDatas -> (fun dataPairs -> (fun unit -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData allDatas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (if ((bi_eq_str ((v_Vuna_dCompiler_dCodegen_dSplit_dmapOwnerOf dataPairs) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__131))) unit) then (v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (match dtb__132 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> ((fun unit -> ((fun unitDatas -> ((fun unitDefs -> ((fun bridge -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitText mc0) mc1) unitDatas) unitDefs) bridge) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) mc4))) (fun text -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles mc0) mc1) mc2) mc3) ((v_Base_dList_dappend mc4) (C_Base_dList_dList_Cons (unit, C_Base_dList_dList_Nil)))) dtb__133)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (((bi_concat unit) ".ml"), text)), tail))))))))) (((v_Vuna_dCompiler_dCodegen_dSplit_dsplitListBridgeFor mc0) mc3) dtb__134))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit mc2) dtb__134) mc1))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit mc3) dtb__134) mc0))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainHook = (fun allDatas -> (fun allDefs -> (fun printResult -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") allDefs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("[CG_NoMain] DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> ((fun table -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__136)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) dtb__137) ((v_Vuna_dCompiler_dCodegen_dTerm_dioRunText (C_Base_dPair_dPair_Base_dPair_dPair (allDatas, allDefs))) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__136)) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName "main"))) (v_Vuna_dCompiler_dCodegen_dErase_ddefTable allDefs))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile = (fun allDatas -> (fun allDefs -> (fun defPairs -> (fun dataPairs -> (fun printResult -> (fun opens -> ((fun entryDefs -> ((fun entryDatas -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf allDatas) entryDatas)) (fun typeText -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs entryDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency entryDefs)) ((v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainHook allDatas) allDefs) printResult)) (fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Main.ml", ((bi_concat (v_Vuna_dCompiler_dCodegen_dSplit_dopenHeader opens)) ((bi_concat typeText) ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__138)) ((bi_concat "\n") hook))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit dataPairs) (v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ())) allDatas))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner ())) allDefs))))))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dfirstUnresolvedDeclName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__140) then (v_Vuna_dCompiler_dCodegen_dSplit_dfirstUnresolvedDeclName dtb__141) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (match (v_Vuna_dCompiler_dCodegen_dSplit_dfirstUnresolvedDeclName (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__145)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: module ") ((bi_concat dtb__144) ((bi_concat " has an unresolved declaration name `") ((bi_concat dtb__146) "` (codegen requires Loader-resolved decls)"))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules dtb__143)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram = (fun modules -> (fun entryDecls -> (fun prog -> (fun printResult -> ((fun allDatas -> ((fun allDefs -> ((fun runtimeAll -> ((fun table -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules modules)) (fun _u -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) allDefs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> ((fun allTypeNames -> ((fun meta -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes allDefs)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames allDatas) dtb__147)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__147)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs meta) dtb__147)) (fun defPairs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((fun builtinDatas -> ((fun builtinDefs -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitText runtimeAll) dtb__147) builtinDatas) builtinDefs) "") (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit ()), C_Base_dList_dList_Nil)))) (fun builtinText -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles runtimeAll) dtb__147) defPairs) dataPairs) C_Base_dList_dList_Nil) modules)) (fun moduleFiles -> ((fun unitNames -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile runtimeAll) dtb__147) defPairs) dataPairs) printResult) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) unitNames))) (fun mainFile -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Vuna_runtime.ml", (v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Vuna_builtins.ml", builtinText)), ((v_Base_dList_dappend moduleFiles) (C_Base_dList_dList_Cons (mainFile, C_Base_dList_dList_Nil)))))))))))) ((v_Base_dList_dmap (fun p -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (v_Base_dPair_dfirstOf p)))) modules))))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner ())) dtb__147))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit dataPairs) (v_Vuna_dCompiler_dCodegen_dSplit_dbuiltinOwner ())) runtimeAll))))))))))))) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf modules) entryDecls))) ((v_Base_dList_dappend dtb__148) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) allDatas)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dErase_ddefTable allDefs))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas allDatas))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))))
