open Vuna_runtime
# 22 "Vuna/Compiler/Elab/Term.vuna"
let v_deferDictBinder = (fun (dtb_u_u1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2 : Elab_dTypes.t_Ctx) (dtb_u_u3 : Elab_dTypes.t_Ec) (dtb_u_u4 : Core_dTerm.t_Value) (dtb_u_u5 : Core_dTerm.t_Closure) (dtb_u_u6 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u7 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_deferDictBinderFuel 64) dtb_u_u1) dtb_u_u2) dtb_u_u3) dtb_u_u4) dtb_u_u5) dtb_u_u6) dtb_u_u7) B_dData_dMaybe.C_Maybe_Nothing))

# 26 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeCmpApp = (fun (dtb_u_u8 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u9 : Elab_dTypes.t_Ctx) (dtb_u_u10 : Elab_dTypes.t_Ec) (dtb_u_u11 : string) (dtb_u_u12 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u13 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeCmpAppFuel 256) dtb_u_u8) dtb_u_u9) dtb_u_u10) dtb_u_u11) dtb_u_u12) dtb_u_u13))

# 29 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeEqApp = (fun (dtb_u_u14 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u15 : Elab_dTypes.t_Ctx) (dtb_u_u16 : Elab_dTypes.t_Ec) (dtb_u_u17 : string) (dtb_u_u18 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u19 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeEqAppFuel 256) dtb_u_u14) dtb_u_u15) dtb_u_u16) dtb_u_u17) dtb_u_u18) dtb_u_u19))

# 32 "Vuna/Compiler/Elab/Term.vuna"
let v_checkTypeInfer = (fun (dtb_u_u20 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u21 : Elab_dTypes.t_Ctx) (dtb_u_u22 : Elab_dTypes.t_Ec) (dtb_u_u23 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeInferFuel ((Frontend_dAstQuery.v_exprBudget 256) dtb_u_u23)) dtb_u_u20) dtb_u_u21) dtb_u_u22) dtb_u_u23))

# 35 "Vuna/Compiler/Elab/Term.vuna"
let v_checkByInfer = (fun (dtb_u_u24 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u25 : Elab_dTypes.t_Ctx) (dtb_u_u26 : Elab_dTypes.t_Ec) (dtb_u_u27 : Frontend_dAst.t_Expr) (dtb_u_u28 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkByInferFuel ((Frontend_dAstQuery.v_exprBudget 256) dtb_u_u27)) dtb_u_u24) dtb_u_u25) dtb_u_u26) dtb_u_u27) dtb_u_u28))

# 38 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetIgnored = (fun (dtb_u_u29 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u30 : Elab_dTypes.t_Ctx) (dtb_u_u31 : Elab_dTypes.t_Ec) (dtb_u_u32 : Frontend_dAst.t_Expr) (dtb_u_u33 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u34 : Frontend_dAst.t_Expr) (dtb_u_u35 : bool) (dtb_u_u36 : Base_dSource.t_Span) (dtb_u_u37 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferLetIgnoredFuel 256) dtb_u_u29) dtb_u_u30) dtb_u_u31) dtb_u_u32) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u37))

# 41 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetBound = (fun (dtb_u_u38 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u39 : Elab_dTypes.t_Ctx) (dtb_u_u40 : Elab_dTypes.t_Ec) (dtb_u_u41 : string) (dtb_u_u42 : Frontend_dAst.t_Expr) (dtb_u_u43 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u44 : Frontend_dAst.t_Expr) (dtb_u_u45 : bool) (dtb_u_u46 : Base_dSource.t_Span) (dtb_u_u47 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_inferLetBoundFuel 256) dtb_u_u38) dtb_u_u39) dtb_u_u40) dtb_u_u41) dtb_u_u42) dtb_u_u43) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u47))

# 44 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLet = (fun (dtb_u_u48 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u49 : Elab_dTypes.t_Ctx) (dtb_u_u50 : Elab_dTypes.t_Ec) (dtb_u_u51 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u52 : Frontend_dAst.t_Expr) (dtb_u_u53 : bool) (dtb_u_u54 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetFuel 256) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) dtb_u_u53) dtb_u_u54))

