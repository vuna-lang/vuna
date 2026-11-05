open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
type 'a0 t_Base_dList_dList = C_Base_dList_dList_Base_dList_dNil | C_Base_dList_dList_Base_dList_dCons of ('a0) * ('a0 t_Base_dList_dList)


let dtp_unpack (s : string) =
  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in
  List.fold_right (fun x acc -> C_Base_dList_dList_Base_dList_dCons (x, acc)) cs C_Base_dList_dList_Base_dList_dNil
let dtp_pack xs =
  let rec to_list xs = match xs with C_Base_dList_dList_Base_dList_dNil -> [] | C_Base_dList_dList_Base_dList_dCons (x, rest) -> x :: to_list rest in
  let cs = Array.of_list (to_list xs) in
  String.init (Array.length cs) (fun i -> Char.chr cs.(i))

let dtp_listOf xs = List.fold_right (fun x acc -> C_Base_dList_dList_Base_dList_dCons (x, acc)) xs C_Base_dList_dList_Base_dList_dNil
let dtp_ocamlOf xs =
  let rec go l = match l with C_Base_dList_dList_Base_dList_dNil -> [] | C_Base_dList_dList_Base_dList_dCons (x, rest) -> x :: go rest in
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
let rec v_Base_dList_dappend = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, ((v_Base_dList_dappend dtb__1) mc1)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dreverseOnto = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> ((v_Base_dList_dreverseOnto dtb__3) (C_Base_dList_dList_Base_dList_dCons (dtb__2, mc1)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dList_dreverse = (fun xs -> ((v_Base_dList_dreverseOnto xs) C_Base_dList_dList_Base_dList_dNil))

let rec v_Base_dList_dlengthInt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (1 + (v_Base_dList_dlengthInt dtb__5))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dList_dlength = (fun xs -> (bi_natFromInt (v_Base_dList_dlengthInt xs)))

let rec v_Base_dList_dmap = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (C_Base_dList_dList_Base_dList_dCons ((mc0 dtb__6), ((v_Base_dList_dmap mc0) dtb__7)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Functor_uBase_dList_dList = (C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f xs -> ((v_Base_dList_dmap f) xs))))

let rec v_Base_dList_dfilter = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if (mc0 dtb__8) then (C_Base_dList_dList_Base_dList_dCons (dtb__8, ((v_Base_dList_dfilter mc0) dtb__9))) else ((v_Base_dList_dfilter mc0) dtb__9))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dfoldl = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (((v_Base_dList_dfoldl mc0) ((mc0 mc1) dtb__10)) dtb__11)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dfoldr = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> ((mc0 dtb__12) (((v_Base_dList_dfoldr mc0) mc1) dtb__13))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dconcatMapGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (((v_Base_dList_dconcatMapGo mc0) dtb__15) ((v_Base_dList_dappend (v_Base_dList_dreverse (mc0 dtb__14))) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dList_dconcatMap = (fun f xs -> (((v_Base_dList_dconcatMapGo f) xs) C_Base_dList_dList_Base_dList_dNil))

let v_Monad_uBase_dList_dList = (C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun xs f -> ((v_Base_dList_dconcatMap f) xs)), (fun x -> (C_Base_dList_dList_Base_dList_dCons (x, C_Base_dList_dList_Base_dList_dNil)))))

let v_Base_dList_dflatMap = (fun f xs -> ((v_Base_dList_dconcatMap f) xs))

let rec v_Base_dList_dmem = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (if (((v_Base_dEq_deq _uctx0) mc0) dtb__16) then true else (((v_Base_dList_dmem _uctx0) mc0) dtb__17))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dmemName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (if (dtb__18 = mc0) then true else ((v_Base_dList_dmemName mc0) dtb__19))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (if ((v_Base_dPair_dfirstOf dtb__20) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__20))) else ((v_Base_dList_dlookupPair mc0) dtb__21))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dzip = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__24)), ((v_Base_dList_dzip dtb__23) dtb__25)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Base_dList_dtake = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (if (mc0 <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (dtb__26, ((v_Base_dList_dtake (mc0 - 1)) dtb__27))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_ddrop = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (if (mc0 <= 0) then (C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29)) else ((v_Base_dList_ddrop (mc0 - 1)) dtb__29))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_drangeFrom = (fun i k -> (if (k <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (i, ((v_Base_dList_drangeFrom (i + 1)) (k - 1))))))

let v_Base_dList_drange = (fun i n -> ((v_Base_dList_drangeFrom i) (n - i)))

let rec v_Base_dList_dmapMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match (mc0 dtb__30) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dList_dmapMaybe mc0) dtb__31)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> (C_Base_dList_dList_Base_dList_dCons (dtb__32, ((v_Base_dList_dmapMaybe mc0) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
