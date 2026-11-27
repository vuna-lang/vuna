open Vuna_runtime
type 'a0 t_MutRef = ('a0 ref)

# 19 "Base/Container/MutRef.vuna"
let v_new = (fun x -> (let x = ((fun x -> ref x) x) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))

# 23 "Base/Container/MutRef.vuna"
let v_read = (fun m -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) (let dtb__0 = m in dtb__0))))

# 27 "Base/Container/MutRef.vuna"
let v_write = (fun m v -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__1 = Obj.obj (e) in (let dtb__2 = Obj.obj ((k (dtb__1 u))) in (dtb__2 u)))))) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) (let dtb__3 = m in dtb__3)) v))) (fun _u -> (let x = B_dData_dUnit.C_Unit_MkUnit in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 34 "Base/Container/MutRef.vuna"
let v_modify = (fun m f -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) (v_read m)) (fun x -> ((v_write m) (f x)))))

# 41 "Base/Container/MutRef.vuna"
let v_withMutRef = (fun init body -> (B_dEffect_dCore.v_dropEffHead (body ((fun x -> ref x) init))))

# 45 "Base/Container/MutRef.vuna"
let v_withMutRefPure = (fun init body -> (B_dEffect_dCore.v_runPure ((v_withMutRef init) body)))

# 15 "Base/Container/MutRef.vuna"
let v_cell = (fun p -> (let dtb__6 = p in dtb__6))
