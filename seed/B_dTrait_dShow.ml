open Vuna_runtime
type 'a0 t_Show = C_Show_Show of (('a0) -> string)
and 'a0 t_DebugShow = C_DebugShow_DebugShow of (('a0) -> string)

# 14 "Base/Trait/Show.vuna"
let v_Show_uString = (C_Show_Show ((fun s -> (dt_show_string s))))

# 11 "Base/Trait/Show.vuna"
let v_show = (fun _ud x0 -> (match _ud with
  | C_Show_Show (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Trait/Show.vuna"
let v_DebugShow_ua = (fun _uctx0 -> (C_DebugShow_DebugShow ((fun x -> ((v_show _uctx0) x)))))

# 21 "Base/Trait/Show.vuna"
let v_debugShow = (fun _ud x0 -> (match _ud with
  | C_DebugShow_DebugShow (dtb__1) -> (dtb__1 x0)
  | _ -> failwith "DT: impossible branch"
))

# 31 "Base/Trait/Show.vuna"
let v_dbgShow = (fun _uctx0 x -> ((fun _u -> x) (if (dtp_debug_on 0) then (dtp_debug_line ((v_debugShow _uctx0) x)) else 0)))
