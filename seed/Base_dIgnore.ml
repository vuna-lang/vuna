open Vuna_runtime
type t_IgnoreRule = { f_IgnoreRule_ignoreBase : string; f_IgnoreRule_ignoreNegate : bool; f_IgnoreRule_ignoreDirOnly : bool; f_IgnoreRule_ignoreAnchored : bool; f_IgnoreRule_ignoreSegs : string B_dData_dList.t_List }
and t_IgnoreContext = { f_IgnoreContext_ignoreRoot : string; f_IgnoreContext_ignorePrefix : string; f_IgnoreContext_ignoreRules : t_IgnoreRule B_dData_dList.t_List }

# 68 "Vuna/Compiler/Base/Ignore.vuna"
let v_buildRule = (fun (base : string) (body : string) (negate : bool) -> ((fun dirOnly -> ((fun body1 -> ((fun leadingSlash -> ((fun body2 -> ((fun anchored -> { f_IgnoreRule_ignoreBase = base; f_IgnoreRule_ignoreNegate = negate; f_IgnoreRule_ignoreDirOnly = dirOnly; f_IgnoreRule_ignoreAnchored = anchored; f_IgnoreRule_ignoreSegs = ((B_dData_dString.v_split "/") body2) }) (if leadingSlash then true else ((B_dData_dString.v_contains "/") body2)))) (if leadingSlash then (((dtp_substring 1) ((bi_strLength body1) - 1)) body1) else body1))) ((B_dData_dString.v_startsWith "/") body1))) (if dirOnly then (((dtp_substring 0) ((bi_strLength body) - 1)) body) else body))) ((B_dData_dString.v_endsWith "/") body)))

# 53 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignoreLine = (fun (base : string) (raw : string) -> ((fun line -> (if (if (line = "") then true else ((B_dData_dString.v_startsWith "#") line)) then B_dData_dMaybe.C_Maybe_Nothing else (if ((B_dData_dString.v_startsWith "\\#") line) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) (((dtp_substring 1) ((bi_strLength line) - 1)) line)) false))) else (if ((B_dData_dString.v_startsWith "!") line) then ((fun body -> (if (body = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) body) true))))) (((dtp_substring 1) ((bi_strLength line) - 1)) line)) else (if ((B_dData_dString.v_startsWith "\\!") line) then (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) (((dtp_substring 1) ((bi_strLength line) - 1)) line)) false))) else (B_dData_dMaybe.C_Maybe_Just ((((v_buildRule base) line) false)))))))) (B_dData_dString.v_trimRight raw)))

# 49 "Vuna/Compiler/Base/Ignore.vuna"
let v_parseGitignore = (fun (base : string) (text : string) -> ((B_dData_dList.v_mapMaybe (v_parseGitignoreLine base)) (B_dData_dString.v_lines text)))

# 97 "Vuna/Compiler/Base/Ignore.vuna"
let v_trimTrailingSlash = (fun (path : string) -> (if (if ((bi_strLength path) > 1) then ((B_dData_dString.v_endsWith "/") path) else false) then (((dtp_substring 0) ((bi_strLength path) - 1)) path) else path))

# 102 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_ancestorChain = (fun (fuel : int) (stop : string) (dir : string) -> (if (fuel <= 0) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else (if (dir = stop) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else ((fun parent -> (if (parent = dir) then (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (((v_ancestorChain (fuel - 1)) stop) parent)) (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))))) (Base_dSource.v_parentOfPath dir)))))

# 125 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_findGitRoot = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/.git"))) (fun found -> (if found then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just (dir))) else ((fun parent -> (if (parent = dir) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((v_findGitRoot nFs) (fuel - 1)) parent))) (Base_dSource.v_parentOfPath dir)))))))

# 140 "Vuna/Compiler/Base/Ignore.vuna"
let v_loadIgnoreFile = (fun (nFs : string) (dir : string) (base : string) (ctx : t_IgnoreContext) -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ctx) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { f_IgnoreContext_ignoreRoot = (ctx).f_IgnoreContext_ignoreRoot; f_IgnoreContext_ignorePrefix = (ctx).f_IgnoreContext_ignorePrefix; f_IgnoreContext_ignoreRules = ((B_dData_dList.v_append (ctx).f_IgnoreContext_ignoreRules) ((v_parseGitignore base) text)) })))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ctx))))) (dir ^ "/.gitignore")))

# 159 "Vuna/Compiler/Base/Ignore.vuna"
let v_relUnder = (fun (base : string) (dir : string) -> (if (base = dir) then "" else (if (base = ".") then (if ((B_dData_dString.v_startsWith "./") dir) then (((dtp_substring 2) ((bi_strLength dir) - 2)) dir) else dir) else (if ((B_dData_dString.v_startsWith (base ^ "/")) dir) then (((dtp_substring ((bi_strLength base) + 1)) (((bi_strLength dir) - (bi_strLength base)) - 1)) dir) else dir))))

