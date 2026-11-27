open Vuna_runtime
# 17 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirName = ".vuna"

# 21 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateEnv = "VUNA_PKG_STATE"

# 25 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirOf = (fun (dtb_u_u1 : string) (dtb_u_u2 : string) -> (if (dtb_u_u2 = "") then (String.concat "" [dtb_u_u1; "/"; v_pkgStateDirName]) else dtb_u_u2))

# 29 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirEff = (fun (dtb_u_u3 : string) (dtb_u_u6 : string) -> (Obj.repr ((fun (dtb_u_u11 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u12 = Obj.obj (((B_dEffect_dEnv.v_envGetEnv dtb_u_u3) v_pkgStateEnv)) in (let dtb_u_u14 = (dtb_u_u12 dtb_u_u11) in (let dtb_u_u16 = ((v_pkgStateDirOf dtb_u_u6) dtb_u_u14) in dtb_u_u16)))))))

# 44 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ifaceDirOf = (fun (dtb_u_u18 : string) -> (dtb_u_u18 ^ "/iface"))

# 66 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pathIsDir = (fun (dtb_u_u19 : string) (dtb_u_u22 : string) -> (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u28 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u19) dtb_u_u22)) in (let dtb_u_u30 = (dtb_u_u28 dtb_u_u27) in (if dtb_u_u30 then ((Obj.magic ((B_dEffect_dFs.v_fsIsDirectory dtb_u_u19) dtb_u_u22)) dtb_u_u27) else (let dtb_u_u32 = false in dtb_u_u32))))))))

# 48 "Vuna/Compiler/Frontend/Packages/State.vuna"
let rec v_ensureDirEff = (fun (dtb_u_u34 : string) (dtb_u_u37 : int) (dtb_u_u38 : string) -> (if (dtb_u_u37 <= 0) then (let dtb_u_u40 = 1 in (Obj.repr ((fun (dtb_u_u41 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u40)))) else (if (if (if (dtb_u_u38 = "") then true else (dtb_u_u38 = ".")) then true else (dtb_u_u38 = "/")) then (let dtb_u_u43 = 0 in (Obj.repr ((fun (dtb_u_u44 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u43)))) else (Obj.repr ((fun (dtb_u_u49 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u50 = Obj.obj (((v_pathIsDir dtb_u_u34) dtb_u_u38)) in (let dtb_u_u52 = (dtb_u_u50 dtb_u_u49) in (if dtb_u_u52 then (let dtb_u_u54 = 0 in dtb_u_u54) else (let dtb_u_u61 = Obj.obj ((((v_ensureDirEff dtb_u_u34) (dtb_u_u37 - 1)) (Base_dSource.v_parentOfPath dtb_u_u38))) in (let dtb_u_u63 = (dtb_u_u61 dtb_u_u49) in (let dtb_u_u69 = Obj.obj (((v_pathIsDir dtb_u_u34) dtb_u_u38)) in (let dtb_u_u71 = (dtb_u_u69 dtb_u_u49) in (if dtb_u_u71 then (let dtb_u_u73 = 0 in dtb_u_u73) else ((Obj.magic ((B_dEffect_dFs.v_fsMakeDir dtb_u_u34) dtb_u_u38)) dtb_u_u49)))))))))))))))

# 36 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ensurePkgStateDirEff = (fun (dtb_u_u75 : string) (dtb_u_u76 : string) (dtb_u_u80 : string) -> (Obj.repr ((fun (dtb_u_u85 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u86 = Obj.obj (((v_pkgStateDirEff dtb_u_u76) dtb_u_u80)) in (let dtb_u_u88 = (dtb_u_u86 dtb_u_u85) in (let dtb_u_u94 = Obj.obj ((((v_ensureDirEff dtb_u_u75) ((String.length dtb_u_u88) + 2)) dtb_u_u88)) in (let dtb_u_u96 = (dtb_u_u94 dtb_u_u85) in (let dtb_u_u98 = dtb_u_u88 in dtb_u_u98)))))))))
