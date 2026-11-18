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
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__0, dtb__1) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr dtb__0))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 61 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dapplyIrs = (fun f xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> f
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (f, dtb__2))) dtb__3)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disSimple = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__4, dtb__5, dtb__6) -> (match dtb__6 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__7) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__8) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__9) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__10) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__11) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__12) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__13) -> true
  | _ -> false
))

# 78 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dfreshBinder = (fun n -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder ("__anf" ^ (bi_strFromInt n))))

# 81 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dbindSimple = (fun next lets e -> (if (v_Vuna_dCompiler_dIr_dAnf_disSimple e) then { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = lets; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = e; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = next } else ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = ((Base_dData_dList.v_Base_dData_dList_dappend lets) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = b; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e }, Base_dData_dList.C_Base_dData_dList_dList_Nil))); f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (b)); f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = (next + 1) }) (v_Vuna_dCompiler_dIr_dAnf_dfreshBinder next))))

# 90 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dletsIn = (fun (mc0 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__14), Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__14), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn dtb__15) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danf = (fun fuel next e -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__16, dtb__17, dtb__18, dtb__19, (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__20))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> ((fun s -> ((fun z -> ((fun su -> ((fun ca -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__22, (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM))) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__25))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__24))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__23))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__21))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__26, dtb__27) -> ((fun s -> ((fun alts1 -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts))) (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__27))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__26))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__28, dtb__29, dtb__30) -> ((fun ca -> ((fun ta -> ((fun ea -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__30))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__29))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__28))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__31, dtb__32) -> (match dtb__31 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__33) -> (if (dtb__33 = "prim_erase") then (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__32) else ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e)))
  | _ -> ((fun p -> ((fun h -> ((fun xs -> ((fun bf -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (xs).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (h).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) (v_Vuna_dCompiler_dIr_dAnf_dspineOfIr e))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__34, dtb__35, dtb__36) -> ((fun s -> ((fun bScrut -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__34, (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__36))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__35))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__37, dtb__38) -> (if (dtb__37 = "prim_erase") then (match dtb__38 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) ((v_Vuna_dCompiler_dIr_dAnf_dapplyIrs dtb__39) dtb__40))
  | _ -> failwith "DT: impossible branch"
) else ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__37, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__38)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__41, dtb__42, dtb__43) -> ((fun b -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__42, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__43))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__41))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__44, dtb__45) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__44, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) next) dtb__45))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__46, dtb__47, dtb__48) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__46, dtb__47, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__48))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__49) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__49))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__50, dtb__51, dtb__52) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__51, dtb__52))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__50))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__53, dtb__54, dtb__55) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__53, dtb__54, (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__55))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__56, dtb__57, dtb__58) -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__56, dtb__57, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__58))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__59, dtb__60, dtb__61) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__62) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__63) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__64) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__65) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__66) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__67) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__68) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | _ -> failwith "DT: impossible branch"
)) e)))
# 184 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfList = (fun fuel next xs -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = xs; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next } else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__69, dtb__70) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__70))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__69))
  | _ -> failwith "DT: impossible branch"
)))
# 198 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfFields = (fun fuel next fields -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = fields; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next } else (match fields with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__71); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues)); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__72))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__71)))
  | _ -> failwith "DT: impossible branch"
)))
# 212 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAlts = (fun fuel next alts -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = alts; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next } else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__73, dtb__74) -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__73).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__73).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts)); f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__74))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__73).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))
# 225 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe = (fun fuel next m -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = m; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next } else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__75) -> ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__75).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__75).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) })); f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__75).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 272 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disAnfBinder = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__76) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__anf") dtb__76)
  | _ -> false
))

# 268 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountBs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> ((if (v_Vuna_dCompiler_dIr_dAnf_disAnfBinder dtb__77) then 1 else 0) + (v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__78))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders = (fun fuel e -> (if (fuel <= 0) then 0 else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__79) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__80) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__81) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__82) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__83) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__84) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__85) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__86, dtb__87, dtb__88) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__88)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__89, dtb__90) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__90)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__91, dtb__92, dtb__93) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__91)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__94, dtb__95, dtb__96) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__94) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__96))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__97, dtb__98) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__98)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__99, dtb__100, dtb__101) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__101)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__102, dtb__103, dtb__104) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__102) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__103)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__104))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__105, dtb__106, dtb__107) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__105) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__107))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__108, dtb__109) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__108) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__109))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__110, dtb__111, dtb__112) -> ((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__110) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__111)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__112))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__113, dtb__114) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__113) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__114))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> (((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__115) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__117)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__118)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__119))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__120) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__120)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__125)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__126, dtb__127, dtb__128) -> 0
  | _ -> failwith "DT: impossible branch"
)))
# 278 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfList = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__129) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__130))
  | _ -> failwith "DT: impossible branch"
)))
# 287 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, dtb__132) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__131)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__132))
  | _ -> failwith "DT: impossible branch"
)))
# 296 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts = (fun fuel alts -> (if (fuel <= 0) then 0 else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__133).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__133).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__134))
  | _ -> failwith "DT: impossible branch"
)))
# 305 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAltM = (fun fuel m -> (if (fuel <= 0) then 0 else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__135) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__135).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__135).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 314 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfDef = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> ((fun b -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__136, dtb__137, dtb__138, dtb__139, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), dtb__141, dtb__142, dtb__143))) (((v_Vuna_dCompiler_dIr_dAnf_danf (mc0 - 1)) (mc0 + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (mc0 - 1)) dtb__140))) dtb__140))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__144, dtb__145, dtb__146, dtb__147) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfDefs = (fun fuel defs -> (if (fuel <= 0) then defs else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnf_danfDef (fuel - 1)) dtb__148), ((v_Vuna_dCompiler_dIr_dAnf_danfDefs (fuel - 1)) dtb__149)))
  | _ -> failwith "DT: impossible branch"
)))

# 330 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroup = (fun g -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 333 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfGroupsList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dAnf_danfGroup dtb__150), (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList dtb__151)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroups = (fun groups -> (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList groups))

# 340 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfProgramDefs = (fun defs -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) defs))))
