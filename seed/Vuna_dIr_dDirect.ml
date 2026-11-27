open Vuna_runtime
# 29 "Vuna/Ir/Direct.vuna"
let rec v_usesFuel = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then 0 else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__0) -> (if ((Vuna_dIr_dModel.v_sameBinderId b) dtb__0) then 1 else 0)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__1, dtb__2, dtb__3, dtb__4) -> (((v_usesList (fuel - 1)) b) dtb__4)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__5, dtb__6, dtb__7) -> (((v_usesFields (fuel - 1)) b) dtb__7)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__8, dtb__9, dtb__10, dtb__11) -> (((v_usesFuel (fuel - 1)) b) dtb__8)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__12, dtb__13, dtb__14, dtb__15) -> ((((v_usesFuel (fuel - 1)) b) dtb__12) + (((v_usesFields (fuel - 1)) b) dtb__14))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__16, dtb__17) -> (((v_usesList (fuel - 1)) b) dtb__17)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__18, dtb__19, dtb__20) -> (((v_usesFuel (fuel - 1)) b) dtb__20)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__21, dtb__22, dtb__23) -> ((((v_usesFuel (fuel - 1)) b) dtb__22) + (((v_usesFuel (fuel - 1)) b) dtb__23))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__24, dtb__25, dtb__26) -> (((v_usesFuel (fuel - 1)) b) dtb__26)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__27, dtb__28, dtb__29) -> ((((v_usesFuel (fuel - 1)) b) dtb__28) + (((v_usesFuel (fuel - 1)) b) dtb__29))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__30) -> (((v_usesFuel (fuel - 1)) b) dtb__30)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__31, dtb__32, dtb__33) -> (((((v_usesFuel (fuel - 1)) b) dtb__31) + (((v_usesFuel (fuel - 1)) b) dtb__32)) + (((v_usesFuel (fuel - 1)) b) dtb__33))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__34, dtb__35, dtb__36, dtb__37) -> ((((v_usesFuel (fuel - 1)) b) dtb__36) + (((v_usesAlts (fuel - 1)) b) dtb__37))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> ((((((v_usesFuel (fuel - 1)) b) dtb__38) + (((v_usesAltM (fuel - 1)) b) dtb__40)) + (((v_usesAltM (fuel - 1)) b) dtb__41)) + (((v_usesAltM (fuel - 1)) b) dtb__42))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__43) -> (((v_usesList (fuel - 1)) b) dtb__43)
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> (((v_usesFuel (fuel - 1)) b) dtb__48)
  | _ -> 0
)))
# 53 "Vuna/Ir/Direct.vuna"
and v_usesList = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> ((((v_usesFuel (fuel - 1)) b) dtb__49) + (((v_usesList (fuel - 1)) b) dtb__50))
  | _ -> failwith "DT: impossible branch"
)))
# 62 "Vuna/Ir/Direct.vuna"
and v_usesFields = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match fs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> ((((v_usesFuel (fuel - 1)) b) (B_dData_dPair.v_secondOf dtb__51)) + (((v_usesFields (fuel - 1)) b) dtb__52))
  | _ -> failwith "DT: impossible branch"
)))
# 71 "Vuna/Ir/Direct.vuna"
and v_usesAlts = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match alts with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> ((((v_usesFuel (fuel - 1)) b) (Vuna_dIr_dModel.v_irAltBodyOf dtb__53)) + (((v_usesAlts (fuel - 1)) b) dtb__54))
  | _ -> failwith "DT: impossible branch"
)))
# 80 "Vuna/Ir/Direct.vuna"
and v_usesAltM = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then 0 else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (((v_usesFuel (fuel - 1)) b) (Vuna_dIr_dModel.v_irAltBodyOf dtb__55))
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Ir/Direct.vuna"
let v_usesOf = (fun (b : Vuna_dIr_dModel.t_IrBinder) (ir : Vuna_dIr_dModel.t_Ir) -> (((v_usesFuel (64 + (4 * (Vuna_dIr_dModel.v_irSize ir)))) b) ir))

