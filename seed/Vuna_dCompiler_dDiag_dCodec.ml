open Vuna_runtime
type t_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome = C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed of (Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed of (Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList)

# 20 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddiagCodec = "diagnostics 1"

# 26 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dsevTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> 3
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> 0
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dsevOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote)) else (if (mc0 = 3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 39 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dphaseTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal -> 13
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTool -> 12
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhDriver -> 11
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhPackage -> 10
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCodegen -> 9
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUsage -> 8
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTermination -> 7
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCoverage -> 6
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUnify -> 5
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhElab -> 4
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad -> 3
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhResolve -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhParse -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLex -> 0
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dphaseOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLex)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhParse)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhResolve)) else (if (mc0 = 3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad)) else (if (mc0 = 4) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhElab)) else (if (mc0 = 5) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUnify)) else (if (mc0 = 6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCoverage)) else (if (mc0 = 7) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTermination)) else (if (mc0 = 8) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUsage)) else (if (mc0 = 9) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCodegen)) else (if (mc0 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhPackage)) else (if (mc0 = 11) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhDriver)) else (if (mc0 = 12) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTool)) else (if (mc0 = 13) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))))))

# 72 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dcatTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal -> 13
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTool -> 12
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage -> 11
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCodegen -> 10
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTraits -> 9
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatRecords -> 8
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatEffects -> 7
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatQuantity -> 6
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTermination -> 5
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCoverage -> 4
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatUniverses -> 3
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTypes -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatNames -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatSyntax -> 0
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dcatOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatSyntax)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatNames)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTypes)) else (if (mc0 = 3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatUniverses)) else (if (mc0 = 4) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCoverage)) else (if (mc0 = 5) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTermination)) else (if (mc0 = 6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatQuantity)) else (if (mc0 = 7) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatEffects)) else (if (mc0 = 8) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatRecords)) else (if (mc0 = 9) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTraits)) else (if (mc0 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCodegen)) else (if (mc0 = 11) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage)) else (if (mc0 = 12) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTool)) else (if (mc0 = 13) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))))))

# 105 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dstyleTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> 0
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dstyleOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))

# 116 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dapplicabilityTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dapplicabilityOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))

# 127 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dabsentTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal -> 3
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsPackageGraph -> 2
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic -> 0
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dabsentOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage)) else (if (mc0 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsPackageGraph)) else (if (mc0 = 3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 140 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dstabilityTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile -> 1
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dstabilityOfTag = (fun mc0 -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable)) else (if (mc0 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

# 152 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencSpan = (fun sp acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol) acc))))))

# 164 "Vuna/Compiler/Diag/Codec.vuna"
let rec v_Vuna_dCompiler_dDiag_dCodec_dreadCount = (fun fuel acc c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (if (dtb__0 = 58) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c) })) else (if (if (dtb__0 >= 48) then (dtb__0 <= 57) else false) then (((v_Vuna_dCompiler_dDiag_dCodec_dreadCount (fuel - 1)) ((acc * 10) + (dtb__0 - 48))) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 172 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecCount = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1) -> (if (dtb__1 = 91) then (((v_Vuna_dCompiler_dDiag_dCodec_dreadCount (fuel - 1)) 0) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c)))

# 177 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dthenPair = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> (match dtb__2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__3; Base_dPair.f_Base_dPair_dPair_second = dtb__4 } -> ((mc1 dtb__3) dtb__4)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecSpan = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun file b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b1)) (fun sl b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b2)) (fun sc b3 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b3)) (fun el b4 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b4)) (fun ec b5 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = file; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = sl; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = sc; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = el; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = ec }; Base_dPair.f_Base_dPair_dPair_second = b5 })))))))))))))

# 181 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencLabel = (fun l acc -> (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencSpan) (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dstyleTag (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencSpan) (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance) acc)))))

# 186 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecLabel = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecSpan) (fuel - 1)) c)) (fun msp b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun text b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b2)) (fun stag b3 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dstyleOfTag stag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecSpan) (fuel - 1)) b3)) (fun prov b4 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = msp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = text; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__5; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = prov }; Base_dPair.f_Base_dPair_dPair_second = b4 }))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 196 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencEdit = (fun e acc -> ((v_Vuna_dCompiler_dDiag_dCodec_dencSpan (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText) acc)))

# 199 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecEdit = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecSpan (fuel - 1)) c)) (fun sp b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun t b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = sp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = t }; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))

# 204 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencSuggestion = (fun s acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dapplicabilityTag (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencEdit) (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits) acc))))

# 209 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecSuggestion = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun title b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b1)) (fun atag b2 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dapplicabilityOfTag atag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecEdit) (fuel - 1)) b2)) (fun es b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = title; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = dtb__6; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = es }; Base_dPair.f_Base_dPair_dPair_second = b3 }))))
  | _ -> failwith "DT: impossible branch"
))))))

