open Vuna_runtime
type t_IgnoreRule = { f_IgnoreRule_ignoreBase : string; f_IgnoreRule_ignoreNegate : bool; f_IgnoreRule_ignoreDirOnly : bool; f_IgnoreRule_ignoreAnchored : bool; f_IgnoreRule_ignoreSegs : string B_dData_dList.t_List }
and t_IgnoreContext = { f_IgnoreContext_ignoreRoot : string; f_IgnoreContext_ignorePrefix : string; f_IgnoreContext_ignoreRules : t_IgnoreRule B_dData_dList.t_List }

# 68 "Vuna/Compiler/Base/Ignore.vuna"
let v_buildRule = (fun (base : string) (body : string) (negate : bool) -> (let dirOnly = ((B_dData_dString.v_endsWith "/") body) in (let body1 = (if dirOnly then (((dtp_substring 0) ((String.length body) - 1)) body) else body) in (let leadingSlash = ((B_dData_dString.v_startsWith "/") body1) in (let body2 = (if leadingSlash then (((dtp_substring 1) ((String.length body1) - 1)) body1) else body1) in (let anchored = (if leadingSlash then true else ((B_dData_dString.v_contains "/") body2)) in { f_IgnoreRule_ignoreBase = base; f_IgnoreRule_ignoreNegate = negate; f_IgnoreRule_ignoreDirOnly = dirOnly; f_IgnoreRule_ignoreAnchored = anchored; f_IgnoreRule_ignoreSegs = ((B_dData_dString.v_split "/") body2) }))))))

# 53 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignoreLine = (fun (base : string) (raw : string) -> (let line = (B_dData_dString.v_trimRight raw) in (if (if (line = "") then true else ((B_dData_dString.v_startsWith "#") line)) then B_dData_dMaybe.C_Maybe_Nothing else (if ((B_dData_dString.v_startsWith "\\#") line) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) (((dtp_substring 1) ((String.length line) - 1)) line)) false))) else (if ((B_dData_dString.v_startsWith "!") line) then (let body = (((dtp_substring 1) ((String.length line) - 1)) line) in (if (body = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) body) true))))) else (if ((B_dData_dString.v_startsWith "\\!") line) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) (((dtp_substring 1) ((String.length line) - 1)) line)) false))) else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) line) false)))))))))

# 49 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignore = (fun (base : string) (text : string) -> ((B_dData_dList.v_mapMaybe (v_parseGitignoreLine base)) (B_dData_dString.v_lines text)))

# 97 "Vuna/Compiler/Base/Ignore.vuna"
let v_trimTrailingSlash = (fun (path : string) -> (if (if ((String.length path) > 1) then ((B_dData_dString.v_endsWith "/") path) else false) then (((dtp_substring 0) ((String.length path) - 1)) path) else path))

# 102 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_ancestorChain = (fun (fuel : int) (stop : string) (dir : string) -> (if (fuel <= 0) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else (if (dir = stop) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else (let parent = (Base_dSource.v_parentOfPath dir) in (if (parent = dir) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (((v_ancestorChain (fuel - 1)) stop) parent)) (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))))))))

# 125 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_findGitRoot = (fun (dtb_u_u20 : string) (dtb_u_u23 : int) (dtb_u_u24 : string) -> (if (dtb_u_u23 <= 0) then (let dtb_u_u26 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26)))) else (Obj.repr ((fun (dtb_u_u32 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u35 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u20) (dtb_u_u24 ^ "/.git")) dtb_u_u32) in (if dtb_u_u35 then (let dtb_u_u37 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u24)) in dtb_u_u37) else (let dtb_u_u39 = (Base_dSource.v_parentOfPath dtb_u_u24) in (if (dtb_u_u39 = dtb_u_u24) then (let dtb_u_u41 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u41) else ((Obj.magic (((v_findGitRoot dtb_u_u20) (dtb_u_u23 - 1)) dtb_u_u39)) dtb_u_u32))))))))))
# 125 "Vuna/Compiler/Base/Ignore.vuna"
and v_findGitRoot_u_udirect = (fun (nFs : string) (fuel : int) (dir : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u26 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u26) else (let dtb_u_u35 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (dir ^ "/.git")) _u_ueffTok) in (if dtb_u_u35 then (let dtb_u_u37 = (B_dData_dMaybe.C_Maybe_Just (dir)) in dtb_u_u37) else (let dtb_u_u39 = (Base_dSource.v_parentOfPath dir) in (if (dtb_u_u39 = dir) then (let dtb_u_u41 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u41) else ((Obj.magic (((v_findGitRoot nFs) (fuel - 1)) dtb_u_u39)) _u_ueffTok)))))))

