open Vuna_runtime
let v_Base_dArray_dfromList = (fun xs -> ((fun xs -> Array.of_list (Base_dList.dtp_ocamlOf xs)) xs))

let v_Base_dArray_dtoList = (fun a -> ((fun a -> Base_dList.dtp_listOf (Array.to_list a)) a))

let v_Base_dArray_dlength = (fun a -> (bi_natFromInt (Array.length a)))

let v_Base_dArray_dget = (fun a i -> ((Array.get a) i))

let v_Base_dArray_dset = (fun a i v -> (((dtp_arraySet a) i) v))

let v_Base_dArray_dmake = (fun n v -> ((Array.make n) v))
