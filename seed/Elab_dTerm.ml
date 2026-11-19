open Vuna_runtime
# 21 "Vuna/Compiler/Elab/Term.vuna"
let v_deferDictBinder = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_deferDictBinderFuel 64) globals) ctx) ec) dom) clo) args) sp) B_dData_dMaybe.C_Maybe_Nothing))

# 25 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeCmpApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeCmpAppFuel 256) a1) a2) a3) a4) a5) a6))

# 28 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeEqApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeEqAppFuel 256) a1) a2) a3) a4) a5) a6))

# 31 "Vuna/Compiler/Elab/Term.vuna"
let v_checkTypeInfer = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeInferFuel ((Frontend_dRast.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 34 "Vuna/Compiler/Elab/Term.vuna"
let v_checkByInfer = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkByInferFuel ((Frontend_dRast.v_exprBudget 256) a4)) a1) a2) a3) a4) a5))

# 37 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetIgnored = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Frontend_dRast.t_Expr) (a7 : bool) (a8 : Base_dSource.t_Span) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferLetIgnoredFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 40 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetBound = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr) (a6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Frontend_dRast.t_Expr) (a8 : bool) (a9 : Base_dSource.t_Span) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_inferLetBoundFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 43 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLet = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : bool) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 46 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : bool) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 49 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppCtor = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppCtorFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 52 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppUnderType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 55 "Vuna/Compiler/Elab/Term.vuna"
let v_checkApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 58 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppGeneral = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppGeneralFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 61 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeOpApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeOpAppFuel 256) a1) a2) a3) a4) a5) a6))

# 64 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeBoolApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeBoolAppFuel 256) a1) a2) a3) a4) a5) a6))

# 67 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLam = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkLamFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 70 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetOne = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (a5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Frontend_dRast.t_Expr) (a7 : bool) (a8 : Core_dTerm.t_Value) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_checkLetOneFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 73 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLet = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : bool) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 76 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : bool) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 79 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitBoundVar = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : string) (a7 : Frontend_dRast.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Base_dSource.t_Span) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkLitBoundVarFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 83 "Vuna/Compiler/Elab/Term.vuna"
let v_litAltStep = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : Core_dTerm.t_Term) (a7 : Frontend_dRast.t_Expr) (a8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_Value) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_litAltStepFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 86 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitCaseFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 89 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : string) (a6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 92 "Vuna/Compiler/Elab/Term.vuna"
let v_checkBoolCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkBoolCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 95 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_boolAltFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 98 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAltGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) (a8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (((((((((Elab_dTerm_dImpl.v_boolAltGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 101 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCatchAll = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Elab_dTypes.t_DtData) (a6 : Core_dTerm.t_Value B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (a10 : Frontend_dRast.t_Expr) (a11 : string) (a12 : Base_dSource.t_Span) -> (((((((((((((Elab_dTerm_dImpl.v_elabCatchAllFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11) a12))

# 105 "Vuna/Compiler/Elab/Term.vuna"
let v_checkE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkEFuel ((Frontend_dRast.v_exprBudget 256) a4)) a1) a2) a3) a4) a5))

# 108 "Vuna/Compiler/Elab/Term.vuna"
let v_inferPi = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : bool) (a6 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (a7 : Frontend_dRast.t_Expr) (a8 : Frontend_dRast.t_Expr) (a9 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferPiFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))

# 111 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAnn = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAnnFuel 256) a1) a2) a3) a4) a5) a6))

# 114 "Vuna/Compiler/Elab/Term.vuna"
let v_checkType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeFuel ((Frontend_dRast.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 117 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppUnderType = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : string) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6))

# 120 "Vuna/Compiler/Elab/Term.vuna"
let v_inferArgs = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferArgsFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 123 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDom = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ec) (a3 : Elab_dTypes.t_Ctx) (a4 : Core_dTerm.t_Value) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_constrainDictDomFuel 256) a1) a2) a3) a4) a5) a6))

# 126 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDomGoK = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ec) (a3 : Elab_dTypes.t_Ctx) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) (a6 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_constrainDictDomGoKFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 129 "Vuna/Compiler/Elab/Term.vuna"
let v_inferApp = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 132 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneral = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 135 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneralGo = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralGoFuel 256) a1) a2) a3) a4) a5) a6) B_dData_dMaybe.C_Maybe_Nothing))

# 138 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCondBool = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : Base_dSource.t_Span) -> ((((((Elab_dTerm_dImpl.v_checkCondBoolFuel 256) a1) a2) a3) a4) a5))

# 141 "Vuna/Compiler/Elab/Term.vuna"
let v_inferE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) -> (((((Elab_dTerm_dImpl.v_inferEFuel ((Frontend_dRast.v_exprBudget 256) a4)) a1) a2) a3) a4))

# 144 "Vuna/Compiler/Elab/Term.vuna"
let v_inferCaseE = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferCaseEFuel 256) a1) a2) a3) a4) a5) a6))

# 147 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Expr) (a5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))

# 150 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseFam = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : Core_dTerm.t_Value) (a6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkCaseFamFuel 256) a1) a2) a3) a4) a5) a6) a7) a8))

# 153 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseOf = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Term) (a5 : Core_dTerm.t_Value) (a6 : string) (a7 : Core_dTerm.t_Value B_dData_dList.t_List) (a8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a9 : Core_dTerm.t_Value) (a10 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkCaseOfFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 156 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCaseAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Value) (a5 : Elab_dTypes.t_DtData) (a6 : Core_dTerm.t_Value B_dData_dList.t_List) (a7 : Core_dTerm.t_Value) (a8 : Core_dTerm.t_Value) (a9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (a10 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (((((((((((Elab_dTerm_dImpl.v_elabCaseAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 159 "Vuna/Compiler/Elab/Term.vuna"
let v_elabConAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Elab_dTypes.t_DtData) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) (a8 : string) (a9 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a10 : Base_dSource.t_Span) (a11 : Frontend_dRast.t_Expr) -> ((((((((((((Elab_dTerm_dImpl.v_elabConAltFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))

# 164 "Vuna/Compiler/Elab/Term.vuna"
let v_resolveOverFunPats = (fun (a1 : Elab_dTypes.t_Ec) (a2 : Elab_dTypes.t_Ctx) (a3 : Core_dTerm.t_Value) (a4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((Elab_dTerm_dImpl.v_resolveOverFunPats a1) a2) a3) a4))