# 140 "Vuna/Compiler/Base/Ignore.vuna"
let v_loadIgnoreFile = (fun (dtb_u_u43 : string) (dtb_u_u46 : string) (dtb_u_u47 : string) (dtb_u_u48 : t_IgnoreContext) -> (let dtb_u_u49 = (dtb_u_u46 ^ "/.gitignore") in (Obj.repr ((fun (dtb_u_u54 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u57 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u43) dtb_u_u49) dtb_u_u54) in (if dtb_u_u57 then (let dtb_u_u65 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u43) dtb_u_u49) dtb_u_u54) in (if dtb_u_u65 then (let dtb_u_u67 = dtb_u_u48 in dtb_u_u67) else (let dtb_u_u76 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u43) dtb_u_u49) dtb_u_u54) in (let dtb_u_u78 = { f_IgnoreContext_ignoreRoot = (dtb_u_u48).f_IgnoreContext_ignoreRoot; f_IgnoreContext_ignorePrefix = (dtb_u_u48).f_IgnoreContext_ignorePrefix; f_IgnoreContext_ignoreRules = ((B_dData_dList.v_append (dtb_u_u48).f_IgnoreContext_ignoreRules) ((v_parseGitignore dtb_u_u47) dtb_u_u76)) } in dtb_u_u78)))) else (let dtb_u_u81 = dtb_u_u48 in dtb_u_u81))))))))

# 140 "Vuna/Compiler/Base/Ignore.vuna"
let v_loadIgnoreFile_u_udirect = (fun (nFs : string) (dir : string) (base : string) (ctx : t_IgnoreContext) _u_ueffTok -> (let dtb_u_u49 = (dir ^ "/.gitignore") in (let dtb_u_u57 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u49) _u_ueffTok) in (if dtb_u_u57 then (let dtb_u_u65 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) dtb_u_u49) _u_ueffTok) in (if dtb_u_u65 then (let dtb_u_u67 = ctx in dtb_u_u67) else (let dtb_u_u76 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u49) _u_ueffTok) in (let dtb_u_u78 = { f_IgnoreContext_ignoreRoot = (ctx).f_IgnoreContext_ignoreRoot; f_IgnoreContext_ignorePrefix = (ctx).f_IgnoreContext_ignorePrefix; f_IgnoreContext_ignoreRules = ((B_dData_dList.v_append (ctx).f_IgnoreContext_ignoreRules) ((v_parseGitignore base) dtb_u_u76)) } in dtb_u_u78)))) else (let dtb_u_u81 = ctx in dtb_u_u81)))))

# 159 "Vuna/Compiler/Base/Ignore.vuna"
let v_relUnder = (fun (base : string) (dir : string) -> (if (base = dir) then "" else (if (base = ".") then (if ((B_dData_dString.v_startsWith "./") dir) then (((dtp_substring 2) ((String.length dir) - 2)) dir) else dir) else (if ((B_dData_dString.v_startsWith (base ^ "/")) dir) then (((dtp_substring ((String.length base) + 1)) (((String.length dir) - (String.length base)) - 1)) dir) else dir))))

# 114 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_loadChain = (fun (dtb_u_u85 : string) (dtb_u_u88 : string B_dData_dList.t_List) (dtb_u_u89 : string) (dtb_u_u90 : t_IgnoreContext) -> (match dtb_u_u88 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u92) B_dData_dList.C_List_Nil) then (let dtb_u_u94 = dtb_u_u90 in (Obj.repr ((fun (dtb_u_u95 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u94)))) else (Obj.repr ((fun (dtb_u_u100 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u103 = (((((v_loadIgnoreFile_u_udirect dtb_u_u85) dtb_u_u91) ((v_relUnder dtb_u_u89) dtb_u_u91)) dtb_u_u90) dtb_u_u100) in ((Obj.magic ((((v_loadChain dtb_u_u85) dtb_u_u92) dtb_u_u89) dtb_u_u103)) dtb_u_u100))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u105 = dtb_u_u90 in (Obj.repr ((fun (dtb_u_u106 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u105))))
  | _ -> failwith "DT: impossible branch"
))
# 114 "Vuna/Compiler/Base/Ignore.vuna"
and v_loadChain_u_udirect = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_IgnoreContext) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u92) B_dData_dList.C_List_Nil) then (let dtb_u_u94 = mc2 in dtb_u_u94) else (let dtb_u_u103 = (((((v_loadIgnoreFile_u_udirect nFs) dtb_u_u91) ((v_relUnder mc1) dtb_u_u91)) mc2) _u_ueffTok) in ((Obj.magic ((((v_loadChain nFs) dtb_u_u92) mc1) dtb_u_u103)) _u_ueffTok)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u105 = mc2 in dtb_u_u105)
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextAt = (fun (dtb_u_u107 : string) (dtb_u_u110 : string) -> (Obj.repr ((fun (dtb_u_u115 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u118 = ((((v_findGitRoot_u_udirect dtb_u_u107) 512) dtb_u_u110) dtb_u_u115) in (let dtb_u_u119 = (match dtb_u_u118 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u110
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u121) -> dtb_u_u121
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u120 = (((v_ancestorChain 512) dtb_u_u119) dtb_u_u110) in ((Obj.magic ((((v_loadChain dtb_u_u107) dtb_u_u120) dtb_u_u119) { f_IgnoreContext_ignoreRoot = dtb_u_u119; f_IgnoreContext_ignorePrefix = ((v_relUnder dtb_u_u119) dtb_u_u110); f_IgnoreContext_ignoreRules = B_dData_dList.C_List_Nil })) dtb_u_u115))))))))