# 47 "Vuna/Compiler/Elab/Term.vuna"
let v_inferLetGo = (fun (dtb_u_u55 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u56 : Elab_dTypes.t_Ctx) (dtb_u_u57 : Elab_dTypes.t_Ec) (dtb_u_u58 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u59 : Frontend_dAst.t_Expr) (dtb_u_u60 : bool) (dtb_u_u61 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferLetGoFuel 256) dtb_u_u55) dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u61))

# 50 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppCtor = (fun (dtb_u_u62 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u63 : Elab_dTypes.t_Ctx) (dtb_u_u64 : Elab_dTypes.t_Ec) (dtb_u_u65 : string) (dtb_u_u66 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u67 : Core_dTerm.t_Value) (dtb_u_u68 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppCtorFuel 256) dtb_u_u62) dtb_u_u63) dtb_u_u64) dtb_u_u65) dtb_u_u66) dtb_u_u67) dtb_u_u68))

# 53 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppUnderType = (fun (dtb_u_u69 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u70 : Elab_dTypes.t_Ctx) (dtb_u_u71 : Elab_dTypes.t_Ec) (dtb_u_u72 : string) (dtb_u_u73 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u74 : Core_dTerm.t_Value) (dtb_u_u75 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppUnderTypeFuel 256) dtb_u_u69) dtb_u_u70) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75))

# 56 "Vuna/Compiler/Elab/Term.vuna"
let v_checkApp = (fun (dtb_u_u76 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u77 : Elab_dTypes.t_Ctx) (dtb_u_u78 : Elab_dTypes.t_Ec) (dtb_u_u79 : Frontend_dAst.t_Expr) (dtb_u_u80 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u81 : Core_dTerm.t_Value) (dtb_u_u82 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppFuel 256) dtb_u_u76) dtb_u_u77) dtb_u_u78) dtb_u_u79) dtb_u_u80) dtb_u_u81) dtb_u_u82))

# 59 "Vuna/Compiler/Elab/Term.vuna"
let v_checkAppGeneral = (fun (dtb_u_u83 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u84 : Elab_dTypes.t_Ctx) (dtb_u_u85 : Elab_dTypes.t_Ec) (dtb_u_u86 : Frontend_dAst.t_Expr) (dtb_u_u87 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u88 : Core_dTerm.t_Value) (dtb_u_u89 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkAppGeneralFuel 256) dtb_u_u83) dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u87) dtb_u_u88) dtb_u_u89))

# 62 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeOpApp = (fun (dtb_u_u90 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u91 : Elab_dTypes.t_Ctx) (dtb_u_u92 : Elab_dTypes.t_Ec) (dtb_u_u93 : string) (dtb_u_u94 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u95 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeOpAppFuel 256) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95))

# 65 "Vuna/Compiler/Elab/Term.vuna"
let v_specializeBoolApp = (fun (dtb_u_u96 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u97 : Elab_dTypes.t_Ctx) (dtb_u_u98 : Elab_dTypes.t_Ec) (dtb_u_u99 : string) (dtb_u_u100 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u101 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_specializeBoolAppFuel 256) dtb_u_u96) dtb_u_u97) dtb_u_u98) dtb_u_u99) dtb_u_u100) dtb_u_u101))

# 68 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLam = (fun (dtb_u_u102 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u103 : Elab_dTypes.t_Ctx) (dtb_u_u104 : Elab_dTypes.t_Ec) (dtb_u_u105 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u106 : Frontend_dAst.t_Expr) (dtb_u_u107 : Core_dTerm.t_Value) (dtb_u_u108 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkLamFuel 256) dtb_u_u102) dtb_u_u103) dtb_u_u104) dtb_u_u105) dtb_u_u106) dtb_u_u107) dtb_u_u108))

# 71 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetOne = (fun (dtb_u_u109 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u110 : Elab_dTypes.t_Ctx) (dtb_u_u111 : Elab_dTypes.t_Ec) (dtb_u_u112 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (dtb_u_u113 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u114 : Frontend_dAst.t_Expr) (dtb_u_u115 : bool) (dtb_u_u116 : Core_dTerm.t_Value) (dtb_u_u117 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_checkLetOneFuel 256) dtb_u_u109) dtb_u_u110) dtb_u_u111) dtb_u_u112) dtb_u_u113) dtb_u_u114) dtb_u_u115) dtb_u_u116) dtb_u_u117))

