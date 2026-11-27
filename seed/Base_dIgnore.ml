open Vuna_runtime
type t_IgnoreRule = { f_IgnoreRule_ignoreBase : string; f_IgnoreRule_ignoreNegate : bool; f_IgnoreRule_ignoreDirOnly : bool; f_IgnoreRule_ignoreAnchored : bool; f_IgnoreRule_ignoreSegs : string B_dData_dList.t_List }
and t_IgnoreContext = { f_IgnoreContext_ignoreRoot : string; f_IgnoreContext_ignorePrefix : string; f_IgnoreContext_ignoreRules : t_IgnoreRule B_dData_dList.t_List }

# 68 "Vuna/Compiler/Base/Ignore.vuna"
let v_buildRule = (fun (dtb_u_u1 : string) (dtb_u_u2 : string) (dtb_u_u3 : bool) -> (let dtb_u_u4 = ((B_dData_dString.v_endsWith "/") dtb_u_u2) in (let dtb_u_u5 = (if dtb_u_u4 then (((dtp_substring 0) ((String.length dtb_u_u2) - 1)) dtb_u_u2) else dtb_u_u2) in (let dtb_u_u6 = ((B_dData_dString.v_startsWith "/") dtb_u_u5) in (let dtb_u_u7 = (if dtb_u_u6 then (((dtp_substring 1) ((String.length dtb_u_u5) - 1)) dtb_u_u5) else dtb_u_u5) in (let dtb_u_u8 = (if dtb_u_u6 then true else ((B_dData_dString.v_contains "/") dtb_u_u7)) in { f_IgnoreRule_ignoreBase = dtb_u_u1; f_IgnoreRule_ignoreNegate = dtb_u_u3; f_IgnoreRule_ignoreDirOnly = dtb_u_u4; f_IgnoreRule_ignoreAnchored = dtb_u_u8; f_IgnoreRule_ignoreSegs = ((B_dData_dString.v_split "/") dtb_u_u7) }))))))

# 53 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignoreLine = (fun (dtb_u_u9 : string) (dtb_u_u10 : string) -> (let dtb_u_u11 = (B_dData_dString.v_trimRight dtb_u_u10) in (if (if (dtb_u_u11 = "") then true else ((B_dData_dString.v_startsWith "#") dtb_u_u11)) then B_dData_dMaybe.C_Maybe_Nothing else (if ((B_dData_dString.v_startsWith "\\#") dtb_u_u11) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule dtb_u_u9) (((dtp_substring 1) ((String.length dtb_u_u11) - 1)) dtb_u_u11)) false))) else (if ((B_dData_dString.v_startsWith "!") dtb_u_u11) then (let dtb_u_u12 = (((dtp_substring 1) ((String.length dtb_u_u11) - 1)) dtb_u_u11) in (if (dtb_u_u12 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule dtb_u_u9) dtb_u_u12) true))))) else (if ((B_dData_dString.v_startsWith "\\!") dtb_u_u11) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule dtb_u_u9) (((dtp_substring 1) ((String.length dtb_u_u11) - 1)) dtb_u_u11)) false))) else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule dtb_u_u9) dtb_u_u11) false)))))))))

# 49 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignore = (fun (dtb_u_u13 : string) (dtb_u_u14 : string) -> ((B_dData_dList.v_mapMaybe (v_parseGitignoreLine dtb_u_u13)) (B_dData_dString.v_lines dtb_u_u14)))

# 97 "Vuna/Compiler/Base/Ignore.vuna"
let v_trimTrailingSlash = (fun (dtb_u_u15 : string) -> (if (if ((String.length dtb_u_u15) > 1) then ((B_dData_dString.v_endsWith "/") dtb_u_u15) else false) then (((dtp_substring 0) ((String.length dtb_u_u15) - 1)) dtb_u_u15) else dtb_u_u15))

