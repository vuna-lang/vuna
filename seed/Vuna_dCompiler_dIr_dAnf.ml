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
let v_Vuna_dCompiler_dIr_dAnf_disSimple = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__0, dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__3) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__4) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__5) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__6) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__7) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__8) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__9) -> true
  | _ -> false
))

# 65 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dfreshBinder = (fun n -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder ("__anf" ^ (bi_strFromInt n))))

# 68 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_dbindSimple = (fun next lets e -> (if (v_Vuna_dCompiler_dIr_dAnf_disSimple e) then { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = lets; f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = e; f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = next } else ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets = ((Base_dData_dList.v_Base_dData_dList_dappend lets) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = b; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e }, Base_dData_dList.C_Base_dData_dList_dList_Nil))); f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (b)); f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext = (next + 1) }) (v_Vuna_dCompiler_dIr_dAnf_dfreshBinder next))))

# 77 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dletsIn = (fun (mc0 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__10), Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__10), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn dtb__11) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danf = (fun fuel next e -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__12) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__13) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__14) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__15) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__16) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__17) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__18) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__19, dtb__20, dtb__21) -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) e) next)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__22, dtb__23) -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__22, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__23))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__24) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast ((a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__24))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__25, dtb__26, dtb__27) -> ((fun a -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__26, dtb__27))) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__25))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__28) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__28))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__29, dtb__30, dtb__31) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__29, dtb__30, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__31))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__32, dtb__33) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__32, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) next) dtb__33))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__34, dtb__35, dtb__36) -> ((fun b -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__35, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__36))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__34))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__37, dtb__38) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__37, (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) next) dtb__38))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__39, dtb__40, dtb__41) -> ((fun s -> ((fun bScrut -> ((fun b -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__39, (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (bScrut).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__41))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__40))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__42, dtb__43) -> ((fun fa -> ((fun aa -> ((fun bf -> ((fun ba -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (ba).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, (ba).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr))) (ba).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext)) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) (bf).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (aa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (aa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) ((Base_dData_dList.v_Base_dData_dList_dappend (fa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (aa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets)) (fa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (fa).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__43))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__42))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__44, dtb__45, dtb__46) -> ((fun ca -> ((fun ta -> ((fun ea -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr)))) (ea).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ta).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__46))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__45))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__44))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__47, dtb__48) -> ((fun s -> ((fun alts1 -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts))) (alts1).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__48))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__47))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> ((fun s -> ((fun z -> ((fun su -> ((fun ca -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr, dtb__50, (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM, (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM))) (ca).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (su).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__53))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (z).f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext) dtb__52))) (((v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe (fuel - 1)) (s).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__51))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__49))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> ((fun p -> (((v_Vuna_dCompiler_dIr_dAnf_dmkAnf (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__54, dtb__55, dtb__56, dtb__57, (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (p).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext)) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__58))
  | _ -> failwith "DT: impossible branch"
)))
# 164 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfList = (fun fuel next xs -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = xs; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next } else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfExprs)); f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfList_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfList (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__60))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) dtb__59))
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfFields = (fun fuel next fields -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = fields; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next } else (match fields with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> ((fun a -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets = ((Base_dData_dList.v_Base_dData_dList_dappend (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundLets) (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfLets); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__61); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundExpr }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfValues)); f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfFields_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfFields (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dBound_boundNext) dtb__62))) (((v_Vuna_dCompiler_dIr_dAnf_dbindSimple (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (a).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__61)))
  | _ -> failwith "DT: impossible branch"
)))
# 192 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAlts = (fun fuel next alts -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = alts; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next } else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = next }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> ((fun b -> ((fun r -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) }, (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfAlts)); f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext = (r).f_Vuna_dCompiler_dIr_dAnf_dAnfAlts_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danfAlts (fuel - 1)) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext) dtb__64))) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))
# 205 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_danfAltMaybe = (fun fuel next m -> (if (fuel <= 0) then { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = m; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next } else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = next }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__65) -> ((fun b -> { f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfAltM = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr) })); f_Vuna_dCompiler_dIr_dAnf_dAnfAltM_anfNext = (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfNext }) (((v_Vuna_dCompiler_dIr_dAnf_danf (fuel - 1)) next) (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 252 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_disAnfBinder = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__66) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__anf") dtb__66)
  | _ -> false
))

