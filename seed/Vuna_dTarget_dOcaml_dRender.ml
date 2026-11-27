open Vuna_runtime
# 16 "Vuna/Target/Ocaml/Render.vuna"
let[@tail_mod_cons] rec v_interpose = (fun (dtb_u_u1 : string) (dtb_u_u2 : string B_dData_dList.t_List) -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (match dtb_u_u4 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u3, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u3, (B_dData_dList.C_List__x58__x58_ (dtb_u_u1, ((v_interpose dtb_u_u1) dtb_u_u4)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 13 "Vuna/Target/Ocaml/Render.vuna"
let v_joinWith = (fun (dtb_u_u5 : string) (dtb_u_u6 : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v_interpose dtb_u_u5) dtb_u_u6)))

# 21 "Vuna/Target/Ocaml/Render.vuna"
let v_typeParamName = (fun (dtb_u_u7 : int) -> ("'a" ^ (string_of_int dtb_u_u7)))

# 24 "Vuna/Target/Ocaml/Render.vuna"
let v_typeParamDecl = (fun (dtb_u_u8 : int) -> (if (dtb_u_u8 = 0) then "" else (let dtb_u_u9 = ((B_dData_dList.v_map v_typeParamName) ((B_dData_dList.v_range 0) dtb_u_u8)) in (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (match dtb_u_u11 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u10 ^ " ")
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") dtb_u_u9); ") "])
)
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") dtb_u_u9); ") "])
))))

# 31 "Vuna/Target/Ocaml/Render.vuna"
let v_familyTy = (fun (dtb_u_u12 : string) (dtb_u_u13 : string B_dData_dList.t_List) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u15 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [dtb_u_u14; " "; dtb_u_u12])
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") dtb_u_u13); ") "; dtb_u_u12])
)
  | B_dData_dList.C_List_Nil -> dtb_u_u12
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Target/Ocaml/Render.vuna"
let rec v_renderTy = (fun (dtb_u_u16 : (string) -> string) (dtb_u_u17 : Vuna_dTarget_dOcaml_dModel.t_OTy) -> (match dtb_u_u17 with
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTData (dtb_u_u18, dtb_u_u19) -> ((v_familyTy (dtb_u_u16 dtb_u_u18)) ((B_dData_dList.v_map (v_renderTy dtb_u_u16)) dtb_u_u19))
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTFun (dtb_u_u20, dtb_u_u21) -> (String.concat "" ["("; ((v_renderTy dtb_u_u16) dtb_u_u20); ") -> "; ((v_renderTy dtb_u_u16) dtb_u_u21)])
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTRef (dtb_u_u22) -> (String.concat "" ["("; ((v_renderTy dtb_u_u16) dtb_u_u22); " ref)"])
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTArray (dtb_u_u23) -> (String.concat "" ["("; ((v_renderTy dtb_u_u16) dtb_u_u23); " array)"])
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTOpaque -> "Obj.t"
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTFloat -> "float"
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTBool -> "bool"
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTStr -> "string"
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTInt -> "int"
  | Vuna_dTarget_dOcaml_dModel.C_OTy_OTVar (dtb_u_u24) -> (v_typeParamName dtb_u_u24)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Target/Ocaml/Render.vuna"
let v_ctorDecl = (fun (dtb_u_u25 : (string) -> string) (dtb_u_u26 : Vuna_dTarget_dOcaml_dModel.t_OCtor) -> (let dtb_u_u27 = (dtb_u_u26).Vuna_dTarget_dOcaml_dModel.f_OCtor_ocFields in (match dtb_u_u27 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (match dtb_u_u29 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(dtb_u_u26).Vuna_dTarget_dOcaml_dModel.f_OCtor_ocName; " of ("; ((v_renderTy dtb_u_u25) dtb_u_u28); ")"])
  | _ -> (String.concat "" [(dtb_u_u26).Vuna_dTarget_dOcaml_dModel.f_OCtor_ocName; " of "; ((v_joinWith " * ") ((B_dData_dList.v_map (fun (dtb_u_u30 : Vuna_dTarget_dOcaml_dModel.t_OTy) -> (String.concat "" ["("; ((v_renderTy dtb_u_u25) dtb_u_u30); ")"]))) dtb_u_u27))])
)
  | B_dData_dList.C_List_Nil -> (dtb_u_u26).Vuna_dTarget_dOcaml_dModel.f_OCtor_ocName
  | _ -> failwith "DT: impossible branch"
)))