# 114 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_loadChain = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_IgnoreContext) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dString.v_Eq_uString)) dtb__1) B_dData_dList.C_List_Nil) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) mc2) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_loadIgnoreFile nFs) dtb__0) ((v_relUnder mc1) dtb__0)) mc2)) (fun ctx2 -> ((((v_loadChain nFs) dtb__1) mc1) ctx2))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextAt = (fun (nFs : string) (scanRoot : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_findGitRoot nFs) 512) scanRoot)) (fun found -> ((fun ignoreRoot -> ((fun chain -> ((((v_loadChain nFs) chain) ignoreRoot) { f_IgnoreContext_ignoreRoot = ignoreRoot; f_IgnoreContext_ignorePrefix = ((v_relUnder ignoreRoot) scanRoot); f_IgnoreContext_ignoreRules = B_dData_dList.C_List_Nil })) (((v_ancestorChain 512) ignoreRoot) scanRoot))) (match found with
  | B_dData_dMaybe.C_Maybe_Nothing -> scanRoot
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | _ -> failwith "DT: impossible branch"
)))))

# 80 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignoreContextEff = (fun (nFs : string) (root : string) -> ((v_ignoreContextAt nFs) (v_trimTrailingSlash root)))

# 171 "Vuna/Compiler/Base/Ignore.vuna"
let v_ignorePathOf = (fun (ctx : t_IgnoreContext) (rel : string) -> (if ((ctx).f_IgnoreContext_ignorePrefix = "") then rel else (String.concat "" [(ctx).f_IgnoreContext_ignorePrefix; "/"; rel])))

# 195 "Vuna/Compiler/Base/Ignore.vuna"
let v_stripBase = (fun (base : string) (path : string) -> (if (base = "") then (B_dData_dMaybe.C_Maybe_Just (path)) else (if (path = base) then (B_dData_dMaybe.C_Maybe_Just ("")) else (if ((B_dData_dString.v_startsWith (base ^ "/")) path) then (B_dData_dMaybe.C_Maybe_Just ((((dtp_substring ((bi_strLength base) + 1)) (((bi_strLength path) - (bi_strLength base)) - 1)) path))) else B_dData_dMaybe.C_Maybe_Nothing))))

# 225 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegmentChars = (fun (fuel : int) (pat : int B_dData_dList.t_List) (seg : int B_dData_dList.t_List) -> (if (fuel <= 0) then false else (((v_matchSegmentGo (fuel - 1)) pat) seg)))
# 229 "Vuna/Compiler/Base/Ignore.vuna"
and v_matchSegmentGo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (dtb__3 = 42) then (((v_matchSegmentStar (mc0 - 1)) dtb__4) mc2) else (if (dtb__3 = 63) then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (((v_matchSegmentChars (mc0 - 1)) dtb__4) dtb__6)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if (dtb__3 = dtb__7) then (((v_matchSegmentChars (mc0 - 1)) dtb__4) dtb__8) else false)
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
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (((v_matchSegmentStar (fuel - 1)) rest) dtb__10)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 220 "Vuna/Compiler/Base/Ignore.vuna"
let v_matchSegment = (fun (pat : string) (seg : string) -> (((v_matchSegmentChars ((((bi_strLength pat) + 1) * ((bi_strLength seg) + 1)) + 2)) (B_dData_dList.dtp_unpack pat)) (B_dData_dList.dtp_unpack seg)))

# 207 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_matchSegments = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (if (dtb__11 = "**") then ((v_matchAnySegments dtb__12) mc1) else (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if ((v_matchSegment dtb__11) dtb__13) then ((v_matchSegments dtb__12) dtb__14) else false)
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
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if ((v_matchSegments mc0) (B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16))) then true else ((v_matchAnySegments mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> ((v_matchSegments mc0) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Base/Ignore.vuna"
let v_ruleMatches = (fun (rule : t_IgnoreRule) (path : string) (isDir : bool) -> (if (if (rule).f_IgnoreRule_ignoreDirOnly then (B_dData_dBool.v_not isDir) else false) then false else (match ((v_stripBase (rule).f_IgnoreRule_ignoreBase) path) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (if (dtb__17 = "") then false else (if (rule).f_IgnoreRule_ignoreAnchored then ((v_matchSegments (rule).f_IgnoreRule_ignoreSegs) ((B_dData_dString.v_split "/") dtb__17)) else ((v_matchSegments (rule).f_IgnoreRule_ignoreSegs) (B_dData_dList.C_List__x58__x58_ ((Base_dSource.v_baseName dtb__17), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)))

# 179 "Vuna/Compiler/Base/Ignore.vuna"
let rec v_lastMatch = (fun (mc0 : t_IgnoreRule B_dData_dList.t_List) (mc1 : string) (mc2 : bool) (mc3 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> ((((v_lastMatch dtb__19) mc1) mc2) (if (((v_ruleMatches dtb__18) mc1) mc2) then (B_dData_dBool.v_not (dtb__18).f_IgnoreRule_ignoreNegate) else mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Ignore.vuna"
let v_isIgnored = (fun (ctx : t_IgnoreContext) (rel : string) (isDir : bool) -> ((((v_lastMatch (ctx).f_IgnoreContext_ignoreRules) ((v_ignorePathOf ctx) rel)) isDir) false))
