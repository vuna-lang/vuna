open Vuna_runtime
type t_IType = C_IType_ITy | C_IType_IInt | C_IType_IStr | C_IType_IBool | C_IType_INat | C_IType_IList of (t_IType) | C_IType_IEff of (t_IType) | C_IType_IEffHost of (t_IType) | C_IType_IFun of (t_IType) * (t_IType) | C_IType_IFun1 of (t_IType) * (t_IType) | C_IType_IVar of (string) | C_IType_IArray of (t_IType) | C_IType_ICell of (t_IType) | C_IType_IMArray of (t_IType) | C_IType_IMDynArray of (t_IType) | C_IType_IMBuffer | C_IType_IThread of (t_IType) | C_IType_IMutex | C_IType_ICondvar | C_IType_IAtomic | C_IType_IPi of (string) * (t_IType) | C_IType_IFloat | C_IType_IGlobal of (string)
and t_TypeIntrinsic = { f_TypeIntrinsic_typeIntrinsicCtorName : string; f_TypeIntrinsic_typeIntrinsicCtorArity : int }
and t_HostClass = C_HostClass_HostHandled | C_HostClass_HostDirect of (string) * (string) | C_HostClass_HostAbort of (string) * (string)
and t_BuiltinEffect = { f_BuiltinEffect_beTag : string; f_BuiltinEffect_beImpl : string; f_BuiltinEffect_beHost : t_HostClass; f_BuiltinEffect_beErrorImpl : string; f_BuiltinEffect_beErrorHost : t_HostClass }
and t_HostSupport = { f_HostSupport_hsTag : string; f_HostSupport_hsOcaml : string; f_HostSupport_hsNative : string; f_HostSupport_hsWasm : string }
and t_IntrinsicOp = C_IntrinsicOp_OpNone | C_IntrinsicOp_OpAdd | C_IntrinsicOp_OpSub | C_IntrinsicOp_OpMul | C_IntrinsicOp_OpDiv | C_IntrinsicOp_OpEqInt | C_IntrinsicOp_OpNeqInt | C_IntrinsicOp_OpLtInt | C_IntrinsicOp_OpLeInt | C_IntrinsicOp_OpGtInt | C_IntrinsicOp_OpGeInt | C_IntrinsicOp_OpEqStr | C_IntrinsicOp_OpNeqStr | C_IntrinsicOp_OpLtValue | C_IntrinsicOp_OpLeValue | C_IntrinsicOp_OpGtValue | C_IntrinsicOp_OpGeValue | C_IntrinsicOp_OpConcat | C_IntrinsicOp_OpAnd | C_IntrinsicOp_OpOr | C_IntrinsicOp_OpStrFromInt | C_IntrinsicOp_OpStrLength | C_IntrinsicOp_OpStrUnpack | C_IntrinsicOp_OpStrPack | C_IntrinsicOp_OpStrConcatMany | C_IntrinsicOp_OpStrSubstTemplate | C_IntrinsicOp_OpStrHash | C_IntrinsicOp_OpStrDispatchId | C_IntrinsicOp_OpStrAt | C_IntrinsicOp_OpStrSubstring | C_IntrinsicOp_OpStrShow | C_IntrinsicOp_OpNatAdd | C_IntrinsicOp_OpNatSub | C_IntrinsicOp_OpNatMul | C_IntrinsicOp_OpNatDiv | C_IntrinsicOp_OpNatToInt | C_IntrinsicOp_OpNatFromInt | C_IntrinsicOp_OpAddF | C_IntrinsicOp_OpSubF | C_IntrinsicOp_OpMulF | C_IntrinsicOp_OpDivF | C_IntrinsicOp_OpEqF | C_IntrinsicOp_OpNeqF | C_IntrinsicOp_OpLtF | C_IntrinsicOp_OpLeF | C_IntrinsicOp_OpGtF | C_IntrinsicOp_OpGeF | C_IntrinsicOp_OpFloatAbs | C_IntrinsicOp_OpFloatSqrt | C_IntrinsicOp_OpStrFromFloat | C_IntrinsicOp_OpFloatFromInt | C_IntrinsicOp_OpIntFromFloat | C_IntrinsicOp_OpIdentity | C_IntrinsicOp_OpBitAnd | C_IntrinsicOp_OpBitOr | C_IntrinsicOp_OpBitXor | C_IntrinsicOp_OpBitNot | C_IntrinsicOp_OpBitShl | C_IntrinsicOp_OpBitShr
and t_Intrinsic = { f_Intrinsic_intrinsicName : string; f_Intrinsic_intrinsicSignature : t_IType; f_Intrinsic_intrinsicOp : t_IntrinsicOp; f_Intrinsic_intrinsicVisible : bool }
and t_FamilyRepr = C_FamilyRepr_FamReprBool | C_FamilyRepr_FamReprNat | C_FamilyRepr_FamReprBoxed
and t_CanonicalFamily = { f_CanonicalFamily_cfName : string; f_CanonicalFamily_cfCtors : string B_dData_dList.t_List; f_CanonicalFamily_cfRepr : t_FamilyRepr }

# 71 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_arityOfType = (fun (mc0 : t_IType) -> (match mc0 with
  | C_IType_IPi (dtb__0, dtb__1) -> (v_arityOfType dtb__1)
  | C_IType_IFun1 (dtb__2, dtb__3) -> (1 + (v_arityOfType dtb__3))
  | C_IType_IFun (dtb__4, dtb__5) -> (1 + (v_arityOfType dtb__5))
  | _ -> 0
))

