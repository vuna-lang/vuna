open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dGraph_dCheckMods = { f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg : string; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmKind : string; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmManifest : string; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmSources : string; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmDeps : string; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmVer : string }

let v_Vuna_dCompiler_dDriver_dGraph_dcheckModsOf = (fun pkg kind manifest sources deps ver -> { f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg = pkg; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmKind = kind; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmManifest = manifest; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmSources = sources; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmDeps = deps; f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmVer = ver })

let v_Vuna_dCompiler_dDriver_dGraph_dgraphNodeKey = (fun family m -> (String.concat "" [family; ":"; (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg; ":"; (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmKind]))

let v_Vuna_dCompiler_dDriver_dGraph_dcheckNodeKey = (fun m -> ((v_Vuna_dCompiler_dDriver_dGraph_dgraphNodeKey "check") m))

let v_Vuna_dCompiler_dDriver_dGraph_dnodeEnvKey = (fun pkg manifestHash -> (String.concat "" ["env:"; pkg; ":"; manifestHash]))

let v_Vuna_dCompiler_dDriver_dGraph_dnodeSrcKey = (fun pkg closureHash -> (String.concat "" ["src:"; pkg; ":"; closureHash]))

let v_Vuna_dCompiler_dDriver_dGraph_dnodeDepsKey = (fun pkg closureHash -> (String.concat "" ["deps:"; pkg; ":"; closureHash]))

let v_Vuna_dCompiler_dDriver_dGraph_dnodeCompilerKey = (fun verHash -> ("ver:" ^ verHash))

let v_Vuna_dCompiler_dDriver_dGraph_dgraphCheckMods = (fun m -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dGraph_dnodeEnvKey (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg) (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmManifest), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dGraph_dnodeSrcKey (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg) (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmSources), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dGraph_dnodeDepsKey (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmPkg) (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmDeps), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dGraph_dnodeCompilerKey (m).f_Vuna_dCompiler_dDriver_dGraph_dCheckMods_cmVer), Base_dList.C_Base_dList_dList_Nil)))))))))

let v_Vuna_dCompiler_dDriver_dGraph_dgraphRunOpts = (fun pkg -> { Vuna_dCompiler_dQuery_dRun.f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roOrigin = "pkg"; Vuna_dCompiler_dQuery_dRun.f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBudget = 0; Vuna_dCompiler_dQuery_dRun.f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roPersist = true; Vuna_dCompiler_dQuery_dRun.f_Vuna_dCompiler_dQuery_dRun_dRunOpts_roBucket = pkg })

let v_Vuna_dCompiler_dDriver_dGraph_dgraphHit = (fun db key mods -> (((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryHit db) key) (v_Vuna_dCompiler_dDriver_dGraph_dgraphCheckMods mods)))

let v_Vuna_dCompiler_dDriver_dGraph_dgraphCommit = (fun db key mods -> (Base_dPair.v_Base_dPair_dfirstOf ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolve db) key) (v_Vuna_dCompiler_dDriver_dGraph_dgraphCheckMods mods)) { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QMarker; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })))

let v_Vuna_dCompiler_dDriver_dGraph_dgraphCommitRef = (fun db key mods digest -> (Base_dPair.v_Base_dPair_dfirstOf ((((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_dqueryResolve db) key) (v_Vuna_dCompiler_dDriver_dGraph_dgraphCheckMods mods)) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dQuery.C_Vuna_dCompiler_dQuery_dQVal_QRef (digest)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })))

let v_Vuna_dCompiler_dDriver_dGraph_dgraphNote = (fun db kind key -> ((Vuna_dCompiler_dQuery.v_Vuna_dCompiler_dQuery_ddbNote db) (String.concat "" [kind; " "; key])))
