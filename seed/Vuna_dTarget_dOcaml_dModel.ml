open Vuna_runtime
type t_OTy = C_OTy_OTVar of (int) | C_OTy_OTInt | C_OTy_OTStr | C_OTy_OTBool | C_OTy_OTFloat | C_OTy_OTOpaque | C_OTy_OTArray of (t_OTy) | C_OTy_OTRef of (t_OTy) | C_OTy_OTFun of (t_OTy) * (t_OTy) | C_OTy_OTData of (string) * (t_OTy B_dData_dList.t_List)
and t_OCtor = { f_OCtor_ocName : string; f_OCtor_ocFields : t_OTy B_dData_dList.t_List }
and t_ODecl = C_ODecl_ODVariant of (int) * (string) * (t_OCtor B_dData_dList.t_List) | C_ODecl_ODRecord of (int) * (string) * ((string, t_OTy) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_ODecl_ODAlias of (int) * (string) * (t_OTy)
and t_OPat = C_OPat_OPVar of (string) | C_OPat_OPWild | C_OPat_OPCtorPat of (string) * (t_OPat B_dData_dList.t_List) | C_OPat_OPRecordPat of ((string, t_OPat) B_dData_dPair.t_Pair B_dData_dList.t_List)
and t_OTerm = C_OTerm_OName of (string) | C_OTerm_ORaw of (string) | C_OTerm_OApp of (t_OTerm) * (t_OTerm) | C_OTerm_OLam of ((string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_OTerm) | C_OTerm_OLet of (t_OPat) * (t_OTerm) * (t_OTerm) | C_OTerm_OIf of (t_OTerm) * (t_OTerm) * (t_OTerm) | C_OTerm_OMatch of (t_OTerm) * ((t_OPat, t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List) * (bool) | C_OTerm_OCtorApp of (string) * (t_OTerm B_dData_dList.t_List) | C_OTerm_ORecordCon of ((string, t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_OTerm_ORecordUpd of (t_OTerm) * ((string, t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_OTerm_OProj of (t_OTerm) * (string) | C_OTerm_OConcatStr of (t_OTerm B_dData_dList.t_List) | C_OTerm_OCast of (t_OTerm) | C_OTerm_OAnnot of (t_OTerm) * (string)
and t_ODef = C_ODef_ODValue of (string) * (t_OTerm) | C_ODef_ODExternal of (string) * (string) * (string)

# 25 "Vuna/Target/Ocaml/Model.vuna"
let v_ocName = (fun (p : t_OCtor) -> (match p with
  | { f_OCtor_ocName = dtb__0; f_OCtor_ocFields = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Target/Ocaml/Model.vuna"
let v_ocFields = (fun (p : t_OCtor) -> (match p with
  | { f_OCtor_ocName = dtb__2; f_OCtor_ocFields = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))
