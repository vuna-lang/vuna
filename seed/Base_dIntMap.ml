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
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
type 'a0 t_Base_dIntMap_dIntMap = C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap of ((int, 'a0) t_Base_dPair_dPair t_Base_dList_dList t_Base_dList_dList t_Base_dList_dList)

let rec v_Base_dIntMap_d_ureplicate = (fun n -> (fun x -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (x, ((v_Base_dIntMap_d_ureplicate ((bi_sub n) 1)) x))))))

let rec v_Base_dIntMap_d_unthOr = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((bi_le_int mc0) 0) then dtb__0 else (((v_Base_dIntMap_d_unthOr ((bi_sub mc0) 1)) mc1) dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Base_dIntMap_d_uputNth = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if ((bi_le_int mc0) 0) then (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__3)) else (C_Base_dList_dList_Base_dList_dCons (dtb__2, (((v_Base_dIntMap_d_uputNth ((bi_sub mc0) 1)) mc1) dtb__3))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dIntMap_d_uhashInt = (fun n -> ((fun m -> (if ((bi_lt_int m) 0) then ((bi_add m) 1024) else m)) ((bi_sub n) ((bi_mul ((bi_div n) 1024)) 1024))))

let rec v_Base_dIntMap_d_ulookupAssoc = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (if ((bi_eq_int mc0) dtb__6) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7)) else ((v_Base_dIntMap_d_ulookupAssoc mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dIntMap_d_uhasKeyIn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if ((bi_eq_int mc0) dtb__10) then true else ((v_Base_dIntMap_d_uhasKeyIn mc0) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dIntMap_d_udedupGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> (if ((v_Base_dIntMap_d_uhasKeyIn dtb__14) mc1) then ((v_Base_dIntMap_d_udedupGo dtb__13) mc1) else ((v_Base_dIntMap_d_udedupGo dtb__13) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15)), mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dIntMap_d_udedupBucket = (fun xs -> ((v_Base_dIntMap_d_udedupGo xs) C_Base_dList_dList_Base_dList_dNil))

let v_Base_dIntMap_dempty = (C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap (((v_Base_dIntMap_d_ureplicate 32) ((v_Base_dIntMap_d_ureplicate 32) C_Base_dList_dList_Base_dList_dNil))))

let v_Base_dIntMap_dinsert = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap (dtb__16) -> ((fun b -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap ((((v_Base_dIntMap_d_uputNth oi) (((v_Base_dIntMap_d_uputNth ii) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), inner))) outer)) dtb__16)))) (((v_Base_dIntMap_d_unthOr ii) C_Base_dList_dList_Base_dList_dNil) outer))) (((v_Base_dIntMap_d_unthOr oi) ((v_Base_dIntMap_d_ureplicate 32) C_Base_dList_dList_Base_dList_dNil)) dtb__16))) ((bi_sub b) ((bi_mul oi) 32)))) ((bi_div b) 32))) (v_Base_dIntMap_d_uhashInt mc0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dIntMap_dlookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap (dtb__17) -> ((fun b -> ((fun oi -> ((fun ii -> ((v_Base_dIntMap_d_ulookupAssoc mc0) (((v_Base_dIntMap_d_unthOr ii) C_Base_dList_dList_Base_dList_dNil) (((v_Base_dIntMap_d_unthOr oi) C_Base_dList_dList_Base_dList_dNil) dtb__17)))) ((bi_sub b) ((bi_mul oi) 32)))) ((bi_div b) 32))) (v_Base_dIntMap_d_uhashInt mc0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dIntMap_dmember = (fun key -> (fun t -> (match ((v_Base_dIntMap_dlookup key) t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dIntMap_dinsertAll = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((v_Base_dIntMap_dinsertAll dtb__20) (((v_Base_dIntMap_dinsert dtb__21) dtb__22) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dIntMap_dfromList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (match dtb__23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (((v_Base_dIntMap_dinsert dtb__25) dtb__26) (v_Base_dIntMap_dfromList dtb__24))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> v_Base_dIntMap_dempty
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dIntMap_dtoList = (fun mc0 -> (match mc0 with
  | C_Base_dIntMap_dIntMap_Base_dIntMap_dMkIntMap (dtb__27) -> ((v_Base_dList_dconcatMap (fun row -> ((v_Base_dList_dconcatMap v_Base_dIntMap_d_udedupBucket) row))) dtb__27)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dIntMap_dsize = (fun t -> (v_Base_dList_dlength (v_Base_dIntMap_dtoList t)))
