open Vuna_runtime
type t_Reserved = C_Reserved_RsListNil | C_Reserved_RsListCons | C_Reserved_RsTuplePair | C_Reserved_RsTupleUnit | C_Reserved_RsAscribe | C_Reserved_RsPerform | C_Reserved_RsHandle | C_Reserved_RsHandleNoRet | C_Reserved_RsRowAt | C_Reserved_RsAppAt | C_Reserved_RsInstArg | C_Reserved_RsOverCtor of (string) * (string B_dData_dList.t_List) | C_Reserved_RsOverValue of (string) * (string B_dData_dList.t_List) | C_Reserved_RsMacro of (string) | C_Reserved_RsDoBind of (string) | C_Reserved_RsDoIgnore of (string) | C_Reserved_RsFieldSel of (string) * (string)

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

# 91 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsListNilText = "@vuna@list@nil"

# 94 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsListConsText = "@vuna@list@cons"

# 97 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsTuplePairText = "@vuna@tuple@pair"

# 100 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsTupleUnitText = "@vuna@tuple@unit"

# 103 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsAscribeText = "@vuna@ascribe"

# 106 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsPerformText = "@vuna@perform"

# 109 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsHandleText = "@vuna@handle"

# 112 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsHandleNoRetText = "@vuna@handle@noret"

# 115 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsRowAtText = "@vuna@row@at"

# 118 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsAppAtText = "@vuna@app@at"

# 121 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsInstArgText = "@vuna@inst@arg"

# 125 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsOverCtorPrefix = "@vuna@ctor@"

# 128 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsOverValuePrefix = "@vuna@value@"

# 131 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsMacroPrefix = "@vuna@macro@"

# 134 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsDoBindPrefix = "@vuna@do@bind@"

# 137 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsDoIgnorePrefix = "@vuna@do@ignore@"

# 140 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_rsFieldSelPrefix = "@vuna@select@"

# 217 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isParserSurface = (fun (mc0 : t_Reserved) -> (match mc0 with
  | C_Reserved_RsFieldSel (dtb__4, dtb__5) -> false
  | C_Reserved_RsDoIgnore (dtb__6) -> false
  | C_Reserved_RsDoBind (dtb__7) -> false
  | C_Reserved_RsMacro (dtb__8) -> false
  | C_Reserved_RsOverValue (dtb__9, dtb__10) -> false
  | C_Reserved_RsOverCtor (dtb__11, dtb__12) -> false
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

# 237 "Vuna/Compiler/Frontend/Reserved.vuna"
let[@tail_mod_cons] rec v_dropEmpty = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (dtb__13 = "") then (v_dropEmpty dtb__14) else (B_dData_dList.C_List__x58__x58_ (dtb__13, (v_dropEmpty dtb__14))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isMacroSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_rsMacroPrefix) name))

# 246 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isFieldSelText = (fun (name : string) -> ((B_dData_dString.v_startsWith v_rsFieldSelPrefix) name))

# 316 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_dropNChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((v_dropNChars (n - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
)))

# 311 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dropNamePrefix = (fun (p : string) (name : string) -> (if ((B_dData_dString.v_startsWith p) name) then (B_dData_dList.dtp_pack ((v_dropNChars (String.length p)) (B_dData_dList.dtp_unpack name))) else name))

# 199 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_fieldSelParts = (fun (name : string) -> (let nd_uscrut1 = ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_rsFieldSelPrefix) name)) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__17 = "") then true else (dtb__19 = "")) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsFieldSel (dtb__17, dtb__19)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 207 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overParts = (fun (prefix : string) (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix prefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = (v_dropEmpty dtb__22) }))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_classify = (fun (name : string) -> (if (name = v_rsListNilText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListNil)) else (if (name = v_rsListConsText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListCons)) else (if (name = v_rsTuplePairText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTuplePair)) else (if (name = v_rsTupleUnitText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTupleUnit)) else (if (name = v_rsAscribeText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAscribe)) else (if (name = v_rsPerformText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsPerform)) else (if (name = v_rsHandleText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandle)) else (if (name = v_rsHandleNoRetText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandleNoRet)) else (if (name = v_rsRowAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsRowAt)) else (if (name = v_rsAppAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAppAt)) else (if (name = v_rsInstArgText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsInstArg)) else (if ((B_dData_dString.v_startsWith v_rsOverCtorPrefix) name) then (let nd_uscrut1 = ((v_overParts v_rsOverCtorPrefix) name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (match dtb__23 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverCtor (dtb__24, dtb__25))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsOverValuePrefix) name) then (let nd_uscrut1 = ((v_overParts v_rsOverValuePrefix) name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (match dtb__26 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverValue (dtb__27, dtb__28))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsMacroPrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsMacro (((v_dropNamePrefix v_rsMacroPrefix) name))))) else (if ((B_dData_dString.v_startsWith v_rsDoBindPrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoBind (((v_dropNamePrefix v_rsDoBindPrefix) name))))) else (if ((B_dData_dString.v_startsWith v_rsDoIgnorePrefix) name) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoIgnore (((v_dropNamePrefix v_rsDoIgnorePrefix) name))))) else (if ((B_dData_dString.v_startsWith v_rsFieldSelPrefix) name) then (v_fieldSelParts name) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))

