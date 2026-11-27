open Vuna_runtime
type 'a0 t_MutRef = ('a0 ref)

# 19 "Base/Container/MutRef.vuna"
let v_new = (fun dtb_u_u4 -> (let dtb_u_u6 = ((fun x -> ref x) dtb_u_u4) in (Obj.repr ((fun (dtb_u_u7 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u6)))))

# 23 "Base/Container/MutRef.vuna"
let v_read = (fun dtb_u_u11 -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) (let dtb_u_u12 = dtb_u_u11 in dtb_u_u12))))

# 27 "Base/Container/MutRef.vuna"
let v_write = (fun dtb_u_u16 dtb_u_u17 -> (Obj.repr ((fun (dtb_u_u22 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = Obj.obj ((B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) (let dtb_u_u25 = dtb_u_u16 in dtb_u_u25)) dtb_u_u17))) in (let dtb_u_u26 = (dtb_u_u23 dtb_u_u22) in (let dtb_u_u28 = B_dData_dUnit.C_Unit_MkUnit in dtb_u_u28)))))))

# 34 "Base/Container/MutRef.vuna"
let v_modify = (fun dtb_u_u33 dtb_u_u34 -> (Obj.repr ((fun (dtb_u_u39 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u40 = Obj.obj ((v_read dtb_u_u33)) in (let dtb_u_u42 = (dtb_u_u40 dtb_u_u39) in ((Obj.magic ((v_write dtb_u_u33) (dtb_u_u34 dtb_u_u42))) dtb_u_u39)))))))

# 41 "Base/Container/MutRef.vuna"
let v_withMutRef = (fun dtb_u_u46 dtb_u_u47 -> (B_dEffect_dCore.v_dropEffHead (dtb_u_u47 ((fun x -> ref x) dtb_u_u46))))

# 45 "Base/Container/MutRef.vuna"
let v_withMutRefPure = (fun dtb_u_u50 dtb_u_u51 -> (B_dEffect_dCore.v_runPure ((v_withMutRef dtb_u_u50) dtb_u_u51)))

# 15 "Base/Container/MutRef.vuna"
let v_cell = (fun dtb_u_u53 -> (let dtb_u_u54 = dtb_u_u53 in dtb_u_u54))