# 65 "Vuna/Target/Ocaml/Render.vuna"
let v_fieldDecl = (fun (dtb_u_u31 : (string) -> string) (dtb_u_u32 : (string, Vuna_dTarget_dOcaml_dModel.t_OTy) B_dData_dPair.t_Pair) -> (match dtb_u_u32 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u33; B_dData_dPair.f_Pair_second = dtb_u_u34 } -> (String.concat "" [dtb_u_u33; " : "; ((v_renderTy dtb_u_u31) dtb_u_u34)])
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Target/Ocaml/Render.vuna"
let v_renderDecl = (fun (dtb_u_u35 : (string) -> string) (dtb_u_u36 : Vuna_dTarget_dOcaml_dModel.t_ODecl) -> (match dtb_u_u36 with
  | Vuna_dTarget_dOcaml_dModel.C_ODecl_ODAlias (dtb_u_u37, dtb_u_u38, dtb_u_u39) -> (String.concat "" [(v_typeParamDecl dtb_u_u37); dtb_u_u38; " = "; ((v_renderTy dtb_u_u35) dtb_u_u39)])
  | Vuna_dTarget_dOcaml_dModel.C_ODecl_ODRecord (dtb_u_u40, dtb_u_u41, dtb_u_u42) -> (String.concat "" [(v_typeParamDecl dtb_u_u40); dtb_u_u41; " = { "; ((v_joinWith "; ") ((B_dData_dList.v_map (v_fieldDecl dtb_u_u35)) dtb_u_u42)); " }"])
  | Vuna_dTarget_dOcaml_dModel.C_ODecl_ODVariant (dtb_u_u43, dtb_u_u44, dtb_u_u45) -> (match dtb_u_u45 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(v_typeParamDecl dtb_u_u43); dtb_u_u44; " = |"])
  | _ -> (String.concat "" [(v_typeParamDecl dtb_u_u43); dtb_u_u44; " = "; ((v_joinWith " | ") ((B_dData_dList.v_map (v_ctorDecl dtb_u_u35)) dtb_u_u45))])
)
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Target/Ocaml/Render.vuna"
let v_renderDecls = (fun (dtb_u_u46 : (string) -> string) (dtb_u_u47 : Vuna_dTarget_dOcaml_dModel.t_ODecl B_dData_dList.t_List) -> (match dtb_u_u47 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_joinWith "\nand ") ((B_dData_dList.v_map (v_renderDecl dtb_u_u46)) dtb_u_u47)); "\n\n"])
))

