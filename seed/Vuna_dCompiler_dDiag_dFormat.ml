open Vuna_runtime
type t_Vuna_dCompiler_dDiag_dFormat_dSourceRef = { f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcFile : string; f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcDigest : string; f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcPackage : string; f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcModule : string; f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcRelPath : string }

# 28 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dseverityName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "help"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dphaseName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal -> "internal"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTool -> "tool"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhDriver -> "driver"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhPackage -> "package"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCodegen -> "codegen"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUsage -> "usage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTermination -> "termination"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCoverage -> "coverage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUnify -> "unify"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhElab -> "elab"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad -> "load"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhResolve -> "resolve"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhParse -> "parse"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLex -> "lex"
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dcategoryName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal -> "internal"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTool -> "tool"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage -> "package"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCodegen -> "codegen"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTraits -> "traits"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatRecords -> "records"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatEffects -> "effects"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatQuantity -> "quantity"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTermination -> "termination"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCoverage -> "coverage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatUniverses -> "universes"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTypes -> "types"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatNames -> "names"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatSyntax -> "syntax"
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_doriginName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__0) -> "cascade"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> "direct"
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder -> "has-placeholder"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect -> "maybe-incorrect"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable -> "machine-applicable"
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderShort = (fun _uarity0 -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText _uarity0))

# 85 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (match dtb__1 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__3; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__4; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__5; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__6 } -> (match dtb__5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__3
  | _ -> (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan dtb__2)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dprimaryText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__7 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__9; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__10; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__11; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__12 } -> (match dtb__11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__10
  | _ -> (v_Vuna_dCompiler_dDiag_dFormat_dprimaryText dtb__8)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dlineAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (mc1 <= 1) then dtb__13 else ((v_Vuna_dCompiler_dDiag_dFormat_dlineAt dtb__14) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dtabToSpace = (fun mc0 -> (if (mc0 = 9) then 32 else mc0))

# 102 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_ddisplayLine = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dtabToSpace) (Base_dList.dtp_unpack s))))

# 109 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace = (fun n -> (if (n <= 0) then "" else (" " ^ (v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (n - 1)))))

# 112 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dpadLeft = (fun n s -> (if ((bi_strLength s) >= n) then s else ((v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (n - (bi_strLength s))) ^ s)))

# 117 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_disUtf8Cont = (fun c -> (if (c >= 128) then (c < 192) else false))

# 121 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_ddisplayColGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (mc1 <= 0) then mc2 else (((v_Vuna_dCompiler_dDiag_dFormat_ddisplayColGo dtb__16) (mc1 - 1)) (if (v_Vuna_dCompiler_dDiag_dFormat_disUtf8Cont dtb__15) then mc2 else (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_ddisplayColOf = (fun line byteCol -> ((((v_Vuna_dCompiler_dDiag_dFormat_ddisplayColGo (Base_dList.dtp_unpack line)) (if (byteCol <= 1) then 0 else (byteCol - 1))) 0) + 1))

# 132 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dcaretWidthIn = (fun line sp -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine sp) <> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)) then 1 else ((fun w -> (if (w > 0) then w else 1)) (((v_Vuna_dCompiler_dDiag_dFormat_ddisplayColOf line) (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp) <= 0) then 1 else (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp))) - ((v_Vuna_dCompiler_dDiag_dFormat_ddisplayColOf line) (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp) <= 0) then 1 else (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)))))))

# 142 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsnippetOf = (fun sp text -> ((fun lines -> ((fun src -> ((fun display -> ((fun lineNumber -> ((fun width -> ((fun start -> ((fun carets -> ((fun gutter -> ((fun numberRow -> ((fun caretRow -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons (("  --> " ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc sp)), (Base_dList.C_Base_dList_dList_Cons (gutter, (Base_dList.C_Base_dList_dList_Cons (numberRow, (Base_dList.C_Base_dList_dList_Cons (caretRow, Base_dList.C_Base_dList_dList_Nil)))))))))) (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (width + 1)); "|"; (v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (start + 1)); ((Base_dString.v_Base_dString_drepeat (bi_natFromInt carets)) "^")]))) (String.concat "" [((v_Vuna_dCompiler_dDiag_dFormat_dpadLeft width) lineNumber); " | "; display]))) ((v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (width + 1)) ^ "|"))) ((v_Vuna_dCompiler_dDiag_dFormat_dcaretWidthIn src) sp))) (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp) <= 0) then 0 else (((v_Vuna_dCompiler_dDiag_dFormat_ddisplayColOf src) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)) - 1)))) (bi_strLength lineNumber))) (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)))) (v_Vuna_dCompiler_dDiag_dFormat_ddisplayLine src))) ((v_Vuna_dCompiler_dDiag_dFormat_dlineAt lines) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)))) (Base_dString.v_Base_dString_dlines text)))

# 159 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet = (fun sp -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp)))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp)))) (fun isDir -> (if isDir then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "") else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp)))) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDiag_dFormat_dsnippetOf sp) text))))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "")))))

# 172 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderShortSnippetEff = (fun d -> (match (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet dtb__17)) (fun block -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (block = "") then "" else ("\n" ^ block)))))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsameSpan = (fun a b -> (if (if (if (if ((a).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (b).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile) then ((a).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (b).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine) else false) then ((a).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (b).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol) else false) then ((a).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (b).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine) else false) then ((a).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (b).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol) else false))

# 188 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsameAsPrimary = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> ((v_Vuna_dCompiler_dDiag_dFormat_dsameSpan dtb__18) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_disPrimaryStyle = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> true
  | _ -> false
))

