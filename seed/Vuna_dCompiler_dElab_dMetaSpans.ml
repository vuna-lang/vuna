open Vuna_runtime
type t_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox = { f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems : (int, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanTag : int }

let v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanRef = (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanTag = 0 }))

let v_Vuna_dCompiler_dElab_dMetaSpans_dresetMetaSpans = (fun _u -> (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanRef) { f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanTag = 0 })))

let v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan = (fun m sp -> ((fun box -> (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanRef) { f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = sp }, (box).f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems)); f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanTag = (box).f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanTag }))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanRef))))

let rec v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> (if (dtb__2 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3)) else ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf = (fun m -> ((v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta m) ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanRef))).f_Vuna_dCompiler_dElab_dMetaSpans_dMetaSpanBox_metaSpanItems))