# 91 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicCtorName = (fun (mc0 : t_TypeIntrinsic) -> (match mc0 with
  | { f_TypeIntrinsic_typeIntrinsicCtorName = dtb__6; f_TypeIntrinsic_typeIntrinsicCtorArity = dtb__7 } -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicCtorArity = (fun (mc0 : t_TypeIntrinsic) -> (match mc0 with
  | { f_TypeIntrinsic_typeIntrinsicCtorName = dtb__8; f_TypeIntrinsic_typeIntrinsicCtorArity = dtb__9 } -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_arrayTypeName = "Array"

# 103 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_cellTypeName = "@vuna@Cell"

# 107 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_marrayTypeName = "@vuna@MArray"

# 111 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_mdynArrayTypeName = "@vuna@MDynArray"

# 115 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_mbufferTypeName = "@vuna@MBuffer"

# 119 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_threadTypeName = "Thread"

# 123 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_mutexTypeName = "Mutex"

# 127 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_condvarTypeName = "Condvar"

# 131 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_atomicTypeName = "Atomic"

# 135 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicArities = (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_arrayTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_cellTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_marrayTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_mdynArrayTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_mbufferTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_threadTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_mutexTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_condvarTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_TypeIntrinsic_typeIntrinsicCtorName = v_atomicTypeName; f_TypeIntrinsic_typeIntrinsicCtorArity = 0 }, B_dData_dList.C_List_Nil))))))))))))))))))

# 154 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_typeIntrinsicArityOfRest = (fun (mc0 : string) (mc1 : t_TypeIntrinsic B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if ((v_typeIntrinsicCtorName dtb__10) = mc0) then (v_typeIntrinsicCtorArity dtb__10) else ((v_typeIntrinsicArityOfRest mc0) dtb__11))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicArityOf = (fun (name : string) -> ((v_typeIntrinsicArityOfRest name) v_typeIntrinsicArities))

# 163 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicCtorNames = ((B_dData_dList.v_map v_typeIntrinsicCtorName) v_typeIntrinsicArities)

# 197 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_builtinEffects = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Console.ConsoleOp"; f_BuiltinEffect_beImpl = "Base.Effect.Console.runConsoleHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("console", "Base.Effect.Console.consoleOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Fs.FsOp"; f_BuiltinEffect_beImpl = "Base.Effect.Fs.runFsHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("fs", "Base.Effect.Fs.fsOpHIOHost")); f_BuiltinEffect_beErrorImpl = "Base.Effect.Fs.runFsErrorHost"; f_BuiltinEffect_beErrorHost = (C_HostClass_HostAbort ("fs-error", "Base.Effect.Fs.fsErrorText")) }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Clock.ClockOp"; f_BuiltinEffect_beImpl = "Base.Effect.Clock.runClockHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("clock", "Base.Effect.Clock.clockOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Env.EnvOp"; f_BuiltinEffect_beImpl = "Base.Effect.Env.runEnvHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("env", "Base.Effect.Env.envOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Process.ProcessOp"; f_BuiltinEffect_beImpl = "Base.Effect.Process.runProcessHost"; f_BuiltinEffect_beHost = C_HostClass_HostHandled; f_BuiltinEffect_beErrorImpl = "Base.Effect.Process.runProcessErrorHost"; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Exit.ExitOp"; f_BuiltinEffect_beImpl = "Base.Effect.Exit.runExitHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("exit", "Base.Effect.Exit.exitOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Stdin.StdinOp"; f_BuiltinEffect_beImpl = "Base.Effect.Stdin.runStdinHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("stdin", "Base.Effect.Stdin.stdinOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Args.ArgsOp"; f_BuiltinEffect_beImpl = "Base.Effect.Args.runArgsHost"; f_BuiltinEffect_beHost = (C_HostClass_HostDirect ("args", "Base.Effect.Args.argsOpHIOHost")); f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Tty.TtyOp"; f_BuiltinEffect_beImpl = "Base.Effect.Tty.runTtyHost"; f_BuiltinEffect_beHost = C_HostClass_HostHandled; f_BuiltinEffect_beErrorImpl = ""; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinEffect_beTag = "Base.Effect.Net.NetOp"; f_BuiltinEffect_beImpl = "Base.Effect.Net.runNetHost"; f_BuiltinEffect_beHost = C_HostClass_HostHandled; f_BuiltinEffect_beErrorImpl = "Base.Effect.Net.runNetErrorHost"; f_BuiltinEffect_beErrorHost = C_HostClass_HostHandled }, B_dData_dList.C_List_Nil))))))))))))))))))))

# 261 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_builtinEffectImplOfRest = (fun (mc0 : string) (mc1 : t_BuiltinEffect B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if ((dtb__12).f_BuiltinEffect_beTag = mc0) then (dtb__12).f_BuiltinEffect_beImpl else ((v_builtinEffectImplOfRest mc0) dtb__13))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_builtinEffectImplOf = (fun (tag : string) -> ((v_builtinEffectImplOfRest tag) v_builtinEffects))

# 270 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_builtinEffectErrorRunHostOfRest = (fun (mc0 : string) (mc1 : t_BuiltinEffect B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if ((dtb__14).f_BuiltinEffect_beTag = mc0) then (dtb__14).f_BuiltinEffect_beErrorImpl else ((v_builtinEffectErrorRunHostOfRest mc0) dtb__15))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_builtinEffectErrorRunHostOf = (fun (tag : string) -> ((v_builtinEffectErrorRunHostOfRest tag) v_builtinEffects))

# 279 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_hostClassOfRest = (fun (mc0 : string) (mc1 : t_BuiltinEffect B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (if (mc0 = (dtb__16).f_BuiltinEffect_beImpl) then ((dtb__16).f_BuiltinEffect_beImpl <> "") else false) then (B_dData_dMaybe.C_Maybe_Just ((dtb__16).f_BuiltinEffect_beHost)) else (if (if (mc0 = (dtb__16).f_BuiltinEffect_beErrorImpl) then ((dtb__16).f_BuiltinEffect_beErrorImpl <> "") else false) then (B_dData_dMaybe.C_Maybe_Just ((dtb__16).f_BuiltinEffect_beErrorHost)) else ((v_hostClassOfRest mc0) dtb__17)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hostClassOf = (fun (name : string) -> ((v_hostClassOfRest name) v_builtinEffects))

# 304 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_directClassForKey = (fun (mc0 : string) (mc1 : t_HostClass) -> (match mc1 with
  | C_HostClass_HostHandled -> B_dData_dMaybe.C_Maybe_Nothing
  | C_HostClass_HostAbort (dtb__18, dtb__19) -> (if (dtb__18 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | C_HostClass_HostDirect (dtb__20, dtb__21) -> (if (dtb__20 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_hostClassOfSendKeyRest = (fun (mc0 : string) (mc1 : t_BuiltinEffect B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match ((v_directClassForKey mc0) (dtb__22).f_BuiltinEffect_beHost) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (B_dData_dMaybe.C_Maybe_Just (dtb__24))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_directClassForKey mc0) (dtb__22).f_BuiltinEffect_beErrorHost) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (B_dData_dMaybe.C_Maybe_Just (dtb__25))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_hostClassOfSendKeyRest mc0) dtb__23)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hostClassOfSendKey = (fun (key : string) -> ((v_hostClassOfSendKeyRest key) v_builtinEffects))

# 313 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_builtinEffectExistsRest = (fun (mc0 : string) (mc1 : t_BuiltinEffect B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (if ((dtb__26).f_BuiltinEffect_beTag = mc0) then true else ((v_builtinEffectExistsRest mc0) dtb__27))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isBuiltinEffectTag = (fun (tag : string) -> ((v_builtinEffectExistsRest tag) v_builtinEffects))

# 322 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hostTargetNames = (B_dData_dList.C_List__x58__x58_ ("ocaml", (B_dData_dList.C_List__x58__x58_ ("native", (B_dData_dList.C_List__x58__x58_ ("wasm", B_dData_dList.C_List_Nil))))))

# 349 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_unknownHostSupport = { f_HostSupport_hsTag = ""; f_HostSupport_hsOcaml = "none"; f_HostSupport_hsNative = "none"; f_HostSupport_hsWasm = "none" }

# 353 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hostSupportTable = (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Console.ConsoleOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "full" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Fs.FsOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "partial" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Clock.ClockOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "partial" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Env.EnvOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "full" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Process.ProcessOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "none" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Exit.ExitOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "full" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Stdin.StdinOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "none"; f_HostSupport_hsWasm = "none" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Args.ArgsOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "full" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Net.NetOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "none"; f_HostSupport_hsWasm = "none" }, (B_dData_dList.C_List__x58__x58_ ({ f_HostSupport_hsTag = "Base.Effect.Tty.TtyOp"; f_HostSupport_hsOcaml = "full"; f_HostSupport_hsNative = "full"; f_HostSupport_hsWasm = "full" }, B_dData_dList.C_List_Nil))))))))))))))))))))

# 368 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_findHostSupport = (fun (mc0 : string) (mc1 : t_HostSupport B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (if ((dtb__28).f_HostSupport_hsTag = mc0) then dtb__28 else ((v_findHostSupport mc0) dtb__29))
  | B_dData_dList.C_List_Nil -> v_unknownHostSupport
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_pickHostSupport = (fun (mc0 : string) (mc1 : t_HostSupport) -> (if (mc0 = "ocaml") then (mc1).f_HostSupport_hsOcaml else (if (mc0 = "native") then (mc1).f_HostSupport_hsNative else (if (mc0 = "wasm") then (mc1).f_HostSupport_hsWasm else "none"))))

# 336 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hostSupportOf = (fun (target : string) (tag : string) -> ((v_pickHostSupport target) ((v_findHostSupport tag) v_hostSupportTable)))

# 340 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_unsupportedHostTags = (fun (target : string) (tags : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (t : string) -> (((v_hostSupportOf target) t) <> "full"))) tags))

# 380 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effSendCoreName = "Base.Effect.Core.sendCore"

# 383 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effSendCoreIdName = "Base.Effect.Core.sendCoreId"

# 387 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isSendCoreName = (fun (name : string) -> (if (name = v_effSendCoreName) then true else (name = v_effSendCoreIdName)))

# 391 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effPerformCoreName = "Base.Effect.Core.performCore"

# 395 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effSigFnName = "Base.Effect.Core.sigFn"

# 399 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effHandleWithName = "Base.Effect.Core.handleWith"

# 403 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effHandleWithAtName = "Base.Effect.Core.handleWithAt"

# 407 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effWeakenName = "Base.Effect.Core.weaken"

# 411 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRaiseName = "Base.Effect.Core.raise"

# 416 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_primEffBind1Name = "@vuna@prim_eff_bind1"

# 422 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_primEraseName = "prim_erase"

# 428 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_mainShowDefName = "@vuna@main_show"

# 432 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRunName = "Base.Effect.Core.runPure"

# 437 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effMainRunName = "Base.Effect.Core.runMain"

# 460 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_logOnIntrinsicName = "@vuna@log@on"

# 464 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_logEmitIntrinsicName = "@vuna@log@emit"

# 479 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsLevelIntrinsicName = "@vuna@obs@level"

# 483 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSpanIntrinsicName = "@vuna@obs@span"

# 490 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSpanLabIntrinsicName = "@vuna@obs@spanLab"

# 494 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsCounterIntrinsicName = "@vuna@obs@counter"

# 498 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsMarkIntrinsicName = "@vuna@obs@mark"

# 502 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSpanBeginIntrinsicName = "@vuna@obs@spanBegin"

# 506 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSpanEndIntrinsicName = "@vuna@obs@spanEnd"

# 510 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSampleStartIntrinsicName = "@vuna@obs@sampleStart"

# 514 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsSampleStopIntrinsicName = "@vuna@obs@sampleStop"

# 518 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_assertIntrinsicName = "assert"

# 522 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_todoIntrinsicName = "todo"

# 526 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isDebugOnlyName = (fun (name : string) -> (if (name = v_assertIntrinsicName) then true else (name = v_todoIntrinsicName)))

# 539 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRowFamilyName = "Base.Effect.Core.Row"

# 543 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRowNilCtor = "Base.Effect.Core.Row.Nil"

# 547 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRowConsCtor = "Base.Effect.Core.Row.::"

# 551 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effNamedName = "Base.Effect.Core.Named"

# 555 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRowRemName = "Base.Effect.Core.rowRem"

# 559 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effRowAppendName = "Base.Effect.Core.rowAppend"

# 563 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effMemberFamilyName = "Base.Effect.Core.Member"

# 567 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effMemberHereCtor = "Base.Effect.Core.Member.Here"

# 571 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effMemberThereCtor = "Base.Effect.Core.Member.There"

# 575 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effTypeName = "Base.Effect.Core.Eff"

# 580 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effHostOpName = "Base.Effect.Host.HostOp"

# 585 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effUnitTypeName = "Base.Effect.Core.EffUnit"

# 589 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effMkCtor = "Base.Effect.Core.Eff.MkEff"

# 594 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effDefaultInstance = "default"

# 693 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicName = (fun (mc0 : t_Intrinsic) -> (match mc0 with
  | { f_Intrinsic_intrinsicName = dtb__30; f_Intrinsic_intrinsicSignature = dtb__31; f_Intrinsic_intrinsicOp = dtb__32; f_Intrinsic_intrinsicVisible = dtb__33 } -> dtb__30
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicSignature = (fun (mc0 : t_Intrinsic) -> (match mc0 with
  | { f_Intrinsic_intrinsicName = dtb__34; f_Intrinsic_intrinsicSignature = dtb__35; f_Intrinsic_intrinsicOp = dtb__36; f_Intrinsic_intrinsicVisible = dtb__37 } -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicVisible = (fun (mc0 : t_Intrinsic) -> (match mc0 with
  | { f_Intrinsic_intrinsicName = dtb__38; f_Intrinsic_intrinsicSignature = dtb__39; f_Intrinsic_intrinsicOp = dtb__40; f_Intrinsic_intrinsicVisible = dtb__41 } -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

# 713 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicArity = (fun (i : t_Intrinsic) -> (v_arityOfType (v_intrinsicSignature i)))

# 723 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_typeReturnsEff = (fun (mc0 : t_IType) -> (match mc0 with
  | C_IType_IPi (dtb__42, dtb__43) -> (v_typeReturnsEff dtb__43)
  | C_IType_IFun1 (dtb__44, dtb__45) -> (v_typeReturnsEff dtb__45)
  | C_IType_IFun (dtb__46, dtb__47) -> (v_typeReturnsEff dtb__47)
  | C_IType_IEffHost (dtb__48) -> true
  | C_IType_IEff (dtb__49) -> true
  | _ -> false
))

# 719 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicReturnsEff = (fun (i : t_Intrinsic) -> (v_typeReturnsEff (v_intrinsicSignature i)))

# 736 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intTypeName = "Int"

# 740 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_strTypeName = "String"

# 744 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_floatTypeName = "Float"

# 168 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isTypeConstructorName = (fun (name : string) -> (if (if (if (name = v_intTypeName) then true else (name = v_strTypeName)) then true else (name = v_floatTypeName)) then true else ((v_typeIntrinsicArityOf name) >= 0)))

# 732 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_typeIntrinsicNames = (B_dData_dList.C_List__x58__x58_ (v_intTypeName, (B_dData_dList.C_List__x58__x58_ (v_strTypeName, (B_dData_dList.C_List__x58__x58_ (v_floatTypeName, B_dData_dList.C_List_Nil))))))

# 598 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_preludeTypeNames = ((B_dData_dList.v_append v_typeIntrinsicNames) v_typeIntrinsicCtorNames)

# 748 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_boolTypeName = "Base.Data.Bool.Bool"

# 752 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_boolTrueCtor = "Base.Data.Bool.Bool.True"

# 756 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_boolFalseCtor = "Base.Data.Bool.Bool.False"

# 761 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_natTypeName = "Base.Data.Nat.Nat"

# 765 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_natZeroCtor = "Base.Data.Nat.Nat.Zero"

# 769 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_natSuccCtor = "Base.Data.Nat.Nat.Succ"

# 773 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isIntrinsicTypeName = (fun (name : string) -> ((B_dData_dList.v_memName name) v_preludeTypeNames))

# 777 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_listFamilyName = "Base.Data.List.List"

# 781 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_listNilCtor = "Base.Data.List.List.Nil"

# 785 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_listConsCtor = "Base.Data.List.List.::"

# 789 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hasFieldLabelName = "Base.Trait.Field.Field"

# 793 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hasFieldTraitName = "Base.Trait.Record.HasField"

# 797 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hasFieldGetFieldName = "Base.Trait.Record.getField"

# 801 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hasFieldMethodName = "getField"

# 823 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_cfName = (fun (mc0 : t_CanonicalFamily) -> (match mc0 with
  | { f_CanonicalFamily_cfName = dtb__50; f_CanonicalFamily_cfCtors = dtb__51; f_CanonicalFamily_cfRepr = dtb__52 } -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_cfCtors = (fun (mc0 : t_CanonicalFamily) -> (match mc0 with
  | { f_CanonicalFamily_cfName = dtb__53; f_CanonicalFamily_cfCtors = dtb__54; f_CanonicalFamily_cfRepr = dtb__55 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_cfRepr = (fun (mc0 : t_CanonicalFamily) -> (match mc0 with
  | { f_CanonicalFamily_cfName = dtb__56; f_CanonicalFamily_cfCtors = dtb__57; f_CanonicalFamily_cfRepr = dtb__58 } -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 835 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_canonicalFamilies = (B_dData_dList.C_List__x58__x58_ ({ f_CanonicalFamily_cfName = v_boolTypeName; f_CanonicalFamily_cfCtors = (B_dData_dList.C_List__x58__x58_ (v_boolTrueCtor, (B_dData_dList.C_List__x58__x58_ (v_boolFalseCtor, B_dData_dList.C_List_Nil)))); f_CanonicalFamily_cfRepr = C_FamilyRepr_FamReprBool }, (B_dData_dList.C_List__x58__x58_ ({ f_CanonicalFamily_cfName = v_natTypeName; f_CanonicalFamily_cfCtors = (B_dData_dList.C_List__x58__x58_ (v_natZeroCtor, (B_dData_dList.C_List__x58__x58_ (v_natSuccCtor, B_dData_dList.C_List_Nil)))); f_CanonicalFamily_cfRepr = C_FamilyRepr_FamReprNat }, (B_dData_dList.C_List__x58__x58_ ({ f_CanonicalFamily_cfName = v_listFamilyName; f_CanonicalFamily_cfCtors = (B_dData_dList.C_List__x58__x58_ (v_listNilCtor, (B_dData_dList.C_List__x58__x58_ (v_listConsCtor, B_dData_dList.C_List_Nil)))); f_CanonicalFamily_cfRepr = C_FamilyRepr_FamReprBoxed }, B_dData_dList.C_List_Nil))))))

# 854 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_dropLastSegment = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (Base_dSource.v_joinDots dtb__59)
  | _ -> failwith "DT: impossible branch"
))

# 846 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_ctorSpellingKey = (fun (name : string) -> (if (if (if (if (if ((B_dData_dString.v_endsWith ".Cons") name) then true else ((B_dData_dString.v_endsWith ".RCons") name)) then true else ((B_dData_dString.v_endsWith ".VCons") name)) then true else ((B_dData_dString.v_endsWith ".::") name)) then true else ((B_dData_dString.v_endsWith ".(::)") name)) then ((v_dropLastSegment name) ^ ".CONS") else name))

# 863 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_findCanonicalFamilyGo = (fun (mc0 : string) (mc1 : t_CanonicalFamily B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if ((v_cfName dtb__61) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__61)) else ((v_findCanonicalFamilyGo mc0) dtb__62))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 860 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_findCanonicalFamily = (fun (name : string) -> ((v_findCanonicalFamilyGo name) v_canonicalFamilies))

# 706 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_canonicalCtorsFor = (fun (name : string) -> (match (v_findCanonicalFamily name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (B_dData_dMaybe.C_Maybe_Just ((v_cfCtors dtb__63)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 869 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_canonicalReprOf = (fun (name : string) -> (match (v_findCanonicalFamily name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (B_dData_dMaybe.C_Maybe_Just ((v_cfRepr dtb__64)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 876 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isUnboxedCanonical = (fun (name : string) -> (let nd_uscrut1 = (v_canonicalReprOf name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (match dtb__65 with
  | C_FamilyRepr_FamReprBoxed -> false
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)))

# 884 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isBoolCanonical = (fun (name : string) -> (let nd_uscrut1 = (v_canonicalReprOf name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match dtb__66 with
  | C_FamilyRepr_FamReprBool -> true
  | _ -> false
)
  | _ -> false
)))

# 891 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_cmpSpecializedTyNames = (B_dData_dList.C_List__x58__x58_ (v_intTypeName, (B_dData_dList.C_List__x58__x58_ (v_strTypeName, (B_dData_dList.C_List__x58__x58_ (v_floatTypeName, (B_dData_dList.C_List__x58__x58_ (v_boolTypeName, B_dData_dList.C_List_Nil))))))))

# 895 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_ffiScalarNames = (B_dData_dList.C_List__x58__x58_ (v_intTypeName, (B_dData_dList.C_List__x58__x58_ (v_strTypeName, (B_dData_dList.C_List__x58__x58_ (v_boolTypeName, B_dData_dList.C_List_Nil))))))

# 899 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isFfiScalarName = (fun (name : string) -> ((B_dData_dList.v_memName name) v_ffiScalarNames))

# 904 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_interpTypeName = "Base.Trait.Interp.Interp"

# 908 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_interpMethodName = "Base.Trait.Interp.interp"

# 913 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromStringTypeName = "Base.Trait.FromString.FromString"

# 917 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromStringMethodName = "Base.Trait.FromString.fromString"

# 921 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromIntTypeName = "Base.Trait.FromInt.FromInt"

# 925 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromIntMethodName = "Base.Trait.FromInt.fromInt"

# 929 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromFloatTypeName = "Base.Data.Float.FromFloat"

# 933 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_fromFloatMethodName = "Base.Data.Float.fromFloat"

# 966 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_baseIntrinsics = (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "+"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpAdd; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "-"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpSub; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "*"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpMul; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "/"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpDiv; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitAnd"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitAnd; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitOr"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitOr; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitXor"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitXor; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitNot"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitNot; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitShl"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitShl; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bitShr"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpBitShr; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "++"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpConcat; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "&&"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpAnd; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "||"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpOr; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strFromInt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrFromInt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strUnpack"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IList (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrUnpack; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strPack"; f_Intrinsic_intrinsicSignature = (C_IType_IFun ((C_IType_IList (C_IType_IInt)), C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrPack; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strLength"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrLength; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strConcatMany"; f_Intrinsic_intrinsicSignature = (C_IType_IFun ((C_IType_IList (C_IType_IStr)), C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrConcatMany; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strSubstTemplate"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IList (C_IType_IStr)), C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrSubstTemplate; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strHash"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrHash; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "effectId"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrDispatchId; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strAt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrAt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strSubstring"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IStr, C_IType_IStr)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrSubstring; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strShow"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrShow; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_primEraseName; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpIdentity; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natAdd"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_INat, (C_IType_IFun (C_IType_INat, C_IType_INat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatAdd; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natSub"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_INat, (C_IType_IFun (C_IType_INat, C_IType_INat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatSub; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natMul"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_INat, (C_IType_IFun (C_IType_INat, C_IType_INat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatMul; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natDiv"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_INat, (C_IType_IFun (C_IType_INat, C_IType_INat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatDiv; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natToInt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_INat, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatToInt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "natFromInt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_INat)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNatFromInt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayLength"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IArray ((C_IType_IVar ("a")))), C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayEmpty"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IArray ((C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayGet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arraySet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IArray ((C_IType_IVar ("a")))))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayMake"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IArray ((C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayFromList"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IList ((C_IType_IVar ("a")))), (C_IType_IArray ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "arrayToList"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IArray ((C_IType_IVar ("a")))), (C_IType_IList ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_effectPerformId"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IPi ("b", (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IVar ("b")))))))))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_effectHandleId"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("u", (C_IType_IPi ("a", (C_IType_IPi ("b", (C_IType_IPi ("ret", (C_IType_IPi ("h", (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("ret")), (C_IType_IFun ((C_IType_IVar ("h")), (C_IType_IFun ((C_IType_IFun ((C_IType_IVar ("u")), (C_IType_IVar ("a")))), (C_IType_IFun ((C_IType_IVar ("u")), (C_IType_IVar ("b")))))))))))))))))))))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_effectSelf"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IPi ("b", (C_IType_IFun ((C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))), (C_IType_IVar ("b")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_cleanupPush"; f_Intrinsic_intrinsicSignature = (C_IType_IFun ((C_IType_IFun (C_IType_IInt, C_IType_IInt)), C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_cleanupPop"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedNewScope"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedFork"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))), C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedYield"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedIsCancelled"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedAwait"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedTaskResult"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedTaskError"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedCancelTask"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedCancelScope"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedScopeWait"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedScopeWaitTimeout"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedScopeError"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_schedScopeCount"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "prim_fail"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IStr, (C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_assertIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_todoIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IStr, (C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_eq_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpEqInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_neq_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNeqInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_eq_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpEqStr; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_neq_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNeqStr; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_lt_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLtInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_le_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLeInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_gt_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGtInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_ge_int"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGeInt; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_lt_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLtValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_le_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLeValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_gt_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGtValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_ge_str"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGeValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_lt_bool"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLtValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_le_bool"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLeValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_gt_bool"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGtValue; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_ge_bool"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IBool, (C_IType_IFun (C_IType_IBool, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGeValue; f_Intrinsic_intrinsicVisible = false }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 1068 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_floatIntrinsics = (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "strFromFloat"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpStrFromFloat; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "floatFromInt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IFloat)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpFloatFromInt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "intFromFloat"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpIntFromFloat; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "floatAbs"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpFloatAbs; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "floatSqrt"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpFloatSqrt; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_add_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpAddF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_sub_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpSubF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_mul_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpMulF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_div_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IFloat)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpDivF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_eq_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpEqF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_neq_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNeqF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_lt_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLtF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_le_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpLeF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_gt_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGtF; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "bi_ge_float"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IFloat, (C_IType_IFun (C_IType_IFloat, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpGeF; f_Intrinsic_intrinsicVisible = false }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))

# 1102 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_effIntrinsics = (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim@toObj"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IGlobal ("Base.Effect.Core.Obj")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim@fromObj"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IGlobal ("Base.Effect.Core.Obj")), (C_IType_IVar ("a")))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_primEffBind1Name; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IPi ("b", (C_IType_IFun1 ((C_IType_IEff ((C_IType_IVar ("a")))), (C_IType_IFun1 ((C_IType_IFun1 ((C_IType_IVar ("a")), (C_IType_IEff ((C_IType_IVar ("b")))))), (C_IType_IEff ((C_IType_IVar ("b")))))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "effTimeUs"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_sleep"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mrefNew"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_ICell ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mrefRead"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_ICell ((C_IType_IVar ("a")))), (C_IType_IEff ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mrefWrite"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_ICell ((C_IType_IVar ("a")))), (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IEff (C_IType_IInt)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_marrNew"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IMArray ((C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_marrGet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IEff ((C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_marrSet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IEff (C_IType_IInt)))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_marrLen"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMArray ((C_IType_IVar ("a")))), C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_marrFromList"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IList ((C_IType_IVar ("a")))), (C_IType_IMArray ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynNew"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IInt, (C_IType_IMDynArray ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynGet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMDynArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IEff ((C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynSet"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMDynArray ((C_IType_IVar ("a")))), (C_IType_IFun (C_IType_IInt, (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IEff (C_IType_IInt)))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynPush"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMDynArray ((C_IType_IVar ("a")))), (C_IType_IFun ((C_IType_IVar ("a")), (C_IType_IEff (C_IType_IInt)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynLen"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMDynArray ((C_IType_IVar ("a")))), C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_dynClear"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IMDynArray ((C_IType_IVar ("a")))), (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufNew"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IMBuffer)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufAppend"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMBuffer, (C_IType_IFun (C_IType_IStr, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufAppendChar"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMBuffer, (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufLen"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMBuffer, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufClear"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMBuffer, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_mbufToString"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMBuffer, C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_print"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@print"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_eprint"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_readLine"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_readBytes"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_getArgs"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost ((C_IType_IList (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryReadFileRange"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IStr)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@fileExists"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@fileMtime"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@fileSize"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_hostStatus"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryReadFile"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryWriteFile"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryWriteFileAtomic"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryReadDir"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost ((C_IType_IList (C_IType_IStr)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryIsDirectory"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryMakeDir"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryRemoveFile"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryRemoveTree"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryRename"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@trySymlink"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryMakeDirExclusive"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@isTty"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IBool)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryRunIn"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IList (C_IType_IStr)), (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_exit"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_runIn"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IList (C_IType_IStr)), (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "effTimeUs_host"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = true }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@sleep"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@getenv"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@getcwd"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@execPath"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_getArgs_process_host"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost ((C_IType_IList (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_exit_process_host"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@exitOp"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@readLine"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@readBytes"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@getArgs"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost ((C_IType_IList (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetListen"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetPort"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetAccept"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetRecv"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IStr)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetSend"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetClose"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetConnect"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetAcceptWithin"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetRecvWithin"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IStr)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@host@tryNetSendWithin"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_spawn"; f_Intrinsic_intrinsicSignature = (C_IType_IFun ((C_IType_IList (C_IType_IStr)), (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_wait"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEffHost (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_getenv"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IEffHost (C_IType_IStr)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_getcwd"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_execPath"; f_Intrinsic_intrinsicSignature = (C_IType_IEffHost (C_IType_IStr)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 1253 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_threadIntrinsics = (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_threadSpawn"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))), (C_IType_IEff ((C_IType_IThread ((C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_threadJoin"; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun ((C_IType_IThread ((C_IType_IVar ("a")))), (C_IType_IEff ((C_IType_IVar ("a")))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_threadYield"; f_Intrinsic_intrinsicSignature = (C_IType_IEff (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_threadId"; f_Intrinsic_intrinsicSignature = (C_IType_IEff (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_threadParallelism"; f_Intrinsic_intrinsicSignature = (C_IType_IEff (C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_mutexNew"; f_Intrinsic_intrinsicSignature = (C_IType_IEff (C_IType_IMutex)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_mutexLock"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMutex, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_mutexTryLock"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMutex, (C_IType_IEff (C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_mutexUnlock"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IMutex, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_condvarNew"; f_Intrinsic_intrinsicSignature = (C_IType_IEff (C_IType_ICondvar)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_condvarWait"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_ICondvar, (C_IType_IFun (C_IType_IMutex, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_condvarSignal"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_ICondvar, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_condvarBroadcast"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_ICondvar, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicNew"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IAtomic)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicLoad"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IAtomic, (C_IType_IEff (C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicStore"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IAtomic, (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicFetchAdd"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IAtomic, (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicExchange"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IAtomic, (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = "@vuna@prim_eff_atomicCompareExchange"; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IAtomic, (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IInt, (C_IType_IEff (C_IType_IInt)))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))

# 1290 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_threadIntrinsicNames = ((B_dData_dList.v_map v_intrinsicName) v_threadIntrinsics)

# 1297 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_internalIntrinsics = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_logOnIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IStr, C_IType_IBool)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_logEmitIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IInt)))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsLevelIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSpanIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))), (C_IType_IVar ("a")))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSpanLabIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IPi ("a", (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, (C_IType_IFun ((C_IType_IFun (C_IType_IInt, (C_IType_IVar ("a")))), (C_IType_IVar ("a")))))))))))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsCounterIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsMarkIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSpanBeginIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IStr, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSpanEndIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSampleStartIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IStr, (C_IType_IFun (C_IType_IInt, C_IType_IInt)))); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, (B_dData_dList.C_List__x58__x58_ ({ f_Intrinsic_intrinsicName = v_obsSampleStopIntrinsicName; f_Intrinsic_intrinsicSignature = (C_IType_IFun (C_IType_IInt, C_IType_IInt)); f_Intrinsic_intrinsicOp = C_IntrinsicOp_OpNone; f_Intrinsic_intrinsicVisible = false }, B_dData_dList.C_List_Nil))))))))))))))))))))))) ((B_dData_dList.v_append ((B_dData_dList.v_filter (fun (i : t_Intrinsic) -> (B_dData_dBool.v_not (v_intrinsicVisible i)))) v_effIntrinsics)) ((B_dData_dList.v_filter (fun (i : t_Intrinsic) -> (B_dData_dBool.v_not (v_intrinsicVisible i)))) v_threadIntrinsics)))

# 1304 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_logIntrinsicNames = (B_dData_dList.C_List__x58__x58_ (v_logOnIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_logEmitIntrinsicName, B_dData_dList.C_List_Nil))))

# 1310 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_obsIntrinsicNames = (B_dData_dList.C_List__x58__x58_ (v_obsLevelIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSpanIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSpanLabIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsCounterIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsMarkIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSpanBeginIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSpanEndIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSampleStartIntrinsicName, (B_dData_dList.C_List__x58__x58_ (v_obsSampleStopIntrinsicName, B_dData_dList.C_List_Nil))))))))))))))))))

# 1325 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_internalIntrinsicNames = ((B_dData_dList.v_map v_intrinsicName) v_internalIntrinsics)

# 1329 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_allIntrinsics = ((B_dData_dList.v_append v_baseIntrinsics) ((B_dData_dList.v_append v_floatIntrinsics) ((B_dData_dList.v_append v_effIntrinsics) v_internalIntrinsics)))

# 1335 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_floatIntrinsicNames = (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatFromInt", (B_dData_dList.C_List__x58__x58_ ("intFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatAbs", (B_dData_dList.C_List__x58__x58_ ("floatSqrt", (B_dData_dList.C_List__x58__x58_ ("bi_add_float", (B_dData_dList.C_List__x58__x58_ ("bi_sub_float", (B_dData_dList.C_List__x58__x58_ ("bi_mul_float", (B_dData_dList.C_List__x58__x58_ ("bi_div_float", (B_dData_dList.C_List__x58__x58_ ("bi_eq_float", (B_dData_dList.C_List__x58__x58_ ("bi_neq_float", (B_dData_dList.C_List__x58__x58_ ("bi_lt_float", (B_dData_dList.C_List__x58__x58_ ("bi_le_float", (B_dData_dList.C_List__x58__x58_ ("bi_gt_float", (B_dData_dList.C_List__x58__x58_ ("bi_ge_float", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))

# 1356 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (i : t_Intrinsic) -> { B_dData_dPair.f_Pair_first = (v_intrinsicName i); B_dData_dPair.f_Pair_second = i })) v_allIntrinsics)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))

# 1361 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_findIntrinsic = (fun (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) v_intrinsicTbl))

# 1365 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_isIntrinsicName = (fun (name : string) -> (match (v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (v_intrinsicVisible dtb__67)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1372 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_userIntrinsics = ((B_dData_dList.v_filter v_intrinsicVisible) v_allIntrinsics)

# 1376 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_preludeValueNames = ((B_dData_dList.v_map v_intrinsicName) v_userIntrinsics)

# 1380 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_dispatchIdIntrinsicName = "effectId"

# 1389 "Vuna/Compiler/Base/Intrinsics.vuna"
let rec v_dispatchIdChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> ((v_dispatchIdChars dtb__69) (((mc1 lxor dtb__68) * 16777619) land 4294967295))
  | B_dData_dList.C_List_Nil -> (mc1 land 1073741823)
  | _ -> failwith "DT: impossible branch"
))

