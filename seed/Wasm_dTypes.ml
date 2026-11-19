open Vuna_runtime
type t_WasmFamKind = C_WasmFamKind_FamVariant | C_WasmFamKind_FamRecord | C_WasmFamKind_FamUnboxed
and t_WasmCtor = { f_WasmCtor_wasmCtorName : string; f_WasmCtor_wasmCtorTag : int; f_WasmCtor_wasmCtorFields : int }
and t_WasmFam = { f_WasmFam_wasmFamName : string; f_WasmFam_wasmFamKind : t_WasmFamKind; f_WasmFam_wasmFamMaxFields : int; f_WasmFam_wasmFamCtors : t_WasmCtor B_dData_dList.t_List; f_WasmFam_wasmFamRecordFields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_WasmListFam = { f_WasmListFam_wasmListFamily : string; f_WasmListFam_wasmListNilTag : int; f_WasmListFam_wasmListConsTag : int; f_WasmListFam_wasmListConsFields : int }

# 50 "Vuna/Compiler/Wasm/Types.vuna"
let v_isWatNameChar = (fun (c : int) -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 53 "Vuna/Compiler/Wasm/Types.vuna"
let v_watNameChar = (fun (c : int) -> (if (v_isWatNameChar c) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 57 "Vuna/Compiler/Wasm/Types.vuna"
let v_watName = (fun (name : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap (fun (c : int) -> (B_dData_dList.dtp_unpack (v_watNameChar c)))) (B_dData_dList.dtp_unpack name))))

# 61 "Vuna/Compiler/Wasm/Types.vuna"
let v_watFamName = (fun (family : string) -> ("$t_" ^ (v_watName family)))

# 65 "Vuna/Compiler/Wasm/Types.vuna"
let v_watFuncNameOf = (fun (name : string) -> ("$f_" ^ (v_watName name)))

# 69 "Vuna/Compiler/Wasm/Types.vuna"
let v_watGlobalNameOf = (fun (name : string) -> ("$g_" ^ (v_watName name)))

# 73 "Vuna/Compiler/Wasm/Types.vuna"
let v_watDataNameOf = (fun (n : int) -> ("$d_" ^ (bi_strFromInt n)))

# 82 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_ctorEntriesOfGo = (fun (mc0 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (B_dData_dList.C_List__x58__x58_ ({ f_WasmCtor_wasmCtorName = (B_dData_dPair.v_firstOf dtb__0); f_WasmCtor_wasmCtorTag = mc1; f_WasmCtor_wasmCtorFields = (B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb__0)) }, ((v_ctorEntriesOfGo dtb__1) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Wasm/Types.vuna"
let v_ctorEntriesOf = (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_ctorEntriesOfGo ctors) 0))