# 84 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextAt_u_udirect = (fun (nFs : string) (scanRoot : string) _u_ueffTok -> (let dtb_u_u118 = ((((v_findGitRoot_u_udirect nFs) 512) scanRoot) _u_ueffTok) in (let dtb_u_u119 = (match dtb_u_u118 with
  | B_dData_dMaybe.C_Maybe_Nothing -> scanRoot
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u121) -> dtb_u_u121
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u120 = (((v_ancestorChain 512) dtb_u_u119) scanRoot) in ((Obj.magic ((((v_loadChain nFs) dtb_u_u120) dtb_u_u119) { f_IgnoreContext_ignoreRoot = dtb_u_u119; f_IgnoreContext_ignorePrefix = ((v_relUnder dtb_u_u119) scanRoot); f_IgnoreContext_ignoreRules = B_dData_dList.C_List_Nil })) _u_ueffTok)))))

# 80 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextEff = (fun (nFs : string) (root : string) -> ((v_ignoreContextAt nFs) (v_trimTrailingSlash root)))

# 80 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextEff_u_udirect = (fun (nFs : string) (root : string) _u_ueffTok -> ((Obj.magic ((v_ignoreContextAt nFs) (v_trimTrailingSlash root))) _u_ueffTok))

# 171 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignorePathOf = (fun (ctx : t_IgnoreContext) (rel : string) -> (if ((ctx).f_IgnoreContext_ignorePrefix = "") then rel else (String.concat "" [(ctx).f_IgnoreContext_ignorePrefix; "/"; rel])))

# 195 "Vuna/Compiler/Base/Ignore.vuna"
let v_stripBase = (fun (base : string) (path : string) -> (if (base = "") then (B_dData_dMaybe.C_Maybe_Just (path)) else (if (path = base) then (B_dData_dMaybe.C_Maybe_Just ("")) else (if ((B_dData_dString.v_startsWith (base ^ "/")) path) then (B_dData_dMaybe.C_Maybe_Just ((((dtp_substring ((String.length base) + 1)) (((String.length path) - (String.length base)) - 1)) path))) else B_dData_dMaybe.C_Maybe_Nothing))))

# 225 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegmentChars = (fun (fuel : int) (pat : int B_dData_dList.t_List) (seg : int B_dData_dList.t_List) -> (if (fuel <= 0) then false else (((v_matchSegmentGo (fuel - 1)) pat) seg)))
# 229 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchSegmentGo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if (dtb__15 = 42) then (((v_matchSegmentStar (mc0 - 1)) dtb__16) mc2) else (if (dtb__15 = 63) then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (((v_matchSegmentChars (mc0 - 1)) dtb__16) dtb__18)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (dtb__15 = dtb__19) then (((v_matchSegmentChars (mc0 - 1)) dtb__16) dtb__20) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 243 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchSegmentStar = (fun (fuel : int) (rest : int B_dData_dList.t_List) (seg : int B_dData_dList.t_List) -> (if (fuel <= 0) then false else (if (((v_matchSegmentChars fuel) rest) seg) then true else (match seg with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (((v_matchSegmentStar (fuel - 1)) rest) dtb__22)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 220 "Vuna/Compiler/Base/Ignore.vuna"
let v_matchSegment = (fun (pat : string) (seg : string) -> (((v_matchSegmentChars ((((String.length pat) + 1) * ((String.length seg) + 1)) + 2)) (B_dData_dList.dtp_unpack pat)) (B_dData_dList.dtp_unpack seg)))

