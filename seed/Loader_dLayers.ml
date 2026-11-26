open Vuna_runtime
# 29 "Vuna/Compiler/Loader/Layers.vuna"
let v_isLayerPrefix = (fun (prefix : string) (name : string) -> (if (name = prefix) then true else ((B_dData_dString.v_startsWith (prefix ^ ".")) name)))

# 32 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesOfLayer = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).Frontend_dManifest.f_Layer_layerName = mc1) then (dtb__0).Frontend_dManifest.f_Layer_layerUses else ((v_usesOfLayer dtb__1) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_closureGo = (fun (fuel : int) (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) (todo : string B_dContainer_dQueue.t_Queue) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "layer closure fuel exhausted") else (let nd_uscrut4 = (B_dContainer_dQueue.v_pop todo) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (match dtb__2 with
  | { B_dData_dPair.f_Pair_first = dtb__3; B_dData_dPair.f_Pair_second = dtb__4 } -> (if ((B_dData_dList.v_memName dtb__3) acc) then ((((v_closureGo (fuel - 1)) layers) dtb__4) acc) else ((((v_closureGo (fuel - 1)) layers) ((B_dContainer_dQueue.v_pushAll ((v_usesOfLayer layers) dtb__3)) dtb__4)) (B_dData_dList.C_List__x58__x58_ (dtb__3, acc))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (acc))
  | _ -> failwith "DT: impossible branch"
))))

# 50 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesTotal = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> ((B_dData_dList.v_length (dtb__5).Frontend_dManifest.f_Layer_layerUses) + (v_usesTotal dtb__6))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Loader/Layers.vuna"
let v_closureBound = (fun (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (((v_usesTotal layers) + (B_dData_dList.v_length layers)) + 2))

# 55 "Vuna/Compiler/Loader/Layers.vuna"
let v_allowedByRow = (fun (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) (l : Frontend_dManifest.t_Layer) -> ((((v_closureGo (v_closureBound layers)) layers) (B_dContainer_dQueue.v_fromList (l).Frontend_dManifest.f_Layer_layerUses)) (B_dData_dList.C_List__x58__x58_ ((l).Frontend_dManifest.f_Layer_layerName, B_dData_dList.C_List_Nil))))

# 59 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_covered = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if ((v_isLayerPrefix dtb__7) mc1) then true else ((v_covered dtb__8) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_importAllowed = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((Base_dCommon.v_bind ((v_allowedByRow mc0) dtb__9)) (fun (allowed : string B_dData_dList.t_List) -> (if ((v_covered allowed) mc2) then (((v_importAllowed mc0) dtb__10) mc2) else (Base_dDiag.C_Check_OkC (false)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (true))
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Loader/Layers.vuna"
let v_layerMatches = (fun (name : string) (l : Frontend_dManifest.t_Layer) -> ((v_isLayerPrefix (l).Frontend_dManifest.f_Layer_layerName) name))

# 74 "Vuna/Compiler/Loader/Layers.vuna"
let v_matchingLayers = (fun (rules : Frontend_dManifest.t_Layer B_dData_dList.t_List) (name : string) -> ((B_dData_dList.v_filter (v_layerMatches name)) rules))

# 84 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_labelBest = (fun (mc0 : Frontend_dManifest.t_Layer) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (if ((bi_strLength (dtb__11).Frontend_dManifest.f_Layer_layerName) > (bi_strLength (mc0).Frontend_dManifest.f_Layer_layerName)) then ((v_labelBest dtb__11) dtb__12) else ((v_labelBest mc0) dtb__12))
  | B_dData_dList.C_List_Nil -> (mc0).Frontend_dManifest.f_Layer_layerName
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Loader/Layers.vuna"
let v_labelOf = (fun (rules : Frontend_dManifest.t_Layer B_dData_dList.t_List) (name : string) -> (match ((v_matchingLayers rules) name) with
  | B_dData_dList.C_List_Nil -> (Base_dSource.v_prefixOfName name)
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> ((v_labelBest dtb__13) dtb__14)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_layersOfRoot = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__15) = mc1) then (Frontend_dPackages_dPkg.v_rootLayers dtb__15) else ((v_layersOfRoot dtb__16) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Loader/Layers.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan imp)) = "") then e else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan imp)) e)))

# 97 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkImports = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : string) (mc5 : Loader_dModules.t_Module B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match ((Loader_dModules.v_findModule mc5) (Frontend_dAst.v_importName dtb__17)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if (mc3 = mc4) then ((B_dData_dList.v_length ((v_matchingLayers mc0) (Frontend_dAst.v_importName dtb__17))) > 0) else false) then ((Base_dCommon.v_bind (((v_importAllowed mc0) mc1) (Frontend_dAst.v_importName dtb__17))) (fun (ok : bool) -> (if ok then (((((((v_checkImports mc0) mc1) mc2) mc3) mc4) mc5) dtb__18) else ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb__17)) (((((Base_dDiagnostics_dLoader.v_ldErr4 Base_dDiagnostics_dLoader.C_LdDiag_LayerViolation) mc2) (Frontend_dAst.v_importName dtb__17)) ((v_labelOf mc0) mc2)) ((v_labelOf mc0) (Frontend_dAst.v_importName dtb__17))))))) else (((((((v_checkImports mc0) mc1) mc2) mc3) mc4) mc5) dtb__18))
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (if ((Loader_dModules.v_modulePackageOf dtb__19) <> mc3) then (((((((v_checkImports mc0) mc1) mc2) mc3) mc4) mc5) dtb__18) else ((Base_dCommon.v_bind (((v_importAllowed mc0) mc1) (Loader_dModules.v_moduleNameOf dtb__19))) (fun (ok : bool) -> (if ok then (((((((v_checkImports mc0) mc1) mc2) mc3) mc4) mc5) dtb__18) else ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb__17)) (((((Base_dDiagnostics_dLoader.v_ldErr4 Base_dDiagnostics_dLoader.C_LdDiag_LayerViolation) mc2) (Loader_dModules.v_moduleNameOf dtb__19)) ((v_labelOf mc0) mc2)) ((v_labelOf mc0) (Loader_dModules.v_moduleNameOf dtb__19))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dUnit.C_Unit_MkUnit))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkModules = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : Loader_dModules.t_Module B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (let rules = ((v_layersOfRoot mc0) (Loader_dModules.v_modulePackageOf dtb__20)) in (let matched = ((v_matchingLayers rules) (Loader_dModules.v_moduleNameOf dtb__20)) in (if ((B_dData_dList.v_length matched) = 0) then ((((v_checkModules mc0) mc1) mc2) dtb__21) else (match (((((((v_checkImports rules) matched) (Loader_dModules.v_moduleNameOf dtb__20)) (Loader_dModules.v_modulePackageOf dtb__20)) mc1) mc2) (Loader_dModules.v_moduleAllImportsOf dtb__20)) with
  | Base_dDiag.C_Check_ErrC (dtb__22) -> (Base_dDiag.C_Check_ErrC (dtb__22))
  | Base_dDiag.C_Check_OkC (dtb__23) -> ((((v_checkModules mc0) mc1) mc2) dtb__21)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dUnit.C_Unit_MkUnit))
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Layers.vuna"
let v_checkProjectLayers = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((((v_checkModules roots) (project).Loader_dModules.f_Project_projectEntryPkg) (project).Loader_dModules.f_Project_projectModules) (project).Loader_dModules.f_Project_projectModules))
