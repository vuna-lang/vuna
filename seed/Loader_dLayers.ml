open Vuna_runtime
# 29 "Vuna/Compiler/Loader/Layers.vuna"
let v_isLayerPrefix = (fun (dtb_u_u1 : string) (dtb_u_u2 : string) -> (if (dtb_u_u2 = dtb_u_u1) then true else ((B_dData_dString.v_startsWith (dtb_u_u1 ^ ".")) dtb_u_u2)))

# 32 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesOfLayer = (fun (dtb_u_u3 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u4 : string) -> (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> (if ((dtb_u_u5).Frontend_dManifest.f_Layer_layerName = dtb_u_u4) then (dtb_u_u5).Frontend_dManifest.f_Layer_layerUses else ((v_usesOfLayer dtb_u_u6) dtb_u_u4))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_closureGo = (fun (dtb_u_u7 : int) (dtb_u_u8 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u9 : string B_dContainer_dQueue.t_Queue) (dtb_u_u10 : string B_dData_dList.t_List) -> (if (dtb_u_u7 <= 0) then (Base_dDiag.v_icInternal "layer closure fuel exhausted") else (let dtb_u_u11 = (B_dContainer_dQueue.v_pop dtb_u_u9) in (match dtb_u_u11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u12) -> (match dtb_u_u12 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u13; B_dData_dPair.f_Pair_second = dtb_u_u14 } -> (if ((B_dData_dList.v_memName dtb_u_u13) dtb_u_u10) then ((((v_closureGo (dtb_u_u7 - 1)) dtb_u_u8) dtb_u_u14) dtb_u_u10) else ((((v_closureGo (dtb_u_u7 - 1)) dtb_u_u8) ((B_dContainer_dQueue.v_pushAll ((v_usesOfLayer dtb_u_u8) dtb_u_u13)) dtb_u_u14)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u10))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u10))
  | _ -> failwith "DT: impossible branch"
))))

# 50 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesTotal = (fun (dtb_u_u15 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match dtb_u_u15 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> ((B_dData_dList.v_length (dtb_u_u16).Frontend_dManifest.f_Layer_layerUses) + (v_usesTotal dtb_u_u17))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Loader/Layers.vuna"
let v_closureBound = (fun (dtb_u_u18 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (((v_usesTotal dtb_u_u18) + (B_dData_dList.v_length dtb_u_u18)) + 2))

# 55 "Vuna/Compiler/Loader/Layers.vuna"
let v_allowedByRow = (fun (dtb_u_u19 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u20 : Frontend_dManifest.t_Layer) -> ((((v_closureGo (v_closureBound dtb_u_u19)) dtb_u_u19) (B_dContainer_dQueue.v_fromList (dtb_u_u20).Frontend_dManifest.f_Layer_layerUses)) (B_dData_dList.C_List__x58__x58_ ((dtb_u_u20).Frontend_dManifest.f_Layer_layerName, B_dData_dList.C_List_Nil))))

# 59 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_covered = (fun (dtb_u_u21 : string B_dData_dList.t_List) (dtb_u_u22 : string) -> (match dtb_u_u21 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u23, dtb_u_u24) -> (if ((v_isLayerPrefix dtb_u_u23) dtb_u_u22) then true else ((v_covered dtb_u_u24) dtb_u_u22))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_importAllowed = (fun (dtb_u_u25 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u26 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u27 : string) -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> ((Base_dCommon.v_bind ((v_allowedByRow dtb_u_u25) dtb_u_u28)) (fun (dtb_u_u30 : string B_dData_dList.t_List) -> (if ((v_covered dtb_u_u30) dtb_u_u27) then (((v_importAllowed dtb_u_u25) dtb_u_u29) dtb_u_u27) else (Base_dDiag.C_Check_OkC (false)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (true))
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Loader/Layers.vuna"
let v_layerMatches = (fun (dtb_u_u31 : string) (dtb_u_u32 : Frontend_dManifest.t_Layer) -> ((v_isLayerPrefix (dtb_u_u32).Frontend_dManifest.f_Layer_layerName) dtb_u_u31))

# 74 "Vuna/Compiler/Loader/Layers.vuna"
let v_matchingLayers = (fun (dtb_u_u33 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u34 : string) -> ((B_dData_dList.v_filter (v_layerMatches dtb_u_u34)) dtb_u_u33))

# 84 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_labelBest = (fun (dtb_u_u35 : Frontend_dManifest.t_Layer) (dtb_u_u36 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match dtb_u_u36 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u37, dtb_u_u38) -> (if ((String.length (dtb_u_u37).Frontend_dManifest.f_Layer_layerName) > (String.length (dtb_u_u35).Frontend_dManifest.f_Layer_layerName)) then ((v_labelBest dtb_u_u37) dtb_u_u38) else ((v_labelBest dtb_u_u35) dtb_u_u38))
  | B_dData_dList.C_List_Nil -> (dtb_u_u35).Frontend_dManifest.f_Layer_layerName
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Loader/Layers.vuna"
let v_labelOf = (fun (dtb_u_u39 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u40 : string) -> (match ((v_matchingLayers dtb_u_u39) dtb_u_u40) with
  | B_dData_dList.C_List_Nil -> (Base_dSource.v_prefixOfName dtb_u_u40)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> ((v_labelBest dtb_u_u41) dtb_u_u42)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_layersOfRoot = (fun (dtb_u_u43 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u44 : string) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb_u_u45) = dtb_u_u44) then (Frontend_dPackages_dPkg.v_rootLayers dtb_u_u45) else ((v_layersOfRoot dtb_u_u46) dtb_u_u44))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Loader/Layers.vuna"
let v_withImportSpan = (fun (dtb_u_u47 : Frontend_dAst.t_Import) (dtb_u_u48 : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan dtb_u_u47)) = "") then dtb_u_u48 else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan dtb_u_u47)) dtb_u_u48)))

