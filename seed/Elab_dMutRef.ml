open Vuna_runtime
type t_MrefRowEntry = { f_MrefRowEntry_mrefRowEntryName : string; f_MrefRowEntry_mrefRowEntryFamily : string; f_MrefRowEntry_mrefRowEntryPayload : Core_dTerm.t_Term }

# 20 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefModuleName = "Base.Effect.MutRef"

# 24 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefOpName = "Base.Effect.MutRef.MutRefOp"

# 28 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefReadName = "Base.Effect.MutRef.read"

# 31 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWriteName = "Base.Effect.MutRef.write"

# 34 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithName = "Base.Effect.MutRef.withMutRef"

# 37 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithPureName = "Base.Effect.MutRef.withMutRefPure"

# 41 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefReadOpName = "Base.Effect.MutRef.cellReadOp"

# 44 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWriteOpName = "Base.Effect.MutRef.cellWriteOp"

# 47 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithOpName = "Base.Effect.MutRef.cellWith"

# 50 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithPureOpName = "Base.Effect.MutRef.cellWithPure"

# 54 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefCellTypeName = "@vuna@Cell"

# 58 "Vuna/Compiler/Elab/MutRef.vuna"
let v_effDropHeadName = "Base.Effect.Core.dropEffHead"

# 62 "Vuna/Compiler/Elab/MutRef.vuna"
let v_effRunPureName = "Base.Effect.Core.runPure"

# 69 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefCellBinder = (fun (n : string) -> ("@vuna@cell@" ^ n))

# 73 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefCellNameOf = (fun (name : string) -> (if ((B_dData_dString.v_startsWith "@vuna@cell@") name) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 11)) (bi_natFromInt ((bi_strLength name) - 11))) name))) else B_dData_dMaybe.C_Maybe_Nothing))

# 89 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefRowEntryNameOf = (fun (e : t_MrefRowEntry) -> (e).f_MrefRowEntry_mrefRowEntryName)

# 92 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefRowEntryFamilyOf = (fun (e : t_MrefRowEntry) -> (e).f_MrefRowEntry_mrefRowEntryFamily)