# 92 "Vuna/Ir/Direct.vuna"
let rec v_substFuel = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__56) -> (if ((Vuna_dIr_dModel.v_sameBinderId b) dtb__56) then arg else ir)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, dtb__60) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, ((((v_substList (fuel - 1)) b) arg) dtb__60)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__61, dtb__62, dtb__63) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__61, dtb__62, ((((v_substFields (fuel - 1)) b) arg) dtb__63)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__64, dtb__65, dtb__66, dtb__67) -> (Vuna_dIr_dModel.C_Ir_IrProj (((((v_substFuel (fuel - 1)) b) arg) dtb__64), dtb__65, dtb__66, dtb__67))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__68, dtb__69, dtb__70, dtb__71) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((((v_substFuel (fuel - 1)) b) arg) dtb__68), dtb__69, ((((v_substFields (fuel - 1)) b) arg) dtb__70), dtb__71))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__72, dtb__73) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__72, ((((v_substList (fuel - 1)) b) arg) dtb__73)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__74, dtb__75, dtb__76) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__74, dtb__75, ((((v_substFuel (fuel - 1)) b) arg) dtb__76)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__77, dtb__78, dtb__79) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__77, ((((v_substFuel (fuel - 1)) b) arg) dtb__78), ((((v_substFuel (fuel - 1)) b) arg) dtb__79)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__80, dtb__81, dtb__82) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__80, dtb__81, ((((v_substFuel (fuel - 1)) b) arg) dtb__82)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__83, dtb__84, dtb__85) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__83, ((((v_substFuel (fuel - 1)) b) arg) dtb__84), ((((v_substFuel (fuel - 1)) b) arg) dtb__85)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__86) -> (Vuna_dIr_dModel.C_Ir_IrTail (((((v_substFuel (fuel - 1)) b) arg) dtb__86)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__87, dtb__88, dtb__89) -> (Vuna_dIr_dModel.C_Ir_IrIf (((((v_substFuel (fuel - 1)) b) arg) dtb__87), ((((v_substFuel (fuel - 1)) b) arg) dtb__88), ((((v_substFuel (fuel - 1)) b) arg) dtb__89)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__90, dtb__91, dtb__92, dtb__93) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__90, dtb__91, ((((v_substFuel (fuel - 1)) b) arg) dtb__92), ((((v_substAlts (fuel - 1)) b) arg) dtb__93)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((((v_substFuel (fuel - 1)) b) arg) dtb__94), dtb__95, ((((v_substAltM (fuel - 1)) b) arg) dtb__96), ((((v_substAltM (fuel - 1)) b) arg) dtb__97), ((((v_substAltM (fuel - 1)) b) arg) dtb__98)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__99) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((((v_substList (fuel - 1)) b) arg) dtb__99)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__100, dtb__101, dtb__102, dtb__103, ((((v_substFuel (fuel - 1)) b) arg) dtb__104)))
  | _ -> ir
)))
# 116 "Vuna/Ir/Direct.vuna"
and v_substList = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (B_dData_dList.C_List__x58__x58_ (((((v_substFuel (fuel - 1)) b) arg) dtb__105), ((((v_substList (fuel - 1)) b) arg) dtb__106)))
  | _ -> failwith "DT: impossible branch"
)))
# 125 "Vuna/Ir/Direct.vuna"
and v_substFields = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__107); B_dData_dPair.f_Pair_second = ((((v_substFuel (fuel - 1)) b) arg) (B_dData_dPair.v_secondOf dtb__107)) }, ((((v_substFields (fuel - 1)) b) arg) dtb__108)))
  | _ -> failwith "DT: impossible branch"
)))
# 134 "Vuna/Ir/Direct.vuna"
and v_substAlts = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__109).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__109).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_substFuel (fuel - 1)) b) arg) (dtb__109).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((((v_substAlts (fuel - 1)) b) arg) dtb__110)))
  | _ -> failwith "DT: impossible branch"
)))
# 143 "Vuna/Ir/Direct.vuna"
and v_substAltM = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__111).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__111).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_substFuel (fuel - 1)) b) arg) (dtb__111).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 89 "Vuna/Ir/Direct.vuna"
let v_substIr = (fun (b : Vuna_dIr_dModel.t_IrBinder) (arg : Vuna_dIr_dModel.t_Ir) (ir : Vuna_dIr_dModel.t_Ir) -> ((((v_substFuel (64 + (4 * (Vuna_dIr_dModel.v_irSize ir)))) b) arg) ir))

# 152 "Vuna/Ir/Direct.vuna"
let v_binderSafeName = (fun (b : Vuna_dIr_dModel.t_IrBinder) -> (if ((b).Vuna_dIr_dModel.f_IrBinder_irBinderId < 0) then ("dtb__n" ^ (string_of_int (0 - (b).Vuna_dIr_dModel.f_IrBinder_irBinderId))) else ("dtb__" ^ (string_of_int (b).Vuna_dIr_dModel.f_IrBinder_irBinderId))))

# 159 "Vuna/Ir/Direct.vuna"
let v_safeBinder = (fun (b : Vuna_dIr_dModel.t_IrBinder) -> { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (Vuna_dIr_dModel.C_IrBName_IrBUser ((v_binderSafeName b))); Vuna_dIr_dModel.f_IrBinder_irBinderErased = (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (b).Vuna_dIr_dModel.f_IrBinder_irBinderTy })

# 162 "Vuna/Ir/Direct.vuna"
let v_sameIr = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__112) -> ((Vuna_dIr_dModel.v_sameBinderId mc0) dtb__112)
  | _ -> false
))

# 166 "Vuna/Ir/Direct.vuna"
let v_isEffThunk = (fun (fam : string) (ctor : string) -> (if (fam = Vuna_dIr_dModel.v_irEffTypeName) then (ctor = Vuna_dIr_dModel.v_irEffMkCtor) else false))

