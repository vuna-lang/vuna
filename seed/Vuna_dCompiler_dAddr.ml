open Vuna_runtime
type t_Vuna_dCompiler_dAddr_dFixRow = { f_Vuna_dCompiler_dAddr_dFixRow_frOp : string; f_Vuna_dCompiler_dAddr_dFixRow_frLevel : int; f_Vuna_dCompiler_dAddr_dFixRow_frAssoc : int; f_Vuna_dCompiler_dAddr_dFixRow_frTarget : string Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dAddr_dModHeader = { f_Vuna_dCompiler_dAddr_dModHeader_mhName : string; f_Vuna_dCompiler_dAddr_dModHeader_mhImports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dAddr_dModHeader_mhFixities : t_Vuna_dCompiler_dAddr_dFixRow Base_dList.t_Base_dList_dList }

# 28 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_daddrSchema = "vuna-addr 1"

# 32 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dhashHex = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestHex (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestOfString s)))

# 36 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_daddrOf = (fun parts -> (v_Vuna_dCompiler_dAddr_dhashHex ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr)) (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dAddr_daddrSchema, parts)))))

# 41 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dprojectIdAddrOf = (fun dir -> (v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("project", (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))))

# 55 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dheaderKind = "header"

# 58 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dheaderCodec = "module-header 1"

# 72 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dencFixRow = (fun f acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (f).f_Vuna_dCompiler_dAddr_dFixRow_frOp) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (f).f_Vuna_dCompiler_dAddr_dFixRow_frLevel) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (f).f_Vuna_dCompiler_dAddr_dFixRow_frAssoc) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (f).f_Vuna_dCompiler_dAddr_dFixRow_frTarget) acc)))))

# 76 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dencHeader = (fun h acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (h).f_Vuna_dCompiler_dAddr_dModHeader_mhName) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (h).f_Vuna_dCompiler_dAddr_dModHeader_mhImports) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dAddr_dencFixRow) (h).f_Vuna_dCompiler_dAddr_dModHeader_mhFixities) acc))))

# 80 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dencModHeader = (fun h -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop v_Vuna_dCompiler_dAddr_dencHeader) h))

# 83 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_ddecFixRow = (fun fuel cur -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1; Base_dPair.f_Base_dPair_dPair_second = dtb__2 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> (match dtb__3 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = dtb__5 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = dtb__8 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9) -> (match dtb__9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dAddr_dFixRow_frOp = dtb__1; f_Vuna_dCompiler_dAddr_dFixRow_frLevel = dtb__4; f_Vuna_dCompiler_dAddr_dFixRow_frAssoc = dtb__7; f_Vuna_dCompiler_dAddr_dFixRow_frTarget = dtb__10 }; Base_dPair.f_Base_dPair_dPair_second = dtb__11 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr fuel) cur)))

# 94 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_ddecHeader = (fun fuel cur -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dAddr_dModHeader_mhName = dtb__13; f_Vuna_dCompiler_dAddr_dModHeader_mhImports = dtb__16; f_Vuna_dCompiler_dAddr_dModHeader_mhFixities = dtb__19 }; Base_dPair.f_Base_dPair_dPair_second = dtb__20 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dAddr_ddecFixRow) (fuel - 1)) dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr fuel) cur)))

# 104 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_ddecModHeaderComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (match dtb__21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__23) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dAddr_ddecHeader 65536) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

# 110 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dheaderAddrOf = (fun pkgKey moduleName srcAddr -> (v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("header", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dAddr_dheaderCodec, (Base_dList.C_Base_dList_dList_Cons (pkgKey, (Base_dList.C_Base_dList_dList_Cons (moduleName, (Base_dList.C_Base_dList_dList_Cons (srcAddr, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 114 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dreadHeaderEff = (fun addr -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff v_Vuna_dCompiler_dAddr_dheaderKind) v_Vuna_dCompiler_dAddr_dheaderCodec) addr)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> (v_Vuna_dCompiler_dAddr_ddecModHeaderComplete dtb__24)
  | _ -> failwith "DT: impossible branch"
)))))

# 123 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dwriteHeaderEff = (fun addr h -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff v_Vuna_dCompiler_dAddr_dheaderKind) v_Vuna_dCompiler_dAddr_dheaderCodec) addr) (v_Vuna_dCompiler_dAddr_dencModHeader h)))

# 133 "Vuna/Compiler/Addr.vuna"
let rec v_Vuna_dCompiler_dAddr_dlookupImports = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__25 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (if (dtb__27 = mc0) then dtb__28 else ((v_Vuna_dCompiler_dAddr_dlookupImports mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Addr.vuna"
let rec v_Vuna_dCompiler_dAddr_dtopoVisitGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if (mc0 <= 0) then { Base_dPair.f_Base_dPair_dPair_first = mc3; Base_dPair.f_Base_dPair_dPair_second = mc4 } else (if ((Base_dList.v_Base_dList_dmemName dtb__29) mc3) then (((((v_Vuna_dCompiler_dAddr_dtopoVisitGo mc0) mc1) dtb__30) mc3) mc4) else ((fun deps -> ((fun after -> (((((v_Vuna_dCompiler_dAddr_dtopoVisitGo (mc0 - 1)) mc1) dtb__30) (Base_dList.C_Base_dList_dList_Cons (dtb__29, (Base_dPair.v_Base_dPair_dfirstOf after)))) (Base_dList.C_Base_dList_dList_Cons (dtb__29, (Base_dPair.v_Base_dPair_dsecondOf after))))) (((((v_Vuna_dCompiler_dAddr_dtopoVisitGo (mc0 - 1)) mc1) deps) mc3) mc4))) ((v_Vuna_dCompiler_dAddr_dlookupImports dtb__29) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc3; Base_dPair.f_Base_dPair_dPair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dtopoModules = (fun graph -> (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf (((((v_Vuna_dCompiler_dAddr_dtopoVisitGo 8192) graph) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) graph)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

# 158 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dfixRowOf = (fun f -> { f_Vuna_dCompiler_dAddr_dFixRow_frOp = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; f_Vuna_dCompiler_dAddr_dFixRow_frLevel = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel; f_Vuna_dCompiler_dAddr_dFixRow_frAssoc = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc; f_Vuna_dCompiler_dAddr_dFixRow_frTarget = (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget })

# 161 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dimportNameOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__31; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__32; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__33; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__34 } -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Addr.vuna"
let v_Vuna_dCompiler_dAddr_dheaderOfSource = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__35; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__36; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__37; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__38; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__39; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__40; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__41 } -> { f_Vuna_dCompiler_dAddr_dModHeader_mhName = mc0; f_Vuna_dCompiler_dAddr_dModHeader_mhImports = ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dAddr_dimportNameOf) dtb__36); f_Vuna_dCompiler_dAddr_dModHeader_mhFixities = ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dAddr_dfixRowOf) dtb__37) }
  | _ -> failwith "DT: impossible branch"
))
