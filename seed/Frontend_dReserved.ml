open Vuna_runtime
# 19 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_holeNamed = (fun (name : string) -> (let nd_uscrut1 = (B_dData_dList.dtp_unpack name) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 = 63) then (match dtb__1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> true
  | _ -> false
) else false)
  | _ -> false
)))

# 16 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isHoleName = (fun (name : string) -> (if (name = "_") then true else (v_holeNamed name)))

# 26 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_holeNameOf = (fun (name : string) -> (if (v_holeNamed name) then name else ""))

# 42 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_internalNamePrefix = "@vuna@"

# 46 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorPrefix = "@vuna@ctor@"

# 50 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isInternalSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_internalNamePrefix) name))

# 54 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_dropNChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> ((v_dropNChars (n - 1)) dtb__5)
  | _ -> failwith "DT: impossible branch"
)))

# 64 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dropNamePrefix = (fun (p : string) (name : string) -> (if ((B_dData_dString.v_startsWith p) name) then (B_dData_dList.dtp_pack ((v_dropNChars (bi_strLength p)) (B_dData_dList.dtp_unpack name))) else name))

# 69 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_joinWithAt = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__7 with
  | B_dData_dList.C_List_Nil -> dtb__6
  | _ -> (String.concat "" [dtb__6; "@"; (v_joinWithAt dtb__7)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overCtorPrefix; short; "@"; (v_joinWithAt targets)]))

# 79 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverCtorName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overCtorPrefix) name))

# 97 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValuePrefix = "@vuna@value@"

# 100 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overValuePrefix; short; "@"; (v_joinWithAt targets)]))

# 103 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverValueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overValuePrefix) name))

# 121 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_listNilSyntax = "@vuna@list@nil"

# 125 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_listConsSyntax = "@vuna@list@cons"

# 129 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isListNilSyntax = (fun (name : string) -> (name = v_listNilSyntax))

# 133 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isListConsSyntax = (fun (name : string) -> (name = v_listConsSyntax))

# 139 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_tuplePairSyntax = "@vuna@tuple@pair"

# 143 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isTuplePairSyntax = (fun (name : string) -> (name = v_tuplePairSyntax))

# 147 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_tupleUnitSyntax = "@vuna@tuple@unit"

# 151 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isTupleUnitSyntax = (fun (name : string) -> (name = v_tupleUnitSyntax))

# 157 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_ascribeSyntax = "@vuna@ascribe"

# 161 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isAscribeSyntax = (fun (name : string) -> (name = v_ascribeSyntax))

# 183 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_performSyntax = "@vuna@perform"

# 187 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isPerformSyntax = (fun (name : string) -> (name = v_performSyntax))

# 199 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleSyntax = "@vuna@handle"

# 203 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isHandleSyntax = (fun (name : string) -> (name = v_handleSyntax))

# 207 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleNoRetSyntax = "@vuna@handle@noret"

# 211 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isHandleNoRetSyntax = (fun (name : string) -> (name = v_handleNoRetSyntax))

# 217 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rowAtSyntax = "@vuna@row@at"

# 221 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isRowAtSyntax = (fun (name : string) -> (name = v_rowAtSyntax))

# 228 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_appAtSyntax = "@vuna@app@at"

# 232 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isAppAtSyntax = (fun (name : string) -> (name = v_appAtSyntax))

# 237 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_instArgSyntax = "@vuna@inst@arg"

# 241 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isInstArgSyntax = (fun (name : string) -> (name = v_instArgSyntax))

# 253 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroSyntaxPrefix = "@vuna@macro@"

# 257 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroSyntaxName = (fun (name : string) -> (v_macroSyntaxPrefix ^ name))

# 261 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isMacroSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_macroSyntaxPrefix) name))

# 265 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroNameOf = (fun (name : string) -> (if (v_isMacroSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_macroSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing))

# 270 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doBindSyntaxPrefix = "@vuna@do@bind@"

# 274 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 278 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doBindSyntaxName = (fun (canonical : string) -> (v_doBindSyntaxPrefix ^ canonical))

# 282 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doIgnoreSyntaxName = (fun (canonical : string) -> (v_doIgnoreSyntaxPrefix ^ canonical))

# 286 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isDoBindSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doBindSyntaxPrefix) name))

# 290 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isDoIgnoreSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doIgnoreSyntaxPrefix) name))

# 295 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doSyntaxCanonical = (fun (name : string) -> (if (v_isDoBindSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doBindSyntaxPrefix) name))) else (if (v_isDoIgnoreSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doIgnoreSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing)))

# 308 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doPatternBinderName = "@vuna@do@pat"

# 320 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_synthNamePrefix = "#"

# 324 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isSynthName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_synthNamePrefix) name))

# 328 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_sectionBinderName = "#section"

# 332 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dictBinderName = (fun (k : int) -> ("#dict" ^ (bi_strFromInt k)))

# 336 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_etaBinderName = (fun (i : int) -> ("#eta" ^ (bi_strFromInt i)))

# 340 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_teleProbeBinderName = "#tele"

# 344 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_ovProbeName = (fun (i : int) -> ("#ov" ^ (bi_strFromInt i)))
