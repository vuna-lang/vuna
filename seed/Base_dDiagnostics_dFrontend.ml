open Vuna_runtime
type t_LexDiag = C_LexDiag_UnterminatedBlockComment | C_LexDiag_UnterminatedString | C_LexDiag_UnterminatedInterpolation | C_LexDiag_UnknownEscape | C_LexDiag_UnexpectedCharacter | C_LexDiag_IntLiteralOutOfRange
and t_PsDiag = C_PsDiag_CaseAltNotIndented | C_PsDiag_CaseNeedsAlternative | C_PsDiag_DoBlockMustEndWithExpr | C_PsDiag_DoBlockNeedsStatement | C_PsDiag_DoStatementNotIndented | C_PsDiag_ExpectedCommaOrBracket | C_PsDiag_ExpectedEndOfInput | C_PsDiag_ExpectedEndOfExpr | C_PsDiag_ExpectedExportItem | C_PsDiag_ExpectedExpression | C_PsDiag_ExpectedIdentifier | C_PsDiag_ExpectedInstanceMethod | C_PsDiag_ExpectedLetBinding | C_PsDiag_ExpectedPattern | C_PsDiag_ExpectedRecordFieldPattern | C_PsDiag_ExpectedTopLevelDecl | C_PsDiag_RepeatedPatternBinder | C_PsDiag_TemplateHoleEmpty | C_PsDiag_TemplateInPattern | C_PsDiag_ExprNotIndented | C_PsDiag_LetBindingNotIndented | C_PsDiag_PiBinderNameNotSimple | C_PsDiag_UnexpectedEndOfInput | C_PsDiag_UnexpectedIndentAfterCaseAlt | C_PsDiag_UnexpectedIndentInData | C_PsDiag_UnexpectedIndentInDo | C_PsDiag_UnexpectedIndentInInstance | C_PsDiag_UnexpectedIndentInRecord | C_PsDiag_UnexpectedIndentInTrait | C_PsDiag_UnexpectedIndentInBinding | C_PsDiag_ExpectedFixityLevel | C_PsDiag_FixityLevelRange | C_PsDiag_ConstraintUnsupportedHere | C_PsDiag_HandleClauseNeedsCtor | C_PsDiag_HandleClauseNotIndented | C_PsDiag_HandleNeedsOpClause | C_PsDiag_HandleReturnMisplaced | C_PsDiag_HandleContinuationNameMismatch of (string) * (string) | C_PsDiag_WhereSigBeforeClause of (string) | C_PsDiag_WhereSigDuplicate of (string) | C_PsDiag_WhereSigMultiClause of (string) | C_PsDiag_WhereSigNoDef of (string) | C_PsDiag_ExpectedDeclAtColumn of (string) | C_PsDiag_ExpectedToken of (string) | C_PsDiag_ClauseNotAdjacent of (string) | C_PsDiag_DefinitionDuplicate of (string) | C_PsDiag_ClauseShadowed of (string)
and t_LexEntry = { f_LexEntry_lexEntryCode : string; f_LexEntry_lexEntryTemplate : string; f_LexEntry_lexEntryDesc : string }
and t_PsEntry = { f_PsEntry_psEntryCode : string; f_PsEntry_psEntryTemplate : string; f_PsEntry_psEntryDesc : string }

