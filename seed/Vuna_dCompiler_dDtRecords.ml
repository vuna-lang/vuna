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
type t_Vuna_dCompiler_dDtRecords_dRecordInfo = C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dDtRecords_drecordInfoName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_drecordInfoParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_drecordInfoFields = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_drecordInfoDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_drecordInfoCtor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDtRecords_dlookupRecord = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__25 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((bi_eq_str dtb__27) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31)))) else ((v_Vuna_dCompiler_dDtRecords_dlookupRecord mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtRecords_dfieldNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (C_Base_dList_dList_Cons (dtb__34, (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__33)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDtRecords_dfieldIndexAt = (fun d4098 -> (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39) -> (if (((v_Base_dEq_deq d4098) dtb__38) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else ((((v_Vuna_dCompiler_dDtRecords_dfieldIndexAt d4098) mc0) dtb__37) ((bi_add mc2) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDtRecords_dfieldIndex = (fun d4105 -> (fun fname -> (fun fields -> ((((v_Vuna_dCompiler_dDtRecords_dfieldIndexAt d4105) fname) fields) 0))))

let rec v_Vuna_dCompiler_dDtRecords_dlookupProvided = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (if ((bi_eq_str dtb__42) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43)) else ((v_Vuna_dCompiler_dDtRecords_dlookupProvided mc0) dtb__41))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (match ((v_Vuna_dCompiler_dDtRecords_dlookupProvided dtb__46) dtb__45) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames dtb__45)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_dmissingFieldMsg = (fun sp -> (fun fname -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": missing field ") fname))))

let v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg = (fun sp -> (fun fname -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": unknown field ") fname))))

let v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg = (fun sp -> ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ": duplicate field"))

let rec v_Vuna_dCompiler_dDtRecords_dhasUnknownFields = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (match dtb__49 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (if ((v_Base_dList_dmemName dtb__51) mc0) then ((v_Vuna_dCompiler_dDtRecords_dhasUnknownFields mc0) dtb__50) else true)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__55, dtb__56) -> (if ((v_Base_dList_dmemName dtb__55) mc1) then (((v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg mc0) mc1) dtb__54) else ((v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg mc0) dtb__55))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDtRecords_dcheckProvidedFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (if ((v_Base_dList_dmemName dtb__59) mc0) then (((v_Vuna_dCompiler_dDtRecords_dcheckProvidedFields mc0) dtb__58) mc2) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg mc2) dtb__59))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtRecords_drecordFieldPair = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (dtb__61, dtb__62, dtb__63) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtRecords_drecordParamVarExprs = (fun params -> (fun sp -> ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (p, sp)))) params)))

let v_Vuna_dCompiler_dDtRecords_drecordRetType = (fun dname -> (fun params -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dname, sp)), ((v_Vuna_dCompiler_dDtRecords_drecordParamVarExprs params) sp), sp)))))

let rec v_Vuna_dCompiler_dDtRecords_drecordArrowType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi ("_", false, (v_Vuna_dCompiler_dAst_dfieldType dtb__64), (((v_Vuna_dCompiler_dDtRecords_drecordArrowType dtb__65) mc1) mc2), mc2))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtRecords_drecordDeclToData = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__66, dtb__67, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", dtb__70)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (mc1, (((v_Vuna_dCompiler_dDtRecords_drecordArrowType dtb__68) (((v_Vuna_dCompiler_dDtRecords_drecordRetType dtb__66) dtb__67) dtb__70)) dtb__70), (v_Base_dList_dlength dtb__68), dtb__70)), C_Base_dList_dList_Nil)), dtb__69, dtb__70))
  | _ -> mc0
)))