# 74 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLet = (fun (dtb_u_u118 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u119 : Elab_dTypes.t_Ctx) (dtb_u_u120 : Elab_dTypes.t_Ec) (dtb_u_u121 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u122 : Frontend_dAst.t_Expr) (dtb_u_u123 : bool) (dtb_u_u124 : Core_dTerm.t_Value) (dtb_u_u125 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetFuel 256) dtb_u_u118) dtb_u_u119) dtb_u_u120) dtb_u_u121) dtb_u_u122) dtb_u_u123) dtb_u_u124) dtb_u_u125))

# 77 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLetGo = (fun (dtb_u_u126 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u127 : Elab_dTypes.t_Ctx) (dtb_u_u128 : Elab_dTypes.t_Ec) (dtb_u_u129 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u130 : Frontend_dAst.t_Expr) (dtb_u_u131 : bool) (dtb_u_u132 : Core_dTerm.t_Value) (dtb_u_u133 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLetGoFuel 256) dtb_u_u126) dtb_u_u127) dtb_u_u128) dtb_u_u129) dtb_u_u130) dtb_u_u131) dtb_u_u132) dtb_u_u133))

# 80 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitBoundVar = (fun (dtb_u_u134 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u135 : Elab_dTypes.t_Ctx) (dtb_u_u136 : Elab_dTypes.t_Ec) (dtb_u_u137 : Core_dTerm.t_Term) (dtb_u_u138 : string) (dtb_u_u139 : string) (dtb_u_u140 : Frontend_dAst.t_Expr) (dtb_u_u141 : Core_dTerm.t_Value) (dtb_u_u142 : Base_dSource.t_Span) (dtb_u_u143 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkLitBoundVarFuel 256) dtb_u_u134) dtb_u_u135) dtb_u_u136) dtb_u_u137) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143))

# 84 "Vuna/Compiler/Elab/Term.vuna"
let v_litAltStep = (fun (dtb_u_u144 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u145 : Elab_dTypes.t_Ctx) (dtb_u_u146 : Elab_dTypes.t_Ec) (dtb_u_u147 : Core_dTerm.t_Term) (dtb_u_u148 : string) (dtb_u_u149 : Core_dTerm.t_Term) (dtb_u_u150 : Frontend_dAst.t_Expr) (dtb_u_u151 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u152 : Core_dTerm.t_Value) (dtb_u_u153 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_litAltStepFuel 256) dtb_u_u144) dtb_u_u145) dtb_u_u146) dtb_u_u147) dtb_u_u148) dtb_u_u149) dtb_u_u150) dtb_u_u151) dtb_u_u152) dtb_u_u153))

# 87 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitCase = (fun (dtb_u_u154 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u155 : Elab_dTypes.t_Ctx) (dtb_u_u156 : Elab_dTypes.t_Ec) (dtb_u_u157 : Core_dTerm.t_Term) (dtb_u_u158 : string) (dtb_u_u159 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u160 : Core_dTerm.t_Value) (dtb_u_u161 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitCaseFuel 256) dtb_u_u154) dtb_u_u155) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161))

# 90 "Vuna/Compiler/Elab/Term.vuna"
let v_checkLitAlts = (fun (dtb_u_u162 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u163 : Elab_dTypes.t_Ctx) (dtb_u_u164 : Elab_dTypes.t_Ec) (dtb_u_u165 : Core_dTerm.t_Term) (dtb_u_u166 : string) (dtb_u_u167 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u168 : Core_dTerm.t_Value) (dtb_u_u169 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkLitAltsFuel 256) dtb_u_u162) dtb_u_u163) dtb_u_u164) dtb_u_u165) dtb_u_u166) dtb_u_u167) dtb_u_u168) dtb_u_u169))

# 93 "Vuna/Compiler/Elab/Term.vuna"
let v_checkBoolCase = (fun (dtb_u_u170 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u171 : Elab_dTypes.t_Ctx) (dtb_u_u172 : Elab_dTypes.t_Ec) (dtb_u_u173 : Core_dTerm.t_Term) (dtb_u_u174 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u175 : Core_dTerm.t_Value) (dtb_u_u176 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkBoolCaseFuel 256) dtb_u_u170) dtb_u_u171) dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u176))

