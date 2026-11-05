open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
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
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__0, dtb__1, dtb__2) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__3, dtb__4, dtb__5) -> (if (if (if (dtb__0 = dtb__3) then (dtb__1 = dtb__4) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__2) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__5) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__6, dtb__7) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, dtb__9) -> (if (if (dtb__6 = dtb__8) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__7) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__9) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun a b -> (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__10) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__11) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__10) dtb__11)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__12) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__13) -> (dtb__12 = dtb__13)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__14) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__15) -> (dtb__14 = dtb__15)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__16) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__17) -> (if dtb__16 then dtb__17 else (v_Vuna_dCompiler_dCore_dTerm_dnotBool dtb__17))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__18) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__19) -> ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__18) dtb__19)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__20, dtb__21) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__22, dtb__23) -> (if (if (dtb__20 = dtb__22) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__21) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__23) else false)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth = (fun sols depth m -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsDepth m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> dtb__24
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> depth
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_disNilSpine = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dConv_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match dtb__25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> (if (dtb__28 = mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dtermScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__29, dtb__30, dtb__31) -> (if (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__29) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__30) else false) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__31) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__32) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__33) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__34) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__35, dtb__36) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__35) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__36) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__37, dtb__38) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__38)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__39, dtb__40, dtb__41) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__39) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__40) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__42, dtb__43, dtb__44) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__44)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__48) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__49) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__50) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__51) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__52) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__53, dtb__54) -> (if (dtb__54 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__54)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dargsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__55 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__57) then (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__56) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_daltsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__59)))) mc3) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__59)) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__60) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__63) -> (match dtb__63 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__64, dtb__65, dtb__66) -> (if (v_Vuna_dCompiler_dCore_dConv_disNilSpine dtb__66) then (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf dtb__62) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67) -> (if ((v_Vuna_dCompiler_dCore_dConv_dmemLevel dtb__65) dtb__67) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65)), dtb__67)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dlevelPosGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (if (dtb__68 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo mc0) dtb__69) (mc2 + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dlevelPos = (fun level levels -> (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo level) levels) 0))

let rec v_Vuna_dCompiler_dCore_dConv_dspineLevels = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (C_Base_dList_dList_Base_dList_dCons ((v_Base_dPair_dsecondOf dtb__70), (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__71)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dabsPatternBody = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__72, dtb__73, dtb__74) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__72), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__73), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__74)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__75, dtb__76) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__75), ((v_Base_dList_dmap (fun alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) mc4) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))) dtb__76)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__77, dtb__78) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__77, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__78)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__79, dtb__80, dtb__81) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__79), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__80), dtb__81))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__82, dtb__83, dtb__84) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__82, dtb__83, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__84)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__85, dtb__86, dtb__87, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__88), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__89)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, dtb__91) -> (if (dtb__91 < mc3) then mc5 else ((fun level -> (match ((v_Vuna_dCompiler_dCore_dConv_dlevelPos level) mc4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, (((mc3 + mc0) - 1) - dtb__92)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, (dtb__91 + mc0)))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__91)))
  | _ -> mc5
))

let rec v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__95, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__94) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternEnv = (fun created depth -> (if (depth <= 0) then C_Base_dList_dList_Base_dList_dNil else ((fun level -> ((fun lvl -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("_", lvl, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

let v_Vuna_dCompiler_dCore_dConv_dpatternSolution = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__99, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (((v_Vuna_dCompiler_dCore_dConv_dpatternEnv mc1) mc2), ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__98) mc3)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore = (fun sols depth m rhs -> ((fun created -> ((fun t -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) C_Base_dList_dList_Base_dList_dNil) t) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__101, dtb__102) -> (match dtb__102 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (dtb__101 = mc2) then (C_Base_dResult_dResult_Base_dResult_dOk (mc0)) else ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 mc1 -> (if (mc0 = 0) then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals (mc0 - 1)) dtb__106) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__107)), dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs sols depth m rhs -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs))

let v_Vuna_dCompiler_dCore_dConv_dsigText = (fun p -> (String.concat "" [(v_Base_dPair_dfirstOf p); ":"; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Base_dPair_dsecondOf p))]))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth defs a b -> ((fun sa -> ((fun sb -> ((fun _u -> ((fun _u -> ((fun _u -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatch (sa, sb))) sa) sb)) (v_Vuna_dCompiler_dDebug_dnote ("mismatch-sigs: " ^ ((v_Base_dString_djoin "|") ((v_Base_dList_dmap v_Vuna_dCompiler_dCore_dConv_dsigText) ((v_Base_dList_dtake 5) ((v_Base_dList_dfilter (fun p -> ((v_Base_dString_dcontains "b") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Base_dPair_dsecondOf p))))) (v_Base_dHashMap_dtoList defs))))))))) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["mismatch-term: "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) a)); " <> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) b)); " ="; (bi_strFromInt depth)])))) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["mismatch: "; sa; " <> "; sb])))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))