# 97 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkImports = (fun (dtb_u_u49 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u50 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (dtb_u_u51 : string) (dtb_u_u52 : string) (dtb_u_u53 : string) (dtb_u_u54 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u55 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u55 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u57) -> (match ((Loader_dModules.v_findModule dtb_u_u54) (Frontend_dAst.v_importName dtb_u_u56)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if (dtb_u_u52 = dtb_u_u53) then ((B_dData_dList.v_length ((v_matchingLayers dtb_u_u49) (Frontend_dAst.v_importName dtb_u_u56))) > 0) else false) then ((Base_dCommon.v_bind (((v_importAllowed dtb_u_u49) dtb_u_u50) (Frontend_dAst.v_importName dtb_u_u56))) (fun (dtb_u_u58 : bool) -> (if dtb_u_u58 then (((((((v_checkImports dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u57) else ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb_u_u56)) (((((Base_dDiagnostics_dLoader.v_ldErr4 Base_dDiagnostics_dLoader.C_LdDiag_LayerViolation) dtb_u_u51) (Frontend_dAst.v_importName dtb_u_u56)) ((v_labelOf dtb_u_u49) dtb_u_u51)) ((v_labelOf dtb_u_u49) (Frontend_dAst.v_importName dtb_u_u56))))))) else (((((((v_checkImports dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u57))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (if ((Loader_dModules.v_modulePackageOf dtb_u_u59) <> dtb_u_u52) then (((((((v_checkImports dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u57) else ((Base_dCommon.v_bind (((v_importAllowed dtb_u_u49) dtb_u_u50) (Loader_dModules.v_moduleNameOf dtb_u_u59))) (fun (dtb_u_u60 : bool) -> (if dtb_u_u60 then (((((((v_checkImports dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u57) else ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb_u_u56)) (((((Base_dDiagnostics_dLoader.v_ldErr4 Base_dDiagnostics_dLoader.C_LdDiag_LayerViolation) dtb_u_u51) (Loader_dModules.v_moduleNameOf dtb_u_u59)) ((v_labelOf dtb_u_u49) dtb_u_u51)) ((v_labelOf dtb_u_u49) (Loader_dModules.v_moduleNameOf dtb_u_u59))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dUnit.C_Unit_MkUnit))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkModules = (fun (dtb_u_u61 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u62 : string) (dtb_u_u63 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u64 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match dtb_u_u64 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u65, dtb_u_u66) -> (let dtb_u_u67 = ((v_layersOfRoot dtb_u_u61) (Loader_dModules.v_modulePackageOf dtb_u_u65)) in (let dtb_u_u68 = ((v_matchingLayers dtb_u_u67) (Loader_dModules.v_moduleNameOf dtb_u_u65)) in (if ((B_dData_dList.v_length dtb_u_u68) = 0) then ((((v_checkModules dtb_u_u61) dtb_u_u62) dtb_u_u63) dtb_u_u66) else (match (((((((v_checkImports dtb_u_u67) dtb_u_u68) (Loader_dModules.v_moduleNameOf dtb_u_u65)) (Loader_dModules.v_modulePackageOf dtb_u_u65)) dtb_u_u62) dtb_u_u63) (Loader_dModules.v_moduleAllImportsOf dtb_u_u65)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u69) -> (Base_dDiag.C_Check_ErrC (dtb_u_u69))
  | Base_dDiag.C_Check_OkC (dtb_u_u70) -> ((((v_checkModules dtb_u_u61) dtb_u_u62) dtb_u_u63) dtb_u_u66)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dUnit.C_Unit_MkUnit))
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Layers.vuna"
let v_checkProjectLayers = (fun (dtb_u_u71 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u72 : Loader_dModules.t_Project) -> ((((v_checkModules dtb_u_u71) (dtb_u_u72).Loader_dModules.f_Project_projectEntryPkg) (dtb_u_u72).Loader_dModules.f_Project_projectModules) (dtb_u_u72).Loader_dModules.f_Project_projectModules))
