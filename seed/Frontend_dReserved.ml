open Vuna_runtime
type t_Reserved = C_Reserved_RsListNil | C_Reserved_RsListCons | C_Reserved_RsTuplePair | C_Reserved_RsTupleUnit | C_Reserved_RsAscribe | C_Reserved_RsPerform | C_Reserved_RsHandle | C_Reserved_RsHandleNoRet | C_Reserved_RsRowAt | C_Reserved_RsAppAt | C_Reserved_RsInstArg | C_Reserved_RsOverCtor of (string) * (string B_dData_dList.t_List) | C_Reserved_RsOverValue of (string) * (string B_dData_dList.t_List) | C_Reserved_RsMacro of (string) | C_Reserved_RsDoBind of (string) | C_Reserved_RsDoIgnore of (string)

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

# 38 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_internalNamePrefix = "@vuna@"

# 42 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isInternalSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_internalNamePrefix) name))

# 89 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsListNilText = "@vuna@list@nil"

# 92 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsListConsText = "@vuna@list@cons"

# 95 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsTuplePairText = "@vuna@tuple@pair"

# 98 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsTupleUnitText = "@vuna@tuple@unit"

# 101 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsAscribeText = "@vuna@ascribe"

# 104 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsPerformText = "@vuna@perform"

# 107 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsHandleText = "@vuna@handle"

# 110 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsHandleNoRetText = "@vuna@handle@noret"

# 113 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsRowAtText = "@vuna@row@at"

# 116 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsAppAtText = "@vuna@app@at"

# 119 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsInstArgText = "@vuna@inst@arg"

# 123 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsOverCtorPrefix = "@vuna@ctor@"

# 126 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsOverValuePrefix = "@vuna@value@"

# 129 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsMacroPrefix = "@vuna@macro@"

# 132 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsDoBindPrefix = "@vuna@do@bind@"

# 135 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsDoIgnorePrefix = "@vuna@do@ignore@"

# 203 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isParserSurface = (fun (mc0 : t_Reserved) -> (match mc0 with
  | C_Reserved_RsDoIgnore (dtb__4) -> false
  | C_Reserved_RsDoBind (dtb__5) -> false
  | C_Reserved_RsMacro (dtb__6) -> false
  | C_Reserved_RsOverValue (dtb__7, dtb__8) -> false
  | C_Reserved_RsOverCtor (dtb__9, dtb__10) -> false
  | C_Reserved_RsInstArg -> false
  | C_Reserved_RsAppAt -> true
  | C_Reserved_RsRowAt -> true
  | C_Reserved_RsHandleNoRet -> true
  | C_Reserved_RsHandle -> true
  | C_Reserved_RsPerform -> true
  | C_Reserved_RsAscribe -> true
  | C_Reserved_RsTupleUnit -> true
  | C_Reserved_RsTuplePair -> true
  | C_Reserved_RsListCons -> true
  | C_Reserved_RsListNil -> true
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_dropEmpty = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (if (dtb__11 = "") then (v_dropEmpty dtb__12) else (B_dData_dList.C_List__x58__x58_ (dtb__11, (v_dropEmpty dtb__12))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isMacroSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_rsMacroPrefix) name))

# 297 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_dropNChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> ((v_dropNChars (n - 1)) dtb__14)
  | _ -> failwith "DT: impossible branch"
)))

# 292 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dropNamePrefix = (fun (p : string) (name : string) -> (if ((B_dData_dString.v_startsWith p) name) then (B_dData_dList.dtp_pack ((v_dropNChars (bi_strLength p)) (B_dData_dList.dtp_unpack name))) else name))

# 193 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overParts = (fun (prefix : string) (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix prefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = (v_dropEmpty dtb__16) }))
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_classify = (fun (name : string) -> (if (name = v_rsListNilText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListNil)) else (if (name = v_rsListConsText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListCons)) else (if (name = v_rsTuplePairText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTuplePair)) else (if (name = v_rsTupleUnitText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTupleUnit)) else (if (name = v_rsAscribeText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAscribe)) else (if (name = v_rsPerformText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsPerform)) else (if (name = v_rsHandleText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandle)) else (if (name = v_rsHandleNoRetText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandleNoRet)) else (if (name = v_rsRowAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsRowAt)) else (if (name = v_rsAppAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAppAt)) else (if (name = v_rsInstArgText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsInstArg)) else (if ((B_dData_dString.v_startsWith v_rsOverCtorPrefix) name) then (let nd_uscrut1 = ((v_overParts v_rsOverCtorPrefix) name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (match dtb__17 with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverCtor (dtb__18, dtb__19))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsOverValuePrefix) name) then (let nd_uscrut1 = ((v_overParts v_rsOverValuePrefix) name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (match dtb__20 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverValue (dtb__21, dtb__22))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsMacroPrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsMacro (((v_dropNamePrefix v_rsMacroPrefix) name))))) else (if ((B_dData_dString.v_startsWith v_rsDoBindPrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoBind (((v_dropNamePrefix v_rsDoBindPrefix) name))))) else (if ((B_dData_dString.v_startsWith v_rsDoIgnorePrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoIgnore (((v_dropNamePrefix v_rsDoIgnorePrefix) name))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))))