# 169 "Vuna/Ir/Direct.vuna"
let v_effFieldOf = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__113, dtb__114, dtb__115, dtb__116) -> (match dtb__116 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (match dtb__118 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb__113) dtb__114) then (B_dData_dMaybe.C_Maybe_Just (dtb__117)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 178 "Vuna/Ir/Direct.vuna"
let rec v_applyAll = (fun (mc0 : Vuna_dIr_dModel.t_Ir) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, dtb__119))) dtb__120)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Ir/Direct.vuna"
let rec v_listLen = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (1 + (v_listLen dtb__122))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Ir/Direct.vuna"
let rec v_flattenCall = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__123, dtb__124, dtb__125) -> (match (v_flattenCall dtb__124) with
  | { B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = dtb__127 } -> { B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__127) (B_dData_dList.C_List__x58__x58_ (dtb__125, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 192 "Vuna/Ir/Direct.vuna"
let v_directCallOf = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (action : Vuna_dIr_dModel.t_Ir) (token : Vuna_dIr_dModel.t_Ir) -> (let nd_uscrut3 = (v_flattenCall action) in (match nd_uscrut3 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (match dtb__128 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__130) -> (match (eff dtb__130) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (if (if (dtb__131 > 0) then ((v_listLen dtb__129) = dtb__131) else false) then (B_dData_dMaybe.C_Maybe_Just (((v_applyAll (Vuna_dIr_dModel.C_Ir_IrGlobal ((dtb__130 ^ "__direct")))) ((B_dData_dList.v_append dtb__129) (B_dData_dList.C_List__x58__x58_ (token, B_dData_dList.C_List_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Ir/Direct.vuna"
let v_applyToken = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (action : Vuna_dIr_dModel.t_Ir) (token : Vuna_dIr_dModel.t_Ir) -> (match (((v_directCallOf eff) action) token) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> dtb__132
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Ir/Direct.vuna"
let v_applyCont = (fun (mc0 : Vuna_dIr_dModel.t_Ir) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__133, dtb__134, dtb__135) -> (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | B_dData_dList.C_List_Nil -> (let v2 = (v_safeBinder dtb__136) in (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (v2, B_dData_dList.C_List_Nil)), mc1, (((v_substIr dtb__136) (Vuna_dIr_dModel.C_Ir_IrVar (v2))) dtb__135))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, mc1))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, mc1))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, mc1))
))

# 211 "Vuna/Ir/Direct.vuna"
let rec v_runAction = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (action : Vuna_dIr_dModel.t_Ir) (token : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, action, token)) else (let nd_uscrut4 = action in (match nd_uscrut4 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__138, dtb__139, dtb__140) -> (match dtb__139 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__141, dtb__142, dtb__143) -> (match dtb__141 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | B_dData_dList.C_List_Nil -> (let b2 = (v_safeBinder dtb__144) in ((((v_runAction eff) (fuel - 1)) (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (b2, B_dData_dList.C_List_Nil)), dtb__140, (((v_substIr dtb__144) (Vuna_dIr_dModel.C_Ir_IrVar (b2))) dtb__143)))) token))
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> ((((v_runAction eff) (fuel - 1)) dtb__146) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> ((((v_runAction eff) (fuel - 1)) dtb__147) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> ((((v_runAction eff) (fuel - 1)) dtb__148) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__149, dtb__150, dtb__151) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__149, dtb__150, ((((v_runAction eff) (fuel - 1)) dtb__151) token)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__152, dtb__153, ((((v_runAltM eff) (fuel - 1)) dtb__154) token), ((((v_runAltM eff) (fuel - 1)) dtb__155) token), ((((v_runAltM eff) (fuel - 1)) dtb__156) token)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__157, dtb__158, dtb__159, dtb__160) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__157, dtb__158, dtb__159, ((((v_runAlt eff) (fuel - 1)) dtb__160) token)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__161, dtb__162, dtb__163) -> (Vuna_dIr_dModel.C_Ir_IrIf (dtb__161, ((((v_runAction eff) (fuel - 1)) dtb__162) token), ((((v_runAction eff) (fuel - 1)) dtb__163) token)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__164, dtb__165, dtb__166) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__164, dtb__165, ((((v_runAction eff) (fuel - 1)) dtb__166) token)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__167, dtb__168, dtb__169, dtb__170) -> (match dtb__170 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match dtb__171 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__173, dtb__174, dtb__175) -> (match dtb__173 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (match dtb__177 with
  | B_dData_dList.C_List_Nil -> (match dtb__172 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb__167) dtb__168) then (((v_substIr dtb__176) token) dtb__175) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, action, token)))
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> ((((v_runAction eff) (fuel - 1)) dtb__178) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__179) -> ((((v_runAction eff) (fuel - 1)) dtb__179) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> ((((v_runAction eff) (fuel - 1)) dtb__180) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> ((((v_runAction eff) (fuel - 1)) dtb__181) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> ((((v_runAction eff) (fuel - 1)) dtb__182) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind eff) fuel) action) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> ((((v_runAction eff) (fuel - 1)) dtb__183) token)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), token))
  | _ -> failwith "DT: impossible branch"
)
))))
# 232 "Vuna/Ir/Direct.vuna"
and v_runAltM = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (token : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__184).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__184).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_runAction eff) (fuel - 1)) (dtb__184).Vuna_dIr_dModel.f_IrAlt_irAltBody) token) }))
  | _ -> failwith "DT: impossible branch"
)))
# 241 "Vuna/Ir/Direct.vuna"
and v_runAlt = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (token : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__185).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__185).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_runAction eff) (fuel - 1)) (dtb__185).Vuna_dIr_dModel.f_IrAlt_irAltBody) token) }, ((((v_runAlt eff) (fuel - 1)) dtb__186) token)))
  | _ -> failwith "DT: impossible branch"
)))
# 259 "Vuna/Ir/Direct.vuna"
and v_matchBind = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut3 = ir in (match nd_uscrut3 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__187, dtb__188, dtb__189) -> (match dtb__188 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__190, dtb__191, dtb__192) -> (match dtb__191 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__193, dtb__194, dtb__195) -> (match dtb__193 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | B_dData_dList.C_List_Nil -> (match dtb__195 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__200, dtb__201, dtb__202, dtb__203) -> (match dtb__203 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__206, dtb__207, dtb__208) -> (match dtb__206 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (match dtb__210 with
  | B_dData_dList.C_List_Nil -> (match dtb__205 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb__200) dtb__201) then (let nd_uscrut35 = dtb__208 in (match nd_uscrut35 with
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__211, dtb__212, dtb__213, dtb__214) -> (match dtb__213 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__215) -> (match dtb__214 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (match dtb__217 with
  | B_dData_dList.C_List_Nil -> (if ((Vuna_dIr_dModel.v_sameBinderId dtb__196) dtb__215) then (let nd_uscrut45 = (Vuna_dIr_dModel.v_irAltBindersOf dtb__216) in (match nd_uscrut45 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__219 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut50 = (Vuna_dIr_dModel.v_irAltBodyOf dtb__216) in (match nd_uscrut50 with
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__220, dtb__221, dtb__222, dtb__223) -> (match dtb__222 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__224, dtb__225, dtb__226) -> (match dtb__225 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__227) -> (match dtb__226 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__228, dtb__229, dtb__230) -> (match dtb__229 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__231) -> (match dtb__230 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__232) -> (match dtb__223 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (match dtb__234 with
  | B_dData_dList.C_List_Nil -> (if (if (if ((Vuna_dIr_dModel.v_sameBinderId dtb__198) dtb__227) then ((Vuna_dIr_dModel.v_sameBinderId dtb__218) dtb__231) else false) then ((Vuna_dIr_dModel.v_sameBinderId dtb__209) dtb__232) else false) then (let nd_uscrut68 = (Vuna_dIr_dModel.v_irAltBindersOf dtb__233) in (match nd_uscrut68 with
  | B_dData_dList.C_List__x58__x58_ (dtb__235, dtb__236) -> (match dtb__236 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut73 = (Vuna_dIr_dModel.v_irAltBodyOf dtb__233) in (match nd_uscrut73 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__237, dtb__238, dtb__239) -> (match dtb__238 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__240) -> (match dtb__239 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__241) -> (if (if ((Vuna_dIr_dModel.v_sameBinderId dtb__235) dtb__240) then ((Vuna_dIr_dModel.v_sameBinderId dtb__209) dtb__241) else false) then (B_dData_dMaybe.C_Maybe_Just (((((((((v_fuse eff) fuel) dtb__192) dtb__189) dtb__200) dtb__201) dtb__209) dtb__218))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 292 "Vuna/Ir/Direct.vuna"
and v_fuse = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (eAct : Vuna_dIr_dModel.t_Ir) (kAct : Vuna_dIr_dModel.t_Ir) (fam : string) (ctor : string) (u : Vuna_dIr_dModel.t_IrBinder) (a : Vuna_dIr_dModel.t_IrBinder) -> (let u2 = (v_safeBinder u) in (let a2 = (v_safeBinder a) in (let direct = (((v_directCallOf eff) eAct) (Vuna_dIr_dModel.C_Ir_IrVar (u2))) in (let arg = (match direct with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> dtb__244
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (a2)), (Vuna_dIr_dModel.C_Ir_IrVar (u2))))
  | _ -> failwith "DT: impossible branch"
) in (let applied = ((v_applyCont kAct) arg) in (let body = ((((v_runAction eff) (fuel - 1)) applied) (Vuna_dIr_dModel.C_Ir_IrVar (u2))) in (let caseBody = (match (v_effFieldOf eAct) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)), dtb__242, body))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match direct with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> body
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, eAct, (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.v_irEffTypeName; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.v_irEffMkCtor })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)); Vuna_dIr_dModel.f_IrAlt_irAltBody = body }, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (Vuna_dIr_dModel.C_Ir_IrCtor (fam, ctor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u2, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, caseBody)), B_dData_dList.C_List_Nil))))))))))))

# 317 "Vuna/Ir/Direct.vuna"
let rec v_directIr = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match (((v_matchBind eff) fuel) ir) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> (((v_directIr eff) (fuel - 1)) dtb__245)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let ir1 = (((v_directChildren eff) (fuel - 1)) ir) in ir1)
  | _ -> failwith "DT: impossible branch"
)))
# 329 "Vuna/Ir/Direct.vuna"
and v_directChildren = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__246, dtb__247, dtb__248, dtb__249) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__246, dtb__247, dtb__248, (((v_directList eff) (fuel - 1)) dtb__249)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__250, dtb__251, dtb__252) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__250, dtb__251, (((v_directFields eff) (fuel - 1)) dtb__252)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__253, dtb__254, dtb__255, dtb__256) -> (Vuna_dIr_dModel.C_Ir_IrProj ((((v_directIr eff) (fuel - 1)) dtb__253), dtb__254, dtb__255, dtb__256))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__257, dtb__258, dtb__259, dtb__260) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd ((((v_directIr eff) (fuel - 1)) dtb__257), dtb__258, (((v_directFields eff) (fuel - 1)) dtb__259), dtb__260))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__261, dtb__262) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__261, (((v_directList eff) (fuel - 1)) dtb__262)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__263, dtb__264, dtb__265) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__263, dtb__264, (((v_directIr eff) (fuel - 1)) dtb__265)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__266, dtb__267, dtb__268) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__266, (((v_directIr eff) (fuel - 1)) dtb__267), (((v_directIr eff) (fuel - 1)) dtb__268)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__269, dtb__270, dtb__271) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__269, dtb__270, (((v_directIr eff) (fuel - 1)) dtb__271)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__272, dtb__273, dtb__274) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__272, (((v_directIr eff) (fuel - 1)) dtb__273), (((v_directIr eff) (fuel - 1)) dtb__274)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__275) -> (Vuna_dIr_dModel.C_Ir_IrTail ((((v_directIr eff) (fuel - 1)) dtb__275)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__276, dtb__277, dtb__278) -> (Vuna_dIr_dModel.C_Ir_IrIf ((((v_directIr eff) (fuel - 1)) dtb__276), (((v_directIr eff) (fuel - 1)) dtb__277), (((v_directIr eff) (fuel - 1)) dtb__278)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__279, dtb__280, dtb__281, dtb__282) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__279, dtb__280, (((v_directIr eff) (fuel - 1)) dtb__281), (((v_directAlts eff) (fuel - 1)) dtb__282)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (Vuna_dIr_dModel.C_Ir_IrNatCase ((((v_directIr eff) (fuel - 1)) dtb__283), dtb__284, (((v_directAltM eff) (fuel - 1)) dtb__285), (((v_directAltM eff) (fuel - 1)) dtb__286), (((v_directAltM eff) (fuel - 1)) dtb__287)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__288) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany ((((v_directList eff) (fuel - 1)) dtb__288)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__289, dtb__290, dtb__291, dtb__292, (((v_directIr eff) (fuel - 1)) dtb__293)))
  | _ -> ir
)))
# 352 "Vuna/Ir/Direct.vuna"
and v_directList = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (B_dData_dList.C_List__x58__x58_ ((((v_directIr eff) (fuel - 1)) dtb__294), (((v_directList eff) (fuel - 1)) dtb__295)))
  | _ -> failwith "DT: impossible branch"
)))
# 361 "Vuna/Ir/Direct.vuna"
and v_directFields = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__296); B_dData_dPair.f_Pair_second = (((v_directIr eff) (fuel - 1)) (B_dData_dPair.v_secondOf dtb__296)) }, (((v_directFields eff) (fuel - 1)) dtb__297)))
  | _ -> failwith "DT: impossible branch"
)))
# 370 "Vuna/Ir/Direct.vuna"
and v_directAlts = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__298).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__298).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_directIr eff) (fuel - 1)) (dtb__298).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, (((v_directAlts eff) (fuel - 1)) dtb__299)))
  | _ -> failwith "DT: impossible branch"
)))
# 379 "Vuna/Ir/Direct.vuna"
and v_directAltM = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__300) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__300).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__300).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_directIr eff) (fuel - 1)) (dtb__300).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 421 "Vuna/Ir/Direct.vuna"
let rec v_renameAll = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (((v_renameAll dtb__302) dtb__304) (((v_substIr dtb__301) (Vuna_dIr_dModel.C_Ir_IrVar (dtb__303))) mc2))
  | _ -> mc2
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Ir/Direct.vuna"
let rec v_safeIr = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__305, dtb__306, dtb__307) -> (let bs2 = ((B_dData_dList.v_map v_safeBinder) dtb__305) in (let body2 = (((v_renameAll dtb__305) bs2) dtb__307) in (Vuna_dIr_dModel.C_Ir_IrLam (bs2, dtb__306, ((v_safeIr (fuel - 1)) body2)))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__308, dtb__309, dtb__310) -> (let bs2 = ((B_dData_dList.v_map v_safeBinder) dtb__308) in (let body2 = (((v_renameAll dtb__308) bs2) dtb__310) in (Vuna_dIr_dModel.C_Ir_IrLet (bs2, ((v_safeIr (fuel - 1)) dtb__309), ((v_safeIr (fuel - 1)) body2)))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__311, dtb__312, dtb__313, dtb__314) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__311, dtb__312, ((v_safeIr (fuel - 1)) dtb__313), ((v_safeAlts (fuel - 1)) dtb__314)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_safeIr (fuel - 1)) dtb__315), dtb__316, ((v_safeAltM (fuel - 1)) dtb__317), ((v_safeAltM (fuel - 1)) dtb__318), ((v_safeAltM (fuel - 1)) dtb__319)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__320, dtb__321, dtb__322, dtb__323) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__320, dtb__321, dtb__322, ((v_safeList (fuel - 1)) dtb__323)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__324, dtb__325, dtb__326) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__324, dtb__325, ((v_safeFields (fuel - 1)) dtb__326)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__327, dtb__328, dtb__329, dtb__330) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_safeIr (fuel - 1)) dtb__327), dtb__328, dtb__329, dtb__330))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__331, dtb__332, dtb__333, dtb__334) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_safeIr (fuel - 1)) dtb__331), dtb__332, ((v_safeFields (fuel - 1)) dtb__333), dtb__334))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__335, dtb__336, dtb__337) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__335, dtb__336, ((v_safeIr (fuel - 1)) dtb__337)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__338, dtb__339, dtb__340) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__338, ((v_safeIr (fuel - 1)) dtb__339), ((v_safeIr (fuel - 1)) dtb__340)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__341) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_safeIr (fuel - 1)) dtb__341)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__342, dtb__343, dtb__344) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_safeIr (fuel - 1)) dtb__342), ((v_safeIr (fuel - 1)) dtb__343), ((v_safeIr (fuel - 1)) dtb__344)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__345) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_safeList (fuel - 1)) dtb__345)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__346, dtb__347, dtb__348, dtb__349, ((v_safeIr (fuel - 1)) dtb__350)))
  | _ -> ir
)))
# 426 "Vuna/Ir/Direct.vuna"
and v_safeList = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (B_dData_dList.C_List__x58__x58_ (((v_safeIr (fuel - 1)) dtb__351), ((v_safeList (fuel - 1)) dtb__352)))
  | _ -> failwith "DT: impossible branch"
)))
# 435 "Vuna/Ir/Direct.vuna"
and v_safeFields = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__353, dtb__354) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__353); B_dData_dPair.f_Pair_second = ((v_safeIr (fuel - 1)) (B_dData_dPair.v_secondOf dtb__353)) }, ((v_safeFields (fuel - 1)) dtb__354)))
  | _ -> failwith "DT: impossible branch"
)))
# 444 "Vuna/Ir/Direct.vuna"
and v_safeAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__355, dtb__356) -> (B_dData_dList.C_List__x58__x58_ (((v_safeAlt (fuel - 1)) dtb__355), ((v_safeAlts (fuel - 1)) dtb__356)))
  | _ -> failwith "DT: impossible branch"
)))
# 453 "Vuna/Ir/Direct.vuna"
and v_safeAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__357) -> (B_dData_dMaybe.C_Maybe_Just (((v_safeAlt (fuel - 1)) dtb__357)))
  | _ -> failwith "DT: impossible branch"
)))
# 462 "Vuna/Ir/Direct.vuna"
and v_safeAlt = (fun (fuel : int) (a : Vuna_dIr_dModel.t_IrAlt) -> (let bs = (a).Vuna_dIr_dModel.f_IrAlt_irAltBinders in (let bs2 = ((B_dData_dList.v_map v_safeBinder) bs) in (let body2 = (((v_renameAll bs) bs2) (a).Vuna_dIr_dModel.f_IrAlt_irAltBody) in { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (a).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = bs2; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_safeIr (fuel - 1)) body2) }))))

