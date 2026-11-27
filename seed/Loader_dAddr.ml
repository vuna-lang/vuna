open Vuna_runtime
type t_FixRow = { f_FixRow_frOp : string; f_FixRow_frLevel : int; f_FixRow_frAssoc : int }
and t_ModHeader = { f_ModHeader_mhName : string; f_ModHeader_mhImports : string B_dData_dList.t_List; f_ModHeader_mhFixities : t_FixRow B_dData_dList.t_List }

# 25 "Vuna/Compiler/Loader/Addr.vuna"
let v_addrSchema = "vuna-addr 1"

# 29 "Vuna/Compiler/Loader/Addr.vuna"
let v_hashHex = (fun (dtb_u_u1 : string) -> (Base_dHash.v_digestHex (Base_dHash.v_digestOfString dtb_u_u1)))

# 33 "Vuna/Compiler/Loader/Addr.vuna"
let v_addrOf = (fun (dtb_u_u2 : string B_dData_dList.t_List) -> (v_hashHex ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) (B_dData_dList.C_List__x58__x58_ (v_addrSchema, dtb_u_u2)))))

# 43 "Vuna/Compiler/Loader/Addr.vuna"
let v_projectIdAddrOf = (fun (dtb_u_u3 : string) -> (v_addrOf (B_dData_dList.C_List__x58__x58_ ("project", (B_dData_dList.C_List__x58__x58_ ((Base_dSource.v_normalizePath dtb_u_u3), B_dData_dList.C_List_Nil))))))

# 69 "Vuna/Compiler/Loader/Addr.vuna"
let v_fixRowOf = (fun (dtb_u_u4 : Frontend_dAst.t_FixityDecl) -> { f_FixRow_frOp = (dtb_u_u4).Frontend_dAst.f_FixityDecl_fixityOp; f_FixRow_frLevel = (dtb_u_u4).Frontend_dAst.f_FixityDecl_fixityLevel; f_FixRow_frAssoc = (dtb_u_u4).Frontend_dAst.f_FixityDecl_fixityAssoc })

# 72 "Vuna/Compiler/Loader/Addr.vuna"
let v_importNameOf = (fun (dtb_u_u5 : Frontend_dAst.t_Import) -> (match dtb_u_u5 with
  | { Frontend_dAst.f_Import_importName = dtb_u_u6; Frontend_dAst.f_Import_importIsQualified = dtb_u_u7; Frontend_dAst.f_Import_importAlias = dtb_u_u8; Frontend_dAst.f_Import_importRef = dtb_u_u9 } -> dtb_u_u6
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Loader/Addr.vuna"
let v_exportItemDep = (fun (dtb_u_u10 : Frontend_dAst.t_ExportItem) -> (match dtb_u_u10 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u11, dtb_u_u12, dtb_u_u13) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u11, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_ExportItem_XModule (dtb_u_u14, dtb_u_u15) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u14, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 83 "Vuna/Compiler/Loader/Addr.vuna"
let[@tail_mod_cons] rec v_dedupNames = (fun (dtb_u_u16 : string B_dData_dList.t_List) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (if ((B_dData_dList.v_memName dtb_u_u17) dtb_u_u18) then (v_dedupNames dtb_u_u18) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u17, (v_dedupNames dtb_u_u18))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Addr.vuna"
let v_headerOfSource = (fun (dtb_u_u19 : string) (dtb_u_u20 : Frontend_dAst.t_SourceFile) -> (match dtb_u_u20 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u21; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u22; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u23; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u24; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u25; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u26; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u27 } -> { f_ModHeader_mhName = dtb_u_u19; f_ModHeader_mhImports = (v_dedupNames ((B_dData_dList.v_append ((B_dData_dList.v_map v_importNameOf) dtb_u_u22)) ((B_dData_dList.v_concatMap v_exportItemDep) dtb_u_u26))); f_ModHeader_mhFixities = ((B_dData_dList.v_map v_fixRowOf) dtb_u_u23) }
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Loader/Addr.vuna"
let v_frOp = (fun (dtb_u_u28 : t_FixRow) -> (match dtb_u_u28 with
  | { f_FixRow_frOp = dtb_u_u29; f_FixRow_frLevel = dtb_u_u30; f_FixRow_frAssoc = dtb_u_u31 } -> dtb_u_u29
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Loader/Addr.vuna"
let v_frLevel = (fun (dtb_u_u32 : t_FixRow) -> (match dtb_u_u32 with
  | { f_FixRow_frOp = dtb_u_u33; f_FixRow_frLevel = dtb_u_u34; f_FixRow_frAssoc = dtb_u_u35 } -> dtb_u_u34
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Addr.vuna"
let v_frAssoc = (fun (dtb_u_u36 : t_FixRow) -> (match dtb_u_u36 with
  | { f_FixRow_frOp = dtb_u_u37; f_FixRow_frLevel = dtb_u_u38; f_FixRow_frAssoc = dtb_u_u39 } -> dtb_u_u39
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhName = (fun (dtb_u_u40 : t_ModHeader) -> (match dtb_u_u40 with
  | { f_ModHeader_mhName = dtb_u_u41; f_ModHeader_mhImports = dtb_u_u42; f_ModHeader_mhFixities = dtb_u_u43 } -> dtb_u_u41
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhImports = (fun (dtb_u_u44 : t_ModHeader) -> (match dtb_u_u44 with
  | { f_ModHeader_mhName = dtb_u_u45; f_ModHeader_mhImports = dtb_u_u46; f_ModHeader_mhFixities = dtb_u_u47 } -> dtb_u_u46
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Addr.vuna"
let v_mhFixities = (fun (dtb_u_u48 : t_ModHeader) -> (match dtb_u_u48 with
  | { f_ModHeader_mhName = dtb_u_u49; f_ModHeader_mhImports = dtb_u_u50; f_ModHeader_mhFixities = dtb_u_u51 } -> dtb_u_u51
  | _ -> failwith "DT: impossible branch"
))
