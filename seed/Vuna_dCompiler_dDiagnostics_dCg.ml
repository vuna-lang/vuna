open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
type t_Vuna_dCompiler_dDiagnostics_dCg_dCgErr = C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime of (string) | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime of (string)
and t_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry = C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry of (string) * (string) * (string)

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime (dtb__0) -> "CG_UnsolvedMetavarRuntime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (dtb__1) -> "CG_TypeLevelNameRuntime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__2) -> "CG_TypeLevelBindingRuntime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__3) -> "CG_RecursiveValueDefinition"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (dtb__4) -> "CG_ListBridgeRequired"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (dtb__5) -> "CG_EffectPrimRequiresIO"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (dtb__6) -> "CG_AxiomAtRuntime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime -> "CG_TypeUsedAtRuntime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain -> "CG_NoMain"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType -> "CG_MainReturnType"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue -> "CG_MainNotValue"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects -> "CG_InterpCannotExecuteEffects"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle -> "CG_DependencyCycle"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime (dtb__7) -> "unsolved metavariable in runtime code<0>"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (dtb__8) -> "type-level name `<0>` is used at runtime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__9) -> "type-level binding `<0>` is used at runtime"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__10) -> "top-level value definition `<0>` cannot be recursive; make it a function or remove the cycle"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (dtb__11) -> "builtin `<0>` requires the canonical `Base.List.List` declaration from vuna-base (no base dependency in this package)"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (dtb__12) -> "effectful builtin `<0>` returns `IO`; requires the canonical `Base.IO.IO` declaration from vuna-base (add `import Base.IO`, or use Base.IO actions / runIO)"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (dtb__13) -> "axiom `<0>` cannot be used at runtime (it has no runtime definition)"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime -> "a type is used at runtime (M13 limitation)"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain -> "no main definition"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType -> "main must return Int, String or Bool (M13 limitation)"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue -> "main does not reduce to a value"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects -> "interp cannot execute effects (main : IO a); compile and run the program instead"
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle -> "dependency cycle between runtime definitions"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgEntryCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry (dtb__14, dtb__15, dtb__16) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgEntryTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry (dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgEntryDesc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry (dtb__20, dtb__21, dtb__22) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk0 = (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle), "\232\191\144\232\161\140\230\151\182\229\174\154\228\185\137\233\151\180\228\190\157\232\181\150\230\136\144\231\142\175")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects), "interp \228\184\141\232\131\189\230\137\167\232\161\140\230\149\136\230\158\156")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue), "main \230\156\170\229\189\146\231\186\166\229\136\176\229\128\188")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType), "main \232\191\148\229\155\158\231\177\187\229\158\139\229\143\151\233\153\144")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain), "\229\133\165\229\143\163\231\188\186\229\176\145 main \229\174\154\228\185\137")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime), "\231\177\187\229\158\139\232\162\171\232\191\144\232\161\140\230\151\182\228\189\191\231\148\168\239\188\136M13 \233\153\144\229\136\182\239\188\137")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (""))), "axiom \232\162\171\232\191\144\232\161\140\230\151\182\228\189\191\231\148\168\239\188\136\229\174\131\230\178\161\230\156\137\232\191\144\232\161\140\230\151\182\229\174\154\228\185\137\228\189\147\239\188\137")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (""))), "\230\149\136\230\158\156\229\142\159\232\175\173\232\191\148\229\155\158 IO \228\189\134\229\140\133\230\178\161\230\156\137 canonical Base.IO.IO \229\163\176\230\152\142\239\188\136\231\188\186 import Base.IO\239\188\137")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (""))), "\229\134\133\229\187\186\233\156\128\232\166\129 canonical Base.List.List \230\161\165\230\142\165\228\189\134\229\140\133\230\178\161\230\156\137 base \228\190\157\232\181\150")), C_Base_dList_dList_Base_dList_dNil))))))))))))))))))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk1 = (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (""))), "\233\128\146\229\189\146\231\187\132\233\135\140\231\154\132\233\155\182\229\143\130\229\128\188\229\174\154\228\185\137\230\151\160\230\179\149\229\174\137\229\133\168\232\144\189\229\156\176")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (""))), "\231\177\187\229\158\139\231\186\167\231\187\145\229\174\154\232\162\171\232\191\144\232\161\140\230\151\182\228\189\191\231\148\168\239\188\136M13 \233\153\144\229\136\182\239\188\137")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (""))), "\231\177\187\229\158\139\231\186\167\229\144\141\229\173\151\232\162\171\232\191\144\232\161\140\230\151\182\228\189\191\231\148\168")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime (""))), (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime (""))), "\232\191\144\232\161\140\230\151\182\228\187\163\231\160\129\233\135\140\230\156\137\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143")), C_Base_dList_dList_Base_dList_dNil))))))))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgAll = (v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists (C_Base_dList_dList_Base_dList_dCons (v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk0, (C_Base_dList_dList_Base_dList_dCons (v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk1, C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgMsg = (fun e -> (fun args -> (((v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagMsg (v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode e)) (v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate e)) args)))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr = (fun e -> (fun args -> (v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagErr ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgMsg e) args))))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 = (fun e -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr e) C_Base_dVec_dVec_Base_dVec_dVNil))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 = (fun e -> (fun a0 -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr e) (C_Base_dVec_dVec_Base_dVec_dVCons (a0, C_Base_dVec_dVec_Base_dVec_dVNil)))))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc = (fun span -> (fun name -> ((v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagDefLoc span) name)))

let v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt = (fun span -> (fun name -> (fun e -> (fun args -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc span) name)) ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgMsg e) args))))))))