# 67 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexCode = (fun (dtb_u_u2 : t_LexDiag) -> (match dtb_u_u2 with
  | C_LexDiag_IntLiteralOutOfRange -> "LX_IntLiteralOutOfRange"
  | C_LexDiag_UnexpectedCharacter -> "LX_UnexpectedCharacter"
  | C_LexDiag_UnknownEscape -> "LX_UnknownEscape"
  | C_LexDiag_UnterminatedInterpolation -> "LX_UnterminatedInterpolation"
  | C_LexDiag_UnterminatedString -> "LX_UnterminatedString"
  | C_LexDiag_UnterminatedBlockComment -> "LX_UnterminatedBlockComment"
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexTemplate = (fun (dtb_u_u4 : t_LexDiag) -> (match dtb_u_u4 with
  | C_LexDiag_IntLiteralOutOfRange -> "integer literal is out of range (max is 4611686018427387903)"
  | C_LexDiag_UnexpectedCharacter -> "unexpected character"
  | C_LexDiag_UnknownEscape -> "unknown escape sequence"
  | C_LexDiag_UnterminatedInterpolation -> "unterminated string interpolation (missing closing brace)"
  | C_LexDiag_UnterminatedString -> "unterminated string literal"
  | C_LexDiag_UnterminatedBlockComment -> "unterminated block comment"
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psCode = (fun (dtb_u_u6 : t_PsDiag) -> (match dtb_u_u6 with
  | C_PsDiag_WhereSigNoDef (dtb_u_u7) -> "PS_WhereSigNoDef"
  | C_PsDiag_WhereSigMultiClause (dtb_u_u8) -> "PS_WhereSigMultiClause"
  | C_PsDiag_WhereSigDuplicate (dtb_u_u9) -> "PS_WhereSigDuplicate"
  | C_PsDiag_WhereSigBeforeClause (dtb_u_u10) -> "PS_WhereSigBeforeClause"
  | C_PsDiag_ClauseShadowed (dtb_u_u11) -> "PS_ClauseShadowed"
  | C_PsDiag_DefinitionDuplicate (dtb_u_u12) -> "PS_DefinitionDuplicate"
  | C_PsDiag_ClauseNotAdjacent (dtb_u_u13) -> "PS_ClauseNotAdjacent"
  | C_PsDiag_ExpectedToken (dtb_u_u14) -> "PS_ExpectedToken"
  | C_PsDiag_ExpectedDeclAtColumn (dtb_u_u15) -> "PS_ExpectedDeclAtColumn"
  | C_PsDiag_HandleContinuationNameMismatch (dtb_u_u16, dtb_u_u17) -> "PS_HandleContinuationNameMismatch"
  | C_PsDiag_HandleReturnMisplaced -> "PS_HandleReturnMisplaced"
  | C_PsDiag_HandleNeedsOpClause -> "PS_HandleNeedsOpClause"
  | C_PsDiag_HandleClauseNotIndented -> "PS_HandleClauseNotIndented"
  | C_PsDiag_HandleClauseNeedsCtor -> "PS_HandleClauseNeedsCtor"
  | C_PsDiag_ConstraintUnsupportedHere -> "PS_ConstraintUnsupportedHere"
  | C_PsDiag_FixityLevelRange -> "PS_FixityLevelRange"
  | C_PsDiag_ExpectedFixityLevel -> "PS_ExpectedFixityLevel"
  | C_PsDiag_UnexpectedIndentInBinding -> "PS_UnexpectedIndentInBinding"
  | C_PsDiag_UnexpectedIndentInTrait -> "PS_UnexpectedIndentInTrait"
  | C_PsDiag_UnexpectedIndentInRecord -> "PS_UnexpectedIndentInRecord"
  | C_PsDiag_UnexpectedIndentInInstance -> "PS_UnexpectedIndentInInstance"
  | C_PsDiag_UnexpectedIndentInDo -> "PS_UnexpectedIndentInDo"
  | C_PsDiag_UnexpectedIndentInData -> "PS_UnexpectedIndentInData"
  | C_PsDiag_UnexpectedIndentAfterCaseAlt -> "PS_UnexpectedIndentAfterCaseAlt"
  | C_PsDiag_UnexpectedEndOfInput -> "PS_UnexpectedEndOfInput"
  | C_PsDiag_PiBinderNameNotSimple -> "PS_PiBinderNameNotSimple"
  | C_PsDiag_LetBindingNotIndented -> "PS_LetBindingNotIndented"
  | C_PsDiag_ExprNotIndented -> "PS_ExprNotIndented"
  | C_PsDiag_TemplateInPattern -> "PS_TemplateInPattern"
  | C_PsDiag_TemplateHoleEmpty -> "PS_TemplateHoleEmpty"
  | C_PsDiag_RepeatedPatternBinder -> "PS_RepeatedPatternBinder"
  | C_PsDiag_ExpectedTopLevelDecl -> "PS_ExpectedTopLevelDecl"
  | C_PsDiag_ExpectedRecordFieldPattern -> "PS_ExpectedRecordFieldPattern"
  | C_PsDiag_ExpectedPattern -> "PS_ExpectedPattern"
  | C_PsDiag_ExpectedLetBinding -> "PS_ExpectedLetBinding"
  | C_PsDiag_ExpectedInstanceMethod -> "PS_ExpectedInstanceMethod"
  | C_PsDiag_ExpectedIdentifier -> "PS_ExpectedIdentifier"
  | C_PsDiag_ExpectedExpression -> "PS_ExpectedExpression"
  | C_PsDiag_ExpectedExportItem -> "PS_ExpectedExportItem"
  | C_PsDiag_ExpectedEndOfExpr -> "PS_ExpectedEndOfExpr"
  | C_PsDiag_ExpectedEndOfInput -> "PS_ExpectedEndOfInput"
  | C_PsDiag_ExpectedCommaOrBracket -> "PS_ExpectedCommaOrBracket"
  | C_PsDiag_DoStatementNotIndented -> "PS_DoStatementNotIndented"
  | C_PsDiag_DoBlockNeedsStatement -> "PS_DoBlockNeedsStatement"
  | C_PsDiag_DoBlockMustEndWithExpr -> "PS_DoBlockMustEndWithExpr"
  | C_PsDiag_CaseNeedsAlternative -> "PS_CaseNeedsAlternative"
  | C_PsDiag_CaseAltNotIndented -> "PS_CaseAltNotIndented"
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psTemplate = (fun (dtb_u_u19 : t_PsDiag) -> (match dtb_u_u19 with
  | C_PsDiag_ClauseShadowed (dtb_u_u20) -> "clause of <0> is shadowed by an earlier clause and can never match"
  | C_PsDiag_DefinitionDuplicate (dtb_u_u21) -> "definition <0> has no parameters, so only one clause is allowed"
  | C_PsDiag_ClauseNotAdjacent (dtb_u_u22) -> "clauses of <0> must be contiguous (no other declaration, signature or fixity line in between)"
  | C_PsDiag_WhereSigNoDef (dtb_u_u23) -> "binding signature for <0> has no definition"
  | C_PsDiag_WhereSigMultiClause (dtb_u_u24) -> "binding <0> has more than one clause (a signature can annotate only one)"
  | C_PsDiag_WhereSigDuplicate (dtb_u_u25) -> "duplicate binding signature for <0>"
  | C_PsDiag_WhereSigBeforeClause (dtb_u_u26) -> "binding signature for <0> must come before its clause"
  | C_PsDiag_ExpectedToken (dtb_u_u27) -> "expected <0>"
  | C_PsDiag_ExpectedDeclAtColumn (dtb_u_u28) -> "expected a declaration at column <0>"
  | C_PsDiag_HandleContinuationNameMismatch (dtb_u_u29, dtb_u_u30) -> "all handle operation clauses must use the same continuation binder name (expected <0>, got <1>)"
  | C_PsDiag_HandleReturnMisplaced -> "handle return clause must be first and appear at most once"
  | C_PsDiag_HandleNeedsOpClause -> "handle block must contain at least one operation clause"
  | C_PsDiag_HandleClauseNotIndented -> "handle clause is not indented enough"
  | C_PsDiag_HandleClauseNeedsCtor -> "handle operation clause must be a constructor pattern followed by the continuation binder"
  | C_PsDiag_ConstraintUnsupportedHere -> "trait constraints are not supported here (only on top-level signatures and trait heads)"
  | C_PsDiag_FixityLevelRange -> "fixity level must be between 0 and 9"
  | C_PsDiag_ExpectedFixityLevel -> "expected a fixity level (0-9)"
  | C_PsDiag_UnexpectedIndentInBinding -> "unexpected indentation in a let/where binding block"
  | C_PsDiag_UnexpectedIndentInTrait -> "unexpected indentation in trait block"
  | C_PsDiag_UnexpectedIndentInRecord -> "unexpected indentation in record block"
  | C_PsDiag_UnexpectedIndentInInstance -> "unexpected indentation in instance block"
  | C_PsDiag_UnexpectedIndentInDo -> "unexpected indentation in do block"
  | C_PsDiag_UnexpectedIndentInData -> "unexpected indentation in data block"
  | C_PsDiag_UnexpectedIndentAfterCaseAlt -> "unexpected indentation after case alternative"
  | C_PsDiag_UnexpectedEndOfInput -> "unexpected end of input"
  | C_PsDiag_PiBinderNameNotSimple -> "pi binder name must be a simple identifier"
  | C_PsDiag_LetBindingNotIndented -> "let binding is not indented enough"
  | C_PsDiag_ExprNotIndented -> "expression is not indented enough"
  | C_PsDiag_TemplateInPattern -> "string interpolation is not supported in patterns"
  | C_PsDiag_TemplateHoleEmpty -> "string interpolation ${...} must contain an expression"
  | C_PsDiag_RepeatedPatternBinder -> "pattern binds the same name more than once (non-linear patterns are not supported)"
  | C_PsDiag_ExpectedTopLevelDecl -> "expected a top-level declaration"
  | C_PsDiag_ExpectedRecordFieldPattern -> "expected a record field pattern"
  | C_PsDiag_ExpectedPattern -> "expected a pattern"
  | C_PsDiag_ExpectedLetBinding -> "expected a let binding"
  | C_PsDiag_ExpectedInstanceMethod -> "expected an instance method"
  | C_PsDiag_ExpectedIdentifier -> "expected an identifier"
  | C_PsDiag_ExpectedExpression -> "expected an expression"
  | C_PsDiag_ExpectedExportItem -> "expected an export item"
  | C_PsDiag_ExpectedEndOfExpr -> "expected end of expression"
  | C_PsDiag_ExpectedEndOfInput -> "expected end of input"
  | C_PsDiag_ExpectedCommaOrBracket -> "expected a comma or closing bracket"
  | C_PsDiag_DoStatementNotIndented -> "do block statement is not indented enough"
  | C_PsDiag_DoBlockNeedsStatement -> "do block must contain at least one statement"
  | C_PsDiag_DoBlockMustEndWithExpr -> "do block must end with an expression"
  | C_PsDiag_CaseNeedsAlternative -> "case expression must have an alternative"
  | C_PsDiag_CaseAltNotIndented -> "case alternative is not indented enough"
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexAll = (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_UnterminatedBlockComment); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_UnterminatedBlockComment); f_LexEntry_lexEntryDesc = "\229\157\151\230\179\168\233\135\138\230\156\170\233\151\173\229\144\136" }, (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_UnterminatedString); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_UnterminatedString); f_LexEntry_lexEntryDesc = "\229\173\151\231\172\166\228\184\178\229\173\151\233\157\162\233\135\143\230\156\170\233\151\173\229\144\136" }, (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_UnterminatedInterpolation); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_UnterminatedInterpolation); f_LexEntry_lexEntryDesc = "\229\173\151\231\172\166\228\184\178\230\143\146\229\128\188\230\180\158\230\156\170\233\151\173\229\144\136" }, (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_UnknownEscape); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_UnknownEscape); f_LexEntry_lexEntryDesc = "\230\156\170\231\159\165\232\189\172\228\185\137\229\186\143\229\136\151" }, (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_UnexpectedCharacter); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_UnexpectedCharacter); f_LexEntry_lexEntryDesc = "\230\151\160\230\179\149\232\175\134\229\136\171\231\154\132\229\173\151\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_LexEntry_lexEntryCode = (v_lexCode C_LexDiag_IntLiteralOutOfRange); f_LexEntry_lexEntryTemplate = (v_lexTemplate C_LexDiag_IntLiteralOutOfRange); f_LexEntry_lexEntryDesc = "\230\149\180\230\149\176\229\173\151\233\157\162\233\135\143\232\182\133\229\135\186\232\140\131\229\155\180" }, B_dData_dList.C_List_Nil))))))))))))

