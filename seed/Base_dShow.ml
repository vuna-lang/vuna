open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
type 'a0 t_Dict_uBase_dShow_dShow = C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow of (('a0) -> string)

let v_Show_uInt = (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun x -> (bi_strFromInt x))))

let v_Show_uString = (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun s -> (dt_show_string s))))

let v_Show_uBase_dBool_dBool = (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun b -> (if b then "True" else "False"))))

let v_Base_dShow_dshow = (fun _ud -> (fun x0 -> (match _ud with
  | C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
)))