let rec v_Vuna_dCompiler_dDtRecords_drecordsOfDecls = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match ((v_Vuna_dCompiler_dDtRecords_drecordsOfDecls mc0) dtb__72) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (match dtb__71 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((fun info -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (info, dtb__73)), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtRecords_drecordDeclToData dtb__71) (mc0 dtb__75)), dtb__74))))) (C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__75, dtb__76, ((v_Base_dList_dmap v_Vuna_dCompiler_dDtRecords_drecordFieldPair) dtb__77), dtb__78, (mc0 dtb__75))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, (C_Base_dList_dList_Cons (dtb__71, dtb__74))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtRecords_ddesugarPattern = (fun records -> (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__80))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__81, dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__81, dtb__82))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__83, dtb__84) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__83, dtb__84))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__85, dtb__86) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__85, dtb__86))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__87, dtb__88, dtb__89) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records)) dtb__88)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__87, ps, dtb__89))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (dtb__90, dtb__91, dtb__92) -> (match ((v_Vuna_dCompiler_dDtRecords_dlookupRecord dtb__90) records) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__92)) ((bi_concat ": unknown record: ") dtb__90))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (match dtb__93 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> (if (v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames dtb__91) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg dtb__92))) else (if ((v_Vuna_dCompiler_dDtRecords_dhasUnknownFields (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__96)) dtb__91) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg dtb__92) (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__96)) dtb__91))) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields records) dtb__96) dtb__91) dtb__92)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__98, ps, dtb__92))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (match ((v_Vuna_dCompiler_dDtRecords_dlookupProvided dtb__101) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields mc0) dtb__100) mc2) mc3)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (mc3)), ps))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarPattern mc0) dtb__103)) (fun p2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields mc0) dtb__100) mc2) mc3)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDtRecords_drecUpdateVarsAt = (fun i -> (fun n -> (if ((bi_ge_int i) n) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (((bi_concat "vuna_ru") (bi_strFromInt i)), ((v_Vuna_dCompiler_dDtRecords_drecUpdateVarsAt ((bi_add i) 1)) n))))))

let v_Vuna_dCompiler_dDtRecords_drecUpdateVars = (fun n -> ((v_Vuna_dCompiler_dDtRecords_drecUpdateVarsAt 0) n))

