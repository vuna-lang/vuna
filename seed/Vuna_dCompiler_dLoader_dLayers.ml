open Vuna_runtime
# 25 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix = (fun prefix name -> (if (name = prefix) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ ".")) name)))

# 28 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = mc1) then (dtb__0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses else ((v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer dtb__1) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dclosureGo = (fun fuel layers todo acc -> (if (fuel <= 0) then acc else (match todo with
  | Base_dList.C_Base_dList_dList_Nil -> acc
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (if ((Base_dList.v_Base_dList_dmemName dtb__2) acc) then ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo (fuel - 1)) layers) dtb__3) acc) else ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo (fuel - 1)) layers) ((Base_dList.v_Base_dList_dappend dtb__3) ((v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer layers) dtb__2))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__2, acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 41 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dallowedByRow = (fun layers l -> ((((v_Vuna_dCompiler_dLoader_dLayers_dclosureGo ((Base_dList.v_Base_dList_dlength layers) + 2)) layers) (l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) (Base_dList.C_Base_dList_dList__x58__x58_ ((l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName, Base_dList.C_Base_dList_dList_Nil))))

# 44 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcovered = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (if ((v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix dtb__4) mc1) then true else ((v_Vuna_dCompiler_dLoader_dLayers_dcovered dtb__5) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (if ((v_Vuna_dCompiler_dLoader_dLayers_dcovered ((v_Vuna_dCompiler_dLoader_dLayers_dallowedByRow mc0) dtb__6)) mc2) then (((v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed mc0) dtb__7) mc2) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dlayerMatches = (fun name l -> ((v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix (l).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) name))

# 57 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers = (fun rules name -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dLoader_dLayers_dlayerMatches name)) rules))

# 66 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dlabelBest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (if ((bi_strLength (dtb__8).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) > (bi_strLength (mc0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName)) then ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest dtb__8) dtb__9) else ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest mc0) dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> (mc0).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dlabelOf = (fun rules name -> (match ((v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers rules) name) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, dtb__11) -> ((v_Vuna_dCompiler_dLoader_dLayers_dlabelBest dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__12) = mc1) then (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootLayers dtb__12) else ((v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot dtb__13) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dwithImportSpan = (fun imp e -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) = "") then e else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) e)))

# 79 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcheckImports = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule mc4) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__14)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__15)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__16) <> mc3) then ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__15) else (if (((v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed mc0) mc1) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__16)) then ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports mc0) mc1) mc2) mc3) mc4) dtb__15) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dLayers_dwithImportSpan dtb__14)) (((((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr4 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_LayerViolation ("", "", "", ""))) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__16)) ((v_Vuna_dCompiler_dLoader_dLayers_dlabelOf mc0) mc2)) ((v_Vuna_dCompiler_dLoader_dLayers_dlabelOf mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__16))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Layers.vuna"
let rec v_Vuna_dCompiler_dLoader_dLayers_dcheckModules = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__17, dtb__18) -> ((fun rules -> ((fun matched -> (if ((Base_dList.v_Base_dList_dlength matched) = 0) then (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules mc0) mc1) dtb__18) else (match ((((((v_Vuna_dCompiler_dLoader_dLayers_dcheckImports rules) matched) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__17)) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__17)) mc1) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf dtb__17)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__19) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__19))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__20) -> (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules mc0) mc1) dtb__18)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers rules) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__17)))) ((v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__17)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Layers.vuna"
let v_Vuna_dCompiler_dLoader_dLayers_dcheckProjectLayers = (fun roots project -> (((v_Vuna_dCompiler_dLoader_dLayers_dcheckModules roots) (project).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules) (project).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules))
