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
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun dtb_u_u2 -> (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u3 with
  | C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> (match dtb_u_u4 with
  | C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u2) dtb_u_u5) dtb_u_u7) then (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u2)) dtb_u_u6) dtb_u_u8) else false)
  | _ -> false
)
  | C_List_Nil -> (match dtb_u_u4 with
  | C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u9 dtb_u_u10 -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u2)) dtb_u_u9) dtb_u_u10) then false else true)))))

# 207 "Base/Data/List.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun dtb_u_u12 -> (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u13 dtb_u_u14 -> (match dtb_u_u13 with
  | C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (match dtb_u_u14 with
  | C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (if (((B_dTrait_dOrd.v__x60_ dtb_u_u12) dtb_u_u15) dtb_u_u17) then true else (if (((B_dTrait_dOrd.v__x60_ dtb_u_u12) dtb_u_u17) dtb_u_u15) then false else (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) dtb_u_u16) dtb_u_u18)))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> (match dtb_u_u14 with
  | C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> true
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u21 dtb_u_u22 -> (if (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) dtb_u_u21) dtb_u_u22) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) dtb_u_u22) dtb_u_u21)))), (fun dtb_u_u23 dtb_u_u24 -> (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) dtb_u_u24) dtb_u_u23)), (fun dtb_u_u25 dtb_u_u26 -> (((B_dTrait_dOrd.v__x60__x61_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) dtb_u_u26) dtb_u_u25)))))

# 217 "Base/Data/List.vuna"
let rec v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun dtb_u_u28 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u29 -> (match dtb_u_u29 with
  | C_List_Nil -> 0
  | C_List__x58__x58_ (dtb_u_u30, dtb_u_u31) -> ((B_dTrait_dHashable.v_hashCombine ((B_dTrait_dHashable.v_hash dtb_u_u28) dtb_u_u30)) ((B_dTrait_dHashable.v_hash (v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u28)) dtb_u_u31))
  | _ -> failwith "DT: impossible branch"
)))))

# 227 "Base/Data/List.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (B_dTrait_dMonoid.C_Monoid_Monoid (C_List_Nil))