# 196 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_disContextStyle = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> true
  | _ -> false
))

# 200 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_drelatedBlocks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (match dtb__19 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__21; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__22; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__23; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__24 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDiag_dFormat_drelatedBlocks mc0) dtb__20)) (fun restBlocks -> (if (v_Vuna_dCompiler_dDiag_dFormat_disPrimaryStyle dtb__23) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) restBlocks) else (match dtb__21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) restBlocks)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__25) -> ((fun note -> (if ((v_Vuna_dCompiler_dDiag_dFormat_dsameAsPrimary mc0) dtb__25) then (if (note = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) restBlocks) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (note, restBlocks)))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet dtb__25)) (fun sn -> ((fun block -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (block, restBlocks)))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dfilter (fun x -> (x <> ""))) (Base_dList.C_Base_dList_dList_Cons (sn, (Base_dList.C_Base_dList_dList_Cons (note, Base_dList.C_Base_dList_dList_Nil))))))))))) (if (dtb__22 = "") then "" else (if (v_Vuna_dCompiler_dDiag_dFormat_disContextStyle dtb__23) then ("  = " ^ dtb__22) else ("  = note: " ^ dtb__22))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderRelated = (fun primary labels -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDiag_dFormat_drelatedBlocks primary) labels)) (fun blocks -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dfilter (fun x -> (x <> ""))) blocks))))))

# 229 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dghChar = (fun mc0 -> (if (mc0 = 37) then "%25" else (if (mc0 = 13) then "%0D" else (if (mc0 = 10) then "%0A" else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil)))))))

# 226 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dgithubEscape = (fun s -> ((Base_dString.v_Base_dString_djoin "") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dghChar) (Base_dList.dtp_unpack s))))

# 235 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderGithub = (fun d -> ((fun msg -> ((fun code -> (match (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (String.concat "" ["::error file="; (dtb__26).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; ",line="; (bi_strFromInt (dtb__26).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine); ",col="; (bi_strFromInt (dtb__26).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol); ",endLine="; (bi_strFromInt (dtb__26).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine); ",endColumn="; (bi_strFromInt (dtb__26).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol); "::"; code; msg])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (String.concat "" ["::error::"; code; msg])
  | _ -> failwith "DT: impossible branch"
)) (if ((d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then "" else (String.concat "" ["["; (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; "] "])))) (v_Vuna_dCompiler_dDiag_dFormat_dgithubEscape (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage)))

# 246 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage = (fun lang d -> (if (lang = "zh") then (match (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagDescOf (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> dtb__27
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage
  | _ -> failwith "DT: impossible branch"
) else (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage))

# 252 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dheaderOf = (fun lang d -> ((fun msg -> (if ((d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity); ": "; msg]) else (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity); "["; (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; "]: "; msg]))) ((v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage lang) d)))

# 302 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dhexDigit = (fun n -> (if (n < 10) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) 1) "0123456789abcdef") else (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) 1) "0123456789abcdef")))

# 295 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dhex2 = (fun n -> ((fun hi -> ((fun lo -> ((v_Vuna_dCompiler_dDiag_dFormat_dhexDigit hi) ^ (v_Vuna_dCompiler_dDiag_dFormat_dhexDigit lo))) (n - (hi * 16)))) (if 16 = 0 then failwith "division by zero" else n / 16)))

# 287 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonEscapeChar = (fun mc0 -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (mc0 = 10) then "\\n" else (if (mc0 = 13) then "\\r" else (if (mc0 = 9) then "\\t" else (if (mc0 < 32) then ("\\u00" ^ (v_Vuna_dCompiler_dDiag_dFormat_dhex2 mc0)) else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))))))))))

