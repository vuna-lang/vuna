open Vuna_runtime
let v_Base_dIORef_dnewRef = (fun x -> ((fun dtio_0 -> fun (_ : int) -> (fun x -> ref x) dtio_0) x))

let v_Base_dIORef_dreadRef = (fun r -> ((fun dtio_0 -> fun (_ : int) -> (fun r -> !r) dtio_0) r))

let v_Base_dIORef_dwriteRef = (fun r v -> (((fun dtio_0 dtio_1 -> fun (_ : int) -> (fun r v -> r := v; 0) dtio_0 dtio_1) r) v))

let v_Base_dIORef_dmodifyRef = (fun r f -> (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uIO) (v_Base_dIORef_dreadRef r)) (fun x -> ((v_Base_dIORef_dwriteRef r) (f x)))))
