open Vuna_runtime
type t_Reserved = C_Reserved_RsListNil | C_Reserved_RsListCons | C_Reserved_RsTuplePair | C_Reserved_RsTupleUnit | C_Reserved_RsAscribe | C_Reserved_RsPerform | C_Reserved_RsHandle | C_Reserved_RsHandleNoRet | C_Reserved_RsRowAt | C_Reserved_RsAppAt | C_Reserved_RsInstArg | C_Reserved_RsOverCtor of (string) * (string B_dData_dList.t_List) | C_Reserved_RsOverValue of (string) * (string B_dData_dList.t_List) | C_Reserved_RsMacro of (string) | C_Reserved_RsDoBind of (string) | C_Reserved_RsDoIgnore of (string) | C_Reserved_RsFieldSel of (string) * (string)

# 19 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_holeNamed = (fun (dtb_u_u1 : string) -> (let dtb_u_u2 = (B_dData_dList.dtp_unpack dtb_u_u1) in (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (if (dtb_u_u3 = 63) then (match dtb_u_u4 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> true
  | _ -> false
) else false)
  | _ -> false
)))

# 16 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isHoleName = (fun (dtb_u_u7 : string) -> (if (dtb_u_u7 = "_") then true else (v_holeNamed dtb_u_u7)))

# 26 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_holeNameOf = (fun (dtb_u_u8 : string) -> (if (v_holeNamed dtb_u_u8) then dtb_u_u8 else ""))

# 38 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_internalNamePrefix = "@vuna@"

# 42 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isInternalSyntaxName = (fun (dtb_u_u9 : string) -> ((B_dData_dString.v_startsWith v_internalNamePrefix) dtb_u_u9))

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
let v_isParserSurface = (fun (dtb_u_u10 : t_Reserved) -> (match dtb_u_u10 with
  | C_Reserved_RsFieldSel (dtb_u_u11, dtb_u_u12) -> false
  | C_Reserved_RsDoIgnore (dtb_u_u13) -> false
  | C_Reserved_RsDoBind (dtb_u_u14) -> false
  | C_Reserved_RsMacro (dtb_u_u15) -> false
  | C_Reserved_RsOverValue (dtb_u_u16, dtb_u_u17) -> false
  | C_Reserved_RsOverCtor (dtb_u_u18, dtb_u_u19) -> false
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
let[@tail_mod_cons] rec v_dropEmpty = (fun (dtb_u_u20 : string B_dData_dList.t_List) -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (if (dtb_u_u21 = "") then (v_dropEmpty dtb_u_u22) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u21, (v_dropEmpty dtb_u_u22))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isMacroSyntaxName = (fun (dtb_u_u23 : string) -> ((B_dData_dString.v_startsWith v_rsMacroPrefix) dtb_u_u23))

# 246 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isFieldSelText = (fun (dtb_u_u24 : string) -> ((B_dData_dString.v_startsWith v_rsFieldSelPrefix) dtb_u_u24))

# 316 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_dropNChars = (fun (dtb_u_u25 : int) (dtb_u_u26 : int B_dData_dList.t_List) -> (if (dtb_u_u25 <= 0) then dtb_u_u26 else (match dtb_u_u26 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u27, dtb_u_u28) -> ((v_dropNChars (dtb_u_u25 - 1)) dtb_u_u28)
  | _ -> failwith "DT: impossible branch"
)))

# 311 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dropNamePrefix = (fun (dtb_u_u29 : string) (dtb_u_u30 : string) -> (if ((B_dData_dString.v_startsWith dtb_u_u29) dtb_u_u30) then (B_dData_dList.dtp_pack ((v_dropNChars (String.length dtb_u_u29)) (B_dData_dList.dtp_unpack dtb_u_u30))) else dtb_u_u30))

