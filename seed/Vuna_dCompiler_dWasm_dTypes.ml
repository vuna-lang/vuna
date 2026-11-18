open Vuna_runtime
type t_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind = C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamVariant | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamRecord | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamUnboxed
and t_Vuna_dCompiler_dWasm_dTypes_dWasmCtor = { f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorName : string; f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorTag : int; f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorFields : int }
and t_Vuna_dCompiler_dWasm_dTypes_dWasmFam = { f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName : string; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind : t_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields : int; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors : t_Vuna_dCompiler_dWasm_dTypes_dWasmCtor Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dWasm_dTypes_dWasmListFam = { f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListFamily : string; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag : int; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsTag : int; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsFields : int }

# 50 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_disWatNameChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 53 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatNameChar = (fun c -> (if (v_Vuna_dCompiler_dWasm_dTypes_disWatNameChar c) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 57 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatName = (fun name -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : int) -> (Base_dData_dList.dtp_unpack (v_Vuna_dCompiler_dWasm_dTypes_dwatNameChar c)))) (Base_dData_dList.dtp_unpack name))))

# 61 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatFamName = (fun family -> ("$t_" ^ (v_Vuna_dCompiler_dWasm_dTypes_dwatName family)))

# 65 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf = (fun name -> ("$f_" ^ (v_Vuna_dCompiler_dWasm_dTypes_dwatName name)))

# 69 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf = (fun name -> ("$g_" ^ (v_Vuna_dCompiler_dWasm_dTypes_dwatName name)))

# 73 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwatDataNameOf = (fun n -> ("$d_" ^ (bi_strFromInt n)))

# 82 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOfGo = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorName = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__0); f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorTag = mc1; f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorFields = (Base_dData_dList.v_Base_dData_dList_dlength (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__0)) }, ((v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOfGo dtb__1) (mc1 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOf = (fun ctors -> ((v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOfGo ctors) 0))

# 87 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dmaxCtorFields = (fun (mc0 : t_Vuna_dCompiler_dWasm_dTypes_dWasmCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((fun m -> (if ((dtb__2).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorFields > m) then (dtb__2).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorFields else m)) (v_Vuna_dCompiler_dWasm_dTypes_dmaxCtorFields dtb__3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dfamOfDecl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__4, dtb__5, dtb__6) -> { f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName = dtb__4; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind = C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamUnboxed; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields = 0; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__7, dtb__8, dtb__9, dtb__10) -> { f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName = dtb__7; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind = C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamRecord; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields = (Base_dData_dList.v_Base_dData_dList_dlength dtb__9); f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields = dtb__9 }
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__11, dtb__12, dtb__13) -> ((fun cs -> { f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName = dtb__11; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind = C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamVariant; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields = (v_Vuna_dCompiler_dWasm_dTypes_dmaxCtorFields cs); f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors = cs; f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields = Base_dData_dList.C_Base_dData_dList_dList_Nil }) (v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOf dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmFamsOf = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dTypes_dfamOfDecl) decls))

# 106 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dwasmFamLookup = (fun (mc0 : t_Vuna_dCompiler_dWasm_dTypes_dWasmFam Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if ((dtb__14).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14)) else ((v_Vuna_dCompiler_dWasm_dTypes_dwasmFamLookup dtb__15) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagGo = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dWasm_dTypes_dWasmCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if ((dtb__16).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorName = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__16).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorTag)) else ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagGo mc0) dtb__17))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf = (fun fam ctorName -> ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagGo ctorName) (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors))

# 121 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldGo = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dWasm_dTypes_dWasmCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if ((dtb__18).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorName = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__18).f_Vuna_dCompiler_dWasm_dTypes_dWasmCtor_wasmCtorFields)) else ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldGo mc0) dtb__19))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldCountOf = (fun fam ctorName -> ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldGo ctorName) (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamCtors))

# 129 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldGo = (fun (mc0 : string) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__20) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__20))) else ((v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldGo mc0) dtb__21))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldIndex = (fun fam field -> ((v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldGo field) (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields))

# 134 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmIsRecordFam = (fun fam -> (match (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind with
  | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamRecord -> true
  | _ -> false
))

# 145 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_Vuna_dCompiler_dWasm_dTypes_drepeatField = (fun n -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, (v_Vuna_dCompiler_dWasm_dTypes_drepeatField (n - 1))))))

# 139 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmFamFields = (fun fam -> (match (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind with
  | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamVariant -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (v_Vuna_dCompiler_dWasm_dTypes_drepeatField (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields)))
  | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamRecord -> (v_Vuna_dCompiler_dWasm_dTypes_drepeatField (Base_dData_dList.v_Base_dData_dList_dlength (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields))
  | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamUnboxed -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmFamType = (fun fam -> (match (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind with
  | C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamUnboxed -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ((v_Vuna_dCompiler_dWasm_dTypes_dwatFamName (fam).f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamName), (v_Vuna_dCompiler_dWasm_dTypes_dwasmFamFields fam)))))
))

# 163 "Vuna/Compiler/Wasm/Types.vuna"
let v_Vuna_dCompiler_dWasm_dTypes_dwasmListFamFromFams = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrListFam Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : t_Vuna_dCompiler_dWasm_dTypes_dWasmFam Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> ((fun family -> ((fun nilName -> ((fun consName -> (match ((v_Vuna_dCompiler_dWasm_dTypes_dwasmFamLookup mc1) family) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23) -> (match ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf dtb__23) nilName) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__24) -> (match ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf dtb__23) consName) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__25) -> (match ((v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldCountOf dtb__23) consName) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListFamily = family; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag = dtb__24; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsTag = dtb__25; f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsFields = dtb__26 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListConsOf dtb__22))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListNilOf dtb__22))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__22))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
