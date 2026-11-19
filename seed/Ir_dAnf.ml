open Vuna_runtime
type t_Anf = { f_Anf_anfLets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Anf_anfExpr : Ir_dModel.t_Ir; f_Anf_anfNext : int }
and t_Bound = { f_Bound_boundLets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Bound_boundExpr : Ir_dModel.t_Ir; f_Bound_boundNext : int }
and t_AnfList = { f_AnfList_anfLets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List; f_AnfList_anfExprs : Ir_dModel.t_Ir B_dData_dList.t_List; f_AnfList_anfNext : int }
and t_AnfFields = { f_AnfFields_anfLets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List; f_AnfFields_anfValues : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List; f_AnfFields_anfNext : int }
and t_AnfAlts = { f_AnfAlts_anfAlts : Ir_dModel.t_IrAlt B_dData_dList.t_List; f_AnfAlts_anfNext : int }
and t_AnfAltM = { f_AnfAltM_anfAltM : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe; f_AnfAltM_anfNext : int }

# 25 "Vuna/Compiler/Ir/Anf.vuna"
let v_mkAnf = (fun (lets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Ir_dModel.t_Ir) (n : int) -> { f_Anf_anfLets = lets; f_Anf_anfExpr = e; f_Anf_anfNext = n })

# 51 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_spineOfIr = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrApp (dtb__0, dtb__1, dtb__2) -> ((fun p -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dList.C_List__x58__x58_ (dtb__2, B_dData_dList.C_List_Nil))) }) (v_spineOfIr dtb__1))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 58 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_applyIrs = (fun (f : Ir_dModel.t_Ir) (xs : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match xs with
  | B_dData_dList.C_List_Nil -> f
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> ((v_applyIrs (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, f, dtb__3))) dtb__4)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Ir/Anf.vuna"
let v_isSimple = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrCtor (dtb__5, dtb__6, dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | Ir_dModel.C_Ir_IrFloatLit (dtb__9) -> true
  | Ir_dModel.C_Ir_IrBool (dtb__10) -> true
  | Ir_dModel.C_Ir_IrStr (dtb__11) -> true
  | Ir_dModel.C_Ir_IrInt (dtb__12) -> true
  | Ir_dModel.C_Ir_IrRt (dtb__13) -> true
  | Ir_dModel.C_Ir_IrGlobal (dtb__14) -> true
  | Ir_dModel.C_Ir_IrVar (dtb__15) -> true
  | _ -> false
))

# 75 "Vuna/Compiler/Ir/Anf.vuna"
let v_freshBinder = (fun (n : int) -> (Ir_dModel.v_mkIrBinder ("__anf" ^ (bi_strFromInt n))))

# 78 "Vuna/Compiler/Ir/Anf.vuna"
let v_bindSimple = (fun (next : int) (lets : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Ir_dModel.t_Ir) -> (if (v_isSimple e) then { f_Bound_boundLets = lets; f_Bound_boundExpr = e; f_Bound_boundNext = next } else ((fun b -> { f_Bound_boundLets = ((B_dData_dList.v_append lets) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = b; B_dData_dPair.f_Pair_second = e }, B_dData_dList.C_List_Nil))); f_Bound_boundExpr = (Ir_dModel.C_Ir_IrVar (b)); f_Bound_boundNext = (next + 1) }) (v_freshBinder next))))