# 307 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonEscape = (fun s -> ((Base_dString.v_Base_dString_djoin "") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonEscapeChar) (Base_dList.dtp_unpack s))))

# 310 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonStr = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dDiag_dFormat_djsonEscape s); "\""]))

# 313 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonPos = (fun line col -> (String.concat "" ["{\"line\":"; (bi_strFromInt line); ",\"column\":"; (bi_strFromInt col); "}"]))

# 316 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonSpan = (fun sp -> (String.concat "" ["{\"file\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile); ",\"start\":"; ((v_Vuna_dCompiler_dDiag_dFormat_djsonPos (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol); ",\"end\":"; ((v_Vuna_dCompiler_dDiag_dFormat_djsonPos (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol); "}"]))

# 324 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dstyleName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> "context"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary -> "secondary"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> "primary"
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan dtb__28)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonLabel = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__29; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__30; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__31; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__32 } -> (String.concat "" ["{\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan dtb__29); ",\"style\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dstyleName dtb__31)); ",\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__30); ",\"provenance\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan dtb__32); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonString = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__33)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonCandidate = (fun c -> (String.concat "" ["{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan); ",\"reason\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonString (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason); "}"]))

# 341 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonField = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (dtb__34) -> (String.concat "" ["{\"kind\":\"note\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__34); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (dtb__35, dtb__36) -> (String.concat "" ["{\"kind\":\"span\",\"name\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__35); ",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan dtb__36); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (dtb__37) -> (String.concat "" ["{\"kind\":\"module\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__37); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (dtb__38) -> (String.concat "" ["{\"kind\":\"effect\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__38); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (dtb__39, dtb__40, dtb__41) -> (String.concat "" ["{\"kind\":\"quantity\",\"value\":{\"name\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__39); ",\"declared\":"; (bi_strFromInt dtb__40); ",\"observed\":"; (bi_strFromInt dtb__41); "}}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (dtb__42) -> (String.concat "" ["{\"kind\":\"call\",\"value\":{\"callee\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__42).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee); ",\"arg\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__42).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg); ",\"relation\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__42).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (dtb__42).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan); "}}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (dtb__43) -> (String.concat "" ["{\"kind\":\"candidates\",\"value\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonCandidate) dtb__43)); "]}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (dtb__44) -> (String.concat "" ["{\"kind\":\"name\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__44); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (dtb__45) -> (String.concat "" ["{\"kind\":\"found\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__45); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (dtb__46) -> (String.concat "" ["{\"kind\":\"expected\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__46); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonDiagEdit = (fun e -> (String.concat "" ["{\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan); ",\"newText\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText); "}"]))

# 360 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonSuggestion = (fun s -> (String.concat "" ["{\"title\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle); ",\"applicability\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability)); ",\"edits\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonDiagEdit) (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits)); "]}"]))

# 367 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel = (fun fuel t -> (if (fuel <= 0) then "{\"phase\":\"truncated\"}" else (String.concat "" ["{\"phase\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase)); ",\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan); ",\"children\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel (fuel - 1))) (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren)); "]}"])))

# 364 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonTrace = (fun t -> ((v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel 64) t))

# 372 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonIce = (fun i -> (String.concat "" ["{\"phase\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_icePhase)); ",\"function\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction); ",\"invariant\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant); ",\"fingerprint\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint); ",\"hint\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceHint); "}"]))

# 376 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonIce = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonIce dtb__47)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dmaybeParent = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (bi_strFromInt dtb__48)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_doriginJson = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__49) -> (String.concat "" ["{\"kind\":\"cascade\",\"parent\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeParent dtb__49); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> "{\"kind\":\"direct\"}"
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dabsentName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal -> "internal"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsPackageGraph -> "package-graph"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage -> "tool-usage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic -> "synthetic"
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonAbsent = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> (",\"absent\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dabsentName dtb__50)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonSource = (fun s -> (String.concat "" ["{\"file\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcFile); ",\"package\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcPackage); ",\"module\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcModule); ",\"relPath\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcRelPath); ",\"digest\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcDigest); "}"]))

# 430 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId = (fun d -> (if ((d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then "vuna" else (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode))

# 439 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion = (fun sp -> (String.concat "" ["{\"startLine\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)); ",\"startColumn\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)); ",\"endLine\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine sp)); ",\"endColumn\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp)); "}"]))

# 443 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifLocation = (fun file sp -> (String.concat "" ["{\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr file); "},\"region\":"; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion sp); "}}"]))

# 447 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifRelated = (fun file l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (String.concat "" ["{\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText); "}}"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (String.concat "" ["{\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText); "},\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__51)); "},\"region\":"; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion dtb__51); "}}"])
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_disPrimaryLabel = (fun l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> true
  | _ -> false
))

