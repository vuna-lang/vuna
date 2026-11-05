open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
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
open Base_dIntMap
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
open Vuna_dCompiler_dElab_dInstName
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
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
type t_Vuna_dCompiler_dDriver_dCache_dCachedProgram = C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram of (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDef t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (int)

let v_Vuna_dCompiler_dDriver_dCache_dfixTerm = (fun tbl t -> ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl tbl) t))

let v_Vuna_dCompiler_dDriver_dCache_dfixDef = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__0, dtb__1, dtb__2, dtb__3) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__0, ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__1), dtb__2, dtb__3))
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__4, dtb__5, dtb__6) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__4, ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__5), dtb__6))
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__7, dtb__8, dtb__9, dtb__10) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__7, ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__8), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__9), dtb__10))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixCtor = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__11, dtb__12, dtb__13, dtb__14) -> (C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__11, dtb__12, dtb__13, ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__14)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixData = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__15, dtb__16, dtb__17, dtb__18) -> (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__15, dtb__16, ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixCtor mc0)) dtb__17), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__18)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixClass = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__19, dtb__20, dtb__21, dtb__22) -> (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__19, dtb__20, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (v_Base_dPair_dsecondOf p)))))) dtb__21), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0)) dtb__22)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixInst = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__23, dtb__24, dtb__25, dtb__26) -> (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__23, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (v_Base_dPair_dsecondOf p)))))) dtb__24), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0)) dtb__25), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) dtb__26)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram = (fun prog -> ((fun tbl -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixData tbl)) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixDef tbl)) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)), C_Base_dList_dList_Base_dList_dNil, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm tbl) (v_Base_dPair_dsecondOf p)))))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixInst tbl)) (v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixClass tbl)) (v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)), (v_Vuna_dCompiler_dElab_dTypes_ddtProgNext prog)))) (v_Base_dIntMap_dfromList (v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))))

let v_Vuna_dCompiler_dDriver_dCache_dprogramOfCached = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__27, dtb__28, C_Base_dList_dList_Base_dList_dNil, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf p)))))) dtb__29), dtb__30, dtb__31, dtb__32, dtb__33, (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__34, dtb__35, dtb__36) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__34), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__35), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__36)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__37, dtb__38) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__37), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftAltMetas mc0)) dtb__38)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__39, dtb__40) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__39, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__40)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__41, dtb__42, dtb__43) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__41), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__42), dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__44, dtb__45, dtb__46) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__44, dtb__45, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__46)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__47, dtb__48, dtb__49, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__50), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__51)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__52) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta ((dtb__52 + mc0)))
  | _ -> mc1
))
and v_Vuna_dCompiler_dDriver_dCache_dshiftAltMetas = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__53, dtb__54, dtb__55) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__53, dtb__54, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__55)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__56, dtb__57, dtb__58, dtb__59) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__56, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__57), dtb__58, dtb__59))
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__60, dtb__61, dtb__62) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__60, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__61), dtb__62))
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__63, dtb__64, dtb__65, dtb__66) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__63, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__64), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__65), dtb__66))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__67, dtb__68, dtb__69, dtb__70) -> (C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__67, dtb__68, dtb__69, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__70)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__71, dtb__72, dtb__73, dtb__74) -> (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__71, dtb__72, ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__73), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__74)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__75, dtb__76, dtb__77, dtb__78) -> (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__75, dtb__76, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) (v_Base_dPair_dsecondOf p)))))) dtb__77), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0)) dtb__78)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__79, dtb__80, dtb__81, dtb__82) -> (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__79, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) (v_Base_dPair_dsecondOf p)))))) dtb__80), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0)) dtb__81), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) dtb__82)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__83), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__84), ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dPair_dfirstOf p) + mc0), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) (v_Base_dPair_dsecondOf p)))))) dtb__85), ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMetas mc0) (v_Base_dPair_dsecondOf p)))))) dtb__86), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__87), ((v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__88), (dtb__89 + mc0)))
  | _ -> failwith "DT: impossible branch"
))
