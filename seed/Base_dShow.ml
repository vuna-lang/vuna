open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
type 'a0 t_Dict_uBase_dShow_dShow = C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow of (('a0) -> string)

let v_Base_dShow_dBase_dShow_dShow_uBase_dShow_dShow_uInt = fun () -> (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun x -> (bi_strFromInt x))))

let v_Base_dShow_dBase_dShow_dShow_uBase_dShow_dShow_uString = fun () -> (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun s -> ((bi_concat "\"") ((bi_concat s) "\"")))))

let v_Base_dShow_dBase_dShow_dShow_uBase_dShow_dShow_uBool = fun () -> (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun b -> (if b then "True" else "False"))))

let v_Base_dShow_dshow = (fun _ud -> (fun x0 -> (match _ud with
  | C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
)))