# 217 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencCandidate = (fun cand acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (cand).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencSpan) (cand).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (cand).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason) acc))))

# 222 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecCandidate = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun text b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecSpan) (fuel - 1)) b1)) (fun msp b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) b2)) (fun reason b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = text; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = msp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = reason }; Base_dPair.f_Base_dPair_dPair_second = b3 })))))))))

# 227 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencCall = (fun ci acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (ci).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (ci).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (ci).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencSpan) (ci).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan) acc)))))

# 232 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecCall = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun callee b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun arg b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b2)) (fun rel b3 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecSpan) (fuel - 1)) b3)) (fun msp b4 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee = callee; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg = arg; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation = rel; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan = msp }; Base_dPair.f_Base_dPair_dPair_second = b4 })))))))))))

# 238 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencField = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (dtb__7) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 9) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__7) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (dtb__8, dtb__9) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 8) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__8) ((v_Vuna_dCompiler_dDiag_dCodec_dencSpan dtb__9) mc1)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (dtb__10) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 7) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__10) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (dtb__11) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 6) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__11) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (dtb__12, dtb__13, dtb__14) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 5) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__12) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__13) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__14) mc1))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (dtb__15) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 4) ((v_Vuna_dCompiler_dDiag_dCodec_dencCall dtb__15) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (dtb__16) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 3) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencCandidate) dtb__16) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (dtb__17) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__17) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (dtb__18) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__18) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (dtb__19) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__19) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecField = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) c)) (fun tg b1 -> (if (tg = 0) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 1) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 2) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 3) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecCandidate) (fuel - 1)) b1)) (fun cs b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (cs)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 4) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecCall (fuel - 1)) b1)) (fun ci b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (ci)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 5) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun name b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b2)) (fun d b3 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b3)) (fun o b4 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (name, d, o)); Base_dPair.f_Base_dPair_dPair_second = b4 })))))))) else (if (tg = 6) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 7) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tg = 8) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun name b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecSpan (fuel - 1)) b2)) (fun sp b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (name, sp)); Base_dPair.f_Base_dPair_dPair_second = b3 })))))) else (if (tg = 9) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun s b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (s)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))))

# 271 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencOrigin = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__20) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt) dtb__20) mc1))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecOrigin = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) c)) (fun tg b1 -> (if (tg = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; Base_dPair.f_Base_dPair_dPair_second = b1 })) else (if (tg = 1) then ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt) (fuel - 1)) b1)) (fun p b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (p)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 282 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencIce = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_icePhase = dtb__21; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction = dtb__22; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant = dtb__23; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint = dtb__24; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceHint = dtb__25 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dphaseTag dtb__21)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__22) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__23) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__24) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__25) mc1)))))
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecIce = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) c)) (fun pt b1 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dphaseOfTag pt) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun fn b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b2)) (fun inv b3 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b3)) (fun fp b4 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b4)) (fun hint b5 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_icePhase = dtb__26; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction = fn; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant = inv; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint = fp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceHint = hint }; Base_dPair.f_Base_dPair_dPair_second = b5 }))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 294 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecTrace = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) c)) (fun pt b1 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dphaseOfTag pt) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun text b2 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecSpan) (fuel - 1)) b2)) (fun msp b3 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecCount (fuel - 1)) b3)) (fun n b4 -> (if (n = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase = dtb__27; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText = text; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan = msp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren = Base_dList.C_Base_dList_dList_Nil }; Base_dPair.f_Base_dPair_dPair_second = b4 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 310 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencTrace = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase = dtb__28; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText = dtb__29; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan = dtb__30; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren = dtb__31 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dphaseTag dtb__28)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__29) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencSpan) dtb__30) (Base_dList.C_Base_dList_dList_Cons ("[0:", mc1)))))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dmtAbsent = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> (match (v_Vuna_dCompiler_dDiag_dCodec_dabsentOfTag dtb__32) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Diag/Codec.vuna"
let rec v_Vuna_dCompiler_dDiag_dCodec_ddecDiag = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) c)) (fun id b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b1)) (fun st b2 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dsevOfTag st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__34) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b2)) (fun pt b3 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dphaseOfTag pt) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b3)) (fun ct b4 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dcatOfTag ct) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b4)) (fun code b5 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b5)) (fun msg b6 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecLabel) (fuel - 1)) b6)) (fun labels b7 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecField) (fuel - 1)) b7)) (fun fields b8 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecTrace) (fuel - 1)) b8)) (fun trace b9 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) b9)) (fun notes b10 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDiag_dCodec_ddecSuggestion) (fuel - 1)) b10)) (fun sugs b11 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecOrigin (fuel - 1)) b11)) (fun origin b12 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecDiagList (fuel - 1)) b12)) (fun kids b13 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) b13)) (fun internal b14 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dDiag_dCodec_ddecIce) (fuel - 1)) b14)) (fun ice b15 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag) (fuel - 1)) b15)) (fun mtag b16 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dmtAbsent mtag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__37) -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) b16)) (fun stab b17 -> (match (v_Vuna_dCompiler_dDiag_dCodec_dstabilityOfTag stab) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = id; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__34; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__35; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__36; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = code; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = labels; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = fields; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = trace; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = notes; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = sugs; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = origin; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = kids; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = internal; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = ice; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__37; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__38 }; Base_dPair.f_Base_dPair_dPair_second = b17 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
# 353 "Vuna/Compiler/Diag/Codec.vuna"
and v_Vuna_dCompiler_dDiag_dCodec_ddecDiagList = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__39) -> (match dtb__39 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> ((((v_Vuna_dCompiler_dDiag_dCodec_ddecDiagItems (fuel - 1)) dtb__40) dtb__41) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dCodec_ddecCount (fuel - 1)) c))))
# 359 "Vuna/Compiler/Diag/Codec.vuna"
and v_Vuna_dCompiler_dDiag_dCodec_ddecDiagItems = (fun fuel n c acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = c })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } -> ((((v_Vuna_dCompiler_dDiag_dCodec_ddecDiagItems (fuel - 1)) (n - 1)) dtb__44) (Base_dList.C_Base_dList_dList_Cons (dtb__43, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dCodec_ddecDiag (fuel - 1)) c)))))