# 1386 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_dispatchIdOf = (fun (s : string) -> ((v_dispatchIdChars (B_dData_dList.dtp_unpack s)) 2166136261))

# 184 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_beTag = (fun (p : t_BuiltinEffect) -> (match p with
  | { f_BuiltinEffect_beTag = dtb__70; f_BuiltinEffect_beImpl = dtb__71; f_BuiltinEffect_beHost = dtb__72; f_BuiltinEffect_beErrorImpl = dtb__73; f_BuiltinEffect_beErrorHost = dtb__74 } -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_beImpl = (fun (p : t_BuiltinEffect) -> (match p with
  | { f_BuiltinEffect_beTag = dtb__75; f_BuiltinEffect_beImpl = dtb__76; f_BuiltinEffect_beHost = dtb__77; f_BuiltinEffect_beErrorImpl = dtb__78; f_BuiltinEffect_beErrorHost = dtb__79 } -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_beHost = (fun (p : t_BuiltinEffect) -> (match p with
  | { f_BuiltinEffect_beTag = dtb__80; f_BuiltinEffect_beImpl = dtb__81; f_BuiltinEffect_beHost = dtb__82; f_BuiltinEffect_beErrorImpl = dtb__83; f_BuiltinEffect_beErrorHost = dtb__84 } -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_beErrorImpl = (fun (p : t_BuiltinEffect) -> (match p with
  | { f_BuiltinEffect_beTag = dtb__85; f_BuiltinEffect_beImpl = dtb__86; f_BuiltinEffect_beHost = dtb__87; f_BuiltinEffect_beErrorImpl = dtb__88; f_BuiltinEffect_beErrorHost = dtb__89 } -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_beErrorHost = (fun (p : t_BuiltinEffect) -> (match p with
  | { f_BuiltinEffect_beTag = dtb__90; f_BuiltinEffect_beImpl = dtb__91; f_BuiltinEffect_beHost = dtb__92; f_BuiltinEffect_beErrorImpl = dtb__93; f_BuiltinEffect_beErrorHost = dtb__94 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hsTag = (fun (p : t_HostSupport) -> (match p with
  | { f_HostSupport_hsTag = dtb__95; f_HostSupport_hsOcaml = dtb__96; f_HostSupport_hsNative = dtb__97; f_HostSupport_hsWasm = dtb__98 } -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hsOcaml = (fun (p : t_HostSupport) -> (match p with
  | { f_HostSupport_hsTag = dtb__99; f_HostSupport_hsOcaml = dtb__100; f_HostSupport_hsNative = dtb__101; f_HostSupport_hsWasm = dtb__102 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hsNative = (fun (p : t_HostSupport) -> (match p with
  | { f_HostSupport_hsTag = dtb__103; f_HostSupport_hsOcaml = dtb__104; f_HostSupport_hsNative = dtb__105; f_HostSupport_hsWasm = dtb__106 } -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_hsWasm = (fun (p : t_HostSupport) -> (match p with
  | { f_HostSupport_hsTag = dtb__107; f_HostSupport_hsOcaml = dtb__108; f_HostSupport_hsNative = dtb__109; f_HostSupport_hsWasm = dtb__110 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Base/Intrinsics.vuna"
let v_intrinsicOp = (fun (p : t_Intrinsic) -> (match p with
  | { f_Intrinsic_intrinsicName = dtb__111; f_Intrinsic_intrinsicSignature = dtb__112; f_Intrinsic_intrinsicOp = dtb__113; f_Intrinsic_intrinsicVisible = dtb__114 } -> dtb__113
  | _ -> failwith "DT: impossible branch"
))
