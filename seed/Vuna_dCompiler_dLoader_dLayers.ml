open Vuna_runtime
# 25 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix = (fun (prefix : string) (name : string) -> (if (name = prefix) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith (prefix ^ ".")) name)))

# 28 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer = (fun (mc0 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = mc1) then (dtb__0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses else ((v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer dtb__1) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dclosureGo = (fun (fuel : int) (layers : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (todo : string Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else (match todo with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__2) acc) then ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo (fuel - 1)) layers) dtb__3) acc) else ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo (fuel - 1)) layers) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__3) ((v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer layers) dtb__2))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 46 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dusesTotal = (fun (mc0 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> ((Base_dData_dList.v_Base_dData_dList_dlength (dtb__4).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) + (v_Vuna_dCompiler_dLoader_dLayers_dusesTotal dtb__5))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dclosureBound = (fun (layers : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dLoader_dLayers_dusesTotal layers) + (Base_dData_dList.v_Base_dData_dList_dlength layers)) + 2))

# 51 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dallowedByRow = (fun (layers : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (l : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer) -> ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo (v_Vuna_dCompiler_dLoader_dLayers_dclosureBound layers)) layers) (l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 54 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcovered = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (if ((v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix dtb__6) mc1) then true else ((v_Vuna_dCompiler_dLoader_dLayers_dcovered dtb__7) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed = (fun (mc0 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (if ((v_Vuna_dCompiler_dLoader_dLayers_dcovered ((v_Vuna_dCompiler_dLoader_dLayers_dallowedByRow mc0) dtb__8)) mc2) then (((v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed mc0) dtb__9) mc2) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dlayerMatches = (fun (name : string) (l : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer) -> ((v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix (l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) name))

# 67 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers = (fun (rules : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (v_Vuna_dCompiler_dLoader_dLayers_dlayerMatches name)) rules))

# 77 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dlabelBest = (fun (mc0 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer) (mc1 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (if ((bi_strLength (dtb__10).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) > (bi_strLength (mc0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName)) then ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest dtb__10) dtb__11) else ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest mc0) dtb__11))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (mc0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dlabelOf = (fun (rules : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (match ((v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers rules) name) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot = (fun (mc0 : Vuna_dCompiler_dFrontend_dPackages_dPkg.t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__14) = mc1) then (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootLayers dtb__14) else ((v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot dtb__15) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dwithImportSpan = (fun (imp : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport) (e : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) = "") then e else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) e)))

# 90 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcheckImports = (fun (mc0 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) (mc3 : string) (mc4 : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dModule Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule mc4) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__16)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__17)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__18) <> mc3) then ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__17) else (if (((v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed mc0) mc1) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__18)) then ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__17) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dLayers_dwithImportSpan dtb__16)) (((((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr4 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_LayerViolation ("", "", "", ""))) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__18)) ((v_Vuna_dCompiler_dLoader_dLayers_dlabelOf mc0) mc2)) ((v_Vuna_dCompiler_dLoader_dLayers_dlabelOf mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__18))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcheckModules = (fun (mc0 : Vuna_dCompiler_dFrontend_dPackages_dPkg.t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dModule Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dModule Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> ((fun rules -> ((fun matched -> (if ((Base_dData_dList.v_Base_dData_dList_dlength matched) = 0) then (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules mc0) mc1) dtb__20) else (match ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports rules) matched) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__19)) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__19)) mc1) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf dtb__19)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__21) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__21))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__22) -> (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules mc0) mc1) dtb__20)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers rules) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__19)))) ((v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__19)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dcheckProjectLayers = (fun (roots : Vuna_dCompiler_dFrontend_dPackages_dPkg.t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot Base_dData_dList.t_Base_dData_dList_dList) (project : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dProject) -> (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules roots) (project).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules) (project).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules))