# 453 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifResult = (fun d -> ((fun primary -> ((fun related -> ((fun relJson -> ((fun notesText -> ((fun msg -> (String.concat "" ["{\"ruleId\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d)); ",\"level\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifLevel (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity)); ",\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr msg); "}"; primary; relJson; ",\"properties\":{\"vuna.origin\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_doriginName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin)); "}}"])) (if (notesText = "") then (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage else (String.concat "" [(d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; "\n"; notesText])))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap (fun n -> ("note: " ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)))) (if ((Base_dList.v_Base_dList_dlength related) = 0) then "" else (String.concat "" [",\"relatedLocations\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_dsarifRelated (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d))) related)); "]"])))) ((Base_dList.v_Base_dList_dfilter (fun l -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDiag_dFormat_disPrimaryLabel l)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels))) (match (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (String.concat "" [",\"locations\":["; ((v_Vuna_dCompiler_dDiag_dFormat_dsarifLocation (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__52)) dtb__52); "]"])
  | _ -> failwith "DT: impossible branch"
)))

# 481 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dmemCode = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (if (mc0 = dtb__53) then true else ((v_Vuna_dCompiler_dDiag_dFormat_dmemCode mc0) dtb__54))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_duniqueCodes = (fun ds -> (((Base_dList.v_Base_dList_dfoldl (fun acc d -> (if ((v_Vuna_dCompiler_dDiag_dFormat_dmemCode (v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d)) acc) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d), Base_dList.C_Base_dList_dList_Nil)))))) Base_dList.C_Base_dList_dList_Nil) ds))

# 496 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifLevelName = (fun mc0 -> (if (mc0 = "error") then "error" else (if (mc0 = "warning") then "warning" else "note")))

# 485 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_druleJson = (fun code -> ((fun desc -> ((fun sev -> ((fun phase -> ((fun cat -> (String.concat "" ["{\"id\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr code); ",\"shortDescription\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr desc); "},\"help\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr desc); "},\"defaultConfiguration\":{\"level\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifLevelName sev)); "},\"properties\":{\"tags\":["; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr phase); ","; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr cat); "]}}"])) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagCategoryOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagPhaseOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagSeverityOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (match (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagDescOf code) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> dtb__55
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> code
  | _ -> failwith "DT: impossible branch"
)))

# 473 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsarifRules = (fun ds -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_druleJson) (v_Vuna_dCompiler_dDiag_dFormat_duniqueCodes ds))))

# 502 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderSarif = (fun ds -> (String.concat "" ["{\"$schema\":\"https://json.schemastore.org/sarif-2.1.0.json\",\"version\":\"2.1.0\",\"runs\":[{\"tool\":{\"driver\":{\"name\":\"vuna\",\"version\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion); ",\"rules\":["; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRules ds); "]}},\"results\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dsarifResult) ds)); "]}]}"]))

# 510 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_ddiagDescLine = (fun d -> "")

# 530 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dtraceLines = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["  = trace["; (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (dtb__56).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase); "]: "; (dtb__56).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText]), Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dDiag_dFormat_dtraceLines mc0) dtb__57))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Diag/Format.vuna"
let rec v_Vuna_dCompiler_dDiag_dFormat_dindent = (fun n -> (if (n <= 0) then "" else ("  " ^ (v_Vuna_dCompiler_dDiag_dFormat_dindent (n - 1)))))

# 538 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dsuggestionLine = (fun s -> (String.concat "" ["  = help: "; (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle; " ("; (v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability); ")"]))

# 541 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dshowInt = (fun n -> (bi_strFromInt n))

# 544 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dcandidateTextOf = (fun c -> (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText)

