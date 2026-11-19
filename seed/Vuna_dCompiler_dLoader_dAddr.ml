open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dAddr_dFixRow = { f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frOp : string; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frLevel : int; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frAssoc : int }
and t_Vuna_dCompiler_dLoader_dAddr_dModHeader = { f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhName : string; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhFixities : t_Vuna_dCompiler_dLoader_dAddr_dFixRow Base_dData_dList.t_Base_dData_dList_dList }

# 26 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_daddrSchema = "vuna-addr 1"

# 30 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dhashHex = (fun (s : string) -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_ddigestHex (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_ddigestOfString s)))

# 34 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_daddrOf = (fun (parts : string Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dLoader_dAddr_dhashHex ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dLoader_dAddr_daddrSchema, parts)))))

# 39 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dprojectIdAddrOf = (fun (dir : string) -> (v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("project", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dir, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 69 "Vuna/Compiler/Loader/Addr.vuna"
let rec v_Vuna_dCompiler_dLoader_dAddr_dlookupImports = (fun (mc0 : string) (mc1 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> (if (dtb__2 = mc0) then dtb__3 else ((v_Vuna_dCompiler_dLoader_dAddr_dlookupImports mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Loader/Addr.vuna"
let rec v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo = (fun (mc0 : int) (mc1 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (if (mc0 <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc4 } else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__4) mc3) then (((((v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo mc0) mc1) dtb__5) mc3) mc4) else ((fun deps -> ((fun after -> (((((v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo (mc0 - 1)) mc1) dtb__5) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf after)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf after))))) (((((v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo (mc0 - 1)) mc1) deps) mc3) mc4))) ((v_Vuna_dCompiler_dLoader_dAddr_dlookupImports dtb__4) mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dtopoModules = (fun (graph : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (((((v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo 8192) graph) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) graph)) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 97 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dfixRowOf = (fun (f : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl) -> { f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frOp = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frLevel = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel; f_Vuna_dCompiler_dLoader_dAddr_dFixRow_frAssoc = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc })

# 100 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dimportNameOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__6; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__7; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__8; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__9 } -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dexportItemDep = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__10, dtb__11, dtb__12) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__13, dtb__14) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 111 "Vuna/Compiler/Loader/Addr.vuna"
let rec v_Vuna_dCompiler_dLoader_dAddr_ddedupNames = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__15) dtb__16) then (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames dtb__16) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames dtb__16))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Loader/Addr.vuna"
let v_Vuna_dCompiler_dLoader_dAddr_dheaderOfSource = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dSourceFile) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__17; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__18; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__19; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__20; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__21; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__22; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__23 } -> { f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhName = mc0; f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports = (v_Vuna_dCompiler_dLoader_dAddr_ddedupNames ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dAddr_dimportNameOf) dtb__18)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dAddr_dexportItemDep) dtb__22))); f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhFixities = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dAddr_dfixRowOf) dtb__19) }
  | _ -> failwith "DT: impossible branch"
))