# 248 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountBs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, dtb__68) -> ((if (v_Vuna_dCompiler_dIr_dAnf_disAnfBinder dtb__67) then 1 else 0) + (v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__68))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders = (fun fuel e -> (if (fuel <= 0) then 0 else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__69) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__70) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__71) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__72) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__73) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__74) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__75) -> 0
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__76, dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__78)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__79, dtb__80) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__80)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__81, dtb__82, dtb__83) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__81)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__84, dtb__85, dtb__86) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__84) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__86))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__87, dtb__88) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__88)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__89) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__89)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__90, dtb__91, dtb__92) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__90) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__91)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__92))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__93, dtb__94) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs dtb__93) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__94))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__95, dtb__96) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__95) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__96))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__97, dtb__98, dtb__99) -> ((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__97) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__98)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__99))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__100, dtb__101) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__100) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__101))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (((((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__102) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__104)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__105)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAltM (fuel - 1)) dtb__106))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__107) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__107)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__112)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__113, dtb__114, dtb__115) -> 0
  | _ -> failwith "DT: impossible branch"
)))
# 258 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfList = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) dtb__116) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfList (fuel - 1)) dtb__117))
  | _ -> failwith "DT: impossible branch"
)))
# 267 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields = (fun fuel xs -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__118)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfFields (fuel - 1)) dtb__119))
  | _ -> failwith "DT: impossible branch"
)))
# 276 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts = (fun fuel alts -> (if (fuel <= 0) then 0 else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__120).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__120).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfAlts (fuel - 1)) dtb__121))
  | _ -> failwith "DT: impossible branch"
)))
# 285 "Vuna/Compiler/Ir/Anf.vuna"
and v_Vuna_dCompiler_dIr_dAnf_dcountAltM = (fun fuel m -> (if (fuel <= 0) then 0 else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__122) -> ((v_Vuna_dCompiler_dIr_dAnf_dcountBs (dtb__122).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (fuel - 1)) (dtb__122).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody))
  | _ -> failwith "DT: impossible branch"
)))

# 294 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfDef = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> ((fun b -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__123, dtb__124, dtb__125, ((v_Vuna_dCompiler_dIr_dAnf_dletsIn (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfLets) (b).f_Vuna_dCompiler_dIr_dAnf_dAnf_anfExpr), dtb__127, dtb__128, dtb__129))) (((v_Vuna_dCompiler_dIr_dAnf_danf (mc0 - 1)) (mc0 + ((v_Vuna_dCompiler_dIr_dAnf_dcountAnfBinders (mc0 - 1)) dtb__126))) dtb__126))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__130, dtb__131, dtb__132, dtb__133) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfDefs = (fun fuel defs -> (if (fuel <= 0) then defs else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnf_danfDef (fuel - 1)) dtb__134), ((v_Vuna_dCompiler_dIr_dAnf_danfDefs (fuel - 1)) dtb__135)))
  | _ -> failwith "DT: impossible branch"
)))

# 310 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroup = (fun g -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 313 "Vuna/Compiler/Ir/Anf.vuna"
let rec v_Vuna_dCompiler_dIr_dAnf_danfGroupsList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dAnf_danfGroup dtb__136), (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList dtb__137)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfGroups = (fun groups -> (v_Vuna_dCompiler_dIr_dAnf_danfGroupsList groups))

# 320 "Vuna/Compiler/Ir/Anf.vuna"
let v_Vuna_dCompiler_dIr_dAnf_danfProgramDefs = (fun defs -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dAnf_danfDefs v_Vuna_dCompiler_dIr_dAnf_dstartFuel) defs))))
