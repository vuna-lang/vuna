open Vuna_runtime
type t_Vuna_dCompiler_dIr_dAnf_dAnf = { f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dBound = { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfList = { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfFields = { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfAlts = { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext : int }
and t_Vuna_dCompiler_dIr_dAnf_dAnfAltM = { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext : int }

# 20 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dstartFuel = 200000

# 28 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dmkAnf = (fun lets e n -> { f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets = lets; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr = e; f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext = n })

# 54 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dspineOfIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__0, dtb__1, dtb__2) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr dtb__1))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 61 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dapplyIrs = (fun f xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> f
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f, dtb__3))) dtb__4)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Ir/Anf.vuna"
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

# 78 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dfreshBinder = (fun n -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder ("__anf" ^ (bi_strFromInt n))))

# 81 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dbindSimple = (fun next lets e -> (if (v_Vuna_dCompiler_dIr_dAnf_disSimple e) then { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = lets; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = e; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = next } else ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = ((Base_dData_dList.v_Base_dData_dList_dappend lets) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = b; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e }, Base_dData_dList.C_Base_dData_dList_dList_Nil))); f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (b)); f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = (next + 1) }) (v_Vuna_dCompiler_dIr_dAnf_dfreshBinder next))))

# 90 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dletsIn = (fun (mc0 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__16), Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__16), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn dtb__17) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danf = (fun fuel next e -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__18, dtb__19, dtb__20, dtb__21, (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__22))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> ((fun s -> ((fun z -> ((fun su -> ((fun ca -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__24, (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM))) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__27))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__26))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__25))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__23))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__28, dtb__29, dtb__30) -> ((fun s -> ((fun alts1 -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__28, (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts))) (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__30))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__29))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__31, dtb__32, dtb__33) -> ((fun ca -> ((fun ta -> ((fun ea -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__33))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__32))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__31))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__34, dtb__35, dtb__36) -> (match dtb__35 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__37) -> (if (dtb__37 = "prim_erase") then (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__36) else ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e)))
  | _ -> ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__38, dtb__39, dtb__40) -> ((fun s -> ((fun bScrut -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__38, (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__40))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__39))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__41, dtb__42) -> (if (dtb__41 = "prim_erase") then (match dtb__42 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs dtb__43) dtb__44))
  | _ -> failwith "DT: impossible branch"
) else ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__41, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__42)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__45, dtb__46, dtb__47) -> ((fun b -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__46, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__47))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__45))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__48, dtb__49) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__48, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) next) dtb__49))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__50, dtb__51, dtb__52, dtb__53) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__50, dtb__51, dtb__52, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__53))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__54) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__54))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__55, dtb__56, dtb__57) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__56, dtb__57))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__55))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__58, dtb__59, dtb__60) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__58, dtb__59, (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__60))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__61, dtb__62, dtb__63) -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__61, dtb__62, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__63))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__64, dtb__65, dtb__66) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__67) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__68) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__69) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__70) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__71) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__73) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | _ -> failwith "DT: impossible branch"
)) e)))
# 184 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfList = (fun fuel next xs -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = xs; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next } else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__75))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__74))
  | _ -> failwith "DT: impossible branch"
)))
# 198 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfFields = (fun fuel next fields -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = fields; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next } else (match fields with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__76); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues)); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__77))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__76)))
  | _ -> failwith "DT: impossible branch"
)))
# 212 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAlts = (fun fuel next alts -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = alts; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next } else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__78).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__78).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts)); f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__79))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__78).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))
# 225 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe = (fun fuel next m -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = m; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next } else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__80) -> ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__80).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__80).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) })); f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__80).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 272 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disAnfBinder = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__81) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__anf") dtb__81)
  | _ -> false
))

# 268 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountBs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> ((if (v_Vuna_dCompiler_dIr_dAnf_disAnfBinder dtb__82) then 1 else 0) + (v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__83))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders = (fun fuel e -> (if (fuel <= 0) then 0 else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__84) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__85) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__86) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__87) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__88) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__89) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__90) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__91, dtb__92, dtb__93, dtb__94) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__94)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__95, dtb__96) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__96)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__97, dtb__98, dtb__99) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__97)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__100, dtb__101, dtb__102) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__100) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__102))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__103, dtb__104) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__104)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__105, dtb__106, dtb__107) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__107)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__108, dtb__109, dtb__110) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__108) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__109)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__110))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__111, dtb__112, dtb__113) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__111) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__113))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__114, dtb__115, dtb__116) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__115) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__116))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__117, dtb__118, dtb__119) -> ((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__117) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__118)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__119))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__120, dtb__121, dtb__122) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__121) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__122))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> (((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__123) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__125)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__126)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__127))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__128) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__128)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__133)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__134, dtb__135, dtb__136) -> 0
  | _ -> failwith "DT: impossible branch"
)))
# 278 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfList = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__137) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__138))
  | _ -> failwith "DT: impossible branch"
)))
# 287 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__139)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__140))
  | _ -> failwith "DT: impossible branch"
)))
# 296 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts = (fun fuel alts -> (if (fuel <= 0) then 0 else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__141).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__141).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__142))
  | _ -> failwith "DT: impossible branch"
)))
# 305 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAltM = (fun fuel m -> (if (fuel <= 0) then 0 else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__143) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__143).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__143).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 314 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfDef = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> ((fun b -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__144, dtb__145, dtb__146, dtb__147, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), dtb__149, dtb__150, dtb__151))) (((v_Vuna_dCompiler_dIr_dAnf_danf (mc0 - 1)) (mc0 + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (mc0 - 1)) dtb__148))) dtb__148))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__152, dtb__153, dtb__154, dtb__155) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfDefs = (fun fuel defs -> (if (fuel <= 0) then defs else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnf_danfDef (fuel - 1)) dtb__156), ((v_Vuna_dCompiler_dIr_dAnf_danfDefs (fuel - 1)) dtb__157)))
  | _ -> failwith "DT: impossible branch"
)))

# 330 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroup = (fun g -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 333 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfGroupsList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dAnf_danfGroup dtb__158), (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList dtb__159)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroups = (fun groups -> (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList groups))

# 340 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfProgramDefs = (fun defs -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) defs))))