# 291 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psAll = (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_CaseAltNotIndented); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_CaseAltNotIndented); f_PsEntry_psEntryDesc = "case \229\136\134\230\148\175\231\188\169\232\191\155\228\184\141\232\182\179" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_CaseNeedsAlternative); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_CaseNeedsAlternative); f_PsEntry_psEntryDesc = "case \231\188\186\229\176\145\229\136\134\230\148\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_DoBlockMustEndWithExpr); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_DoBlockMustEndWithExpr); f_PsEntry_psEntryDesc = "do \229\157\151\229\191\133\233\161\187\228\187\165\232\161\168\232\190\190\229\188\143\231\187\147\229\176\190" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_DoBlockNeedsStatement); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_DoBlockNeedsStatement); f_PsEntry_psEntryDesc = "do \229\157\151\232\135\179\229\176\145\233\156\128\232\166\129\228\184\128\230\157\161\232\175\173\229\143\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_DoStatementNotIndented); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_DoStatementNotIndented); f_PsEntry_psEntryDesc = "do \232\175\173\229\143\165\231\188\169\232\191\155\228\184\141\232\182\179" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedCommaOrBracket); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedCommaOrBracket); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\233\128\151\229\143\183\230\136\150\229\143\179\230\150\185\230\139\172\229\143\183" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedEndOfInput); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedEndOfInput); f_PsEntry_psEntryDesc = "\232\190\147\229\133\165\229\144\142\230\156\137\229\164\154\228\189\153\229\134\133\229\174\185" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedEndOfExpr); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedEndOfExpr); f_PsEntry_psEntryDesc = "\232\161\168\232\190\190\229\188\143\229\144\142\230\156\137\229\164\154\228\189\153\229\134\133\229\174\185" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedExportItem); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedExportItem); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\229\175\188\229\135\186\233\161\185" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedExpression); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedExpression); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\232\161\168\232\190\190\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedIdentifier); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedIdentifier); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\230\160\135\232\175\134\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedInstanceMethod); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedInstanceMethod); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155 instance \230\150\185\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedLetBinding); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedLetBinding); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155 let \231\187\145\229\174\154" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedPattern); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedPattern); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\230\168\161\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedRecordFieldPattern); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedRecordFieldPattern); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155 record \229\173\151\230\174\181\230\168\161\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedTopLevelDecl); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedTopLevelDecl); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\233\161\182\229\177\130\229\163\176\230\152\142" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_RepeatedPatternBinder); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_RepeatedPatternBinder); f_PsEntry_psEntryDesc = "\230\168\161\229\188\143\229\134\133\233\135\141\229\164\141\231\187\145\229\174\154\229\144\140\229\144\141\239\188\136\228\184\141\230\148\175\230\140\129\233\157\158\231\186\191\230\128\167\230\160\188\239\188\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_TemplateHoleEmpty); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_TemplateHoleEmpty); f_PsEntry_psEntryDesc = "\230\143\146\229\128\188\230\180\158\231\188\186\229\176\145\232\161\168\232\190\190\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_TemplateInPattern); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_TemplateInPattern); f_PsEntry_psEntryDesc = "\230\168\161\229\188\143\233\135\140\228\184\141\230\148\175\230\140\129\229\173\151\231\172\166\228\184\178\230\143\146\229\128\188" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExprNotIndented); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExprNotIndented); f_PsEntry_psEntryDesc = "\232\161\168\232\190\190\229\188\143\231\188\169\232\191\155\228\184\141\232\182\179" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_LetBindingNotIndented); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_LetBindingNotIndented); f_PsEntry_psEntryDesc = "let \231\187\145\229\174\154\231\188\169\232\191\155\228\184\141\232\182\179" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_PiBinderNameNotSimple); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_PiBinderNameNotSimple); f_PsEntry_psEntryDesc = "pi \231\187\145\229\174\154\229\144\141\229\191\133\233\161\187\230\152\175\231\174\128\229\141\149\230\160\135\232\175\134\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedEndOfInput); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedEndOfInput); f_PsEntry_psEntryDesc = "\232\190\147\229\133\165\230\132\143\229\164\150\231\187\147\230\157\159" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentAfterCaseAlt); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentAfterCaseAlt); f_PsEntry_psEntryDesc = "case \229\136\134\230\148\175\229\144\142\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInData); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInData); f_PsEntry_psEntryDesc = "data \229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInDo); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInDo); f_PsEntry_psEntryDesc = "do \229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInInstance); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInInstance); f_PsEntry_psEntryDesc = "instance \229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInRecord); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInRecord); f_PsEntry_psEntryDesc = "record \229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInTrait); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInTrait); f_PsEntry_psEntryDesc = "trait \229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_UnexpectedIndentInBinding); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_UnexpectedIndentInBinding); f_PsEntry_psEntryDesc = "let/where \231\187\145\229\174\154\229\157\151\229\134\133\229\135\186\231\142\176\230\132\143\229\164\150\231\188\169\232\191\155" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_ExpectedDeclAtColumn (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_ExpectedDeclAtColumn (""))); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\229\156\168\232\175\165\229\136\151\229\135\186\231\142\176\228\184\128\228\184\170\229\163\176\230\152\142" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_ExpectedToken (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_ExpectedToken (""))); f_PsEntry_psEntryDesc = "\230\156\159\230\156\155\230\140\135\229\174\154\231\172\166\229\143\183\230\136\150\229\133\179\233\148\174\229\173\151" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_WhereSigBeforeClause (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_WhereSigBeforeClause (""))); f_PsEntry_psEntryDesc = "\231\187\145\229\174\154\231\173\190\229\144\141\229\191\133\233\161\187\229\134\153\229\156\168\229\175\185\229\186\148\229\173\144\229\143\165\228\185\139\229\137\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_WhereSigDuplicate (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_WhereSigDuplicate (""))); f_PsEntry_psEntryDesc = "\233\135\141\229\164\141\231\154\132\231\187\145\229\174\154\231\173\190\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_WhereSigMultiClause (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_WhereSigMultiClause (""))); f_PsEntry_psEntryDesc = "\231\187\145\229\174\154\230\156\137\229\164\154\228\184\170\229\173\144\229\143\165\239\188\140\231\173\190\229\144\141\229\143\170\232\131\189\230\160\135\230\179\168\228\184\128\228\184\170" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_WhereSigNoDef (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_WhereSigNoDef (""))); f_PsEntry_psEntryDesc = "\231\187\145\229\174\154\231\173\190\229\144\141\230\151\160\229\175\185\229\186\148\229\174\154\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ExpectedFixityLevel); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ExpectedFixityLevel); f_PsEntry_psEntryDesc = "fixity \229\163\176\230\152\142\231\188\186\229\176\145\228\188\152\229\133\136\231\186\167" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_FixityLevelRange); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_FixityLevelRange); f_PsEntry_psEntryDesc = "fixity \228\188\152\229\133\136\231\186\167\229\191\133\233\161\187\229\156\168 0 \229\136\176 9 \228\185\139\233\151\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_ConstraintUnsupportedHere); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_ConstraintUnsupportedHere); f_PsEntry_psEntryDesc = "trait \231\186\166\230\157\159\229\143\170\230\148\175\230\140\129\229\156\168\233\161\182\229\177\130\231\173\190\229\144\141\228\184\142 trait \229\164\180\228\184\138" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_HandleClauseNeedsCtor); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_HandleClauseNeedsCtor); f_PsEntry_psEntryDesc = "handle \230\147\141\228\189\156\229\173\144\229\143\165\229\191\133\233\161\187\230\152\175\230\158\132\233\128\160\229\173\144\230\168\161\229\188\143\229\144\142\230\142\165\231\187\173\229\187\182\231\187\145\229\174\154" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_HandleClauseNotIndented); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_HandleClauseNotIndented); f_PsEntry_psEntryDesc = "handle \229\173\144\229\143\165\231\188\169\232\191\155\228\184\141\232\182\179" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_HandleNeedsOpClause); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_HandleNeedsOpClause); f_PsEntry_psEntryDesc = "handle \229\157\151\232\135\179\229\176\145\233\156\128\232\166\129\228\184\128\228\184\170\230\147\141\228\189\156\229\173\144\229\143\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode C_PsDiag_HandleReturnMisplaced); f_PsEntry_psEntryTemplate = (v_psTemplate C_PsDiag_HandleReturnMisplaced); f_PsEntry_psEntryDesc = "handle return \229\173\144\229\143\165\229\191\133\233\161\187\229\156\168\230\156\128\229\137\141\228\184\148\229\143\170\229\135\186\231\142\176\228\184\128\230\172\161" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_HandleContinuationNameMismatch ("", ""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_HandleContinuationNameMismatch ("", ""))); f_PsEntry_psEntryDesc = "handle \229\144\132\230\147\141\228\189\156\229\173\144\229\143\165\231\154\132\231\187\173\229\187\182\231\187\145\229\174\154\229\144\141\229\191\133\233\161\187\228\184\128\232\135\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_ClauseNotAdjacent (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_ClauseNotAdjacent (""))); f_PsEntry_psEntryDesc = "\233\161\182\229\177\130\229\144\140\229\144\141\229\173\144\229\143\165\229\191\133\233\161\187\232\191\158\231\187\173\239\188\136\228\184\173\233\151\180\228\184\141\232\131\189\230\156\137\229\136\171\231\154\132\229\163\176\230\152\142 / \231\173\190\229\144\141 / fixity\239\188\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_DefinitionDuplicate (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_DefinitionDuplicate (""))); f_PsEntry_psEntryDesc = "\233\155\182\229\143\130\229\174\154\228\185\137\229\143\170\232\131\189\230\156\137\228\184\128\230\157\161\229\173\144\229\143\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_PsEntry_psEntryCode = (v_psCode (C_PsDiag_ClauseShadowed (""))); f_PsEntry_psEntryTemplate = (v_psTemplate (C_PsDiag_ClauseShadowed (""))); f_PsEntry_psEntryDesc = "\229\173\144\229\143\165\232\162\171\229\137\141\233\157\162\231\154\132\229\173\144\229\143\165\229\174\140\229\133\168\232\166\134\231\155\150" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 450 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexMsg = (fun (dtb_u_u32 : t_LexDiag) (dtb_u_u33 : string B_dData_dVec.t_Vec) -> (((((Base_dDiagnostics_dCommon.v_mkDiag Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLex) Base_dDiag.C_Category_CatSyntax) (v_lexCode dtb_u_u32)) ((Base_dDiagnostics_dCommon.v_diagBody (v_lexTemplate dtb_u_u32)) dtb_u_u33)))

