open Vuna_runtime
type 'a0 t_List = C_List_Nil | C_List__x58__x58_ of ('a0) * ('a0 t_List)


let dtp_unpack (s : string) =
  let rec go i acc = if i < 0 then acc else go (i - 1) (C_List__x58__x58_ (Char.code (String.unsafe_get s i), acc)) in
  go (String.length s - 1) C_List_Nil
let dtp_pack xs =
  let rec len n l = match l with C_List_Nil -> n | C_List__x58__x58_ (_, rest) -> len (n + 1) rest in
  let buf = Bytes.create (len 0 xs) in
  let rec go i l = match l with
    | C_List_Nil -> ()
    | C_List__x58__x58_ (x, rest) -> Bytes.unsafe_set buf i (Char.chr x); go (i + 1) rest
  in
  (go 0 xs; Bytes.unsafe_to_string buf)

let dtp_listOf xs = List.fold_right (fun x acc -> C_List__x58__x58_ (x, acc)) xs C_List_Nil
let dtp_ocamlOf xs =
  let rec go l = match l with C_List_Nil -> [] | C_List__x58__x58_ (x, rest) -> x :: go rest in
  go xs

let dtp_concatMany xs =
  let rec len acc l = match l with C_List_Nil -> acc | C_List__x58__x58_ (x, rest) -> len (acc + String.length x) rest in
  let n = len 0 xs in
  let buf = Bytes.create n in
  let rec put off l = match l with
    | C_List_Nil -> ()
    | C_List__x58__x58_ (x, rest) ->
      let k = String.length x in
      Bytes.blit_string x 0 buf off k;
      put (off + k) rest
  in
  (put 0 xs; Bytes.unsafe_to_string buf)

let dtp_substTemplate tmpl xs =
  let args = Array.of_list (dtp_ocamlOf xs) in
  let n = String.length tmpl and na = Array.length args in
  let rec scan_len i acc =
    if i >= n then acc
    else if tmpl.[i] = '<' then begin
      let j = ref (i + 1) and k = ref 0 in
      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do
        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j
      done;
      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then
        if !k < na then scan_len (!j + 1) (acc + String.length args.(!k))
        else scan_len (!j + 1) (acc + (!j - i + 1))
      else scan_len (i + 1) (acc + 1)
    end else scan_len (i + 1) (acc + 1)
  in
  let out = Bytes.create (scan_len 0 0) in
  let rec fill i o =
    if i >= n then o
    else if tmpl.[i] = '<' then begin
      let j = ref (i + 1) and k = ref 0 in
      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do
        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j
      done;
      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then
        if !k < na then begin
          let s = args.(!k) in
          Bytes.blit_string s 0 out o (String.length s);
          fill (!j + 1) (o + String.length s)
        end else begin
          let l = !j - i + 1 in
          Bytes.blit_string tmpl i out o l;
          fill (!j + 1) (o + l)
        end
      else (Bytes.set out o '<'; fill (i + 1) (o + 1))
    end else (Bytes.set out o tmpl.[i]; fill (i + 1) (o + 1))
  in
  let m = fill 0 0 in
  Bytes.sub_string out 0 m
# 200 "Base/Data/List.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun _uctx0 -> (B_dTrait_dEq.C_Eq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_List__x58__x58_ (dtb__0, dtb__1) -> (match mc1 with
  | C_List__x58__x58_ (dtb__2, dtb__3) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__0) dtb__2) then (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) dtb__1) dtb__3) else false)
  | _ -> false
)
  | C_List_Nil -> (match mc1 with
  | C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun xs ys -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) xs) ys) then false else true)))))

# 207 "Base/Data/List.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun _uctx0 -> (B_dTrait_dOrd.C_Ord_Ord ((fun mc0 mc1 -> (match mc0 with
  | C_List__x58__x58_ (dtb__4, dtb__5) -> (match mc1 with
  | C_List__x58__x58_ (dtb__6, dtb__7) -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__4) dtb__6) then true else (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__6) dtb__4) then false else (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) dtb__5) dtb__7)))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> (match mc1 with
  | C_List__x58__x58_ (dtb__8, dtb__9) -> true
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun xs ys -> (if (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) xs) ys) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) ys) xs)))), (fun xs ys -> (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) ys) xs)), (fun xs ys -> (((B_dTrait_dOrd.v__x60__x61_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) ys) xs)))))

