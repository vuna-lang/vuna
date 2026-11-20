open Vuna_runtime
type t_ClauseCover = C_ClauseCover_CovUncovered | C_ClauseCover_CovCovered | C_ClauseCover_CovUnknown

# 34 "Vuna/Compiler/Elab/Coverage.vuna"
let v_emptyPatSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 38 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_wilds = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PWild (v_emptyPatSpan)), (v_wilds (n - 1))))))

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patHead = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__0, dtb__1, dtb__2) -> (v_patHead dtb__1)
  | _ -> mc0
))

# 46 "Vuna/Compiler/Elab/Coverage.vuna"
let v_headCtorName = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match (v_patHead dtb__3) with
  | Frontend_dRast.C_Pat_PCon (dtb__5, dtb__6, dtb__7) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__5)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorHeadsOf = (fun (rows : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (B_dData_dList.v_nubNames ((B_dData_dList.v_mapMaybe v_headCtorName) rows)))

# 58 "Vuna/Compiler/Elab/Coverage.vuna"
let v_isWildHead = (fun (p : Frontend_dRast.t_Pat) -> (match (v_patHead p) with
  | Frontend_dRast.C_Pat_PVar (dtb__8, dtb__9) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__10) -> true
  | _ -> false
))

# 66 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_defaultRows = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (v_defaultRows dtb__12)
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (v_isWildHead dtb__13) then (B_dData_dList.C_List__x58__x58_ (dtb__14, (v_defaultRows dtb__12))) else (v_defaultRows dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_concatMapRow = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List) -> Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((B_dData_dList.v_append (mc0 dtb__15)) ((v_concatMapRow mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeRow = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match (v_patHead dtb__17) with
  | Frontend_dRast.C_Pat_PCon (dtb__19, dtb__20, dtb__21) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__19) = mc1) then (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append dtb__20) dtb__18), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | Frontend_dRast.C_Pat_PVar (dtb__22, dtb__23) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds mc0)) dtb__18), B_dData_dList.C_List_Nil))
  | Frontend_dRast.C_Pat_PWild (dtb__24) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds mc0)) dtb__18), B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeCtor = (fun (ar : int) (cname : string) (rows : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> ((v_concatMapRow ((v_specializeRow ar) cname)) rows))

# 90 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasNilRow = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_hasNilRow dtb__26)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_lookupEntry = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> (if (dtb__29 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__30)) else ((v_lookupEntry mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (cname : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__31)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__31)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x47__x61_ (B_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua B_dData_dInt.v_Eq_uInt)) ((v_lookupEntry cname) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf e)))) B_dData_dMaybe.C_Maybe_Nothing))) table)))

# 122 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasShortCtor = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> (if ((Frontend_dRast.v_ctorShortName dtb__35) = mc0) then true else ((v_hasShortCtor mc0) dtb__34))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_anyShortCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (if ((v_hasShortCtor dtb__37) mc1) then true else ((v_anyShortCtor dtb__38) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyOfShortCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (shorts : string B_dData_dList.t_List) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__40 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__39)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__39)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((v_anyShortCtor shorts) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf e))))) table)))

# 133 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_findShortCtor = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (if ((B_dData_dList.v_memName (Frontend_dRast.v_ctorShortName (B_dData_dPair.v_firstOf dtb__41))) mc1) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__41))) else ((v_findShortCtor dtb__42) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Coverage.vuna"
let v_sentinelCtorIn = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (if (Frontend_dRast.v_isListNilSyntax h) then ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil))) else (if (Frontend_dRast.v_isListConsSyntax h) then ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil))))) else (B_dData_dMaybe.C_Maybe_Just (h)))))

# 139 "Vuna/Compiler/Elab/Coverage.vuna"
let v_orderedCtors = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : string B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf e)) heads)))) ctors)) ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf e)) heads))) ctors)))

# 145 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_takePats = (fun (n : int) (xs : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (B_dData_dList.C_List__x58__x58_ (dtb__43, ((v_takePats (n - 1)) dtb__44)))
  | _ -> failwith "DT: impossible branch"
)))

# 154 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_dropPats = (fun (n : int) (xs : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> ((v_dropPats (n - 1)) dtb__46)
  | _ -> failwith "DT: impossible branch"
)))

