open Vuna_runtime
# 37 "Vuna/Compiler/Frontend/AstView.vuna"
let v_modHeadOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | Frontend_dCst.C_CstSem_SemModHead (dtb__1) -> (B_dData_dMaybe.C_Maybe_Just (dtb__1))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 43 "Vuna/Compiler/Frontend/AstView.vuna"
let v_importOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (match dtb__2 with
  | Frontend_dCst.C_CstSem_SemReexportImport (dtb__3, dtb__4) -> (B_dData_dMaybe.C_Maybe_Just (dtb__3))
  | Frontend_dCst.C_CstSem_SemImport (dtb__5) -> (B_dData_dMaybe.C_Maybe_Just (dtb__5))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 50 "Vuna/Compiler/Frontend/AstView.vuna"
let v_fixityOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (match dtb__6 with
  | Frontend_dCst.C_CstSem_SemFixity (dtb__7) -> (B_dData_dMaybe.C_Maybe_Just (dtb__7))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 56 "Vuna/Compiler/Frontend/AstView.vuna"
let v_declOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (match dtb__8 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb__9, dtb__10, dtb__11) -> (B_dData_dMaybe.C_Maybe_Just (dtb__9))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 62 "Vuna/Compiler/Frontend/AstView.vuna"
let v_exportOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (match dtb__12 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb__13, dtb__14, dtb__15) -> (match dtb__14 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (B_dData_dMaybe.C_Maybe_Just (dtb__16))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 68 "Vuna/Compiler/Frontend/AstView.vuna"
let v_opacityOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (match dtb__17 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb__18, dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just (dtb__21))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 74 "Vuna/Compiler/Frontend/AstView.vuna"
let v_reexportsOf = (fun (n : Frontend_dCst.t_CstNode) -> (let nd_uscrut1 = (Frontend_dCst.v_nodeSem n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (match dtb__22 with
  | Frontend_dCst.C_CstSem_SemExportNamespace (dtb__23) -> (B_dData_dList.C_List__x58__x58_ (dtb__23, B_dData_dList.C_List_Nil))
  | Frontend_dCst.C_CstSem_SemReexportImport (dtb__24, dtb__25) -> dtb__25
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 24 "Vuna/Compiler/Frontend/AstView.vuna"
let v_ofTree = (fun (tree : Frontend_dCst.t_CstNode) -> (let kids = (Frontend_dCst.v_nodeChildren tree) in { Frontend_dAst.f_SourceFile_sourceFileModDecl = (B_dData_dList.v_firstJust ((B_dData_dList.v_map v_modHeadOf) kids)); Frontend_dAst.f_SourceFile_sourceFileImports = ((B_dData_dList.v_mapMaybe v_importOf) kids); Frontend_dAst.f_SourceFile_sourceFileFixities = ((B_dData_dList.v_mapMaybe v_fixityOf) kids); Frontend_dAst.f_SourceFile_sourceFileDecls = ((B_dData_dList.v_mapMaybe v_declOf) kids); Frontend_dAst.f_SourceFile_sourceFileExports = ((B_dData_dList.v_mapMaybe v_exportOf) kids); Frontend_dAst.f_SourceFile_sourceFileReexports = ((B_dData_dList.v_concatMap v_reexportsOf) kids); Frontend_dAst.f_SourceFile_sourceFileOpacity = ((B_dData_dList.v_mapMaybe v_opacityOf) kids) }))