# 87 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_letsIn = (fun (mc0 : (Ir_dModel.t_IrBinder, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Ir_dModel.t_Ir) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (Ir_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb__16), B_dData_dList.C_List_Nil)), (B_dData_dPair.v_secondOf dtb__16), ((v_letsIn dtb__17) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_anf = (fun (fuel : int) (next : int) (e : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (((v_mkAnf B_dData_dList.C_List_Nil) e) next) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Ir_dModel.C_Ir_IrTail (dtb__18) -> (((v_anf (fuel - 1)) next) dtb__18)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> ((fun p -> (((v_mkAnf (p).f_Anf_anfLets) (Ir_dModel.C_Ir_IrEffThunk (dtb__19, dtb__20, dtb__21, dtb__22, (p).f_Anf_anfExpr))) (p).f_Anf_anfNext)) (((v_anf (fuel - 1)) next) dtb__23))
  | Ir_dModel.C_Ir_IrNatCase (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> ((fun s -> ((fun z -> ((fun su -> ((fun ca -> (((v_mkAnf (s).f_Anf_anfLets) (Ir_dModel.C_Ir_IrNatCase ((s).f_Anf_anfExpr, dtb__25, (z).f_AnfAltM_anfAltM, (su).f_AnfAltM_anfAltM, (ca).f_AnfAltM_anfAltM))) (ca).f_AnfAltM_anfNext)) (((v_anfAltMaybe (fuel - 1)) (su).f_AnfAltM_anfNext) dtb__28))) (((v_anfAltMaybe (fuel - 1)) (z).f_AnfAltM_anfNext) dtb__27))) (((v_anfAltMaybe (fuel - 1)) (s).f_Anf_anfNext) dtb__26))) (((v_anf (fuel - 1)) next) dtb__24))
  | Ir_dModel.C_Ir_IrCase (dtb__29, dtb__30, dtb__31, dtb__32) -> ((fun s -> ((fun alts1 -> (((v_mkAnf (s).f_Anf_anfLets) (Ir_dModel.C_Ir_IrCase (dtb__29, dtb__30, (s).f_Anf_anfExpr, (alts1).f_AnfAlts_anfAlts))) (alts1).f_AnfAlts_anfNext)) (((v_anfAlts (fuel - 1)) (s).f_Anf_anfNext) dtb__32))) (((v_anf (fuel - 1)) next) dtb__31))
  | Ir_dModel.C_Ir_IrIf (dtb__33, dtb__34, dtb__35) -> ((fun ca -> ((fun ta -> ((fun ea -> (((v_mkAnf (ca).f_Anf_anfLets) (Ir_dModel.C_Ir_IrIf ((ca).f_Anf_anfExpr, ((v_letsIn (ta).f_Anf_anfLets) (ta).f_Anf_anfExpr), ((v_letsIn (ea).f_Anf_anfLets) (ea).f_Anf_anfExpr)))) (ea).f_Anf_anfNext)) (((v_anf (fuel - 1)) (ta).f_Anf_anfNext) dtb__35))) (((v_anf (fuel - 1)) (ca).f_Anf_anfNext) dtb__34))) (((v_anf (fuel - 1)) next) dtb__33))
  | Ir_dModel.C_Ir_IrApp (dtb__36, dtb__37, dtb__38) -> (match dtb__37 with
  | Ir_dModel.C_Ir_IrRt (dtb__39) -> (if (dtb__39 = "prim_erase") then (((v_anf (fuel - 1)) next) dtb__38) else ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_mkAnf (bf).f_Bound_boundLets) ((v_applyIrs (bf).f_Bound_boundExpr) (xs).f_AnfList_anfExprs)) (bf).f_Bound_boundNext)) (((v_bindSimple (xs).f_AnfList_anfNext) ((B_dData_dList.v_append (h).f_Anf_anfLets) (xs).f_AnfList_anfLets)) (h).f_Anf_anfExpr))) (((v_anfList (fuel - 1)) (h).f_Anf_anfNext) (B_dData_dPair.v_secondOf p)))) (((v_anf (fuel - 1)) next) (B_dData_dPair.v_firstOf p)))) (v_spineOfIr e)))
  | _ -> ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_mkAnf (bf).f_Bound_boundLets) ((v_applyIrs (bf).f_Bound_boundExpr) (xs).f_AnfList_anfExprs)) (bf).f_Bound_boundNext)) (((v_bindSimple (xs).f_AnfList_anfNext) ((B_dData_dList.v_append (h).f_Anf_anfLets) (xs).f_AnfList_anfLets)) (h).f_Anf_anfExpr))) (((v_anfList (fuel - 1)) (h).f_Anf_anfNext) (B_dData_dPair.v_secondOf p)))) (((v_anf (fuel - 1)) next) (B_dData_dPair.v_firstOf p)))) (v_spineOfIr e))
)
  | Ir_dModel.C_Ir_IrLet (dtb__40, dtb__41, dtb__42) -> ((fun s -> ((fun bScrut -> ((fun b -> (((v_mkAnf (bScrut).f_Bound_boundLets) (Ir_dModel.C_Ir_IrLet (dtb__40, (bScrut).f_Bound_boundExpr, ((v_letsIn (b).f_Anf_anfLets) (b).f_Anf_anfExpr)))) (b).f_Anf_anfNext)) (((v_anf (fuel - 1)) (bScrut).f_Bound_boundNext) dtb__42))) (((v_bindSimple (s).f_Anf_anfNext) (s).f_Anf_anfLets) (s).f_Anf_anfExpr))) (((v_anf (fuel - 1)) next) dtb__41))
  | Ir_dModel.C_Ir_IrRtApp (dtb__43, dtb__44) -> (if (dtb__43 = "prim_erase") then (match dtb__44 with
  | B_dData_dList.C_List_Nil -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (((v_anf (fuel - 1)) next) ((v_applyIrs dtb__45) dtb__46))
  | _ -> failwith "DT: impossible branch"
) else ((fun p -> (((v_mkAnf (p).f_AnfList_anfLets) (Ir_dModel.C_Ir_IrRtApp (dtb__43, (p).f_AnfList_anfExprs))) (p).f_AnfList_anfNext)) (((v_anfList (fuel - 1)) next) dtb__44)))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun b -> ((fun p -> (((v_mkAnf ((B_dData_dList.v_append (b).f_Anf_anfLets) (p).f_AnfFields_anfLets)) (Ir_dModel.C_Ir_IrRecUpd ((b).f_Anf_anfExpr, dtb__48, (p).f_AnfFields_anfValues, dtb__50))) (p).f_AnfFields_anfNext)) (((v_anfFields (fuel - 1)) (b).f_Anf_anfNext) dtb__49))) (((v_anf (fuel - 1)) next) dtb__47))
  | Ir_dModel.C_Ir_IrRecord (dtb__51, dtb__52, dtb__53) -> ((fun p -> (((v_mkAnf (p).f_AnfFields_anfLets) (Ir_dModel.C_Ir_IrRecord (dtb__51, dtb__52, (p).f_AnfFields_anfValues))) (p).f_AnfFields_anfNext)) (((v_anfFields (fuel - 1)) next) dtb__53))
  | Ir_dModel.C_Ir_IrCtor (dtb__54, dtb__55, dtb__56, dtb__57) -> ((fun p -> (((v_mkAnf (p).f_AnfList_anfLets) (Ir_dModel.C_Ir_IrCtor (dtb__54, dtb__55, dtb__56, (p).f_AnfList_anfExprs))) (p).f_AnfList_anfNext)) (((v_anfList (fuel - 1)) next) dtb__57))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__58) -> ((fun p -> (((v_mkAnf (p).f_AnfList_anfLets) (Ir_dModel.C_Ir_IrConcatMany ((p).f_AnfList_anfExprs))) (p).f_AnfList_anfNext)) (((v_anfList (fuel - 1)) next) dtb__58))
  | Ir_dModel.C_Ir_IrProj (dtb__59, dtb__60, dtb__61, dtb__62) -> ((fun a -> (((v_mkAnf (a).f_Anf_anfLets) (Ir_dModel.C_Ir_IrProj ((a).f_Anf_anfExpr, dtb__60, dtb__61, dtb__62))) (a).f_Anf_anfNext)) (((v_anf (fuel - 1)) next) dtb__59))
  | Ir_dModel.C_Ir_IrCast (dtb__63, dtb__64, dtb__65) -> ((fun a -> (((v_mkAnf (a).f_Anf_anfLets) (Ir_dModel.C_Ir_IrCast (dtb__63, dtb__64, (a).f_Anf_anfExpr))) (a).f_Anf_anfNext)) (((v_anf (fuel - 1)) next) dtb__65))
  | Ir_dModel.C_Ir_IrLam (dtb__66, dtb__67, dtb__68) -> ((fun b -> (((v_mkAnf B_dData_dList.C_List_Nil) (Ir_dModel.C_Ir_IrLam (dtb__66, dtb__67, ((v_letsIn (b).f_Anf_anfLets) (b).f_Anf_anfExpr)))) (b).f_Anf_anfNext)) (((v_anf (fuel - 1)) next) dtb__68))
  | Ir_dModel.C_Ir_IrEffBind (dtb__69, dtb__70, dtb__71) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrFloatLit (dtb__72) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrBool (dtb__73) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrStr (dtb__74) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrInt (dtb__75) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrRt (dtb__76) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrGlobal (dtb__77) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | Ir_dModel.C_Ir_IrVar (dtb__78) -> (((v_mkAnf B_dData_dList.C_List_Nil) e) next)
  | _ -> failwith "DT: impossible branch"
)) e)))
# 183 "Vuna/Compiler/Ir/Anf.vuna"
and v_anfList = (fun (fuel : int) (next : int) (xs : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then { f_AnfList_anfLets = B_dData_dList.C_List_Nil; f_AnfList_anfExprs = xs; f_AnfList_anfNext = next } else (match xs with
  | B_dData_dList.C_List_Nil -> { f_AnfList_anfLets = B_dData_dList.C_List_Nil; f_AnfList_anfExprs = B_dData_dList.C_List_Nil; f_AnfList_anfNext = next }
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> ((fun a -> ((fun b -> ((fun r -> { f_AnfList_anfLets = ((B_dData_dList.v_append (b).f_Bound_boundLets) (r).f_AnfList_anfLets); f_AnfList_anfExprs = (B_dData_dList.C_List__x58__x58_ ((b).f_Bound_boundExpr, (r).f_AnfList_anfExprs)); f_AnfList_anfNext = (r).f_AnfList_anfNext }) (((v_anfList (fuel - 1)) (b).f_Bound_boundNext) dtb__80))) (((v_bindSimple (a).f_Anf_anfNext) (a).f_Anf_anfLets) (a).f_Anf_anfExpr))) (((v_anf (fuel - 1)) next) dtb__79))
  | _ -> failwith "DT: impossible branch"
)))
# 197 "Vuna/Compiler/Ir/Anf.vuna"
and v_anfFields = (fun (fuel : int) (next : int) (fields : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then { f_AnfFields_anfLets = B_dData_dList.C_List_Nil; f_AnfFields_anfValues = fields; f_AnfFields_anfNext = next } else (match fields with
  | B_dData_dList.C_List_Nil -> { f_AnfFields_anfLets = B_dData_dList.C_List_Nil; f_AnfFields_anfValues = B_dData_dList.C_List_Nil; f_AnfFields_anfNext = next }
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> ((fun a -> ((fun b -> ((fun r -> { f_AnfFields_anfLets = ((B_dData_dList.v_append (b).f_Bound_boundLets) (r).f_AnfFields_anfLets); f_AnfFields_anfValues = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__81); B_dData_dPair.f_Pair_second = (b).f_Bound_boundExpr }, (r).f_AnfFields_anfValues)); f_AnfFields_anfNext = (r).f_AnfFields_anfNext }) (((v_anfFields (fuel - 1)) (b).f_Bound_boundNext) dtb__82))) (((v_bindSimple (a).f_Anf_anfNext) (a).f_Anf_anfLets) (a).f_Anf_anfExpr))) (((v_anf (fuel - 1)) next) (B_dData_dPair.v_secondOf dtb__81)))
  | _ -> failwith "DT: impossible branch"
)))
# 211 "Vuna/Compiler/Ir/Anf.vuna"
and v_anfAlts = (fun (fuel : int) (next : int) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then { f_AnfAlts_anfAlts = alts; f_AnfAlts_anfNext = next } else (match alts with
  | B_dData_dList.C_List_Nil -> { f_AnfAlts_anfAlts = B_dData_dList.C_List_Nil; f_AnfAlts_anfNext = next }
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> ((fun b -> ((fun r -> { f_AnfAlts_anfAlts = (B_dData_dList.C_List__x58__x58_ ({ Ir_dModel.f_IrAlt_irAltCtor = (dtb__83).Ir_dModel.f_IrAlt_irAltCtor; Ir_dModel.f_IrAlt_irAltBinders = (dtb__83).Ir_dModel.f_IrAlt_irAltBinders; Ir_dModel.f_IrAlt_irAltBody = ((v_letsIn (b).f_Anf_anfLets) (b).f_Anf_anfExpr) }, (r).f_AnfAlts_anfAlts)); f_AnfAlts_anfNext = (r).f_AnfAlts_anfNext }) (((v_anfAlts (fuel - 1)) (b).f_Anf_anfNext) dtb__84))) (((v_anf (fuel - 1)) next) (dtb__83).Ir_dModel.f_IrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Compiler/Ir/Anf.vuna"
and v_anfAltMaybe = (fun (fuel : int) (next : int) (m : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then { f_AnfAltM_anfAltM = m; f_AnfAltM_anfNext = next } else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_AnfAltM_anfAltM = B_dData_dMaybe.C_Maybe_Nothing; f_AnfAltM_anfNext = next }
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> ((fun b -> { f_AnfAltM_anfAltM = (B_dData_dMaybe.C_Maybe_Just ({ Ir_dModel.f_IrAlt_irAltCtor = (dtb__85).Ir_dModel.f_IrAlt_irAltCtor; Ir_dModel.f_IrAlt_irAltBinders = (dtb__85).Ir_dModel.f_IrAlt_irAltBinders; Ir_dModel.f_IrAlt_irAltBody = ((v_letsIn (b).f_Anf_anfLets) (b).f_Anf_anfExpr) })); f_AnfAltM_anfNext = (b).f_Anf_anfNext }) (((v_anf (fuel - 1)) next) (dtb__85).Ir_dModel.f_IrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 272 "Vuna/Compiler/Ir/Anf.vuna"
let v_isAnfBinder = (fun (b : Ir_dModel.t_IrBinder) -> (match (b).Ir_dModel.f_IrBinder_irBinderName with
  | Ir_dModel.C_IrBName_IrBUser (dtb__86) -> ((B_dData_dString.v_startsWith "__anf") dtb__86)
  | _ -> false
))

# 268 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_countBs = (fun (mc0 : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> ((if (v_isAnfBinder dtb__87) then 1 else 0) + (v_countBs dtb__88))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_countAnfBinders = (fun (fuel : int) (e : Ir_dModel.t_Ir) -> (if (fuel <= 0) then 0 else (match e with
  | Ir_dModel.C_Ir_IrVar (dtb__89) -> 0
  | Ir_dModel.C_Ir_IrGlobal (dtb__90) -> 0
  | Ir_dModel.C_Ir_IrRt (dtb__91) -> 0
  | Ir_dModel.C_Ir_IrInt (dtb__92) -> 0
  | Ir_dModel.C_Ir_IrStr (dtb__93) -> 0
  | Ir_dModel.C_Ir_IrBool (dtb__94) -> 0
  | Ir_dModel.C_Ir_IrFloatLit (dtb__95) -> 0
  | Ir_dModel.C_Ir_IrCtor (dtb__96, dtb__97, dtb__98, dtb__99) -> ((v_countAnfList (fuel - 1)) dtb__99)
  | Ir_dModel.C_Ir_IrRecord (dtb__100, dtb__101, dtb__102) -> ((v_countAnfFields (fuel - 1)) dtb__102)
  | Ir_dModel.C_Ir_IrProj (dtb__103, dtb__104, dtb__105, dtb__106) -> ((v_countAnfBinders (fuel - 1)) dtb__103)
  | Ir_dModel.C_Ir_IrRecUpd (dtb__107, dtb__108, dtb__109, dtb__110) -> (((v_countAnfBinders (fuel - 1)) dtb__107) + ((v_countAnfFields (fuel - 1)) dtb__109))
  | Ir_dModel.C_Ir_IrRtApp (dtb__111, dtb__112) -> ((v_countAnfList (fuel - 1)) dtb__112)
  | Ir_dModel.C_Ir_IrCast (dtb__113, dtb__114, dtb__115) -> ((v_countAnfBinders (fuel - 1)) dtb__115)
  | Ir_dModel.C_Ir_IrLet (dtb__116, dtb__117, dtb__118) -> (((v_countBs dtb__116) + ((v_countAnfBinders (fuel - 1)) dtb__117)) + ((v_countAnfBinders (fuel - 1)) dtb__118))
  | Ir_dModel.C_Ir_IrLam (dtb__119, dtb__120, dtb__121) -> ((v_countBs dtb__119) + ((v_countAnfBinders (fuel - 1)) dtb__121))
  | Ir_dModel.C_Ir_IrApp (dtb__122, dtb__123, dtb__124) -> (((v_countAnfBinders (fuel - 1)) dtb__123) + ((v_countAnfBinders (fuel - 1)) dtb__124))
  | Ir_dModel.C_Ir_IrIf (dtb__125, dtb__126, dtb__127) -> ((((v_countAnfBinders (fuel - 1)) dtb__125) + ((v_countAnfBinders (fuel - 1)) dtb__126)) + ((v_countAnfBinders (fuel - 1)) dtb__127))
  | Ir_dModel.C_Ir_IrCase (dtb__128, dtb__129, dtb__130, dtb__131) -> (((v_countAnfBinders (fuel - 1)) dtb__130) + ((v_countAnfAlts (fuel - 1)) dtb__131))
  | Ir_dModel.C_Ir_IrNatCase (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (((((v_countAnfBinders (fuel - 1)) dtb__132) + ((v_countAltM (fuel - 1)) dtb__134)) + ((v_countAltM (fuel - 1)) dtb__135)) + ((v_countAltM (fuel - 1)) dtb__136))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__137) -> ((v_countAnfList (fuel - 1)) dtb__137)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_countAnfBinders (fuel - 1)) dtb__142)
  | Ir_dModel.C_Ir_IrTail (dtb__143) -> ((v_countAnfBinders (fuel - 1)) dtb__143)
  | Ir_dModel.C_Ir_IrEffBind (dtb__144, dtb__145, dtb__146) -> 0
  | _ -> failwith "DT: impossible branch"
)))
# 278 "Vuna/Compiler/Ir/Anf.vuna"
and v_countAnfList = (fun (fuel : int) (xs : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (((v_countAnfBinders (fuel - 1)) dtb__147) + ((v_countAnfList (fuel - 1)) dtb__148))
  | _ -> failwith "DT: impossible branch"
)))
# 287 "Vuna/Compiler/Ir/Anf.vuna"
and v_countAnfFields = (fun (fuel : int) (xs : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (((v_countAnfBinders (fuel - 1)) (B_dData_dPair.v_secondOf dtb__149)) + ((v_countAnfFields (fuel - 1)) dtb__150))
  | _ -> failwith "DT: impossible branch"
)))
# 296 "Vuna/Compiler/Ir/Anf.vuna"
and v_countAnfAlts = (fun (fuel : int) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match alts with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (((v_countBs (dtb__151).Ir_dModel.f_IrAlt_irAltBinders) + ((v_countAnfBinders (fuel - 1)) (dtb__151).Ir_dModel.f_IrAlt_irAltBody)) + ((v_countAnfAlts (fuel - 1)) dtb__152))
  | _ -> failwith "DT: impossible branch"
)))
# 305 "Vuna/Compiler/Ir/Anf.vuna"
and v_countAltM = (fun (fuel : int) (m : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then 0 else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> ((v_countBs (dtb__153).Ir_dModel.f_IrAlt_irAltBinders) + ((v_countAnfBinders (fuel - 1)) (dtb__153).Ir_dModel.f_IrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 314 "Vuna/Compiler/Ir/Anf.vuna"
let v_anfDef = (fun (mc0 : int) (mc1 : Ir_dModel.t_IrDef) -> (match mc1 with
  | Ir_dModel.C_IrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> ((fun b -> (Ir_dModel.C_IrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, ((v_letsIn (b).f_Anf_anfLets) (b).f_Anf_anfExpr), dtb__159, dtb__160, dtb__161))) (((v_anf (mc0 - 1)) (mc0 + ((v_countAnfBinders (mc0 - 1)) dtb__158))) dtb__158))
  | Ir_dModel.C_IrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_anfDefs = (fun (fuel : int) (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then defs else (match defs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (B_dData_dList.C_List__x58__x58_ (((v_anfDef (fuel - 1)) dtb__166), ((v_anfDefs (fuel - 1)) dtb__167)))
  | _ -> failwith "DT: impossible branch"
)))

# 345 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_defsSize = (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match (Ir_dModel.v_irDefBody dtb__168) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (1 + (v_defsSize dtb__169))
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> ((1 + (Ir_dModel.v_irSize dtb__170)) + (v_defsSize dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Ir/Anf.vuna"
let v_anfFuelFor = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (64 + (8 * (v_defsSize defs))))

# 330 "Vuna/Compiler/Ir/Anf.vuna"
let v_anfGroup = (fun (g : Ir_dModel.t_IrGroup) -> { Ir_dModel.f_IrGroup_irGroupIsRec = (g).Ir_dModel.f_IrGroup_irGroupIsRec; Ir_dModel.f_IrGroup_irGroupDefs = ((v_anfDefs (v_anfFuelFor (g).Ir_dModel.f_IrGroup_irGroupDefs)) (g).Ir_dModel.f_IrGroup_irGroupDefs) })

# 333 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_anfGroupsList = (fun (mc0 : Ir_dModel.t_IrGroup B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (B_dData_dList.C_List__x58__x58_ ((v_anfGroup dtb__171), (v_anfGroupsList dtb__172)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Anf.vuna"
let v_anfGroups = (fun (groups : Ir_dModel.t_IrGroup B_dData_dList.t_List) -> (v_anfGroupsList groups))

# 352 "Vuna/Compiler/Ir/Anf.vuna"
let v_anfProgramDefs = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (B_dData_dResult.C_Result_Ok (((v_anfDefs (v_anfFuelFor defs)) defs))))
