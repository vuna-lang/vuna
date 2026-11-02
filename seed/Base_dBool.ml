open Vuna_runtime
open Vuna_builtins
open Base_dPair
let v_Base_dBool_dnot = (fun b -> (if b then false else true))

let v_Base_dBool_dand = (fun a -> (fun b -> (if a then b else false)))

let v_Base_dBool_dor = (fun a -> (fun b -> (if a then true else b)))

let v_Base_dBool_dxor = (fun a -> (fun b -> (if a then (v_Base_dBool_dnot b) else b)))

let v_Base_dBool_dbool = (fun ifFalse -> (fun ifTrue -> (fun b -> (if b then ifTrue else ifFalse))))
