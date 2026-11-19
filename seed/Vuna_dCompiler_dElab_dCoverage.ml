open Vuna_runtime
# 34 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }

# 38 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dwilds = (fun (n : int) -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), (v_Vuna_dCompiler_dElab_dCoverage_dwilds (n - 1))))))

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dpatHead = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__0, dtb__1, dtb__2) -> (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__1)
  | _ -> mc0
))

# 46 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__3) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__5, dtb__6, dtb__7) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__5)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf = (fun (rows : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmapMaybe v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName) rows)))

# 58 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_disWildHead = (fun (p : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead p) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__8, dtb__9) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__10) -> true
  | _ -> false
))

# 66 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dElab_dCoverage_disWildHead dtb__13) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12))) else (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> ((Base_dData_dList.v_Base_dData_dList_dappend (mc0 dtb__15)) ((v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow mc0) dtb__16))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dspecializeRow = (fun (mc0 : int) (mc1 : string) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__17) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__19, dtb__20, dtb__21) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__19) = mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dList.v_Base_dData_dList_dappend dtb__20) dtb__18), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__22, dtb__23) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds mc0)) dtb__18), Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__24) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds mc0)) dtb__18), Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dspecializeCtor = (fun (ar : int) (cname : string) (rows : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow ((v_Vuna_dCompiler_dElab_dCoverage_dspecializeRow ar) cname)) rows))

# 90 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow dtb__26)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry = (fun (mc0 : string) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__29; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__30 } -> (if (dtb__29 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30)) else ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (cname : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__31)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__31)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (e : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x47__x61_ (Base_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua Base_dData_dInt.v_Eq_uInt)) ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry cname) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf e)))) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))) table)))

# 122 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dhasShortCtor = (fun (mc0 : string) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__35; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__36 } -> (if ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorShortName dtb__35) = mc0) then true else ((v_Vuna_dCompiler_dElab_dCoverage_dhasShortCtor mc0) dtb__34))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_danyShortCtor = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__37, dtb__38) -> (if ((v_Vuna_dCompiler_dElab_dCoverage_dhasShortCtor dtb__37) mc1) then true else ((v_Vuna_dCompiler_dElab_dCoverage_danyShortCtor dtb__38) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dfamilyOfShortCtors = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (shorts : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (match dtb__40 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__39)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__39)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (e : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dCoverage_danyShortCtor shorts) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf e))))) table)))

# 133 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dfindShortCtor = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorShortName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__41))) mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__41))) else ((v_Vuna_dCompiler_dElab_dCoverage_dfindShortCtor dtb__42) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dsentinelCtorIn = (fun (ctors : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (h : string) -> (if (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_disListNilSyntax h) then ((v_Vuna_dCompiler_dElab_dCoverage_dfindShortCtor ctors) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Nil", Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_disListConsSyntax h) then ((v_Vuna_dCompiler_dElab_dCoverage_dfindShortCtor ctors) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("::", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Cons", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (h)))))

# 139 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dorderedCtors = (fun (ctors : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (heads : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (e : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf e)) heads)))) ctors)) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (e : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((Base_dData_dList.v_Base_dData_dList_dmemName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf e)) heads))) ctors)))

# 145 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dtakePats = (fun (n : int) (xs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, ((v_Vuna_dCompiler_dElab_dCoverage_dtakePats (n - 1)) dtb__44)))
  | _ -> failwith "DT: impossible branch"
)))

# 154 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_ddropPats = (fun (n : int) (xs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__45, dtb__46) -> ((v_Vuna_dCompiler_dElab_dCoverage_ddropPats (n - 1)) dtb__46)
  | _ -> failwith "DT: impossible branch"
)))

