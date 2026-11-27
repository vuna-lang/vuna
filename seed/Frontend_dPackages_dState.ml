open Vuna_runtime
# 17 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirName = ".vuna"

# 21 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateEnv = "VUNA_PKG_STATE"

# 25 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirOf = (fun (pkgDir : string) (override : string) -> (if (override = "") then (String.concat "" [pkgDir; "/"; v_pkgStateDirName]) else override))

# 29 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirEff = (fun (nEnv : string) (pkgDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) v_pkgStateEnv)) (fun override -> (let x = ((v_pkgStateDirOf pkgDir) override) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 44 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ifaceDirOf = (fun (stateDir : string) -> (stateDir ^ "/iface"))

# 66 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pathIsDir = (fun (nFs : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) path) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 48 "Vuna/Compiler/Frontend/Packages/State.vuna"
let rec v_ensureDirEff = (fun (nFs : string) (fuel : int) (path : string) -> (if (fuel <= 0) then (let x = 1 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) ((v_pathIsDir nFs) path)) (fun here -> (if here then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) (((v_ensureDirEff nFs) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) ((v_pathIsDir nFs) path)) (fun stillMissing -> (if stillMissing then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((B_dEffect_dFs.v_fsMakeDir nFs) path))))))))))))

# 36 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ensurePkgStateDirEff = (fun (nFs : string) (nEnv : string) (pkgDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__10 = Obj.obj (e) in (let dtb__11 = Obj.obj ((k (dtb__10 u))) in (dtb__11 u)))))) ((v_pkgStateDirEff nEnv) pkgDir)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) (((v_ensureDirEff nFs) ((String.length dir) + 2)) dir)) (fun _u -> (let x = dir in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