# 169 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_coverageWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (pending : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (rows : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__47 = fuel in (if (dtnat__47 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb__48 = (dtnat__47 - 1) in (match pending with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (match dtb__49 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> ((fun ar -> ((fun specialized -> ((fun deeper -> (match deeper with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_coverageWitness table) dtb__48) (B_dData_dMaybe.C_Maybe_Just (dtb__51))) rows) qs)
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName (B_dData_dPair.v_firstOf dtb__50)), ((v_takePats ar) dtb__52), v_emptyPatSpan)), ((v_dropPats ar) dtb__52)))))
  | _ -> failwith "DT: impossible branch"
)) (((((v_coverageWitness table) dtb__48) B_dData_dMaybe.C_Maybe_Nothing) specialized) ((B_dData_dList.v_append (v_wilds ar)) qs)))) (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__50)) rows))) (B_dData_dPair.v_secondOf dtb__50))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> ((fun heads -> (match heads with
  | B_dData_dList.C_List_Nil -> (match (((((v_coverageWitness table) dtb__48) B_dData_dMaybe.C_Maybe_Nothing) (v_defaultRows rows)) dtb__54) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PWild (v_emptyPatSpan)), dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match ((v_familyCtors table) dtb__56) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (((((v_coverageWitness table) dtb__48) (B_dData_dMaybe.C_Maybe_Just (((v_orderedCtors dtb__58) heads)))) rows) dtb__54)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_ctorHeadsOf rows))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 230 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_clauseCover = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (rows : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__59 = fuel in (if (dtnat__59 = 0) then C_ClauseCover_CovUnknown else (let dtb__60 = (dtnat__59 - 1) in (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then C_ClauseCover_CovCovered else C_ClauseCover_CovUncovered)
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match (v_patHead dtb__61) with
  | Frontend_dRast.C_Pat_PCon (dtb__63, dtb__64, dtb__65) -> ((((v_clauseCover table) dtb__60) (((v_specializeCtor (B_dData_dList.v_length dtb__64)) (Frontend_dRast_dName.v_rnameKey dtb__63)) rows)) ((B_dData_dList.v_append dtb__64) dtb__62))
  | Frontend_dRast.C_Pat_PRecord (dtb__66, dtb__67, dtb__68) -> C_ClauseCover_CovUnknown
  | Frontend_dRast.C_Pat_PInt (dtb__69, dtb__70) -> ((((v_clauseCover table) dtb__60) (v_defaultRows rows)) dtb__62)
  | Frontend_dRast.C_Pat_PStr (dtb__71, dtb__72) -> ((((v_clauseCover table) dtb__60) (v_defaultRows rows)) dtb__62)
  | _ -> (match (v_ctorHeadsOf rows) with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover table) dtb__60) (v_defaultRows rows)) dtb__62)
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (match ((v_familyCtors table) dtb__73) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_ClauseCover_CovUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> ((((((v_clauseCoverCtorsGo table) dtb__60) ((v_orderedCtors dtb__75) (v_ctorHeadsOf rows))) rows) dtb__62) C_ClauseCover_CovCovered)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))))
# 270 "Vuna/Compiler/Elab/Coverage.vuna"
and v_clauseCoverCtorsGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc5 : t_ClauseCover) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((fun ar -> (match ((((v_clauseCover mc0) mc1) (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__76)) mc3)) ((B_dData_dList.v_append (v_wilds ar)) mc4)) with
  | C_ClauseCover_CovUncovered -> C_ClauseCover_CovUncovered
  | C_ClauseCover_CovUnknown -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__77) mc3) mc4) C_ClauseCover_CovUnknown)
  | C_ClauseCover_CovCovered -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__77) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dPair.v_secondOf dtb__76))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patNodes = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__78, dtb__79, dtb__80) -> (1 + (v_patNodesFields dtb__79))
  | Frontend_dRast.C_Pat_PAs (dtb__81, dtb__82, dtb__83) -> (1 + (v_patNodes dtb__82))
  | Frontend_dRast.C_Pat_PCon (dtb__84, dtb__85, dtb__86) -> (1 + (v_patNodesList dtb__85))
  | _ -> 1
))
# 287 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesList = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> ((v_patNodes dtb__87) + (v_patNodesList dtb__88))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesFields = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> ((v_patNodes dtb__92) + (v_patNodesFields dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_matrixNodes = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> ((v_patNodesList dtb__93) + (v_matrixNodes dtb__94))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelMax = 1000000