# 169 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (pending : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (rows : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (qs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (let dtnat__47 = fuel in (if (dtnat__47 = 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (let dtb__48 = (dtnat__47 - 1) in (match pending with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__49) -> (match dtb__49 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> ((fun ar -> ((fun specialized -> ((fun deeper -> (match deeper with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__48) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51))) rows) qs)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__52) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__50)), ((v_Vuna_dCompiler_dElab_dCoverage_dtakePats ar) dtb__52), v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), ((v_Vuna_dCompiler_dElab_dCoverage_ddropPats ar) dtb__52)))))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__48) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) specialized) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds ar)) qs)))) (((v_Vuna_dCompiler_dElab_dCoverage_dspecializeCtor ar) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__50)) rows))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__50))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match qs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow rows) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> ((fun heads -> (match heads with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__48) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows rows)) dtb__54) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (match ((v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors table) dtb__56) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__48) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dCoverage_dorderedCtors dtb__58) heads)))) rows) dtb__54)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf rows))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 220 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dpatNodes = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__59, dtb__60, dtb__61) -> (1 + (v_Vuna_dCompiler_dElab_dCoverage_dpatNodesFields dtb__60))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__62, dtb__63, dtb__64) -> (1 + (v_Vuna_dCompiler_dElab_dCoverage_dpatNodes dtb__63))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__65, dtb__66, dtb__67) -> (1 + (v_Vuna_dCompiler_dElab_dCoverage_dpatNodesList dtb__66))
  | _ -> 1
))
# 226 "Vuna/Compiler/Elab/Coverage.vuna"
and v_Vuna_dCompiler_dElab_dCoverage_dpatNodesList = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> ((v_Vuna_dCompiler_dElab_dCoverage_dpatNodes dtb__68) + (v_Vuna_dCompiler_dElab_dCoverage_dpatNodesList dtb__69))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 230 "Vuna/Compiler/Elab/Coverage.vuna"
and v_Vuna_dCompiler_dElab_dCoverage_dpatNodesFields = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__72; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__73 } -> ((v_Vuna_dCompiler_dElab_dCoverage_dpatNodes dtb__73) + (v_Vuna_dCompiler_dElab_dCoverage_dpatNodesFields dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dmatrixNodes = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> ((v_Vuna_dCompiler_dElab_dCoverage_dpatNodesList dtb__74) + (v_Vuna_dCompiler_dElab_dCoverage_dmatrixNodes dtb__75))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dcoverageFuelMax = 1000000

# 239 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dcoverageFuelFor = (fun (clauses : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dElab_dCoverage_dcoverageFuelMax) then v_Vuna_dCompiler_dElab_dCoverage_dcoverageFuelMax else scaled)) (256 + (4 * (v_Vuna_dCompiler_dElab_dCoverage_dmatrixNodes clauses)))))

# 253 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dallSameLen = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__76) = mc0) then ((v_Vuna_dCompiler_dElab_dCoverage_dallSameLen mc0) dtb__77) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_duniformArity = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> ((v_Vuna_dCompiler_dElab_dCoverage_dallSameLen (Base_dData_dList.v_Base_dData_dList_dlength dtb__78)) dtb__79)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dmatrixArity = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (Base_dData_dList.v_Base_dData_dList_dlength dtb__80)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dmatrixWitness = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (if (v_Vuna_dCompiler_dElab_dCoverage_duniformArity clauses) then (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) (bi_natFromInt (v_Vuna_dCompiler_dElab_dCoverage_dcoverageFuelFor clauses))) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) clauses) (v_Vuna_dCompiler_dElab_dCoverage_dwilds (v_Vuna_dCompiler_dElab_dCoverage_dmatrixArity clauses))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 290 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dwitnessNamesCtor = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__82) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__84, dtb__85, dtb__86) -> true
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn = (fun (fuel : int) (paren : bool) (p : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (if (fuel <= 0) then "_" else (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead p) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__87, dtb__88, dtb__89) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__88) = 0) then (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__87) else ((fun body -> (if paren then (String.concat "" ["("; body; ")"]) else body)) (String.concat "" [(Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__87); " "; ((Base_dData_dString.v_Base_dData_dString_djoin " ") ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) true)) dtb__88))])))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__90, dtb__91) -> "_"
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__92) -> "_"
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__93, dtb__94) -> (bi_strFromInt dtb__93)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__95, dtb__96) -> (String.concat "" ["\""; dtb__95; "\""])
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__97, dtb__98, dtb__99) -> (String.concat "" ["{ "; (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__97); " }"])
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__100, dtb__101, dtb__102) -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) paren) dtb__101)
  | _ -> failwith "DT: impossible branch"
)))

# 299 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_drenderPat = (fun (p : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn 64) false) p))

# 322 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_drenderWitness = (fun (ws : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dString.v_Base_dData_dString_djoin " ") ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn 64) true)) ws)))

# 273 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dimproveDiag = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (if ((d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCode <> "TC_NotExhaustive") then d else (match ((v_Vuna_dCompiler_dElab_dCoverage_dmatrixWitness table) clauses) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103) -> (if (v_Vuna_dCompiler_dElab_dCoverage_dwitnessNamesCtor dtb__103) then ((fun rx -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotExhaustive (rx))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (rx, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))) (v_Vuna_dCompiler_dElab_dCoverage_drenderWitness dtb__103)) else d)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
)))

# 269 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive = (fun (mc0 : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (int) -> Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) mc3 -> (match mc3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__104) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((((v_Vuna_dCompiler_dElab_dCoverage_dimproveDiag mc0) (mc1 0)) mc2) dtb__104)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__105) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__105))
  | _ -> failwith "DT: impossible branch"
))