# 99 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefHeadArgsGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = mc1 }))
  | Core_dTerm.C_Term_TMk (dtb__1, dtb__2) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__2)) mc1) }))
  | Core_dTerm.C_Term_TCon (dtb__3, dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__3; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__4)) mc1) }))
  | Core_dTerm.C_Term_TApp (dtb__5, dtb__6, dtb__7) -> ((v_mrefHeadArgsGo dtb__5) (B_dData_dList.C_List__x58__x58_ (dtb__6, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 96 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefHeadArgs = (fun (t : Core_dTerm.t_Term) -> ((v_mrefHeadArgsGo t) B_dData_dList.C_List_Nil))

# 146 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefEntryOf = (fun (e : Core_dTerm.t_Term) -> (let nd_uscrut1 = (v_mrefHeadArgs e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (if (dtb__9 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut8 = dtb__10 in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match dtb__11 with
  | Core_dTerm.C_Term_TStr (dtb__15) -> (let nd_uscrut16 = (v_mrefHeadArgs dtb__13) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> (match dtb__18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (B_dData_dMaybe.C_Maybe_Just ({ f_MrefRowEntry_mrefRowEntryName = dtb__15; f_MrefRowEntry_mrefRowEntryFamily = dtb__17; f_MrefRowEntry_mrefRowEntryPayload = dtb__19 }))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ f_MrefRowEntry_mrefRowEntryName = dtb__15; f_MrefRowEntry_mrefRowEntryFamily = dtb__17; f_MrefRowEntry_mrefRowEntryPayload = dtb__13 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 128 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefRowEntriesGo = (fun (fuel : int) (r : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let nd_uscrut2 = (v_mrefHeadArgs r) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (if (dtb__22 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut9 = dtb__23 in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (match (v_mrefEntryOf dtb__24) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (B_dData_dList.C_List__x58__x58_ (dtb__28, ((v_mrefRowEntriesGo (fuel - 1)) dtb__26)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mrefRowEntriesGo (fuel - 1)) dtb__26)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefRowEntriesOfTyGo = (fun (fuel : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match t with
  | Core_dTerm.C_Term_TPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> ((v_mrefRowEntriesOfTyGo (fuel - 1)) dtb__33)
  | _ -> (let nd_uscrut2 = (v_mrefHeadArgs t) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (match dtb__34 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> (if (dtb__35 = "Base.Effect.Core.Eff") then (match dtb__36 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> ((v_mrefRowEntriesGo fuel) dtb__37)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 107 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefRowEntriesOfTy = (fun (t : Core_dTerm.t_Term) -> ((v_mrefRowEntriesOfTyGo 256) t))

# 171 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefCellParamsGo = (fun (mc0 : t_MrefRowEntry B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (if ((v_mrefRowEntryFamilyOf dtb__39) = v_mrefOpName) then ((v_mrefCellParamsGo dtb__40) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_mrefRowEntryNameOf dtb__39); B_dData_dPair.f_Pair_second = (dtb__39).f_MrefRowEntry_mrefRowEntryPayload }, mc1))) else ((v_mrefCellParamsGo dtb__40) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefCellParamsOf = (fun (ty : Core_dTerm.t_Term) -> ((v_mrefCellParamsGo (v_mrefRowEntriesOfTy ty)) B_dData_dList.C_List_Nil))

# 183 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefAddCellParamsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (match dtb__41 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> (Core_dTerm.C_Term_TPi ((v_mrefCellBinder dtb__43), true, Core_dTerm.C_Rig_RigOmega, (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (v_mrefCellTypeName)), dtb__44, Core_dTerm.C_Rig_Rig0)), ((v_mrefAddCellParamsGo dtb__42) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefAddCellParams = (fun (ty : Core_dTerm.t_Term) -> ((v_mrefAddCellParamsGo (v_mrefCellParamsOf ty)) ty))

# 202 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_mrefRowKeys = (fun (mc0 : t_MrefRowEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_mrefRowEntryFamilyOf dtb__45); B_dData_dPair.f_Pair_second = (v_mrefRowEntryNameOf dtb__45) }, (v_mrefRowKeys dtb__46)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_memKey = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (if (if (dtb__47 = dtb__51) then (dtb__48 = dtb__52) else false) then true else ((v_memKey { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 }) dtb__50))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/MutRef.vuna"
let rec v_duplicateKeysGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if ((v_memKey dtb__53) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__53, ((v_duplicateKeysGo dtb__54) mc1))) else ((v_duplicateKeysGo dtb__54) (B_dData_dList.C_List__x58__x58_ (dtb__53, mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Elab/MutRef.vuna"
let v_duplicateRowKeys = (fun (ty : Core_dTerm.t_Term) -> ((v_duplicateKeysGo (v_mrefRowKeys (v_mrefRowEntriesOfTy ty))) B_dData_dList.C_List_Nil))

# 219 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefReadExpr = (fun (sp : Base_dSource.t_Span) (cell : string) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal (v_mrefModuleName, "cellReadOp")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_instArgSyntax)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (cell, sp)), B_dData_dList.C_List_Nil)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal ((v_mrefCellBinder cell))), sp)), B_dData_dList.C_List_Nil)))), sp)))

# 227 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWriteExpr = (fun (sp : Base_dSource.t_Span) (cell : string) (v : Frontend_dRast.t_Expr) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal (v_mrefModuleName, "cellWriteOp")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_instArgSyntax)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (cell, sp)), B_dData_dList.C_List_Nil)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal ((v_mrefCellBinder cell))), sp)), (B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)))))), sp)))

# 235 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithExpr = (fun (sp : Base_dSource.t_Span) (nExpr : Frontend_dRast.t_Expr) (init : Frontend_dRast.t_Expr) (body : Frontend_dRast.t_Expr) (cellName : string) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "dropEffHead")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal (v_mrefModuleName, "cellWith")), sp)), (B_dData_dList.C_List__x58__x58_ (nExpr, (B_dData_dList.C_List__x58__x58_ (init, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_mrefCellBinder cellName); B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), body, sp)), B_dData_dList.C_List_Nil)))))), sp)), B_dData_dList.C_List_Nil)), sp)))

# 243 "Vuna/Compiler/Elab/MutRef.vuna"
let v_mrefWithPureExpr = (fun (sp : Base_dSource.t_Span) (nExpr : Frontend_dRast.t_Expr) (init : Frontend_dRast.t_Expr) (body : Frontend_dRast.t_Expr) (cellName : string) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "runPure")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "dropEffHead")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal (v_mrefModuleName, "cellWithPure")), sp)), (B_dData_dList.C_List__x58__x58_ (nExpr, (B_dData_dList.C_List__x58__x58_ (init, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_mrefCellBinder cellName); B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), body, sp)), B_dData_dList.C_List_Nil)))))), sp)), B_dData_dList.C_List_Nil)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 251 "Vuna/Compiler/Elab/MutRef.vuna"
let v_stringLitOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EStr (dtb__55, dtb__56) -> (B_dData_dMaybe.C_Maybe_Just (dtb__55))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