# 478 "Vuna/Ir/Direct.vuna"
let rec v_irTyPeel = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__358, dtb__359) -> (if (dtb__358 = Vuna_dIr_dModel.v_irEffTypeName) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else B_dData_dMaybe.C_Maybe_Nothing)
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__360, dtb__361) -> ((v_irTyPeel (mc0 + 1)) dtb__361)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 474 "Vuna/Ir/Direct.vuna"
let v_irTyEffArity = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> ((v_irTyPeel 0) dtb__362)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Ir/Direct.vuna"
let v_effPairOfDef = (fun (d : Vuna_dIr_dModel.t_IrDef) -> (match (v_irTyEffArity (Vuna_dIr_dModel.v_irDefTy d)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName d); B_dData_dPair.f_Pair_second = dtb__363 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Ir/Direct.vuna"
let[@tail_mod_cons] rec v_effPairsOfDefs = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365) -> (match (v_effPairOfDef dtb__364) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (B_dData_dList.C_List__x58__x58_ (dtb__366, (v_effPairsOfDefs dtb__365)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effPairsOfDefs dtb__365)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Ir/Direct.vuna"
let v_effPairsOfGroup = (fun (g : Vuna_dIr_dModel.t_IrGroup) -> (v_effPairsOfDefs (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs))

# 505 "Vuna/Ir/Direct.vuna"
let rec v_effArityLookup = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (match dtb__367 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (if (dtb__369 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__370)) else ((v_effArityLookup mc0) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Ir/Direct.vuna"
let v_effWithUnit = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (pairs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match (eff n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__371) -> (B_dData_dMaybe.C_Maybe_Just (dtb__371))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_effArityLookup n) pairs)
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Ir/Direct.vuna"
let v_etaTwin = (fun (n : string) (ar0 : int) (u : Vuna_dIr_dModel.t_IrBinder) -> (let xs = ((B_dData_dList.v_map (fun (i : int) -> { Vuna_dIr_dModel.f_IrBinder_irBinderId = (0 - (2200000000 + i)); Vuna_dIr_dModel.f_IrBinder_irBinderName = (Vuna_dIr_dModel.C_IrBName_IrBUser (("__eta" ^ (string_of_int i)))); Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })) ((B_dData_dList.v_range 0) ar0)) in (let argVars = ((B_dData_dList.v_map (fun (x : Vuna_dIr_dModel.t_IrBinder) -> (Vuna_dIr_dModel.C_Ir_IrVar (x)))) xs) in (let action = ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrGlobal (n))) argVars) in (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_append xs) (B_dData_dList.C_List__x58__x58_ (u, B_dData_dList.C_List_Nil))), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, action)), (Vuna_dIr_dModel.C_Ir_IrVar (u))))))))))