# 548 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dcallSpanSuffix = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (String.concat "" [" at "; (dtb__58).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; ":"; (bi_strFromInt (dtb__58).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine)])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dfieldLine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (dtb__59) -> ("  = note: " ^ dtb__59)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (dtb__60, dtb__61) -> (String.concat "" ["  = span: "; dtb__60; " at "; (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc dtb__61)])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (dtb__62) -> ("  = module: " ^ dtb__62)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (dtb__63) -> ("  = effect: " ^ dtb__63)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (dtb__64, dtb__65, dtb__66) -> (String.concat "" ["  = quantity: "; dtb__64; " (declared "; (v_Vuna_dCompiler_dDiag_dFormat_dshowInt dtb__65); ", observed "; (v_Vuna_dCompiler_dDiag_dFormat_dshowInt dtb__66); ")"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (dtb__67) -> (String.concat "" ["  = call: "; (dtb__67).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee; " <- "; (dtb__67).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg; " ("; (dtb__67).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation; ")"; (v_Vuna_dCompiler_dDiag_dFormat_dcallSpanSuffix (dtb__67).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan)])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (dtb__68) -> ("  = candidates: " ^ ((Base_dString.v_Base_dString_djoin ", ") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dcandidateTextOf) ((Base_dList.v_Base_dList_dtake 8) dtb__68))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (dtb__69) -> ("  = name: " ^ dtb__69)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (dtb__70) -> ("  = found: " ^ dtb__70)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (dtb__71) -> ("  = expected: " ^ dtb__71)
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderHuman = (fun lang d -> ((fun primary -> ((fun ptext -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (match primary with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> (v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet dtb__72)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "")
  | _ -> failwith "DT: impossible branch"
)) (fun snippet -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDiag_dFormat_drenderRelated primary) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)) (fun related -> ((fun labelNote -> ((fun notes -> ((fun descLine -> ((fun origLine -> ((fun fieldBlock -> ((fun traceBlock -> ((fun helpBlock -> ((fun block -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dString.v_Base_dString_dtrim block))) ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDiag_dFormat_dheaderOf lang) d), (Base_dList.C_Base_dList_dList_Cons (snippet, (Base_dList.C_Base_dList_dList_Cons (related, (Base_dList.C_Base_dList_dList_Cons (labelNote, (Base_dList.C_Base_dList_dList_Cons (origLine, (Base_dList.C_Base_dList_dList_Cons (notes, (Base_dList.C_Base_dList_dList_Cons (fieldBlock, (Base_dList.C_Base_dList_dList_Cons (traceBlock, (Base_dList.C_Base_dList_dList_Cons (helpBlock, (Base_dList.C_Base_dList_dList_Cons (descLine, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dsuggestionLine) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions)))) ((Base_dString.v_Base_dString_djoin "\n") ((v_Vuna_dCompiler_dDiag_dFormat_dtraceLines 0) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace)))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dfieldLine) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields)))) (if (((v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage lang) d) = (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) then "" else ("  = message: " ^ (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage)))) (v_Vuna_dCompiler_dDiag_dFormat_ddiagDescLine d))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap (fun n -> ("  = note: " ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)))) (if (ptext = "") then "" else ("  = note: " ^ ptext)))))))) (v_Vuna_dCompiler_dDiag_dFormat_dprimaryText (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels))) (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)))

# 552 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_dlocalizedJsonField = (fun lang d -> ((fun lm -> (if (lm = (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) then "" else (",\"localizedMessage\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr lm)))) ((v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage lang) d)))

# 399 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_djsonDiag = (fun lang d -> ((Base_dString.v_Base_dString_djoin "") (Base_dList.C_Base_dList_dList_Cons (("{\"code\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode)), (Base_dList.C_Base_dList_dList_Cons ((",\"severity\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity))), (Base_dList.C_Base_dList_dList_Cons ((",\"phase\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase))), (Base_dList.C_Base_dList_dList_Cons ((",\"category\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dcategoryName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory))), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"message\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage); ((v_Vuna_dCompiler_dDiag_dFormat_dlocalizedJsonField lang) d)]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"labels\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonLabel) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"fields\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonField) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"trace\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonTrace) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"notes\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonStr) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"suggestions\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonSuggestion) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((",\"origin\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_doriginJson (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin)), (Base_dList.C_Base_dList_dList_Cons ((",\"internal\":" ^ (if (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal then "true" else "false")), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"ice\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonIce (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce); (v_Vuna_dCompiler_dDiag_dFormat_djsonAbsent (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent); "}"]), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))

# 404 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderJson = (fun lang d -> ((v_Vuna_dCompiler_dDiag_dFormat_djsonDiag lang) d))

# 407 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList = (fun lang ds -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"diagnostics\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_djsonDiag lang)) ds)); "]}"]))

# 423 "Vuna/Compiler/Diag/Format.vuna"
let v_Vuna_dCompiler_dDiag_dFormat_drenderJsonListWithSources = (fun lang ds sources -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"sources\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonSource) sources)); "],\"diagnostics\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_djsonDiag lang)) ds)); "]}"]))
