open Vuna_runtime
let v_main = (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uBase_dIO_dIO) Base_dIO.v_Base_dIO_dgetArgs) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uBase_dIO_dIO) ((Base_dMonad.v_Base_dMonad_dpure Base_dIO.v_Monad_uBase_dIO_dIO) (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args))) (fun code -> (Base_dIO.v_Base_dIO_dexit code)))))
let () = print_endline (string_of_int (match v_main with Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO f -> f 0))