# 96 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAlt = (fun (dtb_u_u177 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u178 : Elab_dTypes.t_Ctx) (dtb_u_u179 : Elab_dTypes.t_Ec) (dtb_u_u180 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u181 : string) (dtb_u_u182 : Core_dTerm.t_Value) (dtb_u_u183 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_boolAltFuel 256) dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u180) dtb_u_u181) dtb_u_u182) dtb_u_u183))

# 99 "Vuna/Compiler/Elab/Term.vuna"
let v_boolAltGo = (fun (dtb_u_u184 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u185 : Elab_dTypes.t_Ctx) (dtb_u_u186 : Elab_dTypes.t_Ec) (dtb_u_u187 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u188 : string) (dtb_u_u189 : Core_dTerm.t_Value) (dtb_u_u190 : Base_dSource.t_Span) (dtb_u_u191 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (((((((((Elab_dTerm_dImpl.v_boolAltGoFuel 256) dtb_u_u184) dtb_u_u185) dtb_u_u186) dtb_u_u187) dtb_u_u188) dtb_u_u189) dtb_u_u190) dtb_u_u191))

# 102 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCatchAll = (fun (dtb_u_u192 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u193 : Elab_dTypes.t_Ctx) (dtb_u_u194 : Elab_dTypes.t_Ec) (dtb_u_u195 : Core_dTerm.t_Value) (dtb_u_u196 : Elab_dTypes.t_DtData) (dtb_u_u197 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u198 : Core_dTerm.t_Value) (dtb_u_u199 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u200 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (dtb_u_u201 : Frontend_dAst.t_Expr) (dtb_u_u202 : string) (dtb_u_u203 : Base_dSource.t_Span) -> (((((((((((((Elab_dTerm_dImpl.v_elabCatchAllFuel 256) dtb_u_u192) dtb_u_u193) dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u199) dtb_u_u200) dtb_u_u201) dtb_u_u202) dtb_u_u203))

# 106 "Vuna/Compiler/Elab/Term.vuna"
let v_checkE = (fun (dtb_u_u204 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u205 : Elab_dTypes.t_Ctx) (dtb_u_u206 : Elab_dTypes.t_Ec) (dtb_u_u207 : Frontend_dAst.t_Expr) (dtb_u_u208 : Core_dTerm.t_Value) -> ((((((Elab_dTerm_dImpl.v_checkEFuel ((Frontend_dAstQuery.v_exprBudget 256) dtb_u_u207)) dtb_u_u204) dtb_u_u205) dtb_u_u206) dtb_u_u207) dtb_u_u208))

# 109 "Vuna/Compiler/Elab/Term.vuna"
let v_inferPi = (fun (dtb_u_u209 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u210 : Elab_dTypes.t_Ctx) (dtb_u_u211 : Elab_dTypes.t_Ec) (dtb_u_u212 : string) (dtb_u_u213 : bool) (dtb_u_u214 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dtb_u_u215 : Frontend_dAst.t_Expr) (dtb_u_u216 : Frontend_dAst.t_Expr) (dtb_u_u217 : Base_dSource.t_Span) -> ((((((((((Elab_dTerm_dImpl.v_inferPiFuel 256) dtb_u_u209) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u214) dtb_u_u215) dtb_u_u216) dtb_u_u217))

# 112 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAnn = (fun (dtb_u_u218 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u219 : Elab_dTypes.t_Ctx) (dtb_u_u220 : Elab_dTypes.t_Ec) (dtb_u_u221 : Frontend_dAst.t_Expr) (dtb_u_u222 : Frontend_dAst.t_Expr) (dtb_u_u223 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAnnFuel 256) dtb_u_u218) dtb_u_u219) dtb_u_u220) dtb_u_u221) dtb_u_u222) dtb_u_u223))

# 115 "Vuna/Compiler/Elab/Term.vuna"
let v_checkType = (fun (dtb_u_u224 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u225 : Elab_dTypes.t_Ctx) (dtb_u_u226 : Elab_dTypes.t_Ec) (dtb_u_u227 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_checkTypeFuel ((Frontend_dAstQuery.v_exprBudget 256) dtb_u_u227)) dtb_u_u224) dtb_u_u225) dtb_u_u226) dtb_u_u227))

# 118 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppUnderType = (fun (dtb_u_u228 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u229 : Elab_dTypes.t_Ctx) (dtb_u_u230 : Elab_dTypes.t_Ec) (dtb_u_u231 : string) (dtb_u_u232 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u233 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferAppUnderTypeFuel 256) dtb_u_u228) dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u232) dtb_u_u233))

# 121 "Vuna/Compiler/Elab/Term.vuna"
let v_inferArgs = (fun (dtb_u_u234 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u235 : Elab_dTypes.t_Ctx) (dtb_u_u236 : Elab_dTypes.t_Ec) (dtb_u_u237 : Core_dTerm.t_Value) (dtb_u_u238 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u239 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferArgsFuel 256) dtb_u_u234) dtb_u_u235) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) B_dData_dMaybe.C_Maybe_Nothing))