# 102 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_ancestorChain = (fun (dtb_u_u16 : int) (dtb_u_u17 : string) (dtb_u_u18 : string) -> (if (dtb_u_u16 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u18, B_dData_dList.C_List_Nil)) else (if (dtb_u_u18 = dtb_u_u17) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u18, B_dData_dList.C_List_Nil)) else (let dtb_u_u19 = (Base_dSource.v_parentOfPath dtb_u_u18) in (if (dtb_u_u19 = dtb_u_u18) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u18, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (((v_ancestorChain (dtb_u_u16 - 1)) dtb_u_u17) dtb_u_u19)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u18, B_dData_dList.C_List_Nil))))))))

# 125 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_findGitRoot = (fun (dtb_u_u20 : string) (dtb_u_u23 : int) (dtb_u_u24 : string) -> (if (dtb_u_u23 <= 0) then (let dtb_u_u26 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26)))) else (Obj.repr ((fun (dtb_u_u32 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u33 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u20) (dtb_u_u24 ^ "/.git"))) in (let dtb_u_u35 = (dtb_u_u33 dtb_u_u32) in (if dtb_u_u35 then (let dtb_u_u37 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u24)) in dtb_u_u37) else (let dtb_u_u39 = (Base_dSource.v_parentOfPath dtb_u_u24) in (if (dtb_u_u39 = dtb_u_u24) then (let dtb_u_u41 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u41) else ((Obj.magic (((v_findGitRoot dtb_u_u20) (dtb_u_u23 - 1)) dtb_u_u39)) dtb_u_u32)))))))))))

# 140 "Vuna/Compiler/Base/Ignore.vuna"
let v_loadIgnoreFile = (fun (dtb_u_u43 : string) (dtb_u_u46 : string) (dtb_u_u47 : string) (dtb_u_u48 : t_IgnoreContext) -> (let dtb_u_u49 = (dtb_u_u46 ^ "/.gitignore") in (Obj.repr ((fun (dtb_u_u54 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u55 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u43) dtb_u_u49)) in (let dtb_u_u57 = (dtb_u_u55 dtb_u_u54) in (if dtb_u_u57 then (let dtb_u_u63 = Obj.obj (((B_dEffect_dFs.v_fsIsDirectory dtb_u_u43) dtb_u_u49)) in (let dtb_u_u65 = (dtb_u_u63 dtb_u_u54) in (if dtb_u_u65 then (let dtb_u_u67 = dtb_u_u48 in dtb_u_u67) else (let dtb_u_u74 = Obj.obj (((B_dEffect_dFs.v_fsReadFile dtb_u_u43) dtb_u_u49)) in (let dtb_u_u76 = (dtb_u_u74 dtb_u_u54) in (let dtb_u_u78 = { f_IgnoreContext_ignoreRoot = (dtb_u_u48).f_IgnoreContext_ignoreRoot; f_IgnoreContext_ignorePrefix = (dtb_u_u48).f_IgnoreContext_ignorePrefix; f_IgnoreContext_ignoreRules = ((B_dData_dList.v_append (dtb_u_u48).f_IgnoreContext_ignoreRules) ((v_parseGitignore dtb_u_u47) dtb_u_u76)) } in dtb_u_u78)))))) else (let dtb_u_u81 = dtb_u_u48 in dtb_u_u81)))))))))

# 159 "Vuna/Compiler/Base/Ignore.vuna"
let v_relUnder = (fun (dtb_u_u83 : string) (dtb_u_u84 : string) -> (if (dtb_u_u83 = dtb_u_u84) then "" else (if (dtb_u_u83 = ".") then (if ((B_dData_dString.v_startsWith "./") dtb_u_u84) then (((dtp_substring 2) ((String.length dtb_u_u84) - 2)) dtb_u_u84) else dtb_u_u84) else (if ((B_dData_dString.v_startsWith (dtb_u_u83 ^ "/")) dtb_u_u84) then (((dtp_substring ((String.length dtb_u_u83) + 1)) (((String.length dtb_u_u84) - (String.length dtb_u_u83)) - 1)) dtb_u_u84) else dtb_u_u84))))

