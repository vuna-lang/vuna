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
open Base_dHashMap
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
type t_Vuna_dCompiler_dElab_dRecords_dRecordInfo = C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dElab_dRecords_drecordInfoName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordInfoParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordInfoFields = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordInfoDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordInfoCtor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupRecord = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match dtb__25 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((bi_eq_str dtb__27) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31)))) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (C_Base_dList_dList_Base_dList_dCons (dtb__34, (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__33)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt = (fun d8407 -> (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39) -> (if (((v_Base_dEq_deq d8407) dtb__38) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt d8407) mc0) dtb__37) ((bi_add mc2) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dRecords_dfieldIndex = (fun d8414 -> (fun fname -> (fun fields -> ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt d8414) fname) fields) 0))))

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupProvided = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (if ((bi_eq_str dtb__42) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43)) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided mc0) dtb__41))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__46) dtb__45) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__45)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg = (fun sp -> (fun fname -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": missing field ") fname))))

let v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg = (fun sp -> (fun fname -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": unknown field ") fname))))

let v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg = (fun sp -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ": duplicate field"))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> (match dtb__49 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (if ((v_Base_dList_dmemName dtb__51) mc0) then ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields mc0) dtb__50) else true)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__55, dtb__56) -> (if ((v_Base_dList_dmemName dtb__55) mc1) then (((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc0) mc1) dtb__54) else ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) dtb__55))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (if ((v_Base_dList_dmemName dtb__59) mc0) then (((v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields mc0) dtb__58) mc2) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc2) dtb__59))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__61, dtb__62, dtb__63) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs = (fun params -> (fun sp -> ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (p, sp)))) params)))

let v_Vuna_dCompiler_dElab_dRecords_drecordRetType = (fun dname -> (fun params -> (fun sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dname, sp)), ((v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs params) sp), sp)))))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordArrowType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi ("_", false, (v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__64), (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__65) mc1) mc2), mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__66, dtb__67, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", dtb__70)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (mc1, (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__68) (((v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__66) dtb__67) dtb__70)) dtb__70), (v_Base_dList_dlength dtb__68), dtb__70)), C_Base_dList_dList_Base_dList_dNil)), dtb__69, dtb__70))
  | _ -> mc0
)))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls mc0) dtb__72) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (match dtb__71 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((fun info -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (info, dtb__73)), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData dtb__71) (mc0 dtb__75)), dtb__74))))) (C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__75, dtb__76, ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair) dtb__77), dtb__78, (mc0 dtb__75))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, (C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__74))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel = (fun fuel -> (fun records -> (fun pat -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (pat)) else (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__80))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__81, dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__81, dtb__82))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__83, dtb__84, dtb__85) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub fuel) 1)) records) dtb__84)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__83, p, dtb__85))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__86, dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__86, dtb__87))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__88, dtb__89) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__88, dtb__89))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__90, dtb__91, dtb__92) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun x -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub fuel) 1)) records) x))) dtb__91)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__90, ps, dtb__92))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__93, dtb__94, dtb__95) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (match dtb__96 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__94) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__95))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__99)) dtb__94) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__95) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__99)) dtb__94))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel ((bi_sub fuel) 1)) records) dtb__99) dtb__94) dtb__95)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__101, ps, dtb__95))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__95)) ((bi_concat ": unknown record: ") dtb__93))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__93) records))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel = (fun fuel -> (fun records -> (fun fdefs -> (fun provided -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (match dtb__102 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__104) provided) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel ((bi_sub fuel) 1)) records) dtb__103) provided) sp)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (sp)), ps))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__106) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub fuel) 1)) records) dtb__106)) (fun p2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel ((bi_sub fuel) 1)) records) dtb__103) provided) sp)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) fdefs)))))))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern = (fun records -> (fun pat -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel 64) records) pat)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFields = (fun records -> (fun fdefs -> (fun provided -> (fun sp -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel 64) records) fdefs) provided) sp)))))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo = (fun remaining -> (fun n -> (if ((bi_le_int remaining) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (((bi_concat "vuna_ru") (bi_strFromInt ((bi_sub n) remaining))), ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo ((bi_sub remaining) 1)) n))))))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt = (fun i -> (fun n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo ((bi_sub n) i)) n)))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars = (fun n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt 0) n))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (C_Base_dList_dList_Base_dList_dCons ((match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__109) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> dtb__113
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__111, mc4))
  | _ -> failwith "DT: impossible branch"
), (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__108) mc1) dtb__112) ((bi_add mc3) 1)) mc4)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__116)) mc2) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc3) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__116)) mc2))) else ((fun vars -> ((fun pats -> ((fun args -> ((fun pat -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc1, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__118, mc3)), args, mc3)))), C_Base_dList_dList_Base_dList_dNil)), mc3))))) (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__118, pats, mc3)))) (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__116) mc2) vars) 0) mc3))) ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc3)))) vars))) (v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars (v_Base_dList_dlength dtb__116))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsWithField = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (if ((v_Base_dList_dmemName mc0) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__123)) then (C_Base_dList_dList_Base_dList_dCons (dtb__119, ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__120))) else ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__120))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match dtb__126 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames mc2) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg mc3))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (match dtb__131 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith dtb__130) mc1) mc2) mc3)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__128) " (declared by multiple records)")))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc3) dtb__128)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__128) mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3)) ": record update needs at least one field")))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (match dtb__132 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> (C_Base_dList_dList_Base_dList_dCons ((if ((bi_eq_str dtb__134) mc0) then (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__134, (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__135))) else (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__135)))), ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc0) dtb__133)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140) -> ((fun pats -> ((fun body -> ((fun alt -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc2, (C_Base_dList_dList_Base_dList_dCons (alt, C_Base_dList_dList_Base_dList_dNil)), mc3))) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__140, pats, mc3)), body)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc1, mc3)))) ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc1) dtb__138))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dRecords_dctorName = (fun dname -> dname)