# 524 "Vuna/Ir/Direct.vuna"
let rec v_anyHasEff = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then false else (match xs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__372, dtb__373) -> (if ((v_hasEffNode (fuel - 1)) dtb__372) then true else ((v_anyHasEff (fuel - 1)) dtb__373))
  | _ -> failwith "DT: impossible branch"
)))
# 533 "Vuna/Ir/Direct.vuna"
and v_hasEffNodeField = (fun (fuel : int) (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> ((v_hasEffNode (fuel - 1)) (B_dData_dPair.v_secondOf p)))
# 536 "Vuna/Ir/Direct.vuna"
and v_anyHasEffField = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then false else (match fs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (if ((v_hasEffNodeField (fuel - 1)) dtb__374) then true else ((v_anyHasEffField (fuel - 1)) dtb__375))
  | _ -> failwith "DT: impossible branch"
)))
# 545 "Vuna/Ir/Direct.vuna"
and v_hasEffNodeAlt = (fun (fuel : int) (a : Vuna_dIr_dModel.t_IrAlt) -> ((v_hasEffNode (fuel - 1)) (a).Vuna_dIr_dModel.f_IrAlt_irAltBody))
# 548 "Vuna/Ir/Direct.vuna"
and v_anyHasEffAlt = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then false else (match alts with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (if ((v_hasEffNodeAlt (fuel - 1)) dtb__376) then true else ((v_anyHasEffAlt (fuel - 1)) dtb__377))
  | _ -> failwith "DT: impossible branch"
)))
# 557 "Vuna/Ir/Direct.vuna"
and v_hasEffNodeAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then false else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> ((v_hasEffNodeAlt (fuel - 1)) dtb__378)
  | _ -> failwith "DT: impossible branch"
)))
# 566 "Vuna/Ir/Direct.vuna"
and v_hasEffNode = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then false else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__379, dtb__380, dtb__381, dtb__382) -> (if ((v_isEffThunk dtb__379) dtb__380) then true else ((v_anyHasEff (fuel - 1)) dtb__382))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387) -> true
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__388, dtb__389, dtb__390) -> true
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__391, dtb__392, dtb__393) -> ((v_hasEffNode (fuel - 1)) dtb__393)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__394, dtb__395, dtb__396) -> (if ((v_hasEffNode (fuel - 1)) dtb__395) then true else ((v_hasEffNode (fuel - 1)) dtb__396))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__397, dtb__398, dtb__399) -> (if ((v_hasEffNode (fuel - 1)) dtb__398) then true else ((v_hasEffNode (fuel - 1)) dtb__399))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__400, dtb__401) -> ((v_anyHasEff (fuel - 1)) dtb__401)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__402, dtb__403, dtb__404, dtb__405) -> (if ((v_hasEffNode (fuel - 1)) dtb__404) then true else ((v_anyHasEffAlt (fuel - 1)) dtb__405))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> (if (if (if ((v_hasEffNode (fuel - 1)) dtb__406) then true else ((v_hasEffNodeAltM (fuel - 1)) dtb__408)) then true else ((v_hasEffNodeAltM (fuel - 1)) dtb__409)) then true else ((v_hasEffNodeAltM (fuel - 1)) dtb__410))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__411, dtb__412, dtb__413) -> ((v_anyHasEffField (fuel - 1)) dtb__413)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__414, dtb__415, dtb__416, dtb__417) -> ((v_hasEffNode (fuel - 1)) dtb__414)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__418, dtb__419, dtb__420, dtb__421) -> (if ((v_hasEffNode (fuel - 1)) dtb__418) then true else ((v_anyHasEffField (fuel - 1)) dtb__420))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__422, dtb__423, dtb__424) -> ((v_hasEffNode (fuel - 1)) dtb__424)
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__425) -> ((v_hasEffNode (fuel - 1)) dtb__425)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__426, dtb__427, dtb__428) -> (if (if ((v_hasEffNode (fuel - 1)) dtb__426) then true else ((v_hasEffNode (fuel - 1)) dtb__427)) then true else ((v_hasEffNode (fuel - 1)) dtb__428))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__429) -> ((v_anyHasEff (fuel - 1)) dtb__429)
  | _ -> false
)))

