open Vuna_runtime
let v_Vuna_dCompiler_dCacheFormat_dframeMagic = "vuna-cache-frame 1"

let v_Vuna_dCompiler_dCacheFormat_dframeChecksum = (fun payload -> (dtp_strHash payload))

let v_Vuna_dCompiler_dCacheFormat_dframeHeader = (fun tag len sum -> (String.concat "" [v_Vuna_dCompiler_dCacheFormat_dframeMagic; "|"; tag; "|"; (bi_strFromInt len); "|"; (bi_strFromInt sum); "\n"]))

let v_Vuna_dCompiler_dCacheFormat_dframeEncode = (fun tag payload -> ((((v_Vuna_dCompiler_dCacheFormat_dframeHeader tag) (bi_strLength payload)) (v_Vuna_dCompiler_dCacheFormat_dframeChecksum payload)) ^ payload))

let v_Vuna_dCompiler_dCacheFormat_dheaderFields = (fun line -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__6))))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((Base_dString.v_Base_dString_dsplit "|") line)))

let rec v_Vuna_dCompiler_dCacheFormat_dbreakFirstNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if (dtb__8 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__9))))) else ((v_Vuna_dCompiler_dCacheFormat_dbreakFirstNewline dtb__9) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, mc1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCacheFormat_dframeSplit = (fun raw -> ((fun n -> ((fun headLen -> (match ((v_Vuna_dCompiler_dCacheFormat_dbreakFirstNewline (Base_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> ((fun header -> ((fun start -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (header, (((dtp_substring start) (n - start)) raw)))))) ((bi_strLength header) + 1))) (Base_dPair.v_Base_dPair_dfirstOf dtb__10))
  | _ -> failwith "DT: impossible branch"
)) (if (n < 512) then n else 512))) (bi_strLength raw)))

let v_Vuna_dCompiler_dCacheFormat_dframeDecode = (fun tag raw -> (match (v_Vuna_dCompiler_dCacheFormat_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (match (v_Vuna_dCompiler_dCacheFormat_dheaderFields (Base_dPair.v_Base_dPair_dfirstOf dtb__11)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> ((fun magic -> ((fun rest1 -> ((fun gotTag -> ((fun rest2 -> ((fun gotLen -> ((fun gotSum -> ((fun payload -> (if (if (magic = v_Vuna_dCompiler_dCacheFormat_dframeMagic) then (gotTag = tag) else false) then (if (if (gotLen = (bi_strFromInt (bi_strLength payload))) then (gotSum = (bi_strFromInt (v_Vuna_dCompiler_dCacheFormat_dframeChecksum payload))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (payload)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (Base_dPair.v_Base_dPair_dsecondOf dtb__11))) (Base_dPair.v_Base_dPair_dsecondOf rest2))) (Base_dPair.v_Base_dPair_dfirstOf rest2))) (Base_dPair.v_Base_dPair_dsecondOf rest1))) (Base_dPair.v_Base_dPair_dfirstOf rest1))) (Base_dPair.v_Base_dPair_dsecondOf dtb__12))) (Base_dPair.v_Base_dPair_dfirstOf dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCacheFormat_dreadFramed = (fun tag path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((v_Vuna_dCompiler_dCacheFormat_dframeDecode tag) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