# 114 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_loadChain = (fun (dtb_u_u85 : string) (dtb_u_u88 : string B_dData_dList.t_List) (dtb_u_u89 : string) (dtb_u_u90 : t_IgnoreContext) -> (match dtb_u_u88 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u92) B_dData_dList.C_List_Nil) then (let dtb_u_u94 = dtb_u_u90 in (Obj.repr ((fun (dtb_u_u95 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u94)))) else (Obj.repr ((fun (dtb_u_u100 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u101 = Obj.obj (((((v_loadIgnoreFile dtb_u_u85) dtb_u_u91) ((v_relUnder dtb_u_u89) dtb_u_u91)) dtb_u_u90)) in (let dtb_u_u103 = (dtb_u_u101 dtb_u_u100) in ((Obj.magic ((((v_loadChain dtb_u_u85) dtb_u_u92) dtb_u_u89) dtb_u_u103)) dtb_u_u100)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u105 = dtb_u_u90 in (Obj.repr ((fun (dtb_u_u106 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u105))))
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextAt = (fun (dtb_u_u107 : string) (dtb_u_u110 : string) -> (Obj.repr ((fun (dtb_u_u115 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u116 = Obj.obj ((((v_findGitRoot dtb_u_u107) 512) dtb_u_u110)) in (let dtb_u_u118 = (dtb_u_u116 dtb_u_u115) in (let dtb_u_u119 = (match dtb_u_u118 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u110
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u121) -> dtb_u_u121
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u120 = (((v_ancestorChain 512) dtb_u_u119) dtb_u_u110) in ((Obj.magic ((((v_loadChain dtb_u_u107) dtb_u_u120) dtb_u_u119) { f_IgnoreContext_ignoreRoot = dtb_u_u119; f_IgnoreContext_ignorePrefix = ((v_relUnder dtb_u_u119) dtb_u_u110); f_IgnoreContext_ignoreRules = B_dData_dList.C_List_Nil })) dtb_u_u115)))))))))

# 80 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextEff = (fun (dtb_u_u122 : string) (dtb_u_u125 : string) -> ((v_ignoreContextAt dtb_u_u122) (v_trimTrailingSlash dtb_u_u125)))

# 171 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignorePathOf = (fun (dtb_u_u126 : t_IgnoreContext) (dtb_u_u127 : string) -> (if ((dtb_u_u126).f_IgnoreContext_ignorePrefix = "") then dtb_u_u127 else (String.concat "" [(dtb_u_u126).f_IgnoreContext_ignorePrefix; "/"; dtb_u_u127])))

# 195 "Vuna/Compiler/Base/Ignore.vuna"
let v_stripBase = (fun (dtb_u_u128 : string) (dtb_u_u129 : string) -> (if (dtb_u_u128 = "") then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u129)) else (if (dtb_u_u129 = dtb_u_u128) then (B_dData_dMaybe.C_Maybe_Just ("")) else (if ((B_dData_dString.v_startsWith (dtb_u_u128 ^ "/")) dtb_u_u129) then (B_dData_dMaybe.C_Maybe_Just ((((dtp_substring ((String.length dtb_u_u128) + 1)) (((String.length dtb_u_u129) - (String.length dtb_u_u128)) - 1)) dtb_u_u129))) else B_dData_dMaybe.C_Maybe_Nothing))))

