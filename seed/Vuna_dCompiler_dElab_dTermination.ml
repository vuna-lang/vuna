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
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
let rec v_Vuna_dCompiler_dElab_dTermination_dfunDefsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__3, dtb__4)))), (v_Vuna_dCompiler_dElab_dTermination_dfunDefsOf dtb__1)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dfunDefsOf dtb__1)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dfunMentions = (fun name -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__6, dtb__7) -> ((bi_eq_str dtb__6) name)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__8, dtb__9) -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__10, dtb__11) -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__12, dtb__13, dtb__14) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__13)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__15, dtb__16, dtb__17) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__15) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsList name) dtb__16))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__20) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__21))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__23, dtb__24, dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__24)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__27, dtb__28, dtb__29) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__27) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsAlts name) dtb__28))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__30, dtb__31, dtb__32, dtb__33) -> (if (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__30) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__31)) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__32))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__34, dtb__35, dtb__36) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__34)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__37, dtb__38, dtb__39) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsFields name) dtb__38)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__40, dtb__41, dtb__42) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__40)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__43, dtb__44, dtb__45) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__43)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__46, dtb__47) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsStmts name) dtb__46)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__48, dtb__49, dtb__50) -> ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions name) dtb__48)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dfunMentionsList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions mc0) dtb__51) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsList mc0) dtb__52))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dfunMentionsAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__55, dtb__56) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions mc0) dtb__56) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsAlts mc0) dtb__54))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dfunMentionsFields = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions mc0) dtb__60) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsFields mc0) dtb__58))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dfunMentionsStmts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions mc0) (v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr dtb__61)) then true else ((v_Vuna_dCompiler_dElab_dTermination_dfunMentionsStmts mc0) dtb__62))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_drangeIntGo = (fun n -> (fun i -> (if ((bi_ge_int i) n) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (i, ((v_Vuna_dCompiler_dElab_dTermination_drangeIntGo n) ((bi_add i) 1)))))))

let v_Vuna_dCompiler_dElab_dTermination_drangeInt = (fun n -> ((v_Vuna_dCompiler_dElab_dTermination_drangeIntGo n) 0))

let v_Vuna_dCompiler_dElab_dTermination_dcallIndexes = (fun fname -> (fun fn -> (fun args -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__63, dtb__64) -> (if ((bi_eq_str dtb__63) fname) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTermination_drangeInt (v_Base_dList_dlength args)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dnthExpr = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65)) else ((v_Vuna_dCompiler_dElab_dTermination_dnthExpr dtb__66) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dsubSizeGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__69, dtb__70) -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, dtb__72) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, ((bi_add dtb__72) 1))))), ((v_Vuna_dCompiler_dElab_dTermination_dsubSizeGo mc0) dtb__68)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTermination_dsubSizeGo mc0) dtb__68)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dsubSizeEntries = (fun base -> (fun subpats -> ((v_Vuna_dCompiler_dElab_dTermination_dsubSizeGo base) subpats)))

let rec v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__75, dtb__76) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, (C_Base_dPair_dPair_Base_dPair_dPair (mc1, 0)))), ((v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo dtb__74) ((bi_add mc1) 1))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__77) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("_", (C_Base_dPair_dPair_Base_dPair_dPair (mc1, 0)))), ((v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo dtb__74) ((bi_add mc1) 1))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__78, dtb__79, dtb__80) -> ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("_", (C_Base_dPair_dPair_Base_dPair_dPair (mc1, 0)))), ((v_Vuna_dCompiler_dElab_dTermination_dsubSizeEntries (C_Base_dPair_dPair_Base_dPair_dPair (mc1, 0))) dtb__79)))) ((v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo dtb__74) ((bi_add mc1) 1)))
  | _ -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("_", (C_Base_dPair_dPair_Base_dPair_dPair (mc1, 0)))), ((v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo dtb__74) ((bi_add mc1) 1))))
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dpatSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dpatSizeGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dsizeOfVar = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__81 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (if ((bi_eq_str dtb__83) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84)) else ((v_Vuna_dCompiler_dElab_dTermination_dsizeOfVar mc0) dtb__82))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dargDescendsAt = (fun i -> (fun a -> (fun sizes -> (match a with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__85, dtb__86) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dsizeOfVar dtb__85) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> (match dtb__87 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (if ((bi_eq_int dtb__88) i) then ((bi_gt_int dtb__89) 0) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))))

let rec v_Vuna_dCompiler_dElab_dTermination_danyDescends = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dnthExpr mc1) dtb__90) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTermination_danyDescends dtb__91) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dargDescendsAt dtb__90) dtb__92) mc2) then true else (((v_Vuna_dCompiler_dElab_dTermination_danyDescends dtb__91) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dextendSizes = (fun sizes -> (fun scrut -> (fun pat -> (match scrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__93, dtb__94) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dsizeOfVar dtb__93) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> sizes
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95) -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__96, dtb__97, dtb__98) -> ((v_Base_dList_dappend sizes) ((v_Vuna_dCompiler_dElab_dTermination_dsubSizeEntries dtb__95) dtb__97))
  | _ -> sizes
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> sizes
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody = (fun fname -> (fun sizes -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__99, dtb__100, dtb__101) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dcallIndexes fname) dtb__99) dtb__100) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__99)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> (if (((v_Vuna_dCompiler_dElab_dTermination_danyDescends dtb__102) dtb__100) sizes) then (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermArgs fname) sizes) dtb__100) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: cannot prove termination of ") ((bi_concat fname) " (recursive call does not structurally decrease)")))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__103, dtb__104, dtb__105) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__103)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dTermination_dcheckTermAlts fname) sizes) dtb__103) dtb__104)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__106, dtb__107, dtb__108, dtb__109) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__106)) (fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__107)) (fun _u -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__108)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__110, dtb__111, dtb__112) -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__111)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__113, dtb__114, dtb__115, dtb__116) -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) sizes) dtb__114)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
))))
and v_Vuna_dCompiler_dElab_dTermination_dcheckTermArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__117, dtb__118) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody mc0) mc1) dtb__117)) (fun _u -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermArgs mc0) mc1) dtb__118)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dTermination_dcheckTermAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody mc0) (((v_Vuna_dCompiler_dElab_dTermination_dextendSizes mc1) mc2) dtb__121)) dtb__122)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dTermination_dcheckTermAlts mc0) mc1) mc2) dtb__120)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dcheckTermOne = (fun fname -> (fun pats -> (fun body -> (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermBody fname) (v_Vuna_dCompiler_dElab_dTermination_dpatSizeEntries pats)) body))))

let rec v_Vuna_dCompiler_dElab_dTermination_dcheckTermDeclsGo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (match dtb__126 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, dtb__128) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dfunMentions dtb__125) dtb__128) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTermination_dcheckTermOne dtb__125) dtb__127) dtb__128)) (fun _u -> (v_Vuna_dCompiler_dElab_dTermination_dcheckTermDeclsGo dtb__124))) else (v_Vuna_dCompiler_dElab_dTermination_dcheckTermDeclsGo dtb__124))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls = (fun decls -> (v_Vuna_dCompiler_dElab_dTermination_dcheckTermDeclsGo (v_Vuna_dCompiler_dElab_dTermination_dfunDefsOf decls)))
