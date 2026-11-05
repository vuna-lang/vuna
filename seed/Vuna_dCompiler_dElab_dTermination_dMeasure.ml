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
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

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
  | _ -> (String.concat "" [dtb__6; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__7)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if (mc0 = dtb__10) then (if (mc1 = dtb__11) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> (match ((v_Base_dHashMap_dlookup dtb__14) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) (((v_Base_dHashMap_dinsert dtb__14) (C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16))) mc1))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) (((v_Base_dHashMap_dinsert dtb__14) (C_Base_dList_dList_Base_dList_dCons (dtb__15, C_Base_dList_dList_Base_dList_dNil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf = (fun xs -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo xs) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (if (mc0 = dtb__17) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__18))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl = (fun f i tbl -> (match ((v_Base_dHashMap_dlookup f) tbl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt i) dtb__19)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f i facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (f, i)), facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__22) dtb__23) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__21) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun a b -> (if ((v_Base_dList_dlength a) = (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__26) dtb__27) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27)), ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (match dtb__28 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__29) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__30) dtb__31) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__34) dtb__35) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35)), ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__38) dtb__39) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl dtb__37) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl = (fun a b -> (if (if ((v_Base_dList_dlength a) = (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl a) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf b)) else false) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl b) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf a)) else false))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl = (fun facts fresh -> ((v_Base_dList_dappend fresh) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl facts) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf fresh))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__42, dtb__43, dtb__44, dtb__45) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44)))), (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match dtb__46 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (if (dtb__48 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (if (dtb__52 = mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, mc1)), dtb__51)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53)), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__51))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (match ((v_Base_dHashMap_dlookup dtb__56) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (((v_Base_dHashMap_dinsert dtb__56) (C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58))) mc0)) mc1) dtb__55)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (((v_Base_dHashMap_dinsert dtb__56) (C_Base_dList_dList_Base_dList_dCons (dtb__57, C_Base_dList_dList_Base_dList_dNil))) mc0)) (C_Base_dList_dList_Base_dList_dCons (dtb__56, mc1))) dtb__55)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun decls -> ((fun stepped -> ((fun tbl -> ((fun order -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (match ((v_Base_dHashMap_dlookup n) tbl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> (v_Base_dList_dreverse dtb__59)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))) (v_Base_dList_dreverse order))) (v_Base_dPair_dsecondOf stepped))) (v_Base_dPair_dfirstOf stepped))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun defs -> ((v_Base_dList_dmap v_Base_dPair_dfirstOf) defs))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (if (dtb__62 = mc0) then dtb__63 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl = (fun name tbl -> (match ((v_Base_dHashMap_dlookup name) tbl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64) -> dtb__64
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Base_dList_dlength (v_Base_dPair_dfirstOf dtb__65))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__66))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__67) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__68) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__78)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (C_Base_dList_dList_Base_dList_dCons (dtb__81, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__86, dtb__87, dtb__88) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__87) mc1) mc2) 0) mc3)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__89, dtb__90, dtb__91) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__90) mc1) mc2) 0) mc3)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__92) -> mc3
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__93, dtb__94) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dlength mc2), mc2)))))), mc3))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__95, dtb__96, dtb__97) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__96) mc1) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dlength mc2), mc2)))))), mc3)))
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__99) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__98) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__101) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__103) mc1) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> ((v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__104) mc1) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__105) (mc1 + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match dtb__106 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (if (dtb__108 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__109)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__110, dtb__111) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__110) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__117, dtb__118, dtb__119) -> ((v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__118) dtb__113) dtb__116) 0) C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__120, dtb__121, dtb__122) -> ((v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__121) dtb__113) dtb__116) 0) C_Base_dList_dList_Base_dList_dNil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__112)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__125, dtb__126) -> (match dtb__126 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (match dtb__128 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__127 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__129, dtb__130) -> (if (dtb__129 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__125) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__134 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__131 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__135, dtb__136) -> (if (dtb__135 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__133) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (match dtb__138 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__139 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__141, dtb__142) -> (if (dtb__141 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__137) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__143, dtb__144, dtb__145) -> (match dtb__143 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__144) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__144) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__144) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__144) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__144) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__146) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__144) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) e))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f i st -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dfirstOf st)), (v_Base_dPair_dsecondOf st))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f i st -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf st), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (v_Base_dPair_dsecondOf st)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__148) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__149) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match dtb__151 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__153, dtb__154) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__154) ((v_Base_dList_dappend mc2) (C_Base_dList_dList_Base_dList_dCons (mc3, C_Base_dList_dList_Base_dList_dNil)))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__152) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__156, dtb__157, dtb__158) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__157) mc2) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__159, dtb__160, dtb__161) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__160) mc2) 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__162) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__163, dtb__164) -> (if (dtb__163 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (match dtb__166 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__168 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Base_dPair_dsecondOf dtb__165) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__169, dtb__170) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__169) dtb__167) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__171) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf d), dtb__171)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dfirstOf dtb__165))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Base_dPair_dsecondOf d)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__172) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (C_Base_dList_dList_Base_dList_dCons (dtb__174, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__173)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__173)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (match dtb__175 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__177, dtb__178) -> (if (mc0 = dtb__177) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match dtb__179 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__181, dtb__182) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__181) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (match dtb__185 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (if (dtb__184 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__180) mc2) mc3) dtb__186) dtb__187) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__180) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__183)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__180) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__180) mc2) (mc3 + 1))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p rest sizes k depth path -> (if (depth > 0) then (match path with
  | C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (if (dtb__188 = k) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x p caller facts region -> (if ((v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__190, dtb__191) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__190) mc3) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> (match dtb__194 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (if (dtb__193 = mc0) then (if (dtb__195 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__190) mc0) mc4) mc5) mc6) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (4)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__192)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__197, dtb__198) -> (match dtb__198 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match dtb__199 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__201, dtb__202) -> (match dtb__200 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (dtb__201 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__197) dtb__201) mc2) mc3) mc4) mc5) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__203, dtb__204, dtb__205) -> (match dtb__203 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__206, dtb__207) -> (if (dtb__206 = "-") then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__204) mc2) mc3) mc4) mc5) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__208, dtb__209) -> (match dtb__209 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__208 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__210, dtb__211) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__210) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__212) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> (match dtb__214 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__216) -> (if (dtb__213 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__212)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__220, dtb__221) -> (if ((v_Base_dList_dmemName dtb__220) mc3) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__218) mc2) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__220) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__218) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__222, dtb__223) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__222) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__225, dtb__226) -> (match dtb__226 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (if (dtb__225 = mc0) then (if (dtb__227 > 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__224)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> (C_Base_dPair_dPair_Base_dPair_dPair (false, (v_Base_dPair_dsecondOf acc))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller callee m acc -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf acc), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (caller, callee)), m)), (v_Base_dPair_dsecondOf acc))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__229, dtb__230) -> (if ((v_Base_dList_dmemName dtb__229) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__229)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (if (mc1 <= 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__231)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__232) (mc1 - 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args i sizes caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__233) -> (match dtb__233 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__234, dtb__235) -> (dtb__234 > 0)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__236, dtb__237) -> (if ((v_Base_dList_dmemName dtb__236) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__236) sizes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__238) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__240) -> (match dtb__240 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (if (dtb__241 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__239) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__238)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun names caller sizes facts region g remaining args st -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((v_Base_dList_dlength args) - remaining))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun names caller sizes facts region g i args st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) ((v_Base_dList_dlength args) - i)) args) st))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__244) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__243) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__245, dtb__246) -> (match dtb__245 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__246) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__248) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (match dtb__249 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__250) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__252) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__253, dtb__254) -> (match dtb__253 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__254) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__256) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__257, dtb__258) -> (match dtb__257 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__259, dtb__260, dtb__261) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__258) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__260) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__262, dtb__263) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__258) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__262) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__264, dtb__265) -> mc6
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__266, dtb__267, dtb__268) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__267) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__266) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__269, dtb__270) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__269) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__271, dtb__272, dtb__273) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__272) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__271) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__274, dtb__275, dtb__276) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__275) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__277, dtb__278, dtb__279) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__277) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__283) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__282) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__285, dtb__286, dtb__287, dtb__288) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__286) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__285) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__289, dtb__290, dtb__291) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__290) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__292, dtb__293, dtb__294) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__293) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__292) mc6))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__295, dtb__296, dtb__297, dtb__298) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__295) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__299) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons (dtb__299, mc4))) dtb__297) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__296) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__295) mc6))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__297) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__296) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__295) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__300, dtb__301, dtb__302) -> (match dtb__300 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__303, dtb__304) -> (if ((v_Base_dList_dmemName dtb__303) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__301) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__303) 0) dtb__301) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__301) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__300) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__301) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__300) mc6))
)
  | _ -> mc6
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__305, dtb__306) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__306) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__305)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__305)))
  | C_Base_dList_dList_Base_dList_dNil -> mc5
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__308) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__308) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (v_Base_dPair_dfirstOf dtb__307)) (v_Base_dPair_dsecondOf dtb__307)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__309, dtb__310) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__310) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) C_Base_dList_dList_Base_dList_dNil) mc2) dtb__309) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__309) mc1)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun names defTbl factsTbl work st -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo names) defTbl) factsTbl) work) st))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs fuel facts -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs fuel facts -> ((fun names -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (v_Base_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (v_Base_dPair_dsecondOf scan))))) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs names) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p args sizes ctors projs caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__311) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot n))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse") then true else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap") then true else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter"))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__312, dtb__313) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__312) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__314) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__315, dtb__316) -> (match dtb__316 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, dtb__318) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__315, (C_Base_dPair_dPair_Base_dPair_dPair ((dtb__317 + 1), ((v_Base_dList_dappend dtb__318) (C_Base_dList_dList_Base_dList_dCons (0, C_Base_dList_dList_Base_dList_dNil))))))))), mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__314)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__319, dtb__320) -> (match dtb__319 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__321, dtb__322) -> (match dtb__321 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__323, dtb__324) -> (if (dtb__323 = mc0) then (if (dtb__324 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__320) true) (if (dtb__322 = 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__320) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__320) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f g edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__325, dtb__326) -> (match dtb__325 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, dtb__328) -> (match dtb__327 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__329, dtb__330) -> (if (dtb__329 = mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__330, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__326))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__326))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__331, dtb__332) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__331) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__332) else (C_Base_dList_dList_Base_dList_dCons (dtb__331, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__332))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp edges f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel comp edges start frontier visited -> (if (fuel <= 0) then false else (match frontier with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__333, dtb__334) -> (if (dtb__333 = start) then true else (if ((v_Base_dList_dmemName dtb__333) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__334) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((v_Base_dList_dappend dtb__334) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__333))) (C_Base_dList_dList_Base_dList_dCons (dtb__333, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp edges start frontier visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__335, dtb__336) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__335) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__335)) (C_Base_dList_dList_Base_dList_dCons (dtb__335, C_Base_dList_dList_Base_dList_dNil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__336))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (if (m = 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__337, dtb__338) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__337) then (C_Base_dList_dList_Base_dList_dCons (dtb__337, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__338))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__338))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