# 300 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelFor = (fun (clauses : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> ((fun scaled -> (if (scaled > v_coverageFuelMax) then v_coverageFuelMax else scaled)) (256 + (4 * (v_matrixNodes clauses)))))

# 314 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_allSameLen = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (if ((B_dData_dList.v_length dtb__95) = mc0) then ((v_allSameLen mc0) dtb__96) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Coverage.vuna"
let v_uniformArity = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> ((v_allSameLen (B_dData_dList.v_length dtb__97)) dtb__98)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixArity = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (B_dData_dList.v_length dtb__99)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (if (v_uniformArity clauses) then (((((v_coverageWitness table) (bi_natFromInt (v_coverageFuelFor clauses))) B_dData_dMaybe.C_Maybe_Nothing) clauses) (v_wilds (v_matrixArity clauses))) else B_dData_dMaybe.C_Maybe_Nothing))

# 351 "Vuna/Compiler/Elab/Coverage.vuna"
let v_witnessNamesCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (match (v_patHead dtb__101) with
  | Frontend_dRast.C_Pat_PCon (dtb__103, dtb__104, dtb__105) -> true
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_renderPatIn = (fun (fuel : int) (paren : bool) (p : Frontend_dRast.t_Pat) -> (if (fuel <= 0) then "_" else (match (v_patHead p) with
  | Frontend_dRast.C_Pat_PCon (dtb__106, dtb__107, dtb__108) -> (if ((B_dData_dList.v_length dtb__107) = 0) then (Frontend_dRast_dName.v_rnameKey dtb__106) else ((fun body -> (if paren then (String.concat "" ["("; body; ")"]) else body)) (String.concat "" [(Frontend_dRast_dName.v_rnameKey dtb__106); " "; ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn (fuel - 1)) true)) dtb__107))])))
  | Frontend_dRast.C_Pat_PVar (dtb__109, dtb__110) -> "_"
  | Frontend_dRast.C_Pat_PWild (dtb__111) -> "_"
  | Frontend_dRast.C_Pat_PInt (dtb__112, dtb__113) -> (bi_strFromInt dtb__112)
  | Frontend_dRast.C_Pat_PStr (dtb__114, dtb__115) -> (String.concat "" ["\""; dtb__114; "\""])
  | Frontend_dRast.C_Pat_PRecord (dtb__116, dtb__117, dtb__118) -> (String.concat "" ["{ "; (Frontend_dRast_dName.v_rnameKey dtb__116); " }"])
  | Frontend_dRast.C_Pat_PAs (dtb__119, dtb__120, dtb__121) -> (((v_renderPatIn (fuel - 1)) paren) dtb__120)
  | _ -> failwith "DT: impossible branch"
)))

# 360 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderPat = (fun (p : Frontend_dRast.t_Pat) -> (((v_renderPatIn 64) false) p))

# 383 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderWitness = (fun (ws : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn 64) true)) ws)))

# 334 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveDiag = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((d).Base_dDiag.f_Diagnostic_diagCode <> "TC_NotExhaustive") then d else (match ((v_matrixWitness table) clauses) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> (if (v_witnessNamesCtor dtb__122) then ((fun rx -> ((Base_dDiag.v_withFallbackSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive (rx))) (B_dData_dVec.C_Vec_VCons (rx, B_dData_dVec.C_Vec_Nil))))) (v_renderWitness dtb__122)) else d)
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
)))

# 330 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveExhaustive = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int) -> Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) mc3 -> (match mc3 with
  | Base_dDiag.C_Check_ErrC (dtb__123) -> (Base_dDiag.C_Check_ErrC (((((v_improveDiag mc0) (mc1 0)) mc2) dtb__123)))
  | Base_dDiag.C_Check_OkC (dtb__124) -> (Base_dDiag.C_Check_OkC (dtb__124))
  | _ -> failwith "DT: impossible branch"
))
