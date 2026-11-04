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
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun a -> (fun b -> (if ((bi_ge_int a) b) then a else b)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((bi_eq_int mc0) dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if ((v_Base_dList_dmemName dtb__4) dtb__5) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5) else (C_Base_dList_dList_Base_dList_dCons (dtb__4, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match dtb__7 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__6
  | _ -> ((bi_concat dtb__6) ((bi_concat ", ") (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__7)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if ((bi_eq_str mc0) dtb__10) then (if ((bi_eq_int mc1) dtb__11) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f -> (fun i -> (fun facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (f, i)), facts))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__14) dtb__15) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__13) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun a -> (fun b -> (if ((bi_eq_int (v_Base_dList_dlength a)) (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (match dtb__16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__18) dtb__19) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__17) mc1) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19)), ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__17) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__21) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__22) dtb__23) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (match dtb__24 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__26, dtb__27, dtb__28, dtb__29) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28)))), (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__25)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__25)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> (if ((bi_eq_str dtb__32) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__33)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (if ((bi_eq_str dtb__36) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, mc1)), dtb__35)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37)), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__40, dtb__41) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup dtb__40) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo dtb__39) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup dtb__40) ((v_Base_dList_dappend dtb__42) (C_Base_dList_dList_Base_dList_dCons (dtb__41, C_Base_dList_dList_Base_dList_dNil)))) mc1))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo dtb__39) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__40, (C_Base_dList_dList_Base_dList_dCons (dtb__41, C_Base_dList_dList_Base_dList_dNil)))), mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun decls -> (v_Base_dList_dreverse ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls)) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun defs -> ((v_Base_dList_dmap v_Base_dPair_dfirstOf) defs))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (match dtb__43 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (if ((bi_eq_str dtb__45) mc0) then dtb__46 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__44))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Base_dList_dlength (v_Base_dPair_dfirstOf dtb__47))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__48))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__49) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__50) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__51, dtb__52, dtb__53, dtb__54) -> dtb__51
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__55 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__60)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__56))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (C_Base_dList_dList_Base_dList_dCons (dtb__63, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__56)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__56)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__68, dtb__69, dtb__70) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__69) mc1) mc2) 0) mc3)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__71, dtb__72, dtb__73) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__72) mc1) mc2) 0) mc3)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__74) -> mc3
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__75, dtb__76, dtb__77) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__76) mc1) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dlength mc2), mc2)))))), mc3)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__78, dtb__79) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dlength mc2), mc2)))))), mc3))
  | _ -> mc3
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__81) mc1) mc2) ((bi_add mc3) 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__80) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match dtb__82 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__83) mc1) mc2) ((bi_add mc3) 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__85) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> ((v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__86) mc1) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__87) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (match dtb__88 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (if ((bi_eq_str dtb__90) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__89))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__92, dtb__93) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__92) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__94) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__99, dtb__100, dtb__101) -> ((v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__100) dtb__95) dtb__98) 0) C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__102, dtb__103, dtb__104) -> ((v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__103) dtb__95) dtb__98) 0) C_Base_dList_dList_Base_dList_dNil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__94)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__105, dtb__106) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__108 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__109 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__111, dtb__112) -> (if ((bi_eq_int dtb__111) 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__107) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__113 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__117, dtb__118) -> (if ((bi_eq_int dtb__117) 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__115) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (match dtb__120 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__121 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__123, dtb__124) -> (if ((bi_eq_int dtb__123) 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__119) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

<<<<<<< HEAD
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__125, dtb__126, dtb__127) -> (match dtb__125 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__128, dtb__129) -> (if ((bi_eq_str dtb__128) "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__126) else (if ((bi_eq_str dtb__128) ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__126) else (if ((bi_eq_str dtb__128) "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__126) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
=======
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__122, dtb__123, dtb__124) -> (match dtb__122 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__125, dtb__126) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__123) else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__123) else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__123) else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__123) else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__123) else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__125)) "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__123) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))
>>>>>>> 92571c3 (feat(m31): 运算符改为 Eq/Ord 方法别名，trait 声明与实例分离)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f -> (fun i -> (fun st -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dfirstOf st)), (v_Base_dPair_dsecondOf st))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f -> (fun i -> (fun st -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf st), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dsecondOf st)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__130) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__131) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__133 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__135, dtb__136) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__136) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__134) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__138, dtb__139, dtb__140) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__139) mc2) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__141, dtb__142, dtb__143) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__142) mc2) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__144) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__145, dtb__146, dtb__147) -> (if ((bi_eq_str dtb__145) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__146) mc2))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__148, dtb__149) -> (if ((bi_eq_str dtb__148) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__151 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (match dtb__153 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Base_dPair_dsecondOf dtb__150) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__154, dtb__155) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__154) dtb__152) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__156) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf d), dtb__156)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dfirstOf dtb__150))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dsecondOf d)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__157) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (C_Base_dList_dList_Base_dList_dCons (dtb__159, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__158)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__158)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (match dtb__160 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163) -> (if ((bi_eq_str mc0) dtb__162) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__161))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__164 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__166, dtb__167) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__166) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__168) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> (match dtb__170 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> (if ((bi_eq_int dtb__169) mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__165) mc2) mc3) dtb__171) dtb__172) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__165) mc2) ((bi_add mc3) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__168)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__165) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__165) mc2) ((bi_add mc3) 1))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p -> (fun rest -> (fun sizes -> (fun k -> (fun depth -> (fun path -> (if ((bi_gt_int depth) 0) then (match path with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (if ((bi_eq_int dtb__173) k) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_add k) 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x -> (fun p -> (fun caller -> (fun facts -> (fun region -> (if ((v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas caller) p) facts)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__175, dtb__176) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__175) mc3) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (if ((bi_eq_int dtb__178) mc0) then (if ((bi_eq_int dtb__180) 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__175) mc0) mc4) mc5) mc6) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (4)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__177)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match dtb__183 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match dtb__184 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__186, dtb__187) -> (match dtb__185 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_gt_int dtb__186) 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__182) dtb__186) mc2) mc3) mc4) mc5) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__188, dtb__189, dtb__190) -> (match dtb__188 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__191, dtb__192) -> (if ((bi_eq_str dtb__191) "-") then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__189) mc2) mc3) mc4) mc5) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (match dtb__194 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__193 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__195, dtb__196) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__195) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (match dtb__199 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__200, dtb__201) -> (if ((bi_eq_int dtb__198) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__197)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__202, dtb__203, dtb__204) -> (match dtb__202 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__205, dtb__206) -> (if ((v_Base_dList_dmemName dtb__205) mc3) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__203) mc2) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__205) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__203) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__207, dtb__208) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__207) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__209) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__210, dtb__211) -> (match dtb__211 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (if ((bi_eq_int dtb__210) mc0) then (if ((bi_gt_int dtb__212) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__209)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> (C_Base_dPair_dPair_Base_dPair_dPair (false, (v_Base_dPair_dsecondOf acc))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller -> (fun callee -> (fun m -> (fun acc -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf acc), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (caller, callee)), m)), (v_Base_dPair_dsecondOf acc)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__214, dtb__215) -> (if ((v_Base_dList_dmemName dtb__214) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__214)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__217) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args -> (fun i -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__218) -> (match dtb__218 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__219, dtb__220) -> ((bi_gt_int dtb__219) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__221, dtb__222) -> (if ((v_Base_dList_dmemName dtb__221) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__221) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__224, dtb__225) -> (match dtb__225 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (if ((bi_eq_int dtb__226) 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas caller) dtb__224) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__223)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun names -> (fun caller -> (fun sizes -> (fun facts -> (fun region -> (fun g -> (fun remaining -> (fun args -> (fun st -> (if ((bi_le_int remaining) 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) ((bi_sub remaining) 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((bi_sub (v_Base_dList_dlength args)) remaining))))))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun names -> (fun caller -> (fun sizes -> (fun facts -> (fun region -> (fun g -> (fun i -> (fun args -> (fun st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) ((bi_sub (v_Base_dList_dlength args)) i)) args) st))))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__229) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__228) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__231) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__231) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__233) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (match dtb__234 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__236, dtb__237) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__235) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__237) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__239) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__241) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (match dtb__242 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__244, dtb__245, dtb__246) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__243) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__245) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__247, dtb__248) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__243) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__247) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__249, dtb__250) -> mc6
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__251, dtb__252, dtb__253) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__252) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__251) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__254, dtb__255) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__254) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__256, dtb__257, dtb__258) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__257) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__256) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__259, dtb__260, dtb__261) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__260) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__262, dtb__263, dtb__264) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__262) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__268) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__267) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__270, dtb__271, dtb__272, dtb__273) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__271) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__270) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__274, dtb__275, dtb__276) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__275) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__277, dtb__278, dtb__279) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__278) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__277) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__280, dtb__281, dtb__282, dtb__283) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__280) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__284) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons (dtb__284, mc4))) dtb__282) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__281) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__280) mc6))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__282) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__281) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__280) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__285, dtb__286, dtb__287) -> (match dtb__285 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__288, dtb__289) -> (if ((v_Base_dList_dmemName dtb__288) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__286) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__288) 0) dtb__286) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__286) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__285) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__286) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__285) mc6))
)
  | _ -> mc6
))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__291) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__291) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__290)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__290)))
  | C_Base_dList_dList_Base_dList_dNil -> mc5
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__292, dtb__293) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__293) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (v_Base_dPair_dfirstOf dtb__292)) (v_Base_dPair_dsecondOf dtb__292)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs -> (fun fuel -> (fun facts -> (if ((bi_le_int fuel) 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs -> (fun fuel -> (fun facts -> ((fun names -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) ((bi_sub fuel) 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter (v_Base_dPair_dfirstOf scan)) (v_Base_dPair_dsecondOf scan)))) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs names) defs) facts) defs) (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs)))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p -> (fun args -> (fun sizes -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__294) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__294) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot n))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "map") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "traverse") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "concatMap") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "mapMaybe") then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "filter"))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__295, dtb__296) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__295) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__297) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (match dtb__299 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__300, dtb__301) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, (C_Base_dPair_dPair_Base_dPair_dPair (((bi_add dtb__300) 1), ((v_Base_dList_dappend dtb__301) (C_Base_dList_dList_Base_dList_dCons (0, C_Base_dList_dList_Base_dList_dNil))))))))), mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__297)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__302, dtb__303) -> (match dtb__302 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (match dtb__304 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__306, dtb__307) -> (if ((bi_eq_str dtb__306) mc0) then (if ((bi_eq_str dtb__307) mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__303) true) (if ((bi_eq_int dtb__305) 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__303) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__303) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f -> (fun g -> (fun edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__308, dtb__309) -> (match dtb__308 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__310, dtb__311) -> (match dtb__310 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__312, dtb__313) -> (if ((bi_eq_str dtb__312) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__313, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__309))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__309))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f -> (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__314, dtb__315) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__314) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__315) else (C_Base_dList_dList_Base_dList_dCons (dtb__314, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__315))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp -> (fun edges -> (fun f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel -> (fun comp -> (fun edges -> (fun start -> (fun frontier -> (fun visited -> (if ((bi_le_int fuel) 0) then false else (match frontier with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__316, dtb__317) -> (if ((bi_eq_str dtb__316) start) then true else (if ((v_Base_dList_dmemName dtb__316) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel ((bi_sub fuel) 1)) comp) edges) start) dtb__317) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel ((bi_sub fuel) 1)) comp) edges) start) ((v_Base_dList_dappend dtb__317) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__316))) (C_Base_dList_dList_Base_dList_dCons (dtb__316, visited)))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp -> (fun edges -> (fun start -> (fun frontier -> (fun visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__318, dtb__319) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__318) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__318)) (C_Base_dList_dList_Base_dList_dCons (dtb__318, C_Base_dList_dList_Base_dList_dNil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__319))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp -> (fun edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (if ((bi_eq_int m) 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__320, dtb__321) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__320) then (C_Base_dList_dList_Base_dList_dCons (dtb__320, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__321))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__321))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