# 87 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_maxCtorFields = (fun (mc0 : t_WasmCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((fun m -> (if ((dtb__2).f_WasmCtor_wasmCtorFields > m) then (dtb__2).f_WasmCtor_wasmCtorFields else m)) (v_maxCtorFields dtb__3))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Wasm/Types.vuna"
let v_famOfDecl = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__4, dtb__5, dtb__6) -> { f_WasmFam_wasmFamName = dtb__4; f_WasmFam_wasmFamKind = C_WasmFamKind_FamUnboxed; f_WasmFam_wasmFamMaxFields = 0; f_WasmFam_wasmFamCtors = B_dData_dList.C_List_Nil; f_WasmFam_wasmFamRecordFields = B_dData_dList.C_List_Nil }
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__7, dtb__8, dtb__9, dtb__10) -> { f_WasmFam_wasmFamName = dtb__7; f_WasmFam_wasmFamKind = C_WasmFamKind_FamRecord; f_WasmFam_wasmFamMaxFields = (B_dData_dList.v_length dtb__9); f_WasmFam_wasmFamCtors = B_dData_dList.C_List_Nil; f_WasmFam_wasmFamRecordFields = dtb__9 }
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__11, dtb__12, dtb__13) -> ((fun cs -> { f_WasmFam_wasmFamName = dtb__11; f_WasmFam_wasmFamKind = C_WasmFamKind_FamVariant; f_WasmFam_wasmFamMaxFields = (v_maxCtorFields cs); f_WasmFam_wasmFamCtors = cs; f_WasmFam_wasmFamRecordFields = B_dData_dList.C_List_Nil }) (v_ctorEntriesOf dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmFamsOf = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((B_dData_dList.v_map v_famOfDecl) decls))

# 106 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_wasmFamLookup = (fun (mc0 : t_WasmFam B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if ((dtb__14).f_WasmFam_wasmFamName = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__14)) else ((v_wasmFamLookup dtb__15) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_wasmCtorTagGo = (fun (mc0 : string) (mc1 : t_WasmCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if ((dtb__16).f_WasmCtor_wasmCtorName = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__16).f_WasmCtor_wasmCtorTag)) else ((v_wasmCtorTagGo mc0) dtb__17))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmCtorTagOf = (fun (fam : t_WasmFam) (ctorName : string) -> ((v_wasmCtorTagGo ctorName) (fam).f_WasmFam_wasmFamCtors))

# 121 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_wasmCtorFieldGo = (fun (mc0 : string) (mc1 : t_WasmCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if ((dtb__18).f_WasmCtor_wasmCtorName = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__18).f_WasmCtor_wasmCtorFields)) else ((v_wasmCtorFieldGo mc0) dtb__19))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmCtorFieldCountOf = (fun (fam : t_WasmFam) (ctorName : string) -> ((v_wasmCtorFieldGo ctorName) (fam).f_WasmFam_wasmFamCtors))

# 129 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_wasmRecordFieldGo = (fun (mc0 : string) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if ((B_dData_dPair.v_secondOf dtb__20) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__20))) else ((v_wasmRecordFieldGo mc0) dtb__21))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmRecordFieldIndex = (fun (fam : t_WasmFam) (field : string) -> ((v_wasmRecordFieldGo field) (fam).f_WasmFam_wasmFamRecordFields))

# 134 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmIsRecordFam = (fun (fam : t_WasmFam) -> (match (fam).f_WasmFam_wasmFamKind with
  | C_WasmFamKind_FamRecord -> true
  | _ -> false
))

# 147 "Vuna/Compiler/Wasm/Types.vuna"
let rec v_repeatField = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvAnyRef }, (v_repeatField (n - 1))))))

# 140 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmFamFields = (fun (fam : t_WasmFam) -> (match (fam).f_WasmFam_wasmFamKind with
  | C_WasmFamKind_FamVariant -> (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvI32 }, (v_repeatField (fam).f_WasmFam_wasmFamMaxFields)))
  | C_WasmFamKind_FamRecord -> (v_repeatField (B_dData_dList.v_length (fam).f_WasmFam_wasmFamRecordFields))
  | C_WasmFamKind_FamUnboxed -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmFamType = (fun (fam : t_WasmFam) -> (match (fam).f_WasmFam_wasmFamKind with
  | C_WasmFamKind_FamUnboxed -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Wasm_dModel.C_WatType_WatStructType ((v_watFamName (fam).f_WasmFam_wasmFamName), (v_wasmFamFields fam)))))
))

# 166 "Vuna/Compiler/Wasm/Types.vuna"
let v_wasmListFamFromFams = (fun (mc0 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (mc1 : t_WasmFam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> ((fun family -> ((fun nilName -> ((fun consName -> (match ((v_wasmFamLookup mc1) family) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (match ((v_wasmCtorTagOf dtb__23) nilName) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (match ((v_wasmCtorTagOf dtb__23) consName) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (match ((v_wasmCtorFieldCountOf dtb__23) consName) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (B_dData_dMaybe.C_Maybe_Just ({ f_WasmListFam_wasmListFamily = family; f_WasmListFam_wasmListNilTag = dtb__24; f_WasmListFam_wasmListConsTag = dtb__25; f_WasmListFam_wasmListConsFields = dtb__26 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dIr_dModel.v_irListConsOf dtb__22))) (Vuna_dIr_dModel.v_irListNilOf dtb__22))) (Vuna_dIr_dModel.v_irListFamilyOf dtb__22))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