# 591 "Vuna/Ir/Direct.vuna"
let v_directOriginal = (fun (mc0 : (string) -> int B_dData_dMaybe.t_Maybe) (mc1 : Vuna_dIr_dModel.t_IrDef) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437) -> (let body1 = (((v_directIr mc0) (128 + (8 * (Vuna_dIr_dModel.v_irSize dtb__434)))) dtb__434) in (let body2 = (if ((v_hasEffNode (128 + (8 * (Vuna_dIr_dModel.v_irSize dtb__434)))) dtb__434) then ((v_safeIr (256 + (8 * (Vuna_dIr_dModel.v_irSize body1)))) body1) else body1) in (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__430, dtb__431, dtb__432, dtb__433, body2, dtb__435, dtb__436, dtb__437))))
  | _ -> mc1
))

# 604 "Vuna/Ir/Direct.vuna"
let v_directTwin = (fun (mc0 : (string) -> int B_dData_dMaybe.t_Maybe) (mc1 : Vuna_dIr_dModel.t_IrDef) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445) -> (match (mc0 dtb__438) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__446) -> (if (dtb__446 > 0) then (let body1 = (((v_directIr mc0) (128 + (8 * (Vuna_dIr_dModel.v_irSize dtb__442)))) dtb__442) in (let u = { Vuna_dIr_dModel.f_IrBinder_irBinderId = (0 - 2100000000); Vuna_dIr_dModel.f_IrBinder_irBinderName = (Vuna_dIr_dModel.C_IrBName_IrBUser ("__effTok")); Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing } in (let twinBody = (match body1 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__447, dtb__448, dtb__449) -> (if ((v_listLen dtb__447) = dtb__446) then (let b2 = ((((v_runAction mc0) (128 + (8 * (Vuna_dIr_dModel.v_irSize dtb__449)))) dtb__449) (Vuna_dIr_dModel.C_Ir_IrVar (u))) in (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_append dtb__447) (B_dData_dList.C_List__x58__x58_ (u, B_dData_dList.C_List_Nil))), B_dData_dMaybe.C_Maybe_Nothing, ((v_safeIr (256 + (8 * (Vuna_dIr_dModel.v_irSize b2)))) b2)))) else (((v_etaTwin dtb__438) dtb__446) u))
  | _ -> (((v_etaTwin dtb__438) dtb__446) u)
) in (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_IrDef_IrDef ((dtb__438 ^ "__direct"), (dtb__446 + 1), dtb__440, dtb__441, twinBody, dtb__443, dtb__444, dtb__445)), B_dData_dList.C_List_Nil))))) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 631 "Vuna/Ir/Direct.vuna"
let v_directGroup = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (g : Vuna_dIr_dModel.t_IrGroup) -> (let originals = ((B_dData_dList.v_map (v_directOriginal eff)) (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) in (let twins = ((B_dData_dList.v_concatMap (v_directTwin eff)) (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) in (if (g).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec then (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = true; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_append originals) twins) }, B_dData_dList.C_List_Nil)) else (match twins with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = false; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = originals }, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = false; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = originals }, (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = false; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = twins }, B_dData_dList.C_List_Nil))))
)))))

# 643 "Vuna/Ir/Direct.vuna"
let v_directUnit = (fun (eff : (string) -> int B_dData_dMaybe.t_Maybe) (u : Vuna_dIr_dModel.t_IrUnit) -> (let unitPairs = ((B_dData_dList.v_concatMap v_effPairsOfGroup) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (let eff2 = ((v_effWithUnit eff) unitPairs) in { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_concatMap (v_directGroup eff2)) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry })))
