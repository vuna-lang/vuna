open Vuna_runtime
type t_FixRow = { f_FixRow_frOp : string; f_FixRow_frLevel : int; f_FixRow_frAssoc : int }
and t_ModHeader = { f_ModHeader_mhName : string; f_ModHeader_mhImports : string B_dData_dList.t_List; f_ModHeader_mhFixities : t_FixRow B_dData_dList.t_List }

# 24 "Vuna/Compiler/Loader/Addr.vuna"
let v_addrSchema = "vuna-addr 1"

# 28 "Vuna/Compiler/Loader/Addr.vuna"
let v_hashHex = (fun (s : string) -> (Base_dHash.v_digestHex (Base_dHash.v_digestOfString s)))

# 32 "Vuna/Compiler/Loader/Addr.vuna"
let v_addrOf = (fun (parts : string B_dData_dList.t_List) -> (v_hashHex ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) (B_dData_dList.C_List__x58__x58_ (v_addrSchema, parts)))))

# 37 "Vuna/Compiler/Loader/Addr.vuna"
let v_projectIdAddrOf = (fun (dir : string) -> (v_addrOf (B_dData_dList.C_List__x58__x58_ ("project", (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))))))

# 63 "Vuna/Compiler/Loader/Addr.vuna"
let v_fixRowOf = (fun (f : Frontend_dAst.t_FixityDecl) -> { f_FixRow_frOp = (f).Frontend_dAst.f_FixityDecl_fixityOp; f_FixRow_frLevel = (f).Frontend_dAst.f_FixityDecl_fixityLevel; f_FixRow_frAssoc = (f).Frontend_dAst.f_FixityDecl_fixityAssoc })

# 66 "Vuna/Compiler/Loader/Addr.vuna"
let v_importNameOf = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__0; Frontend_dAst.f_Import_importIsQualified = dtb__1; Frontend_dAst.f_Import_importAlias = dtb__2; Frontend_dAst.f_Import_importRef = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Loader/Addr.vuna"
let v_exportItemDep = (fun (mc0 : Frontend_dAst.t_ExportItem) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__4, dtb__5, dtb__6) -> (B_dData_dList.C_List__x58__x58_ (dtb__4, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_ExportItem_XModule (dtb__7, dtb__8) -> (B_dData_dList.C_List__x58__x58_ (dtb__7, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 77 "Vuna/Compiler/Loader/Addr.vuna"
let rec v_dedupNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (if ((B_dData_dList.v_memName dtb__9) dtb__10) then (v_dedupNames dtb__10) else (B_dData_dList.C_List__x58__x58_ (dtb__9, (v_dedupNames dtb__10))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Loader/Addr.vuna"
let v_headerOfSource = (fun (mc0 : string) (mc1 : Frontend_dAst.t_SourceFile) -> (match mc1 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__11; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__12; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__13; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__14; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__15; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__16; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__17 } -> { f_ModHeader_mhName = mc0; f_ModHeader_mhImports = (v_dedupNames ((B_dData_dList.v_append ((B_dData_dList.v_map v_importNameOf) dtb__12)) ((B_dData_dList.v_concatMap v_exportItemDep) dtb__16))); f_ModHeader_mhFixities = ((B_dData_dList.v_map v_fixRowOf) dtb__13) }
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Addr.vuna"
let v_frOp = (fun (p : t_FixRow) -> (match p with
  | { f_FixRow_frOp = dtb__18; f_FixRow_frLevel = dtb__19; f_FixRow_frAssoc = dtb__20 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Addr.vuna"
let v_frLevel = (fun (p : t_FixRow) -> (match p with
  | { f_FixRow_frOp = dtb__21; f_FixRow_frLevel = dtb__22; f_FixRow_frAssoc = dtb__23 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Loader/Addr.vuna"
let v_frAssoc = (fun (p : t_FixRow) -> (match p with
  | { f_FixRow_frOp = dtb__24; f_FixRow_frLevel = dtb__25; f_FixRow_frAssoc = dtb__26 } -> dtb__26
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhName = (fun (p : t_ModHeader) -> (match p with
  | { f_ModHeader_mhName = dtb__27; f_ModHeader_mhImports = dtb__28; f_ModHeader_mhFixities = dtb__29 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhImports = (fun (p : t_ModHeader) -> (match p with
  | { f_ModHeader_mhName = dtb__30; f_ModHeader_mhImports = dtb__31; f_ModHeader_mhFixities = dtb__32 } -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhFixities = (fun (p : t_ModHeader) -> (match p with
  | { f_ModHeader_mhName = dtb__33; f_ModHeader_mhImports = dtb__34; f_ModHeader_mhFixities = dtb__35 } -> dtb__35
  | _ -> failwith "DT: impossible branch"
))
