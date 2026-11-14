open Vuna_runtime
type 'a0 t_Base_dList_dList = C_Base_dList_dList_Nil | C_Base_dList_dList_Cons of ('a0) * ('a0 t_Base_dList_dList)


let dtp_unpack (s : string) =
  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in
  List.fold_right (fun x acc -> C_Base_dList_dList_Cons (x, acc)) cs C_Base_dList_dList_Nil
let dtp_pack xs =
  let rec to_list xs = match xs with C_Base_dList_dList_Nil -> [] | C_Base_dList_dList_Cons (x, rest) -> x :: to_list rest in
  let cs = Array.of_list (to_list xs) in
  String.init (Array.length cs) (fun i -> Char.chr cs.(i))

let dtp_listOf xs = List.fold_right (fun x acc -> C_Base_dList_dList_Cons (x, acc)) xs C_Base_dList_dList_Nil
let dtp_ocamlOf xs =
  let rec go l = match l with C_Base_dList_dList_Nil -> [] | C_Base_dList_dList_Cons (x, rest) -> x :: go rest in
  go xs

let dtp_concatMany xs = String.concat "" (dtp_ocamlOf xs)

let dtp_substTemplate tmpl xs =
  let args = Array.of_list (dtp_ocamlOf xs) in
  let n = String.length tmpl and na = Array.length args in
  let buf = Buffer.create (n + 32) in
  let rec go i =
    if i >= n then ()
    else if tmpl.[i] = '<' then begin
      let j = ref (i + 1) and k = ref 0 in
      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do
        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j
      done;
      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin
        (if !k < na then Buffer.add_string buf args.(!k)
         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));
        go (!j + 1)
      end else (Buffer.add_char buf '<'; go (i + 1))
    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))
  in go 0; Buffer.contents buf
# 171 "Base/List.vuna"
let rec v_Eq_uBase_uList_uList_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__0) dtb__2) then (((Base_dEq.v_Base_dEq_deq (v_Eq_uBase_uList_uList_ua _uctx0)) dtb__1) dtb__3) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun xs ys -> (if (((Base_dEq.v_Base_dEq_deq (v_Eq_uBase_uList_uList_ua _uctx0)) xs) ys) then false else true)))))

# 178 "Base/List.vuna"
let rec v_Ord_uBase_uList_uList_ua = (fun _uctx0 -> (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (((Base_dOrd.v_Base_dOrd_dlt _uctx0) dtb__4) dtb__6) then true else (if (((Base_dOrd.v_Base_dOrd_dlt _uctx0) dtb__6) dtb__4) then false else (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_uList_uList_ua _uctx0)) dtb__5) dtb__7)))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> true
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun xs ys -> (if (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_uList_uList_ua _uctx0)) xs) ys) then true else (Base_dBool.v_Base_dBool_dnot (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_uList_uList_ua _uctx0)) ys) xs)))), (fun xs ys -> (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_uList_uList_ua _uctx0)) ys) xs)), (fun xs ys -> (((Base_dOrd.v_Base_dOrd_dle (v_Ord_uBase_uList_uList_ua _uctx0)) ys) xs)))))

# 188 "Base/List.vuna"
let rec v_Hashable_uBase_uList_uList_ua = (fun _uctx0 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun xs -> (match xs with
  | C_Base_dList_dList_Nil -> 0
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> ((Base_dHashable.v_Base_dHashable_dhashCombine ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__10)) ((Base_dHashable.v_Base_dHashable_dhash (v_Hashable_uBase_uList_uList_ua _uctx0)) dtb__11))
  | _ -> failwith "DT: impossible branch"
)))))

# 197 "Base/List.vuna"
let v_Monoid_uBase_uList_uList_ua = (Base_dMonoid.C_Dict_uBase_dMonoid_dMonoid_Monoid (C_Base_dList_dList_Nil))

# 204 "Base/List.vuna"
let rec v_Traversable_uBase_uList_uList_uf = (fun _uctx0 -> (Base_dTraversable.C_Dict_uBase_dTraversable_dTraversable_Traversable ((fun fun_ xs -> (match xs with
  | C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) C_Base_dList_dList_Nil)
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 _uctx0) (fun y ys -> (C_Base_dList_dList_Cons (y, ys)))) (fun_ dtb__12)) (((Base_dTraversable.v_Base_dTraversable_dmapM (v_Traversable_uBase_uList_uList_uf _uctx0)) fun_) dtb__13))
  | _ -> failwith "DT: impossible branch"
)))))