let rec v_Vuna_dCompiler_dDtRecords_drecUpdateArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__104 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (C_Base_dList_dList_Cons ((match ((v_Vuna_dCompiler_dDtRecords_dlookupProvided dtb__106) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> dtb__110
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__108, mc4))
  | _ -> failwith "DT: impossible branch"
), (((((v_Vuna_dCompiler_dDtRecords_drecUpdateArgs dtb__105) mc1) dtb__109) ((bi_add mc3) 1)) mc4)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc2 with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dDtRecords_ddesugarRecUpdateWith = (fun info -> (fun base -> (fun fields -> (fun sp -> (match info with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> (if ((v_Vuna_dCompiler_dDtRecords_dhasUnknownFields (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__113)) fields) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg sp) (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__113)) fields))) else ((fun vars -> ((fun pats -> ((fun args -> ((fun pat -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (base, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__115, sp)), args, sp)))), C_Base_dList_dList_Nil)), sp))))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__115, pats, sp)))) (((((v_Vuna_dCompiler_dDtRecords_drecUpdateArgs dtb__113) fields) vars) 0) sp))) ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, sp)))) vars))) (v_Vuna_dCompiler_dDtRecords_drecUpdateVars (v_Base_dList_dlength dtb__113))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDtRecords_drecordsWithField = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__116 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if ((v_Base_dList_dmemName mc0) (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__120)) then (C_Base_dList_dList_Cons (dtb__116, ((v_Vuna_dCompiler_dDtRecords_drecordsWithField mc0) dtb__117))) else ((v_Vuna_dCompiler_dDtRecords_drecordsWithField mc0) dtb__117))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtRecords_ddesugarRecUpdate = (fun records -> (fun base -> (fun fields -> (fun sp -> (match fields with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ": record update needs at least one field")))
  | C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (if (v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames fields) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg sp))) else (match ((v_Vuna_dCompiler_dDtRecords_drecordsWithField dtb__125) records) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg sp) dtb__125)))
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecUpdateWith dtb__127) base) fields) sp)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__125) " (declared by multiple records)")))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__125) " (declared by multiple records)")))))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDtRecords_dfieldAccessPats = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__129 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__131, dtb__132) -> (C_Base_dList_dList_Cons ((if ((bi_eq_str dtb__131) mc0) then (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__131, (v_Vuna_dCompiler_dAst_dexprSpan dtb__132))) else (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild ((v_Vuna_dCompiler_dAst_dexprSpan dtb__132)))), ((v_Vuna_dCompiler_dDtRecords_dfieldAccessPats mc0) dtb__130)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtRecords_dfieldAccessExpr = (fun info -> (fun fname -> (fun b -> (fun sp -> (match info with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> ((fun pats -> ((fun body -> ((fun alt -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (b, (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil)), sp))) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__137, pats, sp)), body)))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (fname, sp)))) ((v_Vuna_dCompiler_dDtRecords_dfieldAccessPats fname) dtb__135))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDtRecords_ddesugarExpr = (fun records -> (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__138, dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__140, dtb__141) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__142, dtb__143) -> (C_Base_dResult_dResult_Base_dResult_dOk (e))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__144, dtb__145, dtb__146) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__145)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__144, b2, dtb__146))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__147, dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__147)) (fun f2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records)) dtb__148)) (fun a2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (f2, a2, dtb__149))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__150, dtb__151, dtb__152, dtb__153) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarBind records)) dtb__150)) (fun b2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__151)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (b2, body2, dtb__152, dtb__153))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__154, dtb__155, dtb__156) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__154)) (fun s2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarAlt records)) dtb__155)) (fun a2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (s2, a2, dtb__156))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__157, dtb__158, dtb__159, dtb__160) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__157)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__158)) (fun t2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__159)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, dtb__160))))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__161, dtb__162, dtb__163) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__161)) (fun b -> (match ((v_Vuna_dCompiler_dDtRecords_drecordsWithField dtb__162) records) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__163)) ((bi_concat ": unknown field ") dtb__162))))
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__165 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (((((v_Vuna_dCompiler_dDtRecords_dfieldAccessExpr dtb__164) dtb__162) b) dtb__163)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__163)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__162) " (declared by multiple records)")))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__163)) ((bi_concat ": ambiguous field ") ((bi_concat dtb__162) " (declared by multiple records)")))))
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__166, dtb__167, dtb__168) -> (match ((v_Vuna_dCompiler_dDtRecords_dlookupRecord dtb__166) records) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__168)) ((bi_concat ": unknown record: ") dtb__166))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> (match dtb__169 with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo_Vuna_dCompiler_dDtRecords_dRecordInfo (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> (if (v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames dtb__167) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg dtb__168))) else (if ((v_Vuna_dCompiler_dDtRecords_dhasUnknownFields (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__172)) dtb__167) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg dtb__168) (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf dtb__172)) dtb__167))) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues records) dtb__172) dtb__167) dtb__168)) (fun vs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__174, dtb__168)), vs, dtb__168))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__175, dtb__176, dtb__177) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__175)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarFieldValue records)) dtb__176)) (fun fs -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecUpdate records) b) fs) dtb__177)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk (e2))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__178, dtb__179, dtb__180) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__178)) (fun m2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (m2, dtb__179, dtb__180))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__183)) (fun d2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__184)) (fun c2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__181, dtb__182, d2, c2, dtb__185))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__186, dtb__187, dtb__188) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__186)) (fun v2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__187)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (v2, t2, dtb__188))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (match ((v_Vuna_dCompiler_dDtRecords_dlookupProvided dtb__191) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDtRecords_dmissingFieldMsg mc3) dtb__191)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr mc0) dtb__193)) (fun v2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues mc0) dtb__190) mc2) mc3)) (fun vs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dDtRecords_ddesugarFieldValue = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, dtb__195) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr mc0) dtb__195)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, v2))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dDtRecords_ddesugarBind = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarPattern mc0) dtb__196)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr mc0) dtb__197)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, v2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dDtRecords_ddesugarAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarPattern mc0) dtb__198)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr mc0) dtb__199)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl = (fun records -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__200, dtb__201, dtb__202, dtb__203) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records)) dtb__201)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) dtb__202)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__200, pats2, body2, dtb__203))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__215, dtb__216, dtb__217, dtb__218) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl records)) dtb__222)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__219, dtb__220, dtb__221, ms, dtb__223))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__224, dtb__225, dtb__226) -> (C_Base_dResult_dResult_Base_dResult_dOk (d))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtRecords_ddesugarRecords = (fun records -> (fun decls -> ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl records)) decls)))

let v_Vuna_dCompiler_dDtRecords_dctorName = (fun dname -> dname)

let v_Vuna_dCompiler_dDtRecords_dprepareDecls = (fun decls0 -> ((fun split -> ((fun records -> ((fun decls -> ((v_Vuna_dCompiler_dDtRecords_ddesugarRecords records) decls)) (v_Base_dPair_dsecondOf split))) (v_Base_dPair_dfirstOf split))) ((v_Vuna_dCompiler_dDtRecords_drecordsOfDecls v_Vuna_dCompiler_dDtRecords_dctorName) decls0)))