# 207 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegments = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = "**") then ((v_matchAnySegments dtb__24) mc1) else (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if ((v_matchSegment dtb__23) dtb__25) then ((v_matchSegments dtb__24) dtb__26) else false)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 215 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchAnySegments = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (if ((v_matchSegments mc0) (B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28))) then true else ((v_matchAnySegments mc0) dtb__28))
  | B_dData_dList.C_List_Nil -> ((v_matchSegments mc0) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Base/Ignore.vuna"
let v_ruleMatches = (fun (rule : t_IgnoreRule) (path : string) (isDir : bool) -> (if (if (rule).f_IgnoreRule_ignoreDirOnly then (B_dData_dBool.v_not isDir) else false) then false else (match ((v_stripBase (rule).f_IgnoreRule_ignoreBase) path) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (if (dtb__29 = "") then false else (if (rule).f_IgnoreRule_ignoreAnchored then ((v_matchSegments (rule).f_IgnoreRule_ignoreSegs) ((B_dData_dString.v_split "/") dtb__29)) else ((v_matchSegments (rule).f_IgnoreRule_ignoreSegs) (B_dData_dList.C_List__x58__x58_ ((Base_dSource.v_baseName dtb__29), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)))

# 179 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_lastMatch = (fun (mc0 : t_IgnoreRule B_dData_dList.t_List) (mc1 : string) (mc2 : bool) (mc3 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> ((((v_lastMatch dtb__31) mc1) mc2) (if (((v_ruleMatches dtb__30) mc1) mc2) then (B_dData_dBool.v_not (dtb__30).f_IgnoreRule_ignoreNegate) else mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Ignore.vuna"
let v_isIgnored = (fun (ctx : t_IgnoreContext) (rel : string) (isDir : bool) -> ((((v_lastMatch (ctx).f_IgnoreContext_ignoreRules) ((v_ignorePathOf ctx) rel)) isDir) false))

# 28 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreBase = (fun (p : t_IgnoreRule) -> (match p with
  | { f_IgnoreRule_ignoreBase = dtb__32; f_IgnoreRule_ignoreNegate = dtb__33; f_IgnoreRule_ignoreDirOnly = dtb__34; f_IgnoreRule_ignoreAnchored = dtb__35; f_IgnoreRule_ignoreSegs = dtb__36 } -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreNegate = (fun (p : t_IgnoreRule) -> (match p with
  | { f_IgnoreRule_ignoreBase = dtb__37; f_IgnoreRule_ignoreNegate = dtb__38; f_IgnoreRule_ignoreDirOnly = dtb__39; f_IgnoreRule_ignoreAnchored = dtb__40; f_IgnoreRule_ignoreSegs = dtb__41 } -> dtb__38
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreDirOnly = (fun (p : t_IgnoreRule) -> (match p with
  | { f_IgnoreRule_ignoreBase = dtb__42; f_IgnoreRule_ignoreNegate = dtb__43; f_IgnoreRule_ignoreDirOnly = dtb__44; f_IgnoreRule_ignoreAnchored = dtb__45; f_IgnoreRule_ignoreSegs = dtb__46 } -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreAnchored = (fun (p : t_IgnoreRule) -> (match p with
  | { f_IgnoreRule_ignoreBase = dtb__47; f_IgnoreRule_ignoreNegate = dtb__48; f_IgnoreRule_ignoreDirOnly = dtb__49; f_IgnoreRule_ignoreAnchored = dtb__50; f_IgnoreRule_ignoreSegs = dtb__51 } -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreSegs = (fun (p : t_IgnoreRule) -> (match p with
  | { f_IgnoreRule_ignoreBase = dtb__52; f_IgnoreRule_ignoreNegate = dtb__53; f_IgnoreRule_ignoreDirOnly = dtb__54; f_IgnoreRule_ignoreAnchored = dtb__55; f_IgnoreRule_ignoreSegs = dtb__56 } -> dtb__56
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreRoot = (fun (p : t_IgnoreContext) -> (match p with
  | { f_IgnoreContext_ignoreRoot = dtb__57; f_IgnoreContext_ignorePrefix = dtb__58; f_IgnoreContext_ignoreRules = dtb__59 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignorePrefix = (fun (p : t_IgnoreContext) -> (match p with
  | { f_IgnoreContext_ignoreRoot = dtb__60; f_IgnoreContext_ignorePrefix = dtb__61; f_IgnoreContext_ignoreRules = dtb__62 } -> dtb__61
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreRules = (fun (p : t_IgnoreContext) -> (match p with
  | { f_IgnoreContext_ignoreRoot = dtb__63; f_IgnoreContext_ignorePrefix = dtb__64; f_IgnoreContext_ignoreRules = dtb__65 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))