# 39 "Base/List.vuna"
let rec v_Base_dList_dappend = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (C_Base_dList_dList_Cons (dtb__14, ((v_Base_dList_dappend dtb__15) mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 194 "Base/List.vuna"
let v_Semigroup_uBase_uList_uList_ua = (Base_dMonoid.C_Dict_uBase_dMonoid_dSemigroup_Semigroup ((fun _uarity1 _uarity2 -> ((v_Base_dList_dappend _uarity1) _uarity2))))

# 44 "Base/List.vuna"
let rec v_Base_dList_dreverseOnto = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((v_Base_dList_dreverseOnto dtb__17) (C_Base_dList_dList_Cons (dtb__16, mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 49 "Base/List.vuna"
let v_Base_dList_dreverse = (fun xs -> ((v_Base_dList_dreverseOnto xs) C_Base_dList_dList_Nil))

# 58 "Base/List.vuna"
let rec v_Base_dList_dlengthInt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (1 + (v_Base_dList_dlengthInt dtb__19))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 54 "Base/List.vuna"
let v_Base_dList_dlength = (fun xs -> (bi_natFromInt (v_Base_dList_dlengthInt xs)))

# 63 "Base/List.vuna"
let rec v_Base_dList_dmap = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (C_Base_dList_dList_Cons ((mc0 dtb__20), ((v_Base_dList_dmap mc0) dtb__21)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 142 "Base/List.vuna"
let v_Functor_uBase_uList_uList = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f xs -> ((v_Base_dList_dmap f) xs))))

# 68 "Base/List.vuna"
let rec v_Base_dList_dfilter = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (mc0 dtb__22) then (C_Base_dList_dList_Cons (dtb__22, ((v_Base_dList_dfilter mc0) dtb__23))) else ((v_Base_dList_dfilter mc0) dtb__23))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 73 "Base/List.vuna"
let rec v_Base_dList_dfoldl = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (((v_Base_dList_dfoldl mc0) ((mc0 mc1) dtb__24)) dtb__25)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 78 "Base/List.vuna"
let rec v_Base_dList_dfoldr = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> ((mc0 dtb__26) (((v_Base_dList_dfoldr mc0) mc1) dtb__27))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 201 "Base/List.vuna"
let v_Foldable_uBase_uList_uList = (Base_dFoldable.C_Dict_uBase_dFoldable_dFoldable_Foldable ((fun f z xs -> (((v_Base_dList_dfoldr f) z) xs))))

# 90 "Base/List.vuna"
let rec v_Base_dList_dconcatMapGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (((v_Base_dList_dconcatMapGo mc0) dtb__29) ((v_Base_dList_dappend (v_Base_dList_dreverse (mc0 dtb__28))) mc2))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 86 "Base/List.vuna"
let v_Base_dList_dconcatMap = (fun f xs -> (((v_Base_dList_dconcatMapGo f) xs) C_Base_dList_dList_Nil))

# 145 "Base/List.vuna"
let v_Monad_uBase_uList_uList = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun xs f -> ((v_Base_dList_dconcatMap f) xs))))

# 148 "Base/List.vuna"
let v_Applicative_uBase_uList_uList = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun x -> (C_Base_dList_dList_Cons (x, C_Base_dList_dList_Nil))), (fun mf mx -> ((v_Base_dList_dconcatMap (fun g -> ((v_Base_dList_dmap g) mx))) mf)), (fun f xs ys -> ((v_Base_dList_dconcatMap (fun a -> ((v_Base_dList_dmap (fun b -> ((f a) b))) ys))) xs))))

# 95 "Base/List.vuna"
let rec v_Base_dList_dmem = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) mc0) dtb__30) then true else (((v_Base_dList_dmem _uctx0) mc0) dtb__31))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 100 "Base/List.vuna"
let rec v_Base_dList_dmemName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (dtb__32 = mc0) then true else ((v_Base_dList_dmemName mc0) dtb__33))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 105 "Base/List.vuna"
let rec v_Base_dList_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__34) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__34))) else ((v_Base_dList_dlookupPair mc0) dtb__35))
  | C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 110 "Base/List.vuna"
let rec v_Base_dList_dzip = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__38 }, ((v_Base_dList_dzip dtb__37) dtb__39)))
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> C_Base_dList_dList_Nil
))

# 115 "Base/List.vuna"
let rec v_Base_dList_dtake = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if (mc0 <= 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (dtb__40, ((v_Base_dList_dtake (mc0 - 1)) dtb__41))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 120 "Base/List.vuna"
let rec v_Base_dList_ddrop = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (mc0 <= 0) then (C_Base_dList_dList_Cons (dtb__42, dtb__43)) else ((v_Base_dList_ddrop (mc0 - 1)) dtb__43))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 132 "Base/List.vuna"
let rec v_Base_dList_drangeFrom = (fun i k -> (if (k <= 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (i, ((v_Base_dList_drangeFrom (i + 1)) (k - 1))))))

# 128 "Base/List.vuna"
let v_Base_dList_drange = (fun i n -> ((v_Base_dList_drangeFrom i) (n - i)))

# 136 "Base/List.vuna"
let rec v_Base_dList_dmapMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match (mc0 dtb__44) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Base_dList_dmapMaybe mc0) dtb__45)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> (C_Base_dList_dList_Cons (dtb__46, ((v_Base_dList_dmapMaybe mc0) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 164 "Base/List.vuna"
let rec v_Base_dList_dshowElemsTail = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (String.concat "" [", "; dtb__47; (v_Base_dList_dshowElemsTail dtb__48)])
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 159 "Base/List.vuna"
let v_Base_dList_dshowElems = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (dtb__49 ^ (v_Base_dList_dshowElemsTail dtb__50))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 167 "Base/List.vuna"
let v_Show_uBase_uList_uList_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun xs -> (String.concat "" ["["; (v_Base_dList_dshowElems ((v_Base_dList_dmap (fun x -> ((Base_dShow.v_Base_dShow_dshow _uctx0) x))) xs)); "]"])))))
