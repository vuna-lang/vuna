open Vuna_runtime
type t_Vuna_dCompiler_dIr_dAnf_dAnf = { f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dBound = { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfList = { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfFields = { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfAlts = { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfAltM = { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext : int }

# 25 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dmkAnf = (fun (lets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (n : int) -> { f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets = lets; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr = e; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext = n })

# 51 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dspineOfIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__0, dtb__1, dtb__2) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr dtb__1))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 58 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dapplyIrs = (fun (f : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> f
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f, dtb__3))) dtb__4)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disSimple = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__5, dtb__6, dtb__7, dtb__8) -> (match dtb__8 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__9) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__10) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__11) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__12) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__13) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__14) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__15) -> true
  | _ -> false
))

# 75 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dfreshBinder = (fun (n : int) -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder ("__anf" ^ (bi_strFromInt n))))

# 78 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dbindSimple = (fun (next : int) (lets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (v_Vuna_dCompiler_dIr_dAnf_disSimple e) then { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = lets; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = e; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = next } else ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = ((Base_dData_dList.v_Base_dData_dList_dappend lets) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = b; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e }, Base_dData_dList.C_Base_dData_dList_dList_Nil))); f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (b)); f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = (next + 1) }) (v_Vuna_dCompiler_dIr_dAnf_dfreshBinder next))))

# 87 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dletsIn = (fun (mc0 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__16), Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__16), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn dtb__17) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danf = (fun (fuel : int) (next : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__18) -> (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__18)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__19, dtb__20, dtb__21, dtb__22, (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__23))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> ((fun s -> ((fun z -> ((fun su -> ((fun ca -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__25, (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM))) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__28))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__27))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__26))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__24))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__29, dtb__30, dtb__31, dtb__32) -> ((fun s -> ((fun alts1 -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__29, dtb__30, (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts))) (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__32))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__31))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__33, dtb__34, dtb__35) -> ((fun ca -> ((fun ta -> ((fun ea -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__35))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__34))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__33))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__36, dtb__37, dtb__38) -> (match dtb__37 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__39) -> (if (dtb__39 = "prim_erase") then (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__38) else ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e)))
  | _ -> ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__40, dtb__41, dtb__42) -> ((fun s -> ((fun bScrut -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__40, (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__42))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__41))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__43, dtb__44) -> (if (dtb__43 = "prim_erase") then (match dtb__44 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__45, dtb__46) -> (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs dtb__45) dtb__46))
  | _ -> failwith "DT: impossible branch"
) else ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__43, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__44)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun b -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__48, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues, dtb__50))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__49))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__47))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__51, dtb__52, dtb__53) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__51, dtb__52, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) next) dtb__53))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__54, dtb__55, dtb__56, dtb__57) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__54, dtb__55, dtb__56, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__57))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__58) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__58))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__59, dtb__60, dtb__61, dtb__62) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__60, dtb__61, dtb__62))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__59))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__63, dtb__64, dtb__65) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__63, dtb__64, (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__65))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__66, dtb__67, dtb__68) -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__66, dtb__67, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__68))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__69, dtb__70, dtb__71) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__72) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__73) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__74) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__75) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__76) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__77) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__78) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | _ -> failwith "DT: impossible branch"
)) e)))
# 183 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfList = (fun (fuel : int) (next : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = xs; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next } else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__80))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__79))
  | _ -> failwith "DT: impossible branch"
)))
# 197 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfFields = (fun (fuel : int) (next : int) (fields : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = fields; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next } else (match fields with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__81); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues)); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__82))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__81)))
  | _ -> failwith "DT: impossible branch"
)))
# 211 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAlts = (fun (fuel : int) (next : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = alts; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next } else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__83).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__83).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts)); f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__84))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__83).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe = (fun (fuel : int) (next : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = m; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next } else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__85) -> ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__85).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__85).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) })); f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__85).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 272 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disAnfBinder = (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__86) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__anf") dtb__86)
  | _ -> false
))

# 268 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountBs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> ((if (v_Vuna_dCompiler_dIr_dAnf_disAnfBinder dtb__87) then 1 else 0) + (v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__88))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then 0 else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__89) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__90) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__91) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__92) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__93) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__94) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__95) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__96, dtb__97, dtb__98, dtb__99) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__99)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__100, dtb__101, dtb__102) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__102)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__103, dtb__104, dtb__105, dtb__106) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__103)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__107, dtb__108, dtb__109, dtb__110) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__107) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__109))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__111, dtb__112) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__112)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__113, dtb__114, dtb__115) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__115)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__116, dtb__117, dtb__118) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__116) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__117)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__118))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__119, dtb__120, dtb__121) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__119) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__121))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__122, dtb__123, dtb__124) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__123) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__124))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__125, dtb__126, dtb__127) -> ((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__125) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__126)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__127))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__128, dtb__129, dtb__130, dtb__131) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__130) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__131))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__132) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__134)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__135)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__136))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__137) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__137)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__142)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__143) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__143)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__144, dtb__145, dtb__146) -> 0
  | _ -> failwith "DT: impossible branch"
)))
# 278 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__147) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__148))
  | _ -> failwith "DT: impossible branch"
)))
# 287 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields = (fun (fuel : int) (xs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__149)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__150))
  | _ -> failwith "DT: impossible branch"
)))
# 296 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then 0 else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__151).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__151).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__152))
  | _ -> failwith "DT: impossible branch"
)))
# 305 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then 0 else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__153).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__153).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 314 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfDef = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> ((fun b -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), dtb__159, dtb__160, dtb__161))) (((v_Vuna_dCompiler_dIr_dAnf_danf (mc0 - 1)) (mc0 + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (mc0 - 1)) dtb__158))) dtb__158))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfDefs = (fun (fuel : int) (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then defs else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnf_danfDef (fuel - 1)) dtb__166), ((v_Vuna_dCompiler_dIr_dAnf_danfDefs (fuel - 1)) dtb__167)))
  | _ -> failwith "DT: impossible branch"
)))

# 345 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_ddefsSize = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__168) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (1 + (v_Vuna_dCompiler_dIr_dAnf_ddefsSize dtb__169))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__170) -> ((1 + (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize dtb__170)) + (v_Vuna_dCompiler_dIr_dAnf_ddefsSize dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfFuelFor = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (64 + (8 * (v_Vuna_dCompiler_dIr_dAnf_ddefsSize defs))))

# 330 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroup = (fun (g : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((v_Vuna_dCompiler_dIr_dAnf_danfDefs (v_Vuna_dCompiler_dIr_dAnf_danfFuelFor (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 333 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfGroupsList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__171, dtb__172) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dAnf_danfGroup dtb__171), (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList dtb__172)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroups = (fun (groups : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList groups))

# 352 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfProgramDefs = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dAnf_danfDefs (v_Vuna_dCompiler_dIr_dAnf_danfFuelFor defs)) defs))))
