open Vuna_runtime
# 25 "Vuna/Compiler/Loader/Layers.vuna"
let v_isLayerPrefix = (fun (prefix : string) (name : string) -> (if (name = prefix) then true else ((B_dData_dString.v_startsWith (prefix ^ ".")) name)))

# 28 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesOfLayer = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).Frontend_dManifest.f_Layer_layerName = mc1) then (dtb__0).Frontend_dManifest.f_Layer_layerUses else ((v_usesOfLayer dtb__1) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_closureGo = (fun (fuel : int) (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) (todo : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match todo with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if ((B_dData_dList.v_memName dtb__2) acc) then ((((v_closureGo (fuel - 1)) layers) dtb__3) acc) else ((((v_closureGo (fuel - 1)) layers) ((B_dData_dList.v_append dtb__3) ((v_usesOfLayer layers) dtb__2))) (B_dData_dList.C_List__x58__x58_ (dtb__2, acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 46 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_usesTotal = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> ((B_dData_dList.v_length (dtb__4).Frontend_dManifest.f_Layer_layerUses) + (v_usesTotal dtb__5))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Loader/Layers.vuna"
let v_closureBound = (fun (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (((v_usesTotal layers) + (B_dData_dList.v_length layers)) + 2))

# 51 "Vuna/Compiler/Loader/Layers.vuna"
let v_allowedByRow = (fun (layers : Frontend_dManifest.t_Layer B_dData_dList.t_List) (l : Frontend_dManifest.t_Layer) -> ((((v_closureGo (v_closureBound layers)) layers) (l).Frontend_dManifest.f_Layer_layerUses) (B_dData_dList.C_List__x58__x58_ ((l).Frontend_dManifest.f_Layer_layerName, B_dData_dList.C_List_Nil))))

# 54 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_covered = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if ((v_isLayerPrefix dtb__6) mc1) then true else ((v_covered dtb__7) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_importAllowed = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if ((v_covered ((v_allowedByRow mc0) dtb__8)) mc2) then (((v_importAllowed mc0) dtb__9) mc2) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Loader/Layers.vuna"
let v_layerMatches = (fun (name : string) (l : Frontend_dManifest.t_Layer) -> ((v_isLayerPrefix (l).Frontend_dManifest.f_Layer_layerName) name))

# 67 "Vuna/Compiler/Loader/Layers.vuna"
let v_matchingLayers = (fun (rules : Frontend_dManifest.t_Layer B_dData_dList.t_List) (name : string) -> ((B_dData_dList.v_filter (v_layerMatches name)) rules))

# 77 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_labelBest = (fun (mc0 : Frontend_dManifest.t_Layer) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if ((bi_strLength (dtb__10).Frontend_dManifest.f_Layer_layerName) > (bi_strLength (mc0).Frontend_dManifest.f_Layer_layerName)) then ((v_labelBest dtb__10) dtb__11) else ((v_labelBest mc0) dtb__11))
  | B_dData_dList.C_List_Nil -> (mc0).Frontend_dManifest.f_Layer_layerName
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Loader/Layers.vuna"
let v_labelOf = (fun (rules : Frontend_dManifest.t_Layer B_dData_dList.t_List) (name : string) -> (match ((v_matchingLayers rules) name) with
  | B_dData_dList.C_List_Nil -> (Base_dSource.v_prefixOfName name)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_labelBest dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_layersOfRoot = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__14) = mc1) then (Frontend_dPackages_dPkg.v_rootLayers dtb__14) else ((v_layersOfRoot dtb__15) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Loader/Layers.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (imp).Frontend_dAst.f_Import_importSpan) = "") then e else ((Base_dDiag.v_withFallbackSpan (imp).Frontend_dAst.f_Import_importSpan) e)))

# 90 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkImports = (fun (mc0 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc1 : Frontend_dManifest.t_Layer B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Module B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match ((Loader_dModules.v_findModule mc4) (Loader_dModules.v_importName dtb__16)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkImports mc0) mc1) mc2) mc3) mc4) dtb__17)
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (if ((Loader_dModules.v_modulePackageOf dtb__18) <> mc3) then ((((((v_checkImports mc0) mc1) mc2) mc3) mc4) dtb__17) else (if (((v_importAllowed mc0) mc1) (Loader_dModules.v_moduleNameOf dtb__18)) then ((((((v_checkImports mc0) mc1) mc2) mc3) mc4) dtb__17) else ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb__16)) (((((Base_dDiagnostics_dLoader.v_ldErr4 (Base_dDiagnostics_dLoader.C_LdDiag_LayerViolation ("", "", "", ""))) mc2) (Loader_dModules.v_moduleNameOf dtb__18)) ((v_labelOf mc0) mc2)) ((v_labelOf mc0) (Loader_dModules.v_moduleNameOf dtb__18))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_checkModules = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> ((fun rules -> ((fun matched -> (if ((B_dData_dList.v_length matched) = 0) then (((v_checkModules mc0) mc1) dtb__20) else (match ((((((v_checkImports rules) matched) (Loader_dModules.v_moduleNameOf dtb__19)) (Loader_dModules.v_modulePackageOf dtb__19)) mc1) (Loader_dModules.v_moduleAllImportsOf dtb__19)) with
  | Base_dDiag.C_Check_ErrC (dtb__21) -> (Base_dDiag.C_Check_ErrC (dtb__21))
  | Base_dDiag.C_Check_OkC (dtb__22) -> (((v_checkModules mc0) mc1) dtb__20)
  | _ -> failwith "DT: impossible branch"
))) ((v_matchingLayers rules) (Loader_dModules.v_moduleNameOf dtb__19)))) ((v_layersOfRoot mc0) (Loader_dModules.v_modulePackageOf dtb__19)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Loader/Layers.vuna"
let v_checkProjectLayers = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> (((v_checkModules roots) (project).Loader_dModules.f_Project_projectModules) (project).Loader_dModules.f_Project_projectModules))
