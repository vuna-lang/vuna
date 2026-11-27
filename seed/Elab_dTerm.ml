open Vuna_runtime
# 22 "Vuna/Compiler/Elab/Term.vuna"
let v_deferDictBinder = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_deferDictBinderFuel 64) globals) ctx) ec) dom) clo) args) sp) B_dData_dMaybe.C_Maybe_Nothing))

# 26 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeCmpApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeCmpAppFuel 256) a1) a2) a3) a4) a5) a6))

# 29 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeEqApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeEqAppFuel 256) a1) a2) a3) a4) a5) a6))

# 32 "Vuna/Compiler/Elab/Term.vuna"
let v_checkTypeInfer = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeInferFuel ((Frontend_dAstQuery.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 35 "Vuna/Compiler/Elab/Term.vuna"
let v_checkByInfer = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkByInferFuel ((Frontend_dAstQuery.v_exprBudget 256) a4)) a1) a2) a3) a4) a5))

# 38 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetIgnored = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Frontend_dAst.t_Expr) (a7 : bool) (a8 : Base_dSource.t_Span) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferLetIgnoredFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 41 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetBound = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr) (a6 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Frontend_dAst.t_Expr) (a8 : bool) (a9 : Base_dSource.t_Span) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_inferLetBoundFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 44 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLet = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Binding B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : bool) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 47 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : bool) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 50 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppCtor = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppCtorFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 53 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppUnderType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 56 "Vuna/Compiler/Elab/Term.vuna"
let v_checkApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 59 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppGeneral = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppGeneralFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 62 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeOpApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeOpAppFuel 256) a1) a2) a3) a4) a5) a6))

# 65 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeBoolApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeBoolAppFuel 256) a1) a2) a3) a4) a5) a6))

# 68 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLam = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkLamFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 71 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetOne = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (a5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Frontend_dAst.t_Expr) (a7 : bool) (a8 : Core_dTerm.t_Value) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_checkLetOneFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 74 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLet = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Binding B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : bool) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 77 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : bool) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 80 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitBoundVar = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : string) (a7 : Frontend_dAst.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Base_dSource.t_Span) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkLitBoundVarFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 84 "Vuna/Compiler/Elab/Term.vuna"
let v_litAltStep = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : Core_dTerm.t_Term) (a7 : Frontend_dAst.t_Expr) (a8 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_Value) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_litAltStepFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 87 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitCaseFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 90 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 93 "Vuna/Compiler/Elab/Term.vuna"
let v_checkBoolCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkBoolCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 96 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_boolAltFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 99 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAltGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) (a8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (((((((((Elab_dTerm_dImpl.v_boolAltGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 102 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCatchAll = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Elab_dTypes.t_DtData) (a6 : Core_dTerm.t_Value B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (a10 : Frontend_dAst.t_Expr) (a11 : string) (a12 : Base_dSource.t_Span) -> (((((((((((((Elab_dTerm_dImpl.v_elabCatchAllFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11) a12))

# 106 "Vuna/Compiler/Elab/Term.vuna"
let v_checkE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkEFuel ((Frontend_dAstQuery.v_exprBudget 256) a4)) a1) a2) a3) a4) a5))

# 109 "Vuna/Compiler/Elab/Term.vuna"
let v_inferPi = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : bool) (a6 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (a7 : Frontend_dAst.t_Expr) (a8 : Frontend_dAst.t_Expr) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferPiFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 112 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAnn = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAnnFuel 256) a1) a2) a3) a4) a5) a6))

# 115 "Vuna/Compiler/Elab/Term.vuna"
let v_checkType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeFuel ((Frontend_dAstQuery.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 118 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppUnderType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6))

# 121 "Vuna/Compiler/Elab/Term.vuna"
let v_inferArgs = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferArgsFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 124 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDom = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ec) (a3 : Elab_dTypes.t_Ctx) (a4 : Core_dTerm.t_Value) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_constrainDictDomFuel 256) a1) a2) a3) a4) a5) a6))

# 127 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDomGoK = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ec) (a3 : Elab_dTypes.t_Ctx) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) (a6 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_constrainDictDomGoKFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 130 "Vuna/Compiler/Elab/Term.vuna"
let v_inferApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 133 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneral = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 136 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneralGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralGoFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 139 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCondBool = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : Base_dSource.t_Span) -> ((((((Elab_dTerm_dImpl.v_checkCondBoolFuel 256) a1) a2) a3) a4) a5))

# 142 "Vuna/Compiler/Elab/Term.vuna"
let v_inferE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_inferEFuel ((Frontend_dAstQuery.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 145 "Vuna/Compiler/Elab/Term.vuna"
let v_inferCaseE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferCaseEFuel 256) a1) a2) a3) a4) a5) a6))

# 148 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Expr) (a5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 151 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseFam = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : Core_dTerm.t_Value) (a6 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkCaseFamFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 154 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseOf = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : Core_dTerm.t_Value) (a6 : string) (a7 : Core_dTerm.t_Value B_dData_dList.t_List) (a8 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_Value) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkCaseOfFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 157 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCaseAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Elab_dTypes.t_DtData) (a6 : Core_dTerm.t_Value B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Core_dTerm.t_Value) (a9 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a10 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (((((((((((Elab_dTerm_dImpl.v_elabCaseAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 160 "Vuna/Compiler/Elab/Term.vuna"
let v_elabConAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Elab_dTypes.t_DtData) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) (a8 : string) (a9 : Frontend_dAst.t_Pat B_dData_dList.t_List) (a10 : Base_dSource.t_Span) (a11 : Frontend_dAst.t_Expr) -> ((((((((((((Elab_dTerm_dImpl.v_elabConAltFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))

# 165 "Vuna/Compiler/Elab/Term.vuna"
let v_resolveOverFunPats = (fun (a1 : Elab_dTypes.t_Ec) (a2 : Elab_dTypes.t_Ctx) (a3 : Core_dTerm.t_Value) (a4 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((Elab_dTerm_dImpl.v_resolveOverFunPats a1) a2) a3) a4))
