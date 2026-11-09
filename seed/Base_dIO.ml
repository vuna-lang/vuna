open Vuna_runtime
let v_Functor_uIO = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f io -> (((fun io k -> fun (w : int) -> k (io w) w) io) (fun x -> ((fun x -> fun (_ : int) -> x) (f x)))))))

let v_Monad_uIO = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun io k -> (((fun io k -> fun (w : int) -> k (io w) w) io) k))))

let v_Applicative_uIO = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun x -> ((fun x -> fun (_ : int) -> x) x)), (fun f ma mb -> (((fun io k -> fun (w : int) -> k (io w) w) ma) (fun a -> (((fun io k -> fun (w : int) -> k (io w) w) mb) (fun b -> ((fun x -> fun (_ : int) -> x) ((f a) b)))))))))