# 231 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroNameOf = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (match dtb__23 with
  | C_Reserved_RsMacro (dtb__24) -> (B_dData_dMaybe.C_Maybe_Just (dtb__24))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 242 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverCtorName = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (match dtb__25 with
  | C_Reserved_RsOverCtor (dtb__26, dtb__27) -> true
  | _ -> false
)
  | _ -> false
)))

# 249 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorShort = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (match dtb__28 with
  | C_Reserved_RsOverCtor (dtb__29, dtb__30) -> dtb__29
  | _ -> ""
)
  | _ -> ""
)))

# 256 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorTargets = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (match dtb__31 with
  | C_Reserved_RsOverCtor (dtb__32, dtb__33) -> dtb__33
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 263 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverValueName = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (match dtb__34 with
  | C_Reserved_RsOverValue (dtb__35, dtb__36) -> true
  | _ -> false
)
  | _ -> false
)))

# 270 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueShort = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (match dtb__37 with
  | C_Reserved_RsOverValue (dtb__38, dtb__39) -> dtb__38
  | _ -> ""
)
  | _ -> ""
)))

# 277 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueTargets = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (match dtb__40 with
  | C_Reserved_RsOverValue (dtb__41, dtb__42) -> dtb__42
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 284 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doSyntaxCanonical = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (match dtb__43 with
  | C_Reserved_RsDoIgnore (dtb__44) -> (B_dData_dMaybe.C_Maybe_Just (dtb__44))
  | C_Reserved_RsDoBind (dtb__45) -> (B_dData_dMaybe.C_Maybe_Just (dtb__45))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 307 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_joinWithAt = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> dtb__46
  | _ -> (String.concat "" [dtb__46; "@"; (v_joinWithAt dtb__47)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_reservedText = (fun (mc0 : t_Reserved) -> (match mc0 with
  | C_Reserved_RsDoIgnore (dtb__48) -> (v_rsDoIgnorePrefix ^ dtb__48)
  | C_Reserved_RsDoBind (dtb__49) -> (v_rsDoBindPrefix ^ dtb__49)
  | C_Reserved_RsMacro (dtb__50) -> (v_rsMacroPrefix ^ dtb__50)
  | C_Reserved_RsOverValue (dtb__51, dtb__52) -> (String.concat "" [v_rsOverValuePrefix; dtb__51; "@"; (v_joinWithAt dtb__52)])
  | C_Reserved_RsOverCtor (dtb__53, dtb__54) -> (String.concat "" [v_rsOverCtorPrefix; dtb__53; "@"; (v_joinWithAt dtb__54)])
  | C_Reserved_RsInstArg -> v_rsInstArgText
  | C_Reserved_RsAppAt -> v_rsAppAtText
  | C_Reserved_RsRowAt -> v_rsRowAtText
  | C_Reserved_RsHandleNoRet -> v_rsHandleNoRetText
  | C_Reserved_RsHandle -> v_rsHandleText
  | C_Reserved_RsPerform -> v_rsPerformText
  | C_Reserved_RsAscribe -> v_rsAscribeText
  | C_Reserved_RsTupleUnit -> v_rsTupleUnitText
  | C_Reserved_RsTuplePair -> v_rsTuplePairText
  | C_Reserved_RsListCons -> v_rsListConsText
  | C_Reserved_RsListNil -> v_rsListNilText
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doPatternBinderName = "@vuna@do@pat"

# 325 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleOpBinderName = "@vuna@handle@o"

# 329 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleOpIndexBinderName = "@vuna@handle@ix"

# 333 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleSigBinderName = "@vuna@handle@sig"

# 337 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleRetBinderName = "@vuna@handle@ret"

# 341 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordProjBinderName = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 345 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordArgBinderName = (fun (i : int) -> ("@vuna@record@arg" ^ (bi_strFromInt i)))

# 349 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordHiddenFieldBinderName = (fun (i : int) -> ("@vuna@record@hf" ^ (bi_strFromInt i)))

# 361 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_synthNamePrefix = "#"

# 365 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isSynthName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_synthNamePrefix) name))

# 369 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_sectionBinderName = "#section"

# 373 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dictBinderName = (fun (k : int) -> ("#dict" ^ (bi_strFromInt k)))

# 377 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_etaBinderName = (fun (i : int) -> ("#eta" ^ (bi_strFromInt i)))

# 381 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_teleProbeBinderName = "#tele"

# 385 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_ovProbeName = (fun (i : int) -> ("#ov" ^ (bi_strFromInt i)))