# 250 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroNameOf = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (match dtb__29 with
  | C_Reserved_RsMacro (dtb__30) -> (B_dData_dMaybe.C_Maybe_Just (dtb__30))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 261 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverCtorName = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (match dtb__31 with
  | C_Reserved_RsOverCtor (dtb__32, dtb__33) -> true
  | _ -> false
)
  | _ -> false
)))

# 268 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorShort = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (match dtb__34 with
  | C_Reserved_RsOverCtor (dtb__35, dtb__36) -> dtb__35
  | _ -> ""
)
  | _ -> ""
)))

# 275 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorTargets = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (match dtb__37 with
  | C_Reserved_RsOverCtor (dtb__38, dtb__39) -> dtb__39
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 282 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverValueName = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (match dtb__40 with
  | C_Reserved_RsOverValue (dtb__41, dtb__42) -> true
  | _ -> false
)
  | _ -> false
)))

# 289 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueShort = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (match dtb__43 with
  | C_Reserved_RsOverValue (dtb__44, dtb__45) -> dtb__44
  | _ -> ""
)
  | _ -> ""
)))

# 296 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueTargets = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (match dtb__46 with
  | C_Reserved_RsOverValue (dtb__47, dtb__48) -> dtb__48
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 303 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doSyntaxCanonical = (fun (name : string) -> (let nd_uscrut1 = (v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (match dtb__49 with
  | C_Reserved_RsDoIgnore (dtb__50) -> (B_dData_dMaybe.C_Maybe_Just (dtb__50))
  | C_Reserved_RsDoBind (dtb__51) -> (B_dData_dMaybe.C_Maybe_Just (dtb__51))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 326 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_joinWithAt = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | B_dData_dList.C_List_Nil -> dtb__52
  | _ -> (String.concat "" [dtb__52; "@"; (v_joinWithAt dtb__53)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_reservedText = (fun (mc0 : t_Reserved) -> (match mc0 with
  | C_Reserved_RsFieldSel (dtb__54, dtb__55) -> (String.concat "" [v_rsFieldSelPrefix; dtb__54; "@"; dtb__55])
  | C_Reserved_RsDoIgnore (dtb__56) -> (v_rsDoIgnorePrefix ^ dtb__56)
  | C_Reserved_RsDoBind (dtb__57) -> (v_rsDoBindPrefix ^ dtb__57)
  | C_Reserved_RsMacro (dtb__58) -> (v_rsMacroPrefix ^ dtb__58)
  | C_Reserved_RsOverValue (dtb__59, dtb__60) -> (String.concat "" [v_rsOverValuePrefix; dtb__59; "@"; (v_joinWithAt dtb__60)])
  | C_Reserved_RsOverCtor (dtb__61, dtb__62) -> (String.concat "" [v_rsOverCtorPrefix; dtb__61; "@"; (v_joinWithAt dtb__62)])
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

# 335 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doPatternBinderName = "@vuna@do@pat"

# 344 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleOpBinderName = "@vuna@handle@o"

# 348 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleOpIndexBinderName = "@vuna@handle@ix"

# 352 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleSigBinderName = "@vuna@handle@sig"

# 356 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_handleRetBinderName = "@vuna@handle@ret"

# 360 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordProjBinderName = (fun (i : int) -> ("@vuna@record@proj" ^ (string_of_int i)))

# 364 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordArgBinderName = (fun (i : int) -> ("@vuna@record@arg" ^ (string_of_int i)))

# 368 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordHiddenFieldBinderName = (fun (i : int) -> ("@vuna@record@hf" ^ (string_of_int i)))

# 380 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_synthNamePrefix = "#"

# 384 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isSynthName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_synthNamePrefix) name))

# 388 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_sectionBinderName = "#section"

# 392 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dictBinderName = (fun (k : int) -> ("#dict" ^ (string_of_int k)))

# 396 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_etaBinderName = (fun (i : int) -> ("#eta" ^ (string_of_int i)))

# 400 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_teleProbeBinderName = "#tele"

# 404 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_ovProbeName = (fun (i : int) -> ("#ov" ^ (string_of_int i)))