# 453 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psMsg = (fun (dtb_u_u35 : t_PsDiag) (dtb_u_u36 : string B_dData_dVec.t_Vec) -> (((((Base_dDiagnostics_dCommon.v_mkDiag Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhParse) Base_dDiag.C_Category_CatSyntax) (v_psCode dtb_u_u35)) ((Base_dDiagnostics_dCommon.v_diagBody (v_psTemplate dtb_u_u35)) dtb_u_u36)))

# 457 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexErrAt = (fun (dtb_u_u39 : Base_dSource.t_Span) (dtb_u_u41 : t_LexDiag) (dtb_u_u42 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u39)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_lexMsg dtb_u_u41) dtb_u_u42)))))

# 461 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psErrAt = (fun (dtb_u_u45 : Base_dSource.t_Span) (dtb_u_u47 : t_PsDiag) (dtb_u_u48 : string B_dData_dVec.t_Vec) -> (match dtb_u_u47 with
  | C_PsDiag_ExpectedToken (dtb_u_u49) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u45)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldExpected (dtb_u_u49))) ((v_psMsg dtb_u_u47) dtb_u_u48)))))
  | _ -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u45)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_psMsg dtb_u_u47) dtb_u_u48))))
))

# 470 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexErr0At = (fun (dtb_u_u51 : Base_dSource.t_Span) (dtb_u_u52 : t_LexDiag) -> (((v_lexErrAt dtb_u_u51) dtb_u_u52) B_dData_dVec.C_Vec_Nil))

