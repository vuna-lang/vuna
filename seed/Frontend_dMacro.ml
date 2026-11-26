open Vuna_runtime
type t_MacroCall = { f_MacroCall_macroCallName : string; f_MacroCall_macroCallArity : int; f_MacroCall_macroCallRef : Frontend_dAst.t_NodeRef }

# 25 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallSpan = (fun (c : t_MacroCall) -> (Frontend_dAst.v_nodeRefSpan (c).f_MacroCall_macroCallRef))

# 29 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallSynthId = (fun (c : t_MacroCall) -> (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_synthRefAt (v_macroCallSpan c))))

# 37 "Vuna/Compiler/Frontend/Macro.vuna"
let rec v_callsGo = (fun (mc0 : Frontend_dCst.t_CstNode) (mc1 : t_MacroCall B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dCst.C_CstNode_CstBranch (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (let acc1 = (let nd_uscrut8 = dtb__4 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (match dtb__6 with
  | Frontend_dCst.C_CstSem_SemMacro (dtb__7, dtb__8) -> (B_dData_dList.C_List__x58__x58_ ({ f_MacroCall_macroCallName = dtb__7; f_MacroCall_macroCallArity = dtb__8; f_MacroCall_macroCallRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb__1; Frontend_dAst.f_NodeRef_nodeRefSpan = dtb__2 } }, mc1))
  | _ -> mc1
)
  | _ -> mc1
)) in ((v_callsGoList (dtb__3).Frontend_dCst.f_CstSurface_cstHoleTrees) ((v_callsGoList dtb__5) acc1)))
  | Frontend_dCst.C_CstNode_CstLeaf (dtb__9) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 47 "Vuna/Compiler/Frontend/Macro.vuna"
and v_callsGoList = (fun (mc0 : Frontend_dCst.t_CstNode B_dData_dList.t_List) (mc1 : t_MacroCall B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> ((v_callsGoList dtb__11) ((v_callsGo dtb__10) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Frontend/Macro.vuna"
let[@tail_mod_cons] rec v_insertCall = (fun (mc0 : t_MacroCall) (mc1 : t_MacroCall B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if ((Base_dSource.v_spanStartOffset (v_macroCallSpan mc0)) <= (Base_dSource.v_spanStartOffset (v_macroCallSpan dtb__12))) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13)))) else (B_dData_dList.C_List__x58__x58_ (dtb__12, ((v_insertCall mc0) dtb__13))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Macro.vuna"
let rec v_sortCalls = (fun (mc0 : t_MacroCall B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> ((v_insertCall dtb__14) (v_sortCalls dtb__15))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallsOf = (fun (tree : Frontend_dCst.t_CstNode) -> (v_sortCalls ((v_callsGo tree) B_dData_dList.C_List_Nil)))

# 20 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallName = (fun (p : t_MacroCall) -> (match p with
  | { f_MacroCall_macroCallName = dtb__16; f_MacroCall_macroCallArity = dtb__17; f_MacroCall_macroCallRef = dtb__18 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallArity = (fun (p : t_MacroCall) -> (match p with
  | { f_MacroCall_macroCallName = dtb__19; f_MacroCall_macroCallArity = dtb__20; f_MacroCall_macroCallRef = dtb__21 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Frontend/Macro.vuna"
let v_macroCallRef = (fun (p : t_MacroCall) -> (match p with
  | { f_MacroCall_macroCallName = dtb__22; f_MacroCall_macroCallArity = dtb__23; f_MacroCall_macroCallRef = dtb__24 } -> dtb__24
  | _ -> failwith "DT: impossible branch"
))
