open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dAddr_dFixRow = { f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frOp : string; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frLevel : int; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frAssoc : int }
and t_Vuna_dCompiler_dLoader_dAddr_dModHeader = { f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhName : string; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhFixities : t_Vuna_dCompiler_dLoader_dAddr_dFixRow Base_dData_dList.t_Base_dData_dList_dList }

# 24 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_daddrSchema = "vuna-addr 1"

# 28 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dhashHex = (fun (s : string) -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_ddigestHex (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_ddigestOfString s)))

# 32 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_daddrOf = (fun (parts : string Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dLoader_dAddr_dhashHex ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dLoader_dAddr_daddrSchema, parts)))))

# 37 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dprojectIdAddrOf = (fun (dir : string) -> (v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("project", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dir, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 63 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dfixRowOf = (fun (f : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl) -> { f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frOp = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frLevel = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frAssoc = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc })

# 66 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dimportNameOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__0; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__1; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dexportItemDep = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__4, dtb__5, dtb__6) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__7, dtb__8) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 77 "Vuna/Compiler/Loader/Addr.vuna"
let rec v_Vuna_dCompiler_dLoader_dAddr_ddedupNames = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__9) dtb__10) then (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames dtb__10) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames dtb__10))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dheaderOfSource = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dSourceFile) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__11; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__12; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__13; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__14; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__15; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__16; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__17 } -> { f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhName = mc0; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports = (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dAddr_dimportNameOf) dtb__12)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dAddr_dexportItemDep) dtb__16))); f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhFixities = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dAddr_dfixRowOf) dtb__13) }
  | _ -> failwith "DT: impossible branch"
))