# 217 "Base/Data/List.vuna"
let rec v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun _uctx0 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun xs -> (match xs with
  | C_List_Nil -> 0
  | C_List__x58__x58_ (dtb__10, dtb__11) -> ((B_dTrait_dHashable.v_hashCombine ((B_dTrait_dHashable.v_hash _uctx0) dtb__10)) ((B_dTrait_dHashable.v_hash (v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) dtb__11))
  | _ -> failwith "DT: impossible branch"
)))))

# 227 "Base/Data/List.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (B_dTrait_dMonoid.C_Monoid_Monoid (C_List_Nil))

# 234 "Base/Data/List.vuna"
let rec v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_uf = (fun _uctx0 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun fun_ xs -> (match xs with
  | C_List_Nil -> ((B_dTrait_dApplicative.v_pure _uctx0) C_List_Nil)
  | C_List__x58__x58_ (dtb__12, dtb__13) -> ((((B_dTrait_dApplicative.v_liftA2 _uctx0) (fun y ys -> (C_List__x58__x58_ (y, ys)))) (fun_ dtb__12)) (((B_dTrait_dTraversable.v_mapM (v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_uf _uctx0)) fun_) dtb__13))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 32 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_append = (fun mc0 mc1 -> (match mc0 with
  | C_List__x58__x58_ (dtb__14, dtb__15) -> (C_List__x58__x58_ (dtb__14, ((v_append dtb__15) mc1)))
  | C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 224 "Base/Data/List.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (B_dTrait_dMonoid.C_Semigroup_Semigroup (v_append))

# 37 "Base/Data/List.vuna"
let rec v_reverseOnto = (fun mc0 mc1 -> (match mc0 with
  | C_List__x58__x58_ (dtb__16, dtb__17) -> ((v_reverseOnto dtb__17) (C_List__x58__x58_ (dtb__16, mc1)))
  | C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 42 "Base/Data/List.vuna"
let v_reverse = (fun xs -> ((v_reverseOnto xs) C_List_Nil))

# 51 "Base/Data/List.vuna"
let rec v_lengthInt = (fun mc0 -> (match mc0 with
  | C_List__x58__x58_ (dtb__18, dtb__19) -> (1 + (v_lengthInt dtb__19))
  | C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Data/List.vuna"
let v_length = (fun xs -> (bi_natFromInt (v_lengthInt xs)))

# 56 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_map = (fun mc0 mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__20, dtb__21) -> (C_List__x58__x58_ ((mc0 dtb__20), ((v_map mc0) dtb__21)))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 173 "Base/Data/List.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f xs -> ((v_map f) xs))) : Obj.t)))

# 61 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_filter = (fun mc0 mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__22, dtb__23) -> (if (mc0 dtb__22) then (C_List__x58__x58_ (dtb__22, ((v_filter mc0) dtb__23))) else ((v_filter mc0) dtb__23))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 66 "Base/Data/List.vuna"
let rec v_foldl = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_List__x58__x58_ (dtb__24, dtb__25) -> (((v_foldl mc0) ((mc0 mc1) dtb__24)) dtb__25)
  | C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 71 "Base/Data/List.vuna"
let rec v_foldr = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_List__x58__x58_ (dtb__26, dtb__27) -> ((mc0 dtb__26) (((v_foldr mc0) mc1) dtb__27))
  | C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 231 "Base/Data/List.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun f z xs -> (((v_foldr f) z) xs))) : Obj.t)))

# 81 "Base/Data/List.vuna"
let rec v_concatMapGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_List__x58__x58_ (dtb__28, dtb__29) -> (((v_concatMapGo mc0) dtb__29) ((v_append (v_reverse (mc0 dtb__28))) mc2))
  | C_List_Nil -> (v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 77 "Base/Data/List.vuna"
let v_concatMap = (fun f xs -> (((v_concatMapGo f) xs) C_List_Nil))

# 176 "Base/Data/List.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun xs f -> ((v_concatMap f) xs))) : Obj.t)))

# 179 "Base/Data/List.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> (C_List__x58__x58_ (x, C_List_Nil)))) : Obj.t), ((Obj.magic (fun mf mx -> ((v_concatMap (fun g -> ((v_map (Obj.magic g)) mx))) mf))) : Obj.t), ((Obj.magic (fun f xs ys -> ((v_concatMap (fun a -> ((v_map (fun b -> ((f a) b))) ys))) xs))) : Obj.t)))

# 86 "Base/Data/List.vuna"
let rec v_mem = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__30, dtb__31) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__30) then true else (((v_mem _uctx0) mc0) dtb__31))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 91 "Base/Data/List.vuna"
let rec v_memName = (fun (mc0 : string) (mc1 : string t_List) -> (match mc1 with
  | C_List__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = mc0) then true else ((v_memName mc0) dtb__33))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 96 "Base/Data/List.vuna"
let rec v_lookupPair = (fun (mc0 : string) mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__34, dtb__35) -> (if ((B_dData_dPair.v_firstOf dtb__34) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__34))) else ((v_lookupPair mc0) dtb__35))
  | C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 103 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_nubNames = (fun (mc0 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__36, dtb__37) -> (if ((v_memName dtb__36) dtb__37) then (v_nubNames dtb__37) else (C_List__x58__x58_ (dtb__36, (v_nubNames dtb__37))))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Base/Data/List.vuna"
let rec v_allMem = (fun (mc0 : string t_List) (mc1 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__38, dtb__39) -> (if ((v_memName dtb__38) mc1) then ((v_allMem dtb__39) mc1) else false)
  | C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 113 "Base/Data/List.vuna"
let rec v_anyMem = (fun (mc0 : string t_List) (mc1 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__40, dtb__41) -> (if ((v_memName dtb__40) mc1) then true else ((v_anyMem dtb__41) mc1))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Base/Data/List.vuna"
let rec v_hasDupNames = (fun (mc0 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__42, dtb__43) -> (if ((v_memName dtb__42) dtb__43) then true else (v_hasDupNames dtb__43))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 123 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_zip = (fun mc0 mc1 -> (match mc0 with
  | C_List__x58__x58_ (dtb__44, dtb__45) -> (match mc1 with
  | C_List__x58__x58_ (dtb__46, dtb__47) -> (C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__46 }, ((v_zip dtb__45) dtb__47)))
  | _ -> C_List_Nil
)
  | _ -> C_List_Nil
))

# 128 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_take = (fun (mc0 : int) mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__48, dtb__49) -> (if (mc0 <= 0) then C_List_Nil else (C_List__x58__x58_ (dtb__48, ((v_take (mc0 - 1)) dtb__49))))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Base/Data/List.vuna"
let rec v_drop = (fun (mc0 : int) mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__50, dtb__51) -> (if (mc0 <= 0) then (C_List__x58__x58_ (dtb__50, dtb__51)) else ((v_drop (mc0 - 1)) dtb__51))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_rangeFrom = (fun (i : int) (k : int) -> (if (k <= 0) then C_List_Nil else (C_List__x58__x58_ (i, ((v_rangeFrom (i + 1)) (k - 1))))))

# 139 "Base/Data/List.vuna"
let v_range = (fun (i : int) (n : int) -> ((v_rangeFrom i) (n - i)))

# 147 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_mapMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_List__x58__x58_ (dtb__52, dtb__53) -> (match (mc0 dtb__52) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybe mc0) dtb__53)
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (C_List__x58__x58_ (dtb__54, ((v_mapMaybe mc0) dtb__53)))
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Base/Data/List.vuna"
let rec v_firstJust = (fun mc0 -> (match mc0 with
  | C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__55 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dMaybe.C_Maybe_Just (dtb__57))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_firstJust dtb__56)
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 164 "Base/Data/List.vuna"
let rec v_firstSuccess = (fun _uctx0 _hdict0 mc0 -> (match mc0 with
  | C_List__x58__x58_ (dtb__58, dtb__59) -> (((B_dTrait_dMonad.v__x62__x62__x61_ _uctx0) dtb__58) (fun v -> (match v with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> ((B_dTrait_dApplicative.v_pure _hdict0) (B_dData_dMaybe.C_Maybe_Just (dtb__60)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstSuccess _uctx0) _hdict0) dtb__59)
  | _ -> failwith "DT: impossible branch"
)))
  | C_List_Nil -> ((B_dTrait_dApplicative.v_pure _hdict0) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 191 "Base/Data/List.vuna"
let rec v_showElemsTail = (fun (mc0 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__61, dtb__62) -> (String.concat "" [", "; dtb__61; (v_showElemsTail dtb__62)])
  | C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 186 "Base/Data/List.vuna"
let v_showElems = (fun (mc0 : string t_List) -> (match mc0 with
  | C_List__x58__x58_ (dtb__63, dtb__64) -> (dtb__63 ^ (v_showElemsTail dtb__64))
  | C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 196 "Base/Data/List.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun xs -> (String.concat "" ["["; (v_showElems ((v_map (fun x -> ((B_dTrait_dShow.v_show _uctx0) (Obj.magic x)))) xs)); "]"])))))