let rec v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__141, dtb__142, dtb__143) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__142) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__141, dtb__143)), mc0)), C_Base_dList_dList_Base_dList_dNil)), mc2, false, dtb__143)))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (mc1, mc2))
))))

let v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__144) dtb__145)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel = (fun fuel -> (fun records -> (fun e -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__146, dtb__147) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__148, dtb__149) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__150, dtb__151) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__152, dtb__153, dtb__154) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__153)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__152, b2, dtb__154))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__155, dtb__156, dtb__157) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__155)) (fun f2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records)) dtb__156)) (fun a2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (f2, a2, dtb__157))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__158, dtb__159, dtb__160, dtb__161) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel ((bi_sub fuel) 1)) records)) dtb__158)) (fun b2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__159)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (b2, body2, dtb__160, dtb__161))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__162, dtb__163) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel ((bi_sub fuel) 1)) records)) dtb__162)) (fun c2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (c2, dtb__163))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__164, dtb__165, dtb__166) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__164)) (fun s2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel ((bi_sub fuel) 1)) records)) dtb__165)) (fun a2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (s2, ((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs s2)) a2), dtb__166))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__167, dtb__168, dtb__169, dtb__170) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__167)) (fun c2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__168)) (fun t2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__169)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__170))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__171, dtb__172, dtb__173) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__171)) (fun b -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (match dtb__175 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (((((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr dtb__174) dtb__172) b) dtb__173)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__173)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__172) " (declared by multiple records)")))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__173)) ((bi_concat ": unknown field ") dtb__172))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__172) records))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__176, dtb__177, dtb__178) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> (match dtb__179 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__177) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__178))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__182)) dtb__177) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__178) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__182)) dtb__177))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel ((bi_sub fuel) 1)) records) dtb__182) dtb__177) dtb__178)) (fun vs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__184, dtb__178)), vs, dtb__178))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__178)) ((bi_concat ": unknown record: ") dtb__176))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__176) records))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__185, dtb__186, dtb__187) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__185)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel ((bi_sub fuel) 1)) records)) dtb__186)) (fun fs -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate records) b) fs) dtb__187)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk (e2))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__188, dtb__189) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel ((bi_sub fuel) 1)) records)) dtb__188)) (fun s2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (s2, dtb__189))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__192)) (fun d2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__193)) (fun c2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__190, dtb__191, d2, c2, dtb__194))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__195, dtb__196, dtb__197) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__195)) (fun v2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__196)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__197))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
)))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel = (fun fuel -> (fun records -> (fun stmt -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match stmt with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__198, dtb__199, dtb__200) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub fuel) 1)) records) dtb__198)) (fun p2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__199)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__200))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__201, dtb__202) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) dtb__201)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__202))))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__203, dtb__204) -> (match dtb__203 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__205) mc3) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg mc4) dtb__205)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__207) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub mc0) 1)) mc1) dtb__207)) (fun v2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel ((bi_sub mc0) 1)) mc1) dtb__204) mc3) mc4)) (fun vs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub mc0) 1)) mc1) dtb__209)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, v2)))))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__210, dtb__211) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub mc0) 1)) mc1) dtb__210)) (fun p2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub mc0) 1)) mc1) dtb__211)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, v2)))))))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel = (fun fuel -> (fun records -> (fun clause -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub fuel) 1)) records)) (v_Base_dPair_dfirstOf clause))) (fun p2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub fuel) 1)) records) (v_Base_dPair_dsecondOf clause))) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel ((bi_sub mc0) 1)) mc1) dtb__212)) (fun p2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel ((bi_sub mc0) 1)) mc1) dtb__213)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2)))))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarAlt = (fun a1 -> (fun a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel 512) a1) a2)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarBind = (fun a1 -> (fun a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel 512) a1) a2)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValue = (fun a1 -> (fun a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel 512) a1) a2)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValues = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel 512) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmt = (fun a1 -> (fun a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel 512) a1) a2)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr = (fun a1 -> (fun a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel 512) a1) a2)))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl = (fun records -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__214, dtb__215, dtb__216, dtb__217) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern records)) dtb__215)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr records) dtb__216)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__214, pats2, body2, dtb__217))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__229, dtb__230, dtb__231, dtb__232) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__233, dtb__234, dtb__235, dtb__236) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) dtb__235)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__233, dtb__234, ms, dtb__236))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__237, dtb__238, dtb__239, dtb__240) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__241, dtb__242, dtb__243) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords = (fun records -> (fun decls -> ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) decls)))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDecls = (fun decls0 -> ((fun split -> ((fun records -> ((fun decls -> ((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords records) decls)) (v_Base_dPair_dsecondOf split))) (v_Base_dPair_dfirstOf split))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) decls0)))