# 124 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDom = (fun (dtb_u_u240 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u241 : Elab_dTypes.t_Ec) (dtb_u_u242 : Elab_dTypes.t_Ctx) (dtb_u_u243 : Core_dTerm.t_Value) (dtb_u_u244 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u245 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_constrainDictDomFuel 256) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u244) dtb_u_u245))

# 127 "Vuna/Compiler/Elab/Term.vuna"
let v_constrainDictDomGoK = (fun (dtb_u_u246 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u247 : Elab_dTypes.t_Ec) (dtb_u_u248 : Elab_dTypes.t_Ctx) (dtb_u_u249 : Core_dTerm.t_Value) (dtb_u_u250 : Core_dTerm.t_Value) (dtb_u_u251 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u252 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_constrainDictDomGoKFuel 256) dtb_u_u246) dtb_u_u247) dtb_u_u248) dtb_u_u249) dtb_u_u250) dtb_u_u251) dtb_u_u252))

# 130 "Vuna/Compiler/Elab/Term.vuna"
let v_inferApp = (fun (dtb_u_u253 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u254 : Elab_dTypes.t_Ctx) (dtb_u_u255 : Elab_dTypes.t_Ec) (dtb_u_u256 : Frontend_dAst.t_Expr) (dtb_u_u257 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u258 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppFuel 256) dtb_u_u253) dtb_u_u254) dtb_u_u255) dtb_u_u256) dtb_u_u257) dtb_u_u258) B_dData_dMaybe.C_Maybe_Nothing))

# 133 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneral = (fun (dtb_u_u259 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u260 : Elab_dTypes.t_Ctx) (dtb_u_u261 : Elab_dTypes.t_Ec) (dtb_u_u262 : Frontend_dAst.t_Expr) (dtb_u_u263 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u264 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralFuel 256) dtb_u_u259) dtb_u_u260) dtb_u_u261) dtb_u_u262) dtb_u_u263) dtb_u_u264) B_dData_dMaybe.C_Maybe_Nothing))

# 136 "Vuna/Compiler/Elab/Term.vuna"
let v_inferAppGeneralGo = (fun (dtb_u_u265 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u266 : Elab_dTypes.t_Ctx) (dtb_u_u267 : Elab_dTypes.t_Ec) (dtb_u_u268 : Frontend_dAst.t_Expr) (dtb_u_u269 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u270 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_inferAppGeneralGoFuel 256) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u269) dtb_u_u270) B_dData_dMaybe.C_Maybe_Nothing))

# 139 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCondBool = (fun (dtb_u_u271 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u272 : Elab_dTypes.t_Ctx) (dtb_u_u273 : Elab_dTypes.t_Ec) (dtb_u_u274 : Frontend_dAst.t_Expr) (dtb_u_u275 : Base_dSource.t_Span) -> ((((((Elab_dTerm_dImpl.v_checkCondBoolFuel 256) dtb_u_u271) dtb_u_u272) dtb_u_u273) dtb_u_u274) dtb_u_u275))

# 142 "Vuna/Compiler/Elab/Term.vuna"
let v_inferE = (fun (dtb_u_u276 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u277 : Elab_dTypes.t_Ctx) (dtb_u_u278 : Elab_dTypes.t_Ec) (dtb_u_u279 : Frontend_dAst.t_Expr) -> (((((Elab_dTerm_dImpl.v_inferEFuel ((Frontend_dAstQuery.v_exprBudget 256) dtb_u_u279)) dtb_u_u276) dtb_u_u277) dtb_u_u278) dtb_u_u279))