# 474 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psErr0At = (fun (dtb_u_u54 : Base_dSource.t_Span) (dtb_u_u55 : t_PsDiag) -> (((v_psErrAt dtb_u_u54) dtb_u_u55) B_dData_dVec.C_Vec_Nil))

# 478 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psErr1At = (fun (dtb_u_u57 : Base_dSource.t_Span) (dtb_u_u58 : t_PsDiag) (dtb_u_u59 : string) -> (((v_psErrAt dtb_u_u57) dtb_u_u58) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u59, B_dData_dVec.C_Vec_Nil))))

# 258 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexEntryCode = (fun (dtb_u_u60 : t_LexEntry) -> (match dtb_u_u60 with
  | { f_LexEntry_lexEntryCode = dtb_u_u61; f_LexEntry_lexEntryTemplate = dtb_u_u62; f_LexEntry_lexEntryDesc = dtb_u_u63 } -> dtb_u_u61
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexEntryTemplate = (fun (dtb_u_u64 : t_LexEntry) -> (match dtb_u_u64 with
  | { f_LexEntry_lexEntryCode = dtb_u_u65; f_LexEntry_lexEntryTemplate = dtb_u_u66; f_LexEntry_lexEntryDesc = dtb_u_u67 } -> dtb_u_u66
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_lexEntryDesc = (fun (dtb_u_u68 : t_LexEntry) -> (match dtb_u_u68 with
  | { f_LexEntry_lexEntryCode = dtb_u_u69; f_LexEntry_lexEntryTemplate = dtb_u_u70; f_LexEntry_lexEntryDesc = dtb_u_u71 } -> dtb_u_u71
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psEntryCode = (fun (dtb_u_u72 : t_PsEntry) -> (match dtb_u_u72 with
  | { f_PsEntry_psEntryCode = dtb_u_u73; f_PsEntry_psEntryTemplate = dtb_u_u74; f_PsEntry_psEntryDesc = dtb_u_u75 } -> dtb_u_u73
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psEntryTemplate = (fun (dtb_u_u76 : t_PsEntry) -> (match dtb_u_u76 with
  | { f_PsEntry_psEntryCode = dtb_u_u77; f_PsEntry_psEntryTemplate = dtb_u_u78; f_PsEntry_psEntryDesc = dtb_u_u79 } -> dtb_u_u78
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Base/Diagnostics/Frontend.vuna"
let v_psEntryDesc = (fun (dtb_u_u80 : t_PsEntry) -> (match dtb_u_u80 with
  | { f_PsEntry_psEntryCode = dtb_u_u81; f_PsEntry_psEntryTemplate = dtb_u_u82; f_PsEntry_psEntryDesc = dtb_u_u83 } -> dtb_u_u83
  | _ -> failwith "DT: impossible branch"
))
