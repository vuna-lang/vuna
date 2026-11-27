open Vuna_runtime
type 'a0 t_MutRef = ('a0 ref)

# 19 "Base/Container/MutRef.vuna"
let v_new = (fun dtb_u_u4 -> (let dtb_u_u6 = ((fun x -> ref x) dtb_u_u4) in (Obj.repr ((fun (dtb_u_u7 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u6)))))

# 19 "Base/Container/MutRef.vuna"
let v_new_u_udirect = (fun x _u_ueffTok -> (let dtb_u_u6 = ((fun x -> ref x) x) in dtb_u_u6))

# 23 "Base/Container/MutRef.vuna"
let v_read = (fun dtb_u_u11 -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) (let dtb_u_u12 = dtb_u_u11 in dtb_u_u12))))

# 23 "Base/Container/MutRef.vuna"
let v_read_u_udirect = (fun m _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_raise ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) (let dtb_u_u12 = m in dtb_u_u12)))) _u_ueffTok))

# 27 "Base/Container/MutRef.vuna"
let v_write = (fun dtb_u_u16 dtb_u_u17 -> (Obj.repr ((fun (dtb_u_u22 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u26 = ((B_dEffect_dCore.v_raise_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) (let dtb_u_u25 = dtb_u_u16 in dtb_u_u25)) dtb_u_u17)) dtb_u_u22) in (let dtb_u_u28 = B_dData_dUnit.C_Unit_MkUnit in dtb_u_u28))))))

# 27 "Base/Container/MutRef.vuna"
let v_write_u_udirect = (fun m v _u_ueffTok -> (let dtb_u_u26 = ((B_dEffect_dCore.v_raise_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) (let dtb_u_u25 = m in dtb_u_u25)) v)) _u_ueffTok) in (let dtb_u_u28 = B_dData_dUnit.C_Unit_MkUnit in dtb_u_u28)))

# 34 "Base/Container/MutRef.vuna"
let v_modify = (fun dtb_u_u33 dtb_u_u34 -> (Obj.repr ((fun (dtb_u_u39 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u42 = ((v_read_u_udirect dtb_u_u33) dtb_u_u39) in ((Obj.magic ((v_write dtb_u_u33) (dtb_u_u34 dtb_u_u42))) dtb_u_u39))))))

# 34 "Base/Container/MutRef.vuna"
let v_modify_u_udirect = (fun m f _u_ueffTok -> (let dtb_u_u42 = ((v_read_u_udirect m) _u_ueffTok) in ((Obj.magic ((v_write m) (f dtb_u_u42))) _u_ueffTok)))

# 41 "Base/Container/MutRef.vuna"
let v_withMutRef = (fun init body -> (B_dEffect_dCore.v_dropEffHead (body ((fun x -> ref x) init))))

# 41 "Base/Container/MutRef.vuna"
let v_withMutRef_u_udirect = (fun init body _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_dropEffHead (body ((fun x -> ref x) init)))) _u_ueffTok))

# 45 "Base/Container/MutRef.vuna"
let v_withMutRefPure = (fun init body -> (B_dEffect_dCore.v_runPure ((v_withMutRef init) body)))

# 15 "Base/Container/MutRef.vuna"
let v_cell = (fun p -> (let dtb__6 = p in dtb__6))