# 225 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegmentChars = (fun (dtb_u_u130 : int) (dtb_u_u131 : int B_dData_dList.t_List) (dtb_u_u132 : int B_dData_dList.t_List) -> (if (dtb_u_u130 <= 0) then false else (((v_matchSegmentGo (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132)))
# 229 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchSegmentGo = (fun (dtb_u_u133 : int) (dtb_u_u134 : int B_dData_dList.t_List) (dtb_u_u135 : int B_dData_dList.t_List) -> (match dtb_u_u134 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (if (dtb_u_u136 = 42) then (((v_matchSegmentStar (dtb_u_u133 - 1)) dtb_u_u137) dtb_u_u135) else (if (dtb_u_u136 = 63) then (match dtb_u_u135 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u138, dtb_u_u139) -> (((v_matchSegmentChars (dtb_u_u133 - 1)) dtb_u_u137) dtb_u_u139)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else (match dtb_u_u135 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u140, dtb_u_u141) -> (if (dtb_u_u136 = dtb_u_u140) then (((v_matchSegmentChars (dtb_u_u133 - 1)) dtb_u_u137) dtb_u_u141) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (match dtb_u_u135 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 243 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchSegmentStar = (fun (dtb_u_u142 : int) (dtb_u_u143 : int B_dData_dList.t_List) (dtb_u_u144 : int B_dData_dList.t_List) -> (if (dtb_u_u142 <= 0) then false else (if (((v_matchSegmentChars dtb_u_u142) dtb_u_u143) dtb_u_u144) then true else (match dtb_u_u144 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u145, dtb_u_u146) -> (((v_matchSegmentStar (dtb_u_u142 - 1)) dtb_u_u143) dtb_u_u146)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 220 "Vuna/Compiler/Base/Ignore.vuna"
let v_matchSegment = (fun (dtb_u_u147 : string) (dtb_u_u148 : string) -> (((v_matchSegmentChars ((((String.length dtb_u_u147) + 1) * ((String.length dtb_u_u148) + 1)) + 2)) (B_dData_dList.dtp_unpack dtb_u_u147)) (B_dData_dList.dtp_unpack dtb_u_u148)))

