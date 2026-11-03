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
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = fun () -> 1073741824

let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun mc0 -> (if ((bi_eq_str mc0) "+") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "-") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "*") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "/") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "==") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "/=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "<") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "<=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) ">") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) ">=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "&&") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "||") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "++") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_show_string") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "bi_eq_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_neq_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_lt_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_le_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_gt_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_ge_generic") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_eq_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_neq_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_lt_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_le_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_gt_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_ge_int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_eq_str") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_neq_str") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_eq_bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "bi_neq_bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "strLength") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "strConcatMany") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "strSubstTemplate") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "timeUs") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0)) else (if ((bi_eq_str mc0) "strHash") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "strAt") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "strUnpack") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "strPack") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "strFromInt") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "readFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "writeFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "print") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "getArgs") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0)) else (if ((bi_eq_str mc0) "readLine") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0)) else (if ((bi_eq_str mc0) "readDir") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "isDirectory") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "makeDir") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "removeFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "fileExists") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "fileMtime") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "fileSize") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "exit") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_readFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_writeFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else (if ((bi_eq_str mc0) "prim_print") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_getArgs") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0)) else (if ((bi_eq_str mc0) "prim_readLine") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0)) else (if ((bi_eq_str mc0) "prim_readDir") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_isDirectory") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_makeDir") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_removeFile") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_fileExists") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_fileMtime") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_fileSize") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_exit") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (if ((bi_eq_str mc0) "prim_runIn") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (2)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = fun () -> (C_Base_dList_dList_Cons ("Type", (C_Base_dList_dList_Cons ("->", (C_Base_dList_dList_Cons ("_", (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("strConcatMany", (C_Base_dList_dList_Cons ("strSubstTemplate", (C_Base_dList_dList_Cons ("timeUs", (C_Base_dList_dList_Cons ("strHash", (C_Base_dList_dList_Cons ("strAt", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames ())))

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun name -> (if ((bi_eq_str name) "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if ((bi_eq_str name) "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if ((bi_eq_str name) "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if ((bi_eq_str name) "show") then " (trait method show; add `import Base.Show`)" else (if ((bi_eq_str name) "eq") then " (trait method eq; add `import Base.Eq`)" else (if ((bi_eq_str name) "neq") then " (trait method neq; add `import Base.Eq`)" else (if ((bi_eq_str name) "lt") then " (trait method lt; add `import Base.Ord`)" else (if ((bi_eq_str name) "le") then " (trait method le; add `import Base.Ord`)" else (if ((bi_eq_str name) "gt") then " (trait method gt; add `import Base.Ord`)" else (if ((bi_eq_str name) "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor dtb__2) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__2)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__3)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__4)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__2) ((bi_concat " is not exported by ") dtb__3))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__1))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, dtb__6) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7) -> (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor dtb__6) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__6)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__7)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__6) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__8) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__8)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": constructor ") ((bi_concat dtb__6) ((bi_concat " is not exported by ") dtb__7))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__5))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (mc0, dtb__9, mc2))) dtb__10) mc2)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (dtb__11, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs ((bi_sub mc0) 1)) dtb__12))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if ((bi_le_int mc0) 0) then (C_Base_dList_dList_Cons (dtb__13, dtb__14)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs ((bi_sub mc0) 1)) dtb__14))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules -> (fun label -> (fun imports -> (fun segs -> (fun n -> (fun sp -> (if ((bi_lt_int n) 1) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs ((bi_sub n) 1)) segs))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__15)) (fun es -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__17 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor dtb__16) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__16, sp)))))) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__16) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__18), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__16) ((bi_concat " is not exported by ") dtb__15))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__16) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__19), sp))) dtb__17) sp)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__16) ((bi_concat " is not exported by ") dtb__15))))))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs ((bi_sub n) 1)) segs))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) ((bi_sub n) 1)) sp)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun name -> (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor modules) label) imports) name) else (if ((v_Base_dList_dmemName name) ownCtors) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown constructor ") ((bi_concat name) ((v_Vuna_dCompiler_dCommon_dsuggest name) ownCtors))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid variable name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label -> (fun name -> (if ((bi_eq_str name) "_") then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": invalid top-level name _ (bare _ is reserved)"))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid top-level name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun pat -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__20) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__20)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__21, dtb__22) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__21)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__21, dtb__22)), (C_Base_dList_dList_Cons (dtb__21, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__23, dtb__24) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__23, dtb__24)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__25, dtb__26) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__25, dtb__26)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__27, dtb__28, dtb__29) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__27)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub fuel) 1)) modules) label) prefix) ownCtors) imports) dtv))) dtb__28)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__29)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__30, dtb__31, dtb__32) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__30)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField ((bi_sub fuel) 1)) modules) label) prefix) ownCtors) imports) dtv))) dtb__31)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__32)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__34)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__35)), dtb__36))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__37 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) mc0) mc1) mc2) mc3) mc4) dtb__39)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__38)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__42) dtb__43), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__40)), dtb__44))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (match dtb__45 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__47, dtb__48, dtb__49) -> (match dtb__47 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__50) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__46)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__49)), (C_Base_dList_dList_Cons (dtb__48, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__49)), C_Base_dList_dList_Nil)))), dtb__49))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__51, dtb__52) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__46)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__49)), (C_Base_dList_dList_Cons (dtb__48, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Cons (dtb__51, C_Base_dList_dList_Nil)), tail, dtb__49)), C_Base_dList_dList_Nil)))), dtb__49))))))
  | _ -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBindPattern)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__53, dtb__54) -> (match dtb__46 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__53))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__46)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__54)), (C_Base_dList_dList_Cons (dtb__53, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__54)), C_Base_dList_dList_Nil)))), dtb__54))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label -> (fun prefix -> (fun ctor -> (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor ctor) then (C_Base_dResult_dResult_Base_dResult_dOk (ctor)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) ctor)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__55)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((bi_ge_int dtb__57) 65) then ((bi_le_int dtb__57) 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun name -> (if ((v_Base_dList_dmemName name) ownTypes) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (if (if (if (if ((bi_eq_str name) "Int") then true else ((bi_eq_str name) "String")) then true else ((bi_eq_str name) "Bool")) then true else ((bi_eq_str name) "Type")) then true else ((bi_eq_str name) "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat typePrefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__61)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__60) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__62) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__62)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": type ") ((bi_concat dtb__60) ((bi_concat " is not exported by ") dtb__61))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__59))
  | _ -> failwith "DT: impossible branch"
) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) C_Base_dList_dList_Nil) imports) name)) (fun c -> (C_Base_dResult_dResult_Base_dResult_dOk (c))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceName = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc0) mc1) dtb__63)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (n))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc1) "#default")))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageAllowsEffects = (fun pkg -> (if (if ((bi_eq_str pkg) "vuna") then true else ((bi_eq_str pkg) "vuna-compiler")) then true else ((bi_eq_str pkg) "vuna-base")))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str name) "print") then true else ((bi_eq_str name) "readFile")) then true else ((bi_eq_str name) "writeFile")) then true else ((bi_eq_str name) "getArgs")) then true else ((bi_eq_str name) "readLine")) then true else ((bi_eq_str name) "readDir")) then true else ((bi_eq_str name) "isDirectory")) then true else ((bi_eq_str name) "makeDir")) then true else ((bi_eq_str name) "removeFile")) then true else ((bi_eq_str name) "fileExists")) then true else ((bi_eq_str name) "fileMtime")) then true else ((bi_eq_str name) "fileSize")) then true else ((bi_eq_str name) "exit")) then true else ((bi_eq_str name) "prim_print")) then true else ((bi_eq_str name) "prim_readFile")) then true else ((bi_eq_str name) "prim_writeFile")) then true else ((bi_eq_str name) "prim_getArgs")) then true else ((bi_eq_str name) "prim_readLine")) then true else ((bi_eq_str name) "prim_readDir")) then true else ((bi_eq_str name) "prim_isDirectory")) then true else ((bi_eq_str name) "prim_makeDir")) then true else ((bi_eq_str name) "prim_removeFile")) then true else ((bi_eq_str name) "prim_fileExists")) then true else ((bi_eq_str name) "prim_fileMtime")) then true else ((bi_eq_str name) "prim_fileSize")) then true else ((bi_eq_str name) "prim_exit")) then true else ((bi_eq_str name) "prim_runIn")))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (if ((v_Base_dList_dmemName name) scope) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if ((v_Base_dList_dmemName name) own) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (name))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unbound variable ") ((bi_concat name) ((bi_concat ((v_Vuna_dCompiler_dCommon_dsuggest name) ((v_Base_dList_dappend own) scope))) (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name)))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid dotted name ") name))))
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((v_Base_dList_dmemName dtb__64) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__64, sp))) dtb__65) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__66))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName dtb__64) own) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__64), sp))) dtb__65) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__64) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__64, sp))) dtb__65) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__64) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat dtb__64) " is not imported"))))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__64)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, sp))) dtb__65) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) mc1) mc2) mc3) mc5) mc6) dtb__67)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) ((v_Base_dList_dappend dtb__70) mc7)) dtb__68)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun rec_u -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) binds) body) else ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) binds) body))))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match binds with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, b))))))
  | C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match dtb__71 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__74)) (fun value2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownCtors) imports) dtb__73)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__76) scope)) dtb__72) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, value2)), dtb__77)), dtb__78))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ownCtors) imports) binds) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__79) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__79))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__80) -> (match dtb__80 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> ((fun scope2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope2) dtb__82)) (fun values2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__81) scope))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__86)) (fun value2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__84)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__87, dtb__88) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__87) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) own) imports) scope) dtb__87) dtb__88) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__87)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__88)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__89, dtb__90) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__89, dtb__90))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__91, dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__91, dtb__92))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__93, dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__93)) (fun _u -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__93) scope)) dtb__94)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__93, b, dtb__95))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__96, dtb__97, dtb__98) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__96)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) a))) dtb__97)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__98))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__101)) (fun dom2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Cons (dtb__99, C_Base_dList_dList_Nil))) scope)) dtb__102)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__99, dtb__100, dom2, cod2, dtb__103))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__104, dtb__105, dtb__106, dtb__107) -> ((v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__106) dtb__104) dtb__105)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__108, dtb__109, dtb__106, dtb__107))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__110, dtb__111, dtb__112) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__110)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtv))) dtb__111)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__112))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__113, dtb__114, dtb__115, dtb__116) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__113)) (fun c2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__114)) (fun t2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__115)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__116))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__117, dtb__118, dtb__119) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__117)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__118, dtb__119))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__120, dtb__121, dtb__122) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__120)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtv))) dtb__121)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (name2, fs, dtb__122))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__123, dtb__124, dtb__125) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__123)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtv))) dtb__124)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__125))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__126, dtb__127, dtb__128) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__126)) (fun m2 -> (match (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__127) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__129) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown instance name ") ((bi_concat dtb__127) ((bi_concat " (@") ((bi_concat dtb__127) ")")))))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__130) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (m2, dtb__130, dtb__128))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__131, dtb__132) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__131)) (fun e -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) e)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__133, dtb__134, dtb__135) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__133)) (fun v2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) own) ownCtors) imports) scope) dtb__134)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__135))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__137)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, v)))))))
  | _ -> failwith "DT: impossible branch"
))))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match dtb__138 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__139)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__141, dtb__142) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__141) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__143, dtb__144) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__145, dtb__146) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__147, dtb__148, dtb__149) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__148)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__150, dtb__151, dtb__152) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__150), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__151), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__153, dtb__154, dtb__155, dtb__156) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__153), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__154), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__157, dtb__158, dtb__159) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__157), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__158), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__160, dtb__161, dtb__162, dtb__163) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__160), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__161), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__162), C_Base_dList_dList_Nil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__164, dtb__165, dtb__166) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__164)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__167, dtb__168, dtb__169) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__168)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__170, dtb__171, dtb__172) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__170), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__171), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__173, dtb__174, dtb__175) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__178), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__179), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__181, dtb__182) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__181)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__183, dtb__184, dtb__185) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__183)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__186), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__187), C_Base_dList_dList_Nil)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (match dtb__188 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__191), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__189), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (match dtb__192 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, dtb__195) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__195), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__193), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (match dtb__196 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__199), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__197), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun s -> (match s with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__200, dtb__201, dtb__202) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__201)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__203, dtb__204) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__203)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__205, dtb__206) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__205), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__206), C_Base_dList_dList_Nil)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__207, dtb__208, dtb__209, dtb__210) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__209)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__211, dtb__212, dtb__213, dtb__214) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__218)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__220), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__221), C_Base_dList_dList_Nil)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label -> (fun pkg -> (fun decls -> (if (v_Vuna_dCompiler_dLoader_dResolve_dpackageAllowsEffects pkg) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (if (if ((bi_eq_str pkg) "") then ((bi_neq_str label) "<entry>") else false) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__222) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": effectful builtin `") ((bi_concat dtb__222) ((bi_concat "` is not available in package ") ((bi_concat pkg) " (use Base.IO)")))))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__223, dtb__224) -> ((bi_concat "var ") dtb__223)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__225, dtb__226, dtb__227) -> "app"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__228, dtb__229) -> "int"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__230, dtb__231) -> "str"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__232, dtb__233, dtb__234) -> "lam"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__235, dtb__236, dtb__237, dtb__238) -> "let"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__239, dtb__240, dtb__241) -> "case"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__242, dtb__243, dtb__244, dtb__245) -> "if"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__246, dtb__247) -> "do"
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun ty -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtb__250)) (fun dom2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtb__251)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__248, dtb__249, dom2, cod2, dtb__252))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__253, dtb__254, dtb__255) -> (match dtb__253 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__256, dtb__257) -> (if ((bi_eq_str dtb__256) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtb__253)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtv))) dtb__254)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__255)))))))))
  | _ -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtb__253)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ownTypes) imports) dtv))) dtb__254)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__255))))))))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__258, dtb__259) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ownTypes) imports) dtb__258)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__259))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__260, dtb__261) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid type expression (") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)) ")")))))
)) ty)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__262, dtb__263, dtb__264, dtb__265) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) dtb__262)) (fun c2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) mc0) mc1) mc2) mc3) mc4) dtb__263)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (c2, ty2, dtb__264, dtb__265))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__266, dtb__267, dtb__268) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__266)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) mc0) mc1) mc2) mc3) mc4) dtb__267)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__266, ty2, dtb__268))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__269, dtb__270) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__269)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) mc0) mc1) mc2) mc3) mc4) dtb__270)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (n, ty2))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__271, dtb__272, dtb__273) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) dtb__271)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownTypes) imports) dtb__272)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__271, ty2, dtb__273))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__274, dtb__275, dtb__276, dtb__277) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) dtb__274)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownCtors) imports)) dtb__275)) (fun parts -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__276)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__274, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__277))))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": instance body may only contain method signatures/definitions")))
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__278)) (fun dn -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownTypes) imports) dtb__280)) (fun kind2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ownTypes) imports)) dtb__281)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__282)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dn, dtb__279, kind2, ctors2, ds2, dtb__283))))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__284, dtb__285, dtb__286, dtb__287, dtb__288) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__284)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ownTypes) imports)) dtb__286)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__287)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dn, dtb__285, fields2, ds2, dtb__288))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__289, dtb__290, dtb__291, dtb__292) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__289)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ownTypes) imports)) dtb__291)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (tn, dtb__290, ms, dtb__292))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceName label) prefix) dtb__293)) (fun in2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownTypes) imports) dtb__295)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) own) ownCtors) ownTypes) imports)) dtb__296)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (in2, dtb__294, head2, ms, dtb__297))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__298, dtb__299, dtb__300) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__298)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownTypes) imports) dtb__299)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (n, ty2, dtb__300))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__301, dtb__302, dtb__303, dtb__304) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__301)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) ownCtors) imports)) dtb__302)) (fun parts -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound ())) modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__303)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__304))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun decls -> ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) own) ownCtors) ownTypes) imports)) decls)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules -> (fun entryPkg -> (fun imports -> (fun decls -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames decls)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames decls)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls)))) imports) decls)) (fun d -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) d)))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun modules -> (match modules with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__305, dtb__306) -> (match dtb__305 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) dtb__307) dtb__307) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__311)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf dtb__311))) (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf dtb__311)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf dtb__311)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__311)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf dtb__311)))) ((v_Base_dList_dappend dtb__309) dtb__310)) dtb__311)) (fun d -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__307) dtb__308) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__306)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