# 373 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dabsentEnc = (fun r acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dabsentTag r)) acc))

# 302 "Vuna/Compiler/Diag/Codec.vuna"
let rec v_Vuna_dCompiler_dDiag_dCodec_dencDiagList = (fun ds acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf ds)); ":"]), ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagListGo ds) acc))))
# 305 "Vuna/Compiler/Diag/Codec.vuna"
and v_Vuna_dCompiler_dDiag_dCodec_dencDiagListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> ((v_Vuna_dCompiler_dDiag_dCodec_dencDiag dtb__45) ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagListGo dtb__46) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 314 "Vuna/Compiler/Diag/Codec.vuna"
and v_Vuna_dCompiler_dDiag_dCodec_dencDiag = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = dtb__47; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__48; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__49; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__50; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = dtb__51; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = dtb__52; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = dtb__53; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = dtb__54; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = dtb__55; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = dtb__56; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = dtb__57; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = dtb__58; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = dtb__59; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = dtb__60; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = dtb__61; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__62; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__63 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__47) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dsevTag dtb__48)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dphaseTag dtb__49)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dcatTag dtb__50)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__51) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__52) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencLabel) dtb__53) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencField) dtb__54) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencTrace) dtb__55) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) dtb__56) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDiag_dCodec_dencSuggestion) dtb__57) ((v_Vuna_dCompiler_dDiag_dCodec_dencOrigin dtb__58) ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagList dtb__59) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__60) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dencIce) dtb__61) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe v_Vuna_dCompiler_dDiag_dCodec_dabsentEnc) dtb__62) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag (v_Vuna_dCompiler_dDiag_dCodec_dstabilityTag dtb__63)) mc1)))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencDiagnostics = (fun ds -> (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencConcat ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagList ds) Base_dList.C_Base_dList_dList_Nil)))

# 383 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecDiagnostics = (fun payload -> ((fun fuel -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (match dtb__64 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__65; Base_dPair.f_Base_dPair_dPair_second = dtb__66 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__66) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dCodec_ddecDiagList fuel) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf payload)))) ((bi_strLength payload) + 1)))

# 396 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dcheckOutcomeCodec = "check-result 1"

# 399 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencOutcome = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (dtb__67) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagList dtb__67) mc1))
  | C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (dtb__68) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((v_Vuna_dCompiler_dDiag_dCodec_dencDiagList dtb__68) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecOutcome = (fun fuel c -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag (fuel - 1)) c)) (fun tg b1 -> ((v_Vuna_dCompiler_dDiag_dCodec_dthenPair ((v_Vuna_dCompiler_dDiag_dCodec_ddecDiagList (fuel - 1)) b1)) (fun ds b2 -> (if (tg = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (ds)); Base_dPair.f_Base_dPair_dPair_second = b2 })) else (if (tg = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (ds)); Base_dPair.f_Base_dPair_dPair_second = b2 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))

# 412 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dcheckResultCodec = v_Vuna_dCompiler_dDiag_dCodec_dcheckOutcomeCodec

# 415 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_dencCheckOutcome = (fun o -> (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencConcat ((v_Vuna_dCompiler_dDiag_dCodec_dencOutcome o) Base_dList.C_Base_dList_dList_Nil)))

# 418 "Vuna/Compiler/Diag/Codec.vuna"
let v_Vuna_dCompiler_dDiag_dCodec_ddecCheckOutcome = (fun payload -> ((fun fuel -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (match dtb__69 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__70; Base_dPair.f_Base_dPair_dPair_second = dtb__71 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__71) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dCodec_ddecOutcome fuel) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf payload)))) ((bi_strLength payload) + 1)))