# 199 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_fieldSelParts = (fun (dtb_u_u31 : string) -> (let dtb_u_u32 = ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_rsFieldSelPrefix) dtb_u_u31)) in (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (match dtb_u_u36 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb_u_u33 = "") then true else (dtb_u_u35 = "")) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsFieldSel (dtb_u_u33, dtb_u_u35)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 207 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overParts = (fun (dtb_u_u37 : string) (dtb_u_u38 : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix dtb_u_u37) dtb_u_u38)) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u39, dtb_u_u40) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u39; B_dData_dPair.f_Pair_second = (v_dropEmpty dtb_u_u40) }))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_classify = (fun (dtb_u_u41 : string) -> (if (dtb_u_u41 = v_rsListNilText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListNil)) else (if (dtb_u_u41 = v_rsListConsText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsListCons)) else (if (dtb_u_u41 = v_rsTuplePairText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTuplePair)) else (if (dtb_u_u41 = v_rsTupleUnitText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsTupleUnit)) else (if (dtb_u_u41 = v_rsAscribeText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAscribe)) else (if (dtb_u_u41 = v_rsPerformText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsPerform)) else (if (dtb_u_u41 = v_rsHandleText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandle)) else (if (dtb_u_u41 = v_rsHandleNoRetText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsHandleNoRet)) else (if (dtb_u_u41 = v_rsRowAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsRowAt)) else (if (dtb_u_u41 = v_rsAppAtText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsAppAt)) else (if (dtb_u_u41 = v_rsInstArgText) then (B_dData_dMaybe.C_Maybe_Just (C_Reserved_RsInstArg)) else (if ((B_dData_dString.v_startsWith v_rsOverCtorPrefix) dtb_u_u41) then (let dtb_u_u42 = ((v_overParts v_rsOverCtorPrefix) dtb_u_u41) in (match dtb_u_u42 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u43) -> (match dtb_u_u43 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = dtb_u_u45 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverCtor (dtb_u_u44, dtb_u_u45))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsOverValuePrefix) dtb_u_u41) then (let dtb_u_u46 = ((v_overParts v_rsOverValuePrefix) dtb_u_u41) in (match dtb_u_u46 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u47) -> (match dtb_u_u47 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u48; B_dData_dPair.f_Pair_second = dtb_u_u49 } -> (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsOverValue (dtb_u_u48, dtb_u_u49))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((B_dData_dString.v_startsWith v_rsMacroPrefix) dtb_u_u41) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsMacro (((v_dropNamePrefix v_rsMacroPrefix) dtb_u_u41))))) else (if ((B_dData_dString.v_startsWith v_rsDoBindPrefix) dtb_u_u41) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoBind (((v_dropNamePrefix v_rsDoBindPrefix) dtb_u_u41))))) else (if ((B_dData_dString.v_startsWith v_rsDoIgnorePrefix) dtb_u_u41) then (B_dData_dMaybe.C_Maybe_Just ((C_Reserved_RsDoIgnore (((v_dropNamePrefix v_rsDoIgnorePrefix) dtb_u_u41))))) else (if ((B_dData_dString.v_startsWith v_rsFieldSelPrefix) dtb_u_u41) then (v_fieldSelParts dtb_u_u41) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))

# 250 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_macroNameOf = (fun (dtb_u_u50 : string) -> (let dtb_u_u51 = (v_classify dtb_u_u50) in (match dtb_u_u51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u52) -> (match dtb_u_u52 with
  | C_Reserved_RsMacro (dtb_u_u53) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u53))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 261 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverCtorName = (fun (dtb_u_u54 : string) -> (let dtb_u_u55 = (v_classify dtb_u_u54) in (match dtb_u_u55 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u56) -> (match dtb_u_u56 with
  | C_Reserved_RsOverCtor (dtb_u_u57, dtb_u_u58) -> true
  | _ -> false
)
  | _ -> false
)))

# 268 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorShort = (fun (dtb_u_u59 : string) -> (let dtb_u_u60 = (v_classify dtb_u_u59) in (match dtb_u_u60 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u61) -> (match dtb_u_u61 with
  | C_Reserved_RsOverCtor (dtb_u_u62, dtb_u_u63) -> dtb_u_u62
  | _ -> ""
)
  | _ -> ""
)))

# 275 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overCtorTargets = (fun (dtb_u_u64 : string) -> (let dtb_u_u65 = (v_classify dtb_u_u64) in (match dtb_u_u65 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u66) -> (match dtb_u_u66 with
  | C_Reserved_RsOverCtor (dtb_u_u67, dtb_u_u68) -> dtb_u_u68
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 282 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isOverValueName = (fun (dtb_u_u69 : string) -> (let dtb_u_u70 = (v_classify dtb_u_u69) in (match dtb_u_u70 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u71) -> (match dtb_u_u71 with
  | C_Reserved_RsOverValue (dtb_u_u72, dtb_u_u73) -> true
  | _ -> false
)
  | _ -> false
)))