# 78 "Vuna/Target/Ocaml/Render.vuna"
let rec v_renderPat = (fun (dtb_u_u48 : Vuna_dTarget_dOcaml_dModel.t_OPat) -> (match dtb_u_u48 with
  | Vuna_dTarget_dOcaml_dModel.C_OPat_OPRecordPat (dtb_u_u49) -> (String.concat "" ["{ "; ((v_joinWith "; ") ((B_dData_dList.v_map v_fieldAssign) dtb_u_u49)); " }"])
  | Vuna_dTarget_dOcaml_dModel.C_OPat_OPCtorPat (dtb_u_u50, dtb_u_u51) -> (match dtb_u_u51 with
  | B_dData_dList.C_List_Nil -> dtb_u_u50
  | _ -> (String.concat "" [dtb_u_u50; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderPat) dtb_u_u51)); ")"])
)
  | Vuna_dTarget_dOcaml_dModel.C_OPat_OPWild -> "_"
  | Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u52) -> dtb_u_u52
  | _ -> failwith "DT: impossible branch"
))
# 85 "Vuna/Target/Ocaml/Render.vuna"
and v_fieldAssign = (fun (dtb_u_u53 : (string, Vuna_dTarget_dOcaml_dModel.t_OPat) B_dData_dPair.t_Pair) -> (match dtb_u_u53 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = dtb_u_u55 } -> (String.concat "" [dtb_u_u54; " = "; (v_renderPat dtb_u_u55)])
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Target/Ocaml/Render.vuna"
let v_binderText = (fun (dtb_u_u56 : (string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (match dtb_u_u56 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u57; B_dData_dPair.f_Pair_second = dtb_u_u58 } -> (match dtb_u_u58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (String.concat "" ["("; dtb_u_u57; " : "; dtb_u_u59; ")"])
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u57
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Target/Ocaml/Render.vuna"
let rec v_renderTerm = (fun (dtb_u_u60 : Vuna_dTarget_dOcaml_dModel.t_OTerm) -> (match dtb_u_u60 with
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OAnnot (dtb_u_u61, dtb_u_u62) -> (String.concat "" ["("; (v_renderTerm dtb_u_u61); " : "; dtb_u_u62; ")"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OCast (dtb_u_u63) -> (String.concat "" ["(Obj.magic "; (v_renderTerm dtb_u_u63); ")"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OConcatStr (dtb_u_u64) -> (String.concat "" ["(String.concat \"\" ["; ((v_joinWith "; ") ((B_dData_dList.v_map v_renderTerm) dtb_u_u64)); "])"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OProj (dtb_u_u65, dtb_u_u66) -> (String.concat "" ["("; (v_renderTerm dtb_u_u65); ")."; dtb_u_u66])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_ORecordUpd (dtb_u_u67, dtb_u_u68) -> (String.concat "" ["{ "; (v_renderTerm dtb_u_u67); " with "; ((v_joinWith "; ") (v_recordFields dtb_u_u68)); " }"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_ORecordCon (dtb_u_u69) -> (String.concat "" ["{ "; ((v_joinWith "; ") (v_recordFields dtb_u_u69)); " }"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OCtorApp (dtb_u_u70, dtb_u_u71) -> (match dtb_u_u71 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u72, dtb_u_u73) -> (match dtb_u_u73 with
  | B_dData_dList.C_List_Nil -> (String.concat "" ["("; dtb_u_u70; " ("; (v_renderTerm dtb_u_u72); "))"])
  | _ -> (String.concat "" ["("; dtb_u_u70; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderTerm) dtb_u_u71)); "))"])
)
  | B_dData_dList.C_List_Nil -> dtb_u_u70
  | _ -> (String.concat "" ["("; dtb_u_u70; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderTerm) dtb_u_u71)); "))"])
)
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OMatch (dtb_u_u74, dtb_u_u75, dtb_u_u76) -> (let dtb_u_u77 = ((v_joinWith "") ((B_dData_dList.v_map v_renderArm) dtb_u_u75)) in (let dtb_u_u78 = (if dtb_u_u76 then "" else "  | _ -> failwith \"DT: impossible branch\"\n") in (String.concat "" ["(match "; (v_renderTerm dtb_u_u74); " with\n"; dtb_u_u77; dtb_u_u78; ")"])))
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OIf (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> (String.concat "" ["(if "; (v_renderTerm dtb_u_u79); " then "; (v_renderTerm dtb_u_u80); " else "; (v_renderTerm dtb_u_u81); ")"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet (dtb_u_u82, dtb_u_u83, dtb_u_u84) -> (String.concat "" ["(let "; (v_renderPat dtb_u_u82); " = "; (v_renderTerm dtb_u_u83); " in "; (v_renderTerm dtb_u_u84); ")"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OLam (dtb_u_u85, dtb_u_u86) -> (match dtb_u_u85 with
  | B_dData_dList.C_List_Nil -> (v_renderTerm dtb_u_u86)
  | _ -> (String.concat "" ["(fun "; ((v_joinWith " ") ((B_dData_dList.v_map v_binderText) dtb_u_u85)); " -> "; (v_renderTerm dtb_u_u86); ")"])
)
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OApp (dtb_u_u87, dtb_u_u88) -> (String.concat "" ["("; (v_renderTerm dtb_u_u87); " "; (v_renderTerm dtb_u_u88); ")"])
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw (dtb_u_u89) -> dtb_u_u89
  | Vuna_dTarget_dOcaml_dModel.C_OTerm_OName (dtb_u_u90) -> dtb_u_u90
  | _ -> failwith "DT: impossible branch"
))
# 117 "Vuna/Target/Ocaml/Render.vuna"
and v_renderArm = (fun (dtb_u_u91 : (Vuna_dTarget_dOcaml_dModel.t_OPat, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair) -> (match dtb_u_u91 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u92; B_dData_dPair.f_Pair_second = dtb_u_u93 } -> (String.concat "" ["  | "; (v_renderPat dtb_u_u92); " -> "; (v_renderTerm dtb_u_u93); "\n"])
  | _ -> failwith "DT: impossible branch"
))
# 120 "Vuna/Target/Ocaml/Render.vuna"
and v_recordField = (fun (dtb_u_u94 : (string, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair) -> (match dtb_u_u94 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u95; B_dData_dPair.f_Pair_second = dtb_u_u96 } -> (String.concat "" [dtb_u_u95; " = "; (v_renderTerm dtb_u_u96)])
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Target/Ocaml/Render.vuna"
and v_recordFields = (fun (dtb_u_u97 : (string, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map v_recordField) dtb_u_u97))
