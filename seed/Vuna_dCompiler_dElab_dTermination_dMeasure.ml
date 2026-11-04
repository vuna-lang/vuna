open Vuna_runtime
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

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun xs -> (match xs with
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

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun pat -> (fun base -> (fun path -> (fun acc -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__68, dtb__69) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, (C_Base_dPair_dPair_Base_dPair_dPair (base, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dlength path), path)))))), acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__70) -> acc
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__71, dtb__72, dtb__73) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__72) base) path) 0) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__74, dtb__75, dtb__76) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__75) base) path) 0) acc)
  | _ -> acc
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__78) mc1) mc2) ((bi_add mc3) 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__77) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__80) mc1) mc2) ((bi_add mc3) 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__82) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> ((v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__83) mc1) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__84) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (if ((bi_eq_str dtb__87) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__86))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun sizes -> (fun scrut -> (fun pat -> (match scrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__89, dtb__90) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__89) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__96, dtb__97, dtb__98) -> ((v_Base_dList_dappend sizes) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__97) dtb__92) dtb__95) 0) C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__99, dtb__100, dtb__101) -> ((v_Base_dList_dappend sizes) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__100) dtb__92) dtb__95) 0) C_Base_dList_dList_Base_dList_dNil))
  | _ -> sizes
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__91)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> sizes
  | _ -> failwith "DT: impossible branch"
)
  | _ -> sizes
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__102, dtb__103) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun args -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (match dtb__105 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match dtb__107 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__106 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__108, dtb__109) -> (if ((bi_eq_int dtb__108) 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__104) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun args -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (match dtb__111 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__110 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__114, dtb__115) -> (if ((bi_eq_int dtb__114) 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__112) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun args -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (match dtb__117 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119) -> (match dtb__119 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__118 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__120, dtb__121) -> (if ((bi_eq_int dtb__120) 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__116) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__122, dtb__123, dtb__124) -> (match dtb__122 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__125, dtb__126) -> (if ((bi_eq_str dtb__125) "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__123) else (if ((bi_eq_str dtb__125) ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__123) else (if ((bi_eq_str dtb__125) "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__123) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) e))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f -> (fun i -> (fun st -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dfirstOf st)), (v_Base_dPair_dsecondOf st))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f -> (fun i -> (fun st -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf st), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dsecondOf st)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__127) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__128) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (match dtb__130 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__133) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__131) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun v -> (fun pat -> (fun path -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__135, dtb__136) -> (if ((bi_eq_str dtb__135) v) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (path)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__137) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__138, dtb__139, dtb__140) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats v) dtb__139) path) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__141, dtb__142, dtb__143) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields v) dtb__142) path) 0)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__145 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (match dtb__147 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Base_dPair_dsecondOf dtb__144) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__148, dtb__149) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__148) dtb__146) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__150) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf d), dtb__150)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dfirstOf dtb__144))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dsecondOf d)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__151) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> (C_Base_dList_dList_Base_dList_dCons (dtb__153, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__152)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__152)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (match dtb__154 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (if ((bi_eq_str mc0) dtb__156) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__158 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__160, dtb__161) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__160) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__163, dtb__164) -> (match dtb__164 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__165, dtb__166) -> (if ((bi_eq_int dtb__163) mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__159) mc2) mc3) dtb__165) dtb__166) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__159) mc2) ((bi_add mc3) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__162)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__159) mc2) ((bi_add mc3) 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__159) mc2) ((bi_add mc3) 1))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p -> (fun rest -> (fun sizes -> (fun k -> (fun depth -> (fun path -> (if ((bi_gt_int depth) 0) then (match path with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if ((bi_eq_int dtb__167) k) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_add k) 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) ((bi_add k) 1)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x -> (fun p -> (fun caller -> (fun facts -> (fun region -> (if ((v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas caller) p) facts)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun p -> (fun base -> (fun k -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (match base with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__169, dtb__170) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__169) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__172, dtb__173) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (if ((bi_eq_int dtb__172) p) then (if ((bi_eq_int dtb__174) 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__169) p) caller) facts) region) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (4)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__171)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun p -> (fun args -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (match dtb__177 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match dtb__178 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__180, dtb__181) -> (match dtb__179 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_gt_int dtb__180) 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase p) dtb__176) dtb__180) sizes) caller) facts) region) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun p -> (fun a -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__182, dtb__183, dtb__184) -> (match dtb__182 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__185, dtb__186) -> (if ((bi_eq_str dtb__185) "-") then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus p) dtb__183) sizes) caller) facts) region) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) a)))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun p -> (fun cargs -> (fun sizes -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> (match dtb__188 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__187 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__189, dtb__190) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__189) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (match dtb__193 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, dtb__195) -> (if ((bi_eq_int dtb__192) p) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__191)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) cargs))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun p -> (fun a -> (fun sizes -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun region -> (match a with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__196, dtb__197) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__196) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> (match dtb__200 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> (if ((bi_eq_int dtb__199) p) then (if ((bi_gt_int dtb__201) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__198)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__203, dtb__204, dtb__205) -> (match dtb__203 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__206, dtb__207) -> (if ((v_Base_dList_dmemName dtb__206) ctors) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) dtb__204) sizes) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__206) projs) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel p) dtb__204) sizes) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel p) a) sizes) caller) facts) region)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel p) a) sizes) caller) facts) region)
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> (C_Base_dPair_dPair_Base_dPair_dPair (false, (v_Base_dPair_dsecondOf acc))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller -> (fun callee -> (fun m -> (fun acc -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf acc), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (caller, callee)), m)), (v_Base_dPair_dsecondOf acc)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun comp -> (fun fn -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__208, dtb__209) -> (if ((v_Base_dList_dmemName dtb__208) comp) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__208)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__210)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__211) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args -> (fun i -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__212) -> (match dtb__212 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__213, dtb__214) -> ((bi_gt_int dtb__213) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__215, dtb__216) -> (if ((v_Base_dList_dmemName dtb__215) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__215) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__217) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219) -> (match dtb__219 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221) -> (if ((bi_eq_int dtb__220) 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas caller) dtb__218) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__217)
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__222, dtb__223) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__223) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__222) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__224, dtb__225) -> (match dtb__224 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__225) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__227) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__229) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__231) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> (match dtb__232 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, dtb__235) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__233) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__235) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> (match dtb__236 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__238, dtb__239, dtb__240) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__237) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__239) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__241, dtb__242) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__237) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__241) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun names -> (fun caller -> (fun sizes -> (fun facts -> (fun region -> (fun e -> (fun st -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__243, dtb__244, dtb__245) -> (match dtb__243 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__246, dtb__247) -> (if ((v_Base_dList_dmemName dtb__246) names) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs names) caller) sizes) facts) region) dtb__244) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee names) caller) sizes) facts) region) dtb__246) 0) dtb__244) st)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs names) caller) sizes) facts) region) dtb__244) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__243) st)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs names) caller) sizes) facts) region) dtb__244) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__243) st))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__248, dtb__249, dtb__250, dtb__251) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__248) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) (C_Base_dList_dList_Base_dList_dCons (dtb__252, region))) dtb__250) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__249) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__248) st))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__250) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__249) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__248) st))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__253, dtb__254, dtb__255) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts names) caller) sizes) facts) region) dtb__254) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__253) st))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__256, dtb__257, dtb__258) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__257) st)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__259, dtb__260, dtb__261, dtb__262) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__260) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds names) caller) sizes) facts) region) dtb__259) st))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__266) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__265) st))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__268, dtb__269, dtb__270) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__268) st)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__271, dtb__272, dtb__273) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields names) caller) sizes) facts) region) dtb__272) st)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__274, dtb__275, dtb__276) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields names) caller) sizes) facts) region) dtb__275) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__274) st))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__277, dtb__278) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts names) caller) sizes) facts) region) dtb__277) st)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__279, dtb__280, dtb__281) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__280) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk names) caller) sizes) facts) region) dtb__279) st))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__282, dtb__283) -> st
  | _ -> st
))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__284, dtb__285) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__285) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__284)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__284)))
  | C_Base_dList_dList_Base_dList_dNil -> mc5
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__286, dtb__287) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__287) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (v_Base_dPair_dfirstOf dtb__286)) (v_Base_dPair_dsecondOf dtb__286)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs -> (fun fuel -> (fun facts -> (if ((bi_le_int fuel) 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs -> (fun fuel -> (fun facts -> ((fun names -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) ((bi_sub fuel) 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter (v_Base_dPair_dfirstOf scan)) (v_Base_dPair_dsecondOf scan)))) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs names) defs) facts) defs) (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs)))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p -> (fun args -> (fun sizes -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__288) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__288) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot n))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "map") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "traverse") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "concatMap") then true else (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "mapMaybe") then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n)) "filter"))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun sizes -> (fun lst -> (fun v -> (match lst with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__289, dtb__290) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__289) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__291) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293) -> (match dtb__293 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, (C_Base_dPair_dPair_Base_dPair_dPair (((bi_add dtb__294) 1), ((v_Base_dList_dappend dtb__295) (C_Base_dList_dList_Base_dList_dCons (0, C_Base_dList_dList_Base_dList_dNil))))))))), sizes))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__291)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> sizes
  | _ -> failwith "DT: impossible branch"
)
  | _ -> sizes
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__296, dtb__297) -> (match dtb__296 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (match dtb__298 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__300, dtb__301) -> (if ((bi_eq_str dtb__300) mc0) then (if ((bi_eq_str dtb__301) mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__297) true) (if ((bi_eq_int dtb__299) 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__297) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__297) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f -> (fun g -> (fun edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__302, dtb__303) -> (match dtb__302 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (match dtb__304 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__306, dtb__307) -> (if ((bi_eq_str dtb__306) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__307, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__303))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__303))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f -> (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__308, dtb__309) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__308) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__309) else (C_Base_dList_dList_Base_dList_dCons (dtb__308, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__309))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp -> (fun edges -> (fun f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel -> (fun comp -> (fun edges -> (fun start -> (fun frontier -> (fun visited -> (if ((bi_le_int fuel) 0) then false else (match frontier with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__310, dtb__311) -> (if ((bi_eq_str dtb__310) start) then true else (if ((v_Base_dList_dmemName dtb__310) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel ((bi_sub fuel) 1)) comp) edges) start) dtb__311) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel ((bi_sub fuel) 1)) comp) edges) start) ((v_Base_dList_dappend dtb__311) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__310))) (C_Base_dList_dList_Base_dList_dCons (dtb__310, visited)))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp -> (fun edges -> (fun start -> (fun frontier -> (fun visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__312, dtb__313) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__312) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__312)) (C_Base_dList_dList_Base_dList_dCons (dtb__312, C_Base_dList_dList_Base_dList_dNil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__313))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp -> (fun edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (if ((bi_eq_int m) 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__314, dtb__315) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__314) then (C_Base_dList_dList_Base_dList_dCons (dtb__314, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__315))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__315))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