# 289 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueShort = (fun (dtb_u_u74 : string) -> (let dtb_u_u75 = (v_classify dtb_u_u74) in (match dtb_u_u75 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u76) -> (match dtb_u_u76 with
  | C_Reserved_RsOverValue (dtb_u_u77, dtb_u_u78) -> dtb_u_u77
  | _ -> ""
)
  | _ -> ""
)))

# 296 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_overValueTargets = (fun (dtb_u_u79 : string) -> (let dtb_u_u80 = (v_classify dtb_u_u79) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (match dtb_u_u81 with
  | C_Reserved_RsOverValue (dtb_u_u82, dtb_u_u83) -> dtb_u_u83
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 303 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_doSyntaxCanonical = (fun (dtb_u_u84 : string) -> (let dtb_u_u85 = (v_classify dtb_u_u84) in (match dtb_u_u85 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (match dtb_u_u86 with
  | C_Reserved_RsDoIgnore (dtb_u_u87) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u87))
  | C_Reserved_RsDoBind (dtb_u_u88) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u88))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 326 "Vuna/Compiler/Frontend/Reserved.vuna"
let rec v_joinWithAt = (fun (dtb_u_u89 : string B_dData_dList.t_List) -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (match dtb_u_u91 with
  | B_dData_dList.C_List_Nil -> dtb_u_u90
  | _ -> (String.concat "" [dtb_u_u90; "@"; (v_joinWithAt dtb_u_u91)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_reservedText = (fun (dtb_u_u92 : t_Reserved) -> (match dtb_u_u92 with
  | C_Reserved_RsFieldSel (dtb_u_u93, dtb_u_u94) -> (String.concat "" [v_rsFieldSelPrefix; dtb_u_u93; "@"; dtb_u_u94])
  | C_Reserved_RsDoIgnore (dtb_u_u95) -> (v_rsDoIgnorePrefix ^ dtb_u_u95)
  | C_Reserved_RsDoBind (dtb_u_u96) -> (v_rsDoBindPrefix ^ dtb_u_u96)
  | C_Reserved_RsMacro (dtb_u_u97) -> (v_rsMacroPrefix ^ dtb_u_u97)
  | C_Reserved_RsOverValue (dtb_u_u98, dtb_u_u99) -> (String.concat "" [v_rsOverValuePrefix; dtb_u_u98; "@"; (v_joinWithAt dtb_u_u99)])
  | C_Reserved_RsOverCtor (dtb_u_u100, dtb_u_u101) -> (String.concat "" [v_rsOverCtorPrefix; dtb_u_u100; "@"; (v_joinWithAt dtb_u_u101)])
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
let v_recordProjBinderName = (fun (dtb_u_u102 : int) -> ("@vuna@record@proj" ^ (string_of_int dtb_u_u102)))

# 364 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordArgBinderName = (fun (dtb_u_u103 : int) -> ("@vuna@record@arg" ^ (string_of_int dtb_u_u103)))

# 368 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_recordHiddenFieldBinderName = (fun (dtb_u_u104 : int) -> ("@vuna@record@hf" ^ (string_of_int dtb_u_u104)))

# 380 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_synthNamePrefix = "#"

# 384 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_isSynthName = (fun (dtb_u_u105 : string) -> ((B_dData_dString.v_startsWith v_synthNamePrefix) dtb_u_u105))

# 388 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_sectionBinderName = "#section"

# 392 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_dictBinderName = (fun (dtb_u_u106 : int) -> ("#dict" ^ (string_of_int dtb_u_u106)))

# 396 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_etaBinderName = (fun (dtb_u_u107 : int) -> ("#eta" ^ (string_of_int dtb_u_u107)))

# 400 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_teleProbeBinderName = "#tele"

# 404 "Vuna/Compiler/Frontend/Reserved.vuna"
let v_ovProbeName = (fun (dtb_u_u108 : int) -> ("#ov" ^ (string_of_int dtb_u_u108)))