let v_Vuna_dCompiler_dCore_dConv_dboolText = (fun b -> (if b then "T" else "F"))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__109, dtb__110) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__109) dtb__110) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__111, dtb__112) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__111) dtb__112) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__113) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__114) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__113) dtb__114) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((fun _u -> (if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) dtb__116) dtb__121) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__118) dtb__123)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__119) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__124) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__115) depth)))) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["vpi: "; dtb__115; " impl="; (v_Vuna_dCompiler_dCore_dConv_dboolText dtb__116); " <> "; dtb__120; " impl="; (v_Vuna_dCompiler_dCore_dConv_dboolText dtb__121)])))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__125, dtb__126, dtb__127) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__128, dtb__129, dtb__130) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__127) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__130) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__125) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel (fuel - 1)) defs) sols) depth) dtb__125) dtb__127) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__131) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__132) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) dtb__131) dtb__132) a) b)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__133, dtb__134, dtb__135) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__133) dtb__135)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__136) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__137) -> (if (dtb__136 = dtb__137) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__138) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__139) -> (if (dtb__138 = dtb__139) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__140) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__141) -> (if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) dtb__140) dtb__141) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__142, dtb__143) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__144, dtb__145) -> (if (dtb__142 = dtb__144) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) dtb__143) dtb__145) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__146, dtb__147) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__146) dtb__148)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__147) dtb__149)))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__150, dtb__151) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__152, dtb__153) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__150) dtb__152)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__151) dtb__153)))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__154, dtb__155, dtb__156) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__157, dtb__158, dtb__159) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__154) dtb__157)) (fun sols2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__155) dtb__158)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols3) depth) dtb__156) dtb__159)))))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) a) b)
)))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel defs sols depth a name clo -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel defs sols depth name clo b -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel defs sols depth n1 n2 v1 v2 -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__160, dtb__161, dtb__162) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__163, dtb__164, dtb__165) -> (if (dtb__161 = dtb__164) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__162) dtb__165) v1) v2) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) v1) v2))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__166, dtb__167) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__168, dtb__169) -> (if (dtb__166 = dtb__168) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__167) dtb__169) v1) v2) else ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) v1) v2))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) defs) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__170, dtb__171) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__170) dtb__172)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__171) dtb__173) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun _u -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc1) mc6) mc7)) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["spines: "; (v_Vuna_dCompiler_dCore_dEval_dshowValue mc6); " <> "; (v_Vuna_dCompiler_dCore_dEval_dshowValue mc7)]))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun _u -> ((((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc1) mc6) mc7)) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["spines: "; (v_Vuna_dCompiler_dCore_dEval_dshowValue mc6); " <> "; (v_Vuna_dCompiler_dCore_dEval_dshowValue mc7)]))))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__174) dtb__176)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__175) dtb__177))))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCtorArity))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__178) = (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__180)) then (if ((v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__178)) = (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__180))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__178) dtb__180) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__182) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__182))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__183) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (mc0 - 1)) mc1) dtb__183) mc3) dtb__179) dtb__181)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseVars ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__178)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__178))) else (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseBranch ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__178), (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__180)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__178)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__180))))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseCount))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders a))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__184, dtb__185) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__184) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__186) dtb__185))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (m = dtb__184) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__185) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__184, C_Base_dList_dList_Base_dList_dNil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__185) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__187) -> (match dtb__187 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__188, dtb__189) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__187))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__188, C_Base_dList_dList_Base_dList_dNil))))) dtb__189)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__190, dtb__191, dtb__192) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__187))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__190, dtb__191, C_Base_dList_dList_Base_dList_dNil))))) dtb__192)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel = (fun fuel defs sols depth m sp whole headVal args -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Base_dList_dlength args) >= (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__193))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__194) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dlength args) - (v_Base_dList_dlength sp))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf sp) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) dtb__195) t) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) ((((v_Vuna_dCompiler_dCore_dConv_dpatternSolution dtb__195) created) depth) ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody n) created) depth) 0) levels) t))) sols))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__195))) (v_Base_dList_dlength dtb__195))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__196) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__196) sp)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match sp with
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__197, dtb__198) -> (if (dtb__197 = m) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__198) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__197) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__199) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__199) dtb__198))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__197, C_Base_dList_dList_Base_dList_dNil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__198) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dConv_dconv = (fun a1 a2 a3 a4 a5 -> ((fun _u -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel 64) a1) a2) a3) a4) a5)) (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["conv-in: "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote a3) a4)); " <> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote a3) a5)); " |v: "; ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a4); " <> "; ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a5); " @"; (bi_strFromInt a3)]))))

let v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_detaRight = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun a1 a2 a3 a4 a5 a6 -> ((fun _u -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel 64) a1) a2) a3) a4) a5) a6)) (if (a4 = 0) then (v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["solve0: "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote a3) a6)); " sp="; (bi_strFromInt (v_Base_dList_dlength a5)); " solved="; (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup a4) a2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200) -> "yes"
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "no"
  | _ -> failwith "DT: impossible branch"
)])) else 0)))
