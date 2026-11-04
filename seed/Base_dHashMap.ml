open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
type 'a0 t_Base_dHashMap_dHashMap = C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap of ((((string, 'a0) t_Base_dPair_dPair t_Base_dList_dList array) array))

let v_Base_dHashMap_dhashStr = (fun s -> (dtp_strHash s))

let rec v_Base_dHashMap_d_ulookupAssoc = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> (if (mc0 = dtb__2) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3)) else ((v_Base_dHashMap_d_ulookupAssoc mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_uhasKeyIn = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (if (mc0 = dtb__6) then true else ((v_Base_dHashMap_d_uhasKeyIn mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_udedupGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if ((v_Base_dHashMap_d_uhasKeyIn dtb__10) mc1) then ((v_Base_dHashMap_d_udedupGo dtb__9) mc1) else ((v_Base_dHashMap_d_udedupGo dtb__9) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11)), mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_d_udedupBucket = (fun xs -> ((v_Base_dHashMap_d_udedupGo xs) C_Base_dList_dList_Base_dList_dNil))

let v_Base_dHashMap_dinsert = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap (dtb__12) -> ((fun base -> ((fun b -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap ((((v_Base_dArray_dset base) oi) (((v_Base_dArray_dset outer) ii) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), inner))))))) ((v_Base_dArray_dget outer) ii))) ((v_Base_dArray_dget base) oi))) (b - (oi * 32)))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_dhashStr mc0))) (if ((v_Base_dArray_dlength dtb__12) = 0) then ((v_Base_dArray_dmake 32) ((v_Base_dArray_dmake 32) C_Base_dList_dList_Base_dList_dNil)) else dtb__12))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dlookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap (dtb__13) -> (if ((v_Base_dArray_dlength dtb__13) = 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun b -> ((fun oi -> ((fun ii -> ((v_Base_dHashMap_d_ulookupAssoc mc0) ((v_Base_dArray_dget ((v_Base_dArray_dget dtb__13) oi)) ii))) (b - (oi * 32)))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_dhashStr mc0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dmember = (fun key t -> (match ((v_Base_dHashMap_dlookup key) t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dinsertAll = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match dtb__15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> ((v_Base_dHashMap_dinsertAll dtb__16) (((v_Base_dHashMap_dinsert dtb__17) dtb__18) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dfromList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (((v_Base_dHashMap_dinsert dtb__21) dtb__22) (v_Base_dHashMap_dfromList dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap ([||]))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dofNames = (fun xs -> ((v_Base_dHashMap_dinsertAll ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) xs)) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let v_Base_dHashMap_dtoList = (fun mc0 -> (match mc0 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dMkHashMap (dtb__23) -> ((v_Base_dList_dconcatMap (fun outer -> ((v_Base_dList_dconcatMap (fun inner -> (v_Base_dHashMap_d_udedupBucket inner))) (v_Base_dArray_dtoList outer)))) (v_Base_dArray_dtoList dtb__23))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dsize = (fun t -> (v_Base_dList_dlength (v_Base_dHashMap_dtoList t)))