# 145 "Vuna/Compiler/Elab/Term.vuna"
let v_inferCaseE = (fun (dtb_u_u280 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u281 : Elab_dTypes.t_Ctx) (dtb_u_u282 : Elab_dTypes.t_Ec) (dtb_u_u283 : Frontend_dAst.t_Expr) (dtb_u_u284 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u285 : Base_dSource.t_Span) -> (((((((Elab_dTerm_dImpl.v_inferCaseEFuel 256) dtb_u_u280) dtb_u_u281) dtb_u_u282) dtb_u_u283) dtb_u_u284) dtb_u_u285))

# 148 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCase = (fun (dtb_u_u286 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u287 : Elab_dTypes.t_Ctx) (dtb_u_u288 : Elab_dTypes.t_Ec) (dtb_u_u289 : Frontend_dAst.t_Expr) (dtb_u_u290 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u291 : Core_dTerm.t_Value) (dtb_u_u292 : Base_dSource.t_Span) -> ((((((((Elab_dTerm_dImpl.v_checkCaseFuel 256) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292))

# 151 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseFam = (fun (dtb_u_u293 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u294 : Elab_dTypes.t_Ctx) (dtb_u_u295 : Elab_dTypes.t_Ec) (dtb_u_u296 : Core_dTerm.t_Term) (dtb_u_u297 : Core_dTerm.t_Value) (dtb_u_u298 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u299 : Core_dTerm.t_Value) (dtb_u_u300 : Base_dSource.t_Span) -> (((((((((Elab_dTerm_dImpl.v_checkCaseFamFuel 256) dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u296) dtb_u_u297) dtb_u_u298) dtb_u_u299) dtb_u_u300))

# 154 "Vuna/Compiler/Elab/Term.vuna"
let v_checkCaseOf = (fun (dtb_u_u301 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u302 : Elab_dTypes.t_Ctx) (dtb_u_u303 : Elab_dTypes.t_Ec) (dtb_u_u304 : Core_dTerm.t_Term) (dtb_u_u305 : Core_dTerm.t_Value) (dtb_u_u306 : string) (dtb_u_u307 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u308 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u309 : Core_dTerm.t_Value) (dtb_u_u310 : Base_dSource.t_Span) -> (((((((((((Elab_dTerm_dImpl.v_checkCaseOfFuel 256) dtb_u_u301) dtb_u_u302) dtb_u_u303) dtb_u_u304) dtb_u_u305) dtb_u_u306) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310))

# 157 "Vuna/Compiler/Elab/Term.vuna"
let v_elabCaseAlts = (fun (dtb_u_u311 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u312 : Elab_dTypes.t_Ctx) (dtb_u_u313 : Elab_dTypes.t_Ec) (dtb_u_u314 : Core_dTerm.t_Value) (dtb_u_u315 : Elab_dTypes.t_DtData) (dtb_u_u316 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u317 : Core_dTerm.t_Value) (dtb_u_u318 : Core_dTerm.t_Value) (dtb_u_u319 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u320 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (((((((((((Elab_dTerm_dImpl.v_elabCaseAltsFuel 256) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u315) dtb_u_u316) dtb_u_u317) dtb_u_u318) dtb_u_u319) dtb_u_u320))

# 160 "Vuna/Compiler/Elab/Term.vuna"
let v_elabConAlt = (fun (dtb_u_u321 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u322 : Elab_dTypes.t_Ctx) (dtb_u_u323 : Elab_dTypes.t_Ec) (dtb_u_u324 : Elab_dTypes.t_DtData) (dtb_u_u325 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u326 : Core_dTerm.t_Value) (dtb_u_u327 : Core_dTerm.t_Value) (dtb_u_u328 : string) (dtb_u_u329 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u330 : Base_dSource.t_Span) (dtb_u_u331 : Frontend_dAst.t_Expr) -> ((((((((((((Elab_dTerm_dImpl.v_elabConAltFuel 256) dtb_u_u321) dtb_u_u322) dtb_u_u323) dtb_u_u324) dtb_u_u325) dtb_u_u326) dtb_u_u327) dtb_u_u328) dtb_u_u329) dtb_u_u330) dtb_u_u331))

# 165 "Vuna/Compiler/Elab/Term.vuna"
let v_resolveOverFunPats = (fun (dtb_u_u332 : Elab_dTypes.t_Ec) (dtb_u_u333 : Elab_dTypes.t_Ctx) (dtb_u_u334 : Core_dTerm.t_Value) (dtb_u_u335 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((Elab_dTerm_dImpl.v_resolveOverFunPats dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335))
