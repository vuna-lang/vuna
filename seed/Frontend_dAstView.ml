open Vuna_runtime
# 37 "Vuna/Compiler/Frontend/AstView.vuna"
let v_modHeadOf = (fun (dtb_u_u1 : Frontend_dCst.t_CstNode) -> (let dtb_u_u2 = (Frontend_dCst.v_nodeSem dtb_u_u1) in (match dtb_u_u2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3) -> (match dtb_u_u3 with
  | Frontend_dCst.C_CstSem_SemModHead (dtb_u_u4) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u4))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 43 "Vuna/Compiler/Frontend/AstView.vuna"
let v_importOf = (fun (dtb_u_u5 : Frontend_dCst.t_CstNode) -> (let dtb_u_u6 = (Frontend_dCst.v_nodeSem dtb_u_u5) in (match dtb_u_u6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u7) -> (match dtb_u_u7 with
  | Frontend_dCst.C_CstSem_SemReexportImport (dtb_u_u8, dtb_u_u9) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u8))
  | Frontend_dCst.C_CstSem_SemImport (dtb_u_u10) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u10))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 50 "Vuna/Compiler/Frontend/AstView.vuna"
let v_fixityOf = (fun (dtb_u_u11 : Frontend_dCst.t_CstNode) -> (let dtb_u_u12 = (Frontend_dCst.v_nodeSem dtb_u_u11) in (match dtb_u_u12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u13) -> (match dtb_u_u13 with
  | Frontend_dCst.C_CstSem_SemFixity (dtb_u_u14) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u14))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 56 "Vuna/Compiler/Frontend/AstView.vuna"
let v_declOf = (fun (dtb_u_u15 : Frontend_dCst.t_CstNode) -> (let dtb_u_u16 = (Frontend_dCst.v_nodeSem dtb_u_u15) in (match dtb_u_u16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u17) -> (match dtb_u_u17 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb_u_u18, dtb_u_u19, dtb_u_u20) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u18))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 62 "Vuna/Compiler/Frontend/AstView.vuna"
let v_exportOf = (fun (dtb_u_u21 : Frontend_dCst.t_CstNode) -> (let dtb_u_u22 = (Frontend_dCst.v_nodeSem dtb_u_u21) in (match dtb_u_u22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u23) -> (match dtb_u_u23 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb_u_u24, dtb_u_u25, dtb_u_u26) -> (match dtb_u_u25 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u27) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u27))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 68 "Vuna/Compiler/Frontend/AstView.vuna"
let v_opacityOf = (fun (dtb_u_u28 : Frontend_dCst.t_CstNode) -> (let dtb_u_u29 = (Frontend_dCst.v_nodeSem dtb_u_u28) in (match dtb_u_u29 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u30) -> (match dtb_u_u30 with
  | Frontend_dCst.C_CstSem_SemDecl (dtb_u_u31, dtb_u_u32, dtb_u_u33) -> (match dtb_u_u33 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u34) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u34))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 74 "Vuna/Compiler/Frontend/AstView.vuna"
let v_reexportsOf = (fun (dtb_u_u35 : Frontend_dCst.t_CstNode) -> (let dtb_u_u36 = (Frontend_dCst.v_nodeSem dtb_u_u35) in (match dtb_u_u36 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u37) -> (match dtb_u_u37 with
  | Frontend_dCst.C_CstSem_SemExportNamespace (dtb_u_u38) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u38, B_dData_dList.C_List_Nil))
  | Frontend_dCst.C_CstSem_SemReexportImport (dtb_u_u39, dtb_u_u40) -> dtb_u_u40
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 24 "Vuna/Compiler/Frontend/AstView.vuna"
let v_ofTree = (fun (dtb_u_u41 : Frontend_dCst.t_CstNode) -> (let dtb_u_u42 = (Frontend_dCst.v_nodeChildren dtb_u_u41) in { Frontend_dAst.f_SourceFile_sourceFileModDecl = (B_dData_dList.v_firstJust ((B_dData_dList.v_map v_modHeadOf) dtb_u_u42)); Frontend_dAst.f_SourceFile_sourceFileImports = ((B_dData_dList.v_mapMaybe v_importOf) dtb_u_u42); Frontend_dAst.f_SourceFile_sourceFileFixities = ((B_dData_dList.v_mapMaybe v_fixityOf) dtb_u_u42); Frontend_dAst.f_SourceFile_sourceFileDecls = ((B_dData_dList.v_mapMaybe v_declOf) dtb_u_u42); Frontend_dAst.f_SourceFile_sourceFileExports = ((B_dData_dList.v_mapMaybe v_exportOf) dtb_u_u42); Frontend_dAst.f_SourceFile_sourceFileReexports = ((B_dData_dList.v_concatMap v_reexportsOf) dtb_u_u42); Frontend_dAst.f_SourceFile_sourceFileOpacity = ((B_dData_dList.v_mapMaybe v_opacityOf) dtb_u_u42) }))
