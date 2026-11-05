open Vuna_runtime
let v_main = (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uIO) Base_dIO.v_Base_dIO_dgetArgs) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uIO) ((Base_dMonad.v_Base_dMonad_dpure Base_dIO.v_Monad_uIO) (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args))) (fun code -> (Base_dIO.v_Base_dIO_dexit code)))))
let () = print_endline (string_of_int (v_main 0))