# 207 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegments = (fun (dtb_u_u149 : string B_dData_dList.t_List) (dtb_u_u150 : string B_dData_dList.t_List) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> (if (dtb_u_u151 = "**") then ((v_matchAnySegments dtb_u_u152) dtb_u_u150) else (match dtb_u_u150 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (if ((v_matchSegment dtb_u_u151) dtb_u_u153) then ((v_matchSegments dtb_u_u152) dtb_u_u154) else false)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (match dtb_u_u150 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 215 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchAnySegments = (fun (dtb_u_u155 : string B_dData_dList.t_List) (dtb_u_u156 : string B_dData_dList.t_List) -> (match dtb_u_u156 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> (if ((v_matchSegments dtb_u_u155) (B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158))) then true else ((v_matchAnySegments dtb_u_u155) dtb_u_u158))
  | B_dData_dList.C_List_Nil -> ((v_matchSegments dtb_u_u155) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Base/Ignore.vuna"
let v_ruleMatches = (fun (dtb_u_u159 : t_IgnoreRule) (dtb_u_u160 : string) (dtb_u_u161 : bool) -> (if (if (dtb_u_u159).f_IgnoreRule_ignoreDirOnly then (B_dData_dBool.v_not dtb_u_u161) else false) then false else (match ((v_stripBase (dtb_u_u159).f_IgnoreRule_ignoreBase) dtb_u_u160) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u162) -> (if (dtb_u_u162 = "") then false else (if (dtb_u_u159).f_IgnoreRule_ignoreAnchored then ((v_matchSegments (dtb_u_u159).f_IgnoreRule_ignoreSegs) ((B_dData_dString.v_split "/") dtb_u_u162)) else ((v_matchSegments (dtb_u_u159).f_IgnoreRule_ignoreSegs) (B_dData_dList.C_List__x58__x58_ ((Base_dSource.v_baseName dtb_u_u162), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)))

# 179 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_lastMatch = (fun (dtb_u_u163 : t_IgnoreRule B_dData_dList.t_List) (dtb_u_u164 : string) (dtb_u_u165 : bool) (dtb_u_u166 : bool) -> (match dtb_u_u163 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> ((((v_lastMatch dtb_u_u168) dtb_u_u164) dtb_u_u165) (if (((v_ruleMatches dtb_u_u167) dtb_u_u164) dtb_u_u165) then (B_dData_dBool.v_not (dtb_u_u167).f_IgnoreRule_ignoreNegate) else dtb_u_u166))
  | B_dData_dList.C_List_Nil -> dtb_u_u166
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Ignore.vuna"
let v_isIgnored = (fun (dtb_u_u169 : t_IgnoreContext) (dtb_u_u170 : string) (dtb_u_u171 : bool) -> ((((v_lastMatch (dtb_u_u169).f_IgnoreContext_ignoreRules) ((v_ignorePathOf dtb_u_u169) dtb_u_u170)) dtb_u_u171) false))

# 28 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreBase = (fun (dtb_u_u172 : t_IgnoreRule) -> (match dtb_u_u172 with
  | { f_IgnoreRule_ignoreBase = dtb_u_u173; f_IgnoreRule_ignoreNegate = dtb_u_u174; f_IgnoreRule_ignoreDirOnly = dtb_u_u175; f_IgnoreRule_ignoreAnchored = dtb_u_u176; f_IgnoreRule_ignoreSegs = dtb_u_u177 } -> dtb_u_u173
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreNegate = (fun (dtb_u_u178 : t_IgnoreRule) -> (match dtb_u_u178 with
  | { f_IgnoreRule_ignoreBase = dtb_u_u179; f_IgnoreRule_ignoreNegate = dtb_u_u180; f_IgnoreRule_ignoreDirOnly = dtb_u_u181; f_IgnoreRule_ignoreAnchored = dtb_u_u182; f_IgnoreRule_ignoreSegs = dtb_u_u183 } -> dtb_u_u180
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreDirOnly = (fun (dtb_u_u184 : t_IgnoreRule) -> (match dtb_u_u184 with
  | { f_IgnoreRule_ignoreBase = dtb_u_u185; f_IgnoreRule_ignoreNegate = dtb_u_u186; f_IgnoreRule_ignoreDirOnly = dtb_u_u187; f_IgnoreRule_ignoreAnchored = dtb_u_u188; f_IgnoreRule_ignoreSegs = dtb_u_u189 } -> dtb_u_u187
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreAnchored = (fun (dtb_u_u190 : t_IgnoreRule) -> (match dtb_u_u190 with
  | { f_IgnoreRule_ignoreBase = dtb_u_u191; f_IgnoreRule_ignoreNegate = dtb_u_u192; f_IgnoreRule_ignoreDirOnly = dtb_u_u193; f_IgnoreRule_ignoreAnchored = dtb_u_u194; f_IgnoreRule_ignoreSegs = dtb_u_u195 } -> dtb_u_u194
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreSegs = (fun (dtb_u_u196 : t_IgnoreRule) -> (match dtb_u_u196 with
  | { f_IgnoreRule_ignoreBase = dtb_u_u197; f_IgnoreRule_ignoreNegate = dtb_u_u198; f_IgnoreRule_ignoreDirOnly = dtb_u_u199; f_IgnoreRule_ignoreAnchored = dtb_u_u200; f_IgnoreRule_ignoreSegs = dtb_u_u201 } -> dtb_u_u201
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreRoot = (fun (dtb_u_u202 : t_IgnoreContext) -> (match dtb_u_u202 with
  | { f_IgnoreContext_ignoreRoot = dtb_u_u203; f_IgnoreContext_ignorePrefix = dtb_u_u204; f_IgnoreContext_ignoreRules = dtb_u_u205 } -> dtb_u_u203
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignorePrefix = (fun (dtb_u_u206 : t_IgnoreContext) -> (match dtb_u_u206 with
  | { f_IgnoreContext_ignoreRoot = dtb_u_u207; f_IgnoreContext_ignorePrefix = dtb_u_u208; f_IgnoreContext_ignoreRules = dtb_u_u209 } -> dtb_u_u208
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreRules = (fun (dtb_u_u210 : t_IgnoreContext) -> (match dtb_u_u210 with
  | { f_IgnoreContext_ignoreRoot = dtb_u_u211; f_IgnoreContext_ignorePrefix = dtb_u_u212; f_IgnoreContext_ignoreRules = dtb_u_u213 } -> dtb_u_u213
  | _ -> failwith "DT: impossible branch"
))
