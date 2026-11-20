open Vuna_runtime
type 'a0 t_Stream = C_Stream_MkStream of ((B_dData_dUnit.t_Unit) -> 'a0 t_StreamStep)
and 'a0 t_StreamStep = C_StreamStep_SEnd | C_StreamStep_SOne of ('a0) * ('a0 t_Stream) | C_StreamStep_SSkip of ('a0 t_Stream)

# 29 "Base/Data/Stream.vuna"
let v_uncons = (fun mc0 -> (match mc0 with
  | C_Stream_MkStream (dtb__0) -> (dtb__0 B_dData_dUnit.C_Unit_MkUnit)
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/Stream.vuna"
let v_empty = (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> C_StreamStep_SEnd)))

# 37 "Base/Data/Stream.vuna"
let v_singleton = (fun x -> (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> (C_StreamStep_SOne (x, v_empty))))))

# 41 "Base/Data/Stream.vuna"
let v_cons = (fun x s -> (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> (C_StreamStep_SOne (x, s))))))

# 45 "Base/Data/Stream.vuna"
let rec v_fromList = (fun xs -> (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> (v_fromListStep xs)))))
# 48 "Base/Data/Stream.vuna"
and v_fromListStep = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (C_StreamStep_SOne (dtb__1, (v_fromList dtb__2)))
  | B_dData_dList.C_List_Nil -> C_StreamStep_SEnd
  | _ -> failwith "DT: impossible branch"
))

# 53 "Base/Data/Stream.vuna"
let rec v_map = (fun f s -> (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> ((v_mapStep f) (v_uncons s))))))
# 56 "Base/Data/Stream.vuna"
and v_mapStep = (fun mc0 mc1 -> (match mc1 with
  | C_StreamStep_SSkip (dtb__3) -> (C_StreamStep_SSkip (((v_map mc0) dtb__3)))
  | C_StreamStep_SOne (dtb__4, dtb__5) -> (C_StreamStep_SOne ((mc0 dtb__4), ((v_map mc0) dtb__5)))
  | C_StreamStep_SEnd -> C_StreamStep_SEnd
  | _ -> failwith "DT: impossible branch"
))

# 62 "Base/Data/Stream.vuna"
let rec v_filter = (fun p s -> (C_Stream_MkStream ((fun (_u : B_dData_dUnit.t_Unit) -> ((v_filterStep p) (v_uncons s))))))
# 65 "Base/Data/Stream.vuna"
and v_filterStep = (fun mc0 mc1 -> (match mc1 with
  | C_StreamStep_SSkip (dtb__6) -> (C_StreamStep_SSkip (dtb__6))
  | C_StreamStep_SOne (dtb__7, dtb__8) -> (if (mc0 dtb__7) then (C_StreamStep_SOne (dtb__7, ((v_filter mc0) dtb__8))) else (C_StreamStep_SSkip (((v_filter mc0) dtb__8))))
  | C_StreamStep_SEnd -> C_StreamStep_SEnd
  | _ -> failwith "DT: impossible branch"
))

# 71 "Base/Data/Stream.vuna"
let rec v_take = (fun (n : int) s -> (if (n <= 0) then B_dData_dList.C_List_Nil else ((v_takeStep n) (v_uncons s))))
# 74 "Base/Data/Stream.vuna"
and v_takeStep = (fun (mc0 : int) mc1 -> (match mc1 with
  | C_StreamStep_SSkip (dtb__9) -> ((v_take mc0) dtb__9)
  | C_StreamStep_SOne (dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, ((v_take (mc0 - 1)) dtb__11)))
  | C_StreamStep_SEnd -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 80 "Base/Data/Stream.vuna"
let rec v_toList = (fun s -> (v_toListStep (v_uncons s)))
# 83 "Base/Data/Stream.vuna"
and v_toListStep = (fun mc0 -> (match mc0 with
  | C_StreamStep_SSkip (dtb__12) -> (v_toList dtb__12)
  | C_StreamStep_SOne (dtb__13, dtb__14) -> (B_dData_dList.C_List__x58__x58_ (dtb__13, (v_toList dtb__14)))
  | C_StreamStep_SEnd -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 89 "Base/Data/Stream.vuna"
let rec v_foldl = (fun f acc s -> (((v_foldlStep f) acc) (v_uncons s)))
# 92 "Base/Data/Stream.vuna"
and v_foldlStep = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_StreamStep_SSkip (dtb__15) -> (((v_foldl mc0) mc1) dtb__15)
  | C_StreamStep_SOne (dtb__16, dtb__17) -> (((v_foldl mc0) ((mc0 mc1) dtb__16)) dtb__17)
  | C_StreamStep_SEnd -> mc1
  | _ -> failwith "DT: impossible branch"
))
