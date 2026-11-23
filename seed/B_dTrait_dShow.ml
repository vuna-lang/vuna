open Vuna_runtime
type 'a0 t_Show = C_Show_Show of (('a0) -> string)
and 'a0 t_DebugShow = C_DebugShow_DebugShow of (('a0) -> string)

# 14 "Base/Trait/Show.vuna"
let v_Show_u0077d73cf424e521_uString = (C_Show_Show ((fun s -> (dt_show_string s))))

# 11 "Base/Trait/Show.vuna"
let v_show = (fun _ud x0 -> (match _ud with
  | C_Show_Show (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Trait/Show.vuna"
let v_DebugShow_ub9614133c0738231_ua = (fun _uctx0 -> (C_DebugShow_DebugShow ((fun x -> ((v_show _uctx0) x)))))

# 21 "Base/Trait/Show.vuna"
let v_debugShow = (fun _ud x0 -> (match _ud with
  | C_DebugShow_DebugShow (dtb__1) -> (dtb__1 x0)
  | _ -> failwith "DT: impossible branch"
))

# 31 "Base/Trait/Show.vuna"
let v_dbgShow = (fun _uctx0 x -> (let _u = (if ((dtp_log_on 3) "Base.Trait.Show") then (((dtp_log_emit 3) "Base.Trait.Show") ((v_debugShow _uctx0) x)) else 0) in x))