# 234 "Base/Data/List.vuna"
let rec v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_uf = (fun dtb_u_u34 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun dtb_u_u37 dtb_u_u38 -> (match dtb_u_u38 with
  | C_List_Nil -> ((B_dTrait_dApplicative.v_pure dtb_u_u34) C_List_Nil)
  | C_List__x58__x58_ (dtb_u_u39, dtb_u_u40) -> ((((B_dTrait_dApplicative.v_liftA2 dtb_u_u34) (fun dtb_u_u41 dtb_u_u42 -> (C_List__x58__x58_ (dtb_u_u41, dtb_u_u42)))) (dtb_u_u37 dtb_u_u39)) (((B_dTrait_dTraversable.v_mapM (v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_uf dtb_u_u34)) dtb_u_u37) dtb_u_u40))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 32 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_append = (fun dtb_u_u44 dtb_u_u45 -> (match dtb_u_u44 with
  | C_List__x58__x58_ (dtb_u_u46, dtb_u_u47) -> (C_List__x58__x58_ (dtb_u_u46, ((v_append dtb_u_u47) dtb_u_u45)))
  | C_List_Nil -> dtb_u_u45
  | _ -> failwith "DT: impossible branch"
))

# 224 "Base/Data/List.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (B_dTrait_dMonoid.C_Semigroup_Semigroup (v_append))

# 37 "Base/Data/List.vuna"
let rec v_reverseOnto = (fun dtb_u_u50 dtb_u_u51 -> (match dtb_u_u50 with
  | C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> ((v_reverseOnto dtb_u_u53) (C_List__x58__x58_ (dtb_u_u52, dtb_u_u51)))
  | C_List_Nil -> dtb_u_u51
  | _ -> failwith "DT: impossible branch"
))

# 42 "Base/Data/List.vuna"
let v_reverse = (fun dtb_u_u55 -> ((v_reverseOnto dtb_u_u55) C_List_Nil))

# 51 "Base/Data/List.vuna"
let rec v_lengthInt = (fun dtb_u_u57 -> (match dtb_u_u57 with
  | C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (1 + (v_lengthInt dtb_u_u59))
  | C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Data/List.vuna"
let v_length = (fun dtb_u_u61 -> (bi_natFromInt (v_lengthInt dtb_u_u61)))

# 56 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_map = (fun dtb_u_u64 dtb_u_u65 -> (match dtb_u_u65 with
  | C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (C_List__x58__x58_ ((dtb_u_u64 dtb_u_u66), ((v_map dtb_u_u64) dtb_u_u67)))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 173 "Base/Data/List.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u70 dtb_u_u71 -> ((v_map dtb_u_u70) dtb_u_u71))) : Obj.t)))

# 61 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_filter = (fun dtb_u_u73 dtb_u_u74 -> (match dtb_u_u74 with
  | C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (if (dtb_u_u73 dtb_u_u75) then (C_List__x58__x58_ (dtb_u_u75, ((v_filter dtb_u_u73) dtb_u_u76))) else ((v_filter dtb_u_u73) dtb_u_u76))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 66 "Base/Data/List.vuna"
let rec v_foldl = (fun dtb_u_u79 dtb_u_u80 dtb_u_u81 -> (match dtb_u_u81 with
  | C_List__x58__x58_ (dtb_u_u82, dtb_u_u83) -> (((v_foldl dtb_u_u79) ((dtb_u_u79 dtb_u_u80) dtb_u_u82)) dtb_u_u83)
  | C_List_Nil -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))

# 71 "Base/Data/List.vuna"
let rec v_foldr = (fun dtb_u_u86 dtb_u_u87 dtb_u_u88 -> (match dtb_u_u88 with
  | C_List__x58__x58_ (dtb_u_u89, dtb_u_u90) -> ((dtb_u_u86 dtb_u_u89) (((v_foldr dtb_u_u86) dtb_u_u87) dtb_u_u90))
  | C_List_Nil -> dtb_u_u87
  | _ -> failwith "DT: impossible branch"
))

# 231 "Base/Data/List.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun dtb_u_u93 dtb_u_u94 dtb_u_u95 -> (((v_foldr dtb_u_u93) dtb_u_u94) dtb_u_u95))) : Obj.t)))

# 81 "Base/Data/List.vuna"
let rec v_concatMapGo = (fun dtb_u_u98 dtb_u_u99 dtb_u_u100 -> (match dtb_u_u99 with
  | C_List__x58__x58_ (dtb_u_u101, dtb_u_u102) -> (((v_concatMapGo dtb_u_u98) dtb_u_u102) ((v_append (v_reverse (dtb_u_u98 dtb_u_u101))) dtb_u_u100))
  | C_List_Nil -> (v_reverse dtb_u_u100)
  | _ -> failwith "DT: impossible branch"
))

# 77 "Base/Data/List.vuna"
let v_concatMap = (fun dtb_u_u105 dtb_u_u106 -> (((v_concatMapGo dtb_u_u105) dtb_u_u106) C_List_Nil))

# 176 "Base/Data/List.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u109 dtb_u_u110 -> ((v_concatMap dtb_u_u110) dtb_u_u109))) : Obj.t)))

# 179 "Base/Data/List.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u112 -> (C_List__x58__x58_ (dtb_u_u112, C_List_Nil)))) : Obj.t), ((Obj.magic (fun dtb_u_u115 dtb_u_u116 -> ((v_concatMap (fun dtb_u_u117 -> ((v_map dtb_u_u117) dtb_u_u116))) dtb_u_u115))) : Obj.t), ((Obj.magic (fun dtb_u_u121 dtb_u_u122 dtb_u_u123 -> ((v_concatMap (fun dtb_u_u124 -> ((v_map (fun dtb_u_u125 -> ((dtb_u_u121 dtb_u_u124) dtb_u_u125))) dtb_u_u123))) dtb_u_u122))) : Obj.t)))

# 86 "Base/Data/List.vuna"
let rec v_mem = (fun dtb_u_u127 dtb_u_u128 dtb_u_u129 -> (match dtb_u_u129 with
  | C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u127) dtb_u_u128) dtb_u_u130) then true else (((v_mem dtb_u_u127) dtb_u_u128) dtb_u_u131))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 91 "Base/Data/List.vuna"
let rec v_memName = (fun (dtb_u_u132 : string) (dtb_u_u133 : string t_List) -> (match dtb_u_u133 with
  | C_List__x58__x58_ (dtb_u_u134, dtb_u_u135) -> (if (dtb_u_u134 = dtb_u_u132) then true else ((v_memName dtb_u_u132) dtb_u_u135))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 96 "Base/Data/List.vuna"
let rec v_lookupPair = (fun (dtb_u_u137 : string) dtb_u_u138 -> (match dtb_u_u138 with
  | C_List__x58__x58_ (dtb_u_u139, dtb_u_u140) -> (if ((B_dData_dPair.v_firstOf dtb_u_u139) = dtb_u_u137) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u139))) else ((v_lookupPair dtb_u_u137) dtb_u_u140))
  | C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 103 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_nubNames = (fun (dtb_u_u141 : string t_List) -> (match dtb_u_u141 with
  | C_List__x58__x58_ (dtb_u_u142, dtb_u_u143) -> (if ((v_memName dtb_u_u142) dtb_u_u143) then (v_nubNames dtb_u_u143) else (C_List__x58__x58_ (dtb_u_u142, (v_nubNames dtb_u_u143))))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Base/Data/List.vuna"
let rec v_allMem = (fun (dtb_u_u144 : string t_List) (dtb_u_u145 : string t_List) -> (match dtb_u_u144 with
  | C_List__x58__x58_ (dtb_u_u146, dtb_u_u147) -> (if ((v_memName dtb_u_u146) dtb_u_u145) then ((v_allMem dtb_u_u147) dtb_u_u145) else false)
  | C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 113 "Base/Data/List.vuna"
let rec v_anyMem = (fun (dtb_u_u148 : string t_List) (dtb_u_u149 : string t_List) -> (match dtb_u_u148 with
  | C_List__x58__x58_ (dtb_u_u150, dtb_u_u151) -> (if ((v_memName dtb_u_u150) dtb_u_u149) then true else ((v_anyMem dtb_u_u151) dtb_u_u149))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Base/Data/List.vuna"
let rec v_hasDupNames = (fun (dtb_u_u152 : string t_List) -> (match dtb_u_u152 with
  | C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (if ((v_memName dtb_u_u153) dtb_u_u154) then true else (v_hasDupNames dtb_u_u154))
  | C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 123 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_zip = (fun dtb_u_u157 dtb_u_u158 -> (match dtb_u_u157 with
  | C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (match dtb_u_u158 with
  | C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u159; B_dData_dPair.f_Pair_second = dtb_u_u161 }, ((v_zip dtb_u_u160) dtb_u_u162)))
  | _ -> C_List_Nil
)
  | _ -> C_List_Nil
))

# 128 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_take = (fun (dtb_u_u164 : int) dtb_u_u165 -> (match dtb_u_u165 with
  | C_List__x58__x58_ (dtb_u_u166, dtb_u_u167) -> (if (dtb_u_u164 <= 0) then C_List_Nil else (C_List__x58__x58_ (dtb_u_u166, ((v_take (dtb_u_u164 - 1)) dtb_u_u167))))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Base/Data/List.vuna"
let rec v_drop = (fun (dtb_u_u169 : int) dtb_u_u170 -> (match dtb_u_u170 with
  | C_List__x58__x58_ (dtb_u_u171, dtb_u_u172) -> (if (dtb_u_u169 <= 0) then (C_List__x58__x58_ (dtb_u_u171, dtb_u_u172)) else ((v_drop (dtb_u_u169 - 1)) dtb_u_u172))
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_rangeFrom = (fun (dtb_u_u173 : int) (dtb_u_u174 : int) -> (if (dtb_u_u174 <= 0) then C_List_Nil else (C_List__x58__x58_ (dtb_u_u173, ((v_rangeFrom (dtb_u_u173 + 1)) (dtb_u_u174 - 1))))))

# 139 "Base/Data/List.vuna"
let v_range = (fun (dtb_u_u175 : int) (dtb_u_u176 : int) -> ((v_rangeFrom dtb_u_u175) (dtb_u_u176 - dtb_u_u175)))

# 147 "Base/Data/List.vuna"
let[@tail_mod_cons] rec v_mapMaybe = (fun dtb_u_u179 dtb_u_u180 -> (match dtb_u_u180 with
  | C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (match (dtb_u_u179 dtb_u_u181) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybe dtb_u_u179) dtb_u_u182)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u183) -> (C_List__x58__x58_ (dtb_u_u183, ((v_mapMaybe dtb_u_u179) dtb_u_u182)))
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Base/Data/List.vuna"
let rec v_firstJust = (fun dtb_u_u185 -> (match dtb_u_u185 with
  | C_List__x58__x58_ (dtb_u_u186, dtb_u_u187) -> (match dtb_u_u186 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u188) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u188))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_firstJust dtb_u_u187)
  | _ -> failwith "DT: impossible branch"
)
  | C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 164 "Base/Data/List.vuna"
let rec v_firstSuccess = (fun dtb_u_u191 dtb_u_u192 dtb_u_u193 -> (match dtb_u_u193 with
  | C_List__x58__x58_ (dtb_u_u194, dtb_u_u195) -> (((B_dTrait_dMonad.v__x62__x62__x61_ dtb_u_u191) dtb_u_u194) (fun dtb_u_u196 -> (match dtb_u_u196 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u197) -> ((B_dTrait_dApplicative.v_pure dtb_u_u192) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u197)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstSuccess dtb_u_u191) dtb_u_u192) dtb_u_u195)
  | _ -> failwith "DT: impossible branch"
)))
  | C_List_Nil -> ((B_dTrait_dApplicative.v_pure dtb_u_u192) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 191 "Base/Data/List.vuna"
let rec v_showElemsTail = (fun (dtb_u_u198 : string t_List) -> (match dtb_u_u198 with
  | C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> (String.concat "" [", "; dtb_u_u199; (v_showElemsTail dtb_u_u200)])
  | C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 186 "Base/Data/List.vuna"
let v_showElems = (fun (dtb_u_u201 : string t_List) -> (match dtb_u_u201 with
  | C_List__x58__x58_ (dtb_u_u202, dtb_u_u203) -> (dtb_u_u202 ^ (v_showElemsTail dtb_u_u203))
  | C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 196 "Base/Data/List.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua = (fun dtb_u_u205 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u206 -> (String.concat "" ["["; (v_showElems ((v_map (fun dtb_u_u207 -> ((B_dTrait_dShow.v_show dtb_u_u205) dtb_u_u207))) dtb_u_u206)); "]"])))))
