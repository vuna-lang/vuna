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
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
type t_Vuna_dCompiler_dLexer_dTok = C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent of (string) | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw of (string) | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt of (int) | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr of (string) | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym of (string) | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTEof
and t_Vuna_dCompiler_dLexer_dPTok = C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok of (t_Vuna_dCompiler_dLexer_dTok) * (t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dLexer_dChars = C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars of (int t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dLexer_dCKind = C_Vuna_dCompiler_dLexer_dCKind_Vuna_dCompiler_dLexer_dCLine | C_Vuna_dCompiler_dLexer_dCKind_Vuna_dCompiler_dLexer_dCBlock
and t_Vuna_dCompiler_dLexer_dComment = C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment of (t_Vuna_dCompiler_dLexer_dCKind) * (string) * (t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dLexer_dadvanceChar = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__0, dtb__1) -> (if ((bi_eq_int mc0) 10) then (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (((bi_add dtb__0) 1), 1)) else (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__0, ((bi_add dtb__1) 1))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLexer_disUpperChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dLexer_disLowerChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dLexer_disLowerChar c)) then true else ((bi_eq_int c) 95)))

let v_Vuna_dCompiler_dLexer_disDigit = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dLexer_disDigit c)) then true else ((bi_eq_int c) 39)))

let v_Vuna_dCompiler_dLexer_disSpace = (fun c -> (if (if (if ((bi_eq_int c) 32) then true else ((bi_eq_int c) 9)) then true else ((bi_eq_int c) 10)) then true else ((bi_eq_int c) 13)))

let v_Vuna_dCompiler_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_int c) 33) then true else ((bi_eq_int c) 36)) then true else ((bi_eq_int c) 37)) then true else ((bi_eq_int c) 38)) then true else ((bi_eq_int c) 42)) then true else ((bi_eq_int c) 43)) then true else ((bi_eq_int c) 45)) then true else ((bi_eq_int c) 46)) then true else ((bi_eq_int c) 47)) then true else ((bi_eq_int c) 60)) then true else ((bi_eq_int c) 61)) then true else ((bi_eq_int c) 62)) then true else ((bi_eq_int c) 63)) then true else ((bi_eq_int c) 64)) then true else ((bi_eq_int c) 92)) then true else ((bi_eq_int c) 94)) then true else ((bi_eq_int c) 124)) then true else ((bi_eq_int c) 126)) then true else ((bi_eq_int c) 58)))

let v_Vuna_dCompiler_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str s) "data") then true else ((bi_eq_str s) "case")) then true else ((bi_eq_str s) "of")) then true else ((bi_eq_str s) "let")) then true else ((bi_eq_str s) "in")) then true else ((bi_eq_str s) "if")) then true else ((bi_eq_str s) "then")) then true else ((bi_eq_str s) "else")) then true else ((bi_eq_str s) "where")) then true else ((bi_eq_str s) "Type")) then true else ((bi_eq_str s) "import")) then true else ((bi_eq_str s) "module")) then true else ((bi_eq_str s) "qualified")) then true else ((bi_eq_str s) "as")) then true else ((bi_eq_str s) "record")) then true else ((bi_eq_str s) "trait")) then true else ((bi_eq_str s) "instance")) then true else ((bi_eq_str s) "deriving")) then true else ((bi_eq_str s) "do")))

let v_Vuna_dCompiler_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dLexer_disKeyword s) then (C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (s)) else (C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (s))))

let rec v_Vuna_dCompiler_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__2, dtb__3) -> (match dtb__2 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if ((bi_eq_int dtb__4) 10) then (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__4, dtb__5)), dtb__3)) else (v_Vuna_dCompiler_dLexer_dskipLineComment (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__5, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__4) dtb__3)))))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (C_Base_dList_dList_Nil, dtb__3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLexer_dskipBlockComment = (fun depth -> (fun cs -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__6, dtb__7) -> (match dtb__6 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__9 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if ((bi_eq_int dtb__8) 123) then ((bi_eq_int dtb__10) 45) else false) then ((v_Vuna_dCompiler_dLexer_dskipBlockComment ((bi_add depth) 1)) (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__8) dtb__7))))) else (if (if ((bi_eq_int dtb__8) 45) then ((bi_eq_int dtb__10) 125) else false) then (if ((bi_eq_int depth) 1) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dLexer_dskipBlockComment ((bi_sub depth) 1)) (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dLexer_dskipBlockComment depth) (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__9, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__8) dtb__7))))))
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dLexer_dskipBlockComment depth) (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__9, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__8) dtb__7))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated block comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

let rec v_Vuna_dCompiler_dLexer_dskipTrivia = (fun cs -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__12, dtb__13) -> (match dtb__12 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dLexer_disSpace dtb__14) then (v_Vuna_dCompiler_dLexer_dskipTrivia (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__14) dtb__13)))) else (match dtb__15 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (if ((bi_eq_int dtb__14) 45) then ((bi_eq_int dtb__16) 45) else false) then (v_Vuna_dCompiler_dLexer_dskipTrivia (v_Vuna_dCompiler_dLexer_dskipLineComment (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__14) dtb__13))))) else (if (if ((bi_eq_int dtb__14) 123) then ((bi_eq_int dtb__16) 45) else false) then (match ((v_Vuna_dCompiler_dLexer_dskipBlockComment 1) (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__14) dtb__13)))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__18) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__18))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__19) -> (v_Vuna_dCompiler_dLexer_dskipTrivia dtb__19)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk (cs))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (cs))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (cs))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs))

let rec v_Vuna_dCompiler_dLexer_dcollectIdent = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dLexer_disIdentChar dtb__22) then ((v_Vuna_dCompiler_dLexer_dcollectIdent (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__23, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__22) dtb__21)))) (C_Base_dList_dList_Cons (dtb__22, mc1))) else (if ((bi_eq_int dtb__22) 46) then (match dtb__23 with
  | C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (v_Vuna_dCompiler_dLexer_disIdentStart dtb__24) then ((v_Vuna_dCompiler_dLexer_dcollectIdent (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__23, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__22) dtb__21)))) (C_Base_dList_dList_Cons (dtb__22, mc1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21)))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21))))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (C_Base_dList_dList_Nil, dtb__21))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLexer_dcollectInt = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dLexer_disDigit dtb__28) then ((v_Vuna_dCompiler_dLexer_dcollectInt (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__29, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__28) dtb__27)))) ((bi_add ((bi_mul mc1) 10)) ((bi_sub dtb__28) 48))) else (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__28, dtb__29)), dtb__27)))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (C_Base_dList_dList_Nil, dtb__27))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLexer_dcollectOp = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dLexer_disOpChar dtb__32) then ((v_Vuna_dCompiler_dLexer_dcollectOp (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__33, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__32) dtb__31)))) (C_Base_dList_dList_Cons (dtb__32, mc1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__32, dtb__33)), dtb__31)))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (C_Base_dList_dList_Nil, dtb__31))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLexer_dscanString = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if ((bi_eq_int dtb__36) 34) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__36) dtb__35))))))) else (if ((bi_eq_int dtb__36) 10) then (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated string literal")) else (if ((bi_eq_int dtb__36) 92) then ((v_Vuna_dCompiler_dLexer_dscanEscape (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__36) dtb__35)))) mc1) else ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__36) dtb__35)))) (C_Base_dList_dList_Cons (dtb__36, mc1))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated string literal"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLexer_dscanEscape = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if ((bi_eq_int dtb__40) 110) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (10, mc1))) else (if ((bi_eq_int dtb__40) 116) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (9, mc1))) else (if ((bi_eq_int dtb__40) 114) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (13, mc1))) else (if ((bi_eq_int dtb__40) 34) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (34, mc1))) else (if ((bi_eq_int dtb__40) 92) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (92, mc1))) else (if ((bi_eq_int dtb__40) 39) then ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__40) dtb__39)))) (C_Base_dList_dList_Cons (39, mc1))) else (C_Base_dResult_dResult_Base_dResult_dErr ("unknown escape sequence"))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated string literal"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLexer_dlexChars = (fun cs -> (match (v_Vuna_dCompiler_dLexer_dskipTrivia cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__42) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__42))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__43) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (((v_Vuna_dCompiler_dLexer_dlexToken dtb__46) dtb__47) dtb__45)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTEof, dtb__45)), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__43)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLexer_dlexToken = (fun c -> (fun rest -> (fun p -> (if (v_Vuna_dCompiler_dLexer_disIdentStart c) then (match ((v_Vuna_dCompiler_dLexer_dcollectIdent (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (rest, ((v_Vuna_dCompiler_dLexer_dadvanceChar c) p)))) (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil))) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (match (v_Vuna_dCompiler_dLexer_dlexChars dtb__49) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__50))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__51) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok ((v_Vuna_dCompiler_dLexer_dclassifyIdent dtb__48), p)), dtb__51))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dLexer_disDigit c) then (match ((v_Vuna_dCompiler_dLexer_dcollectInt (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (rest, ((v_Vuna_dCompiler_dLexer_dadvanceChar c) p)))) ((bi_sub c) 48)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (match (v_Vuna_dCompiler_dLexer_dlexChars dtb__53) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__54) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__54))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__55) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok ((C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt (dtb__52)), p)), dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_int c) 34) then (match ((v_Vuna_dCompiler_dLexer_dscanString (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (rest, ((v_Vuna_dCompiler_dLexer_dadvanceChar c) p)))) C_Base_dList_dList_Nil) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__56) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__56))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__57) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (match (v_Vuna_dCompiler_dLexer_dlexChars dtb__59) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__60) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__60))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok ((C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr (dtb__58)), p)), dtb__61))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (if (if (if (if (if (if ((bi_eq_int c) 40) then true else ((bi_eq_int c) 41)) then true else ((bi_eq_int c) 91)) then true else ((bi_eq_int c) 93)) then true else ((bi_eq_int c) 44)) then true else ((bi_eq_int c) 123)) then true else ((bi_eq_int c) 125)) then (match (v_Vuna_dCompiler_dLexer_dlexChars (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (rest, ((v_Vuna_dCompiler_dLexer_dadvanceChar c) p)))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__62) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__62))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__63) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok ((C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym ((dtp_pack (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil))))), p)), dtb__63))))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dLexer_disOpChar c) then (match ((v_Vuna_dCompiler_dLexer_dcollectOp (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (rest, ((v_Vuna_dCompiler_dLexer_dadvanceChar c) p)))) (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil))) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> (match (v_Vuna_dCompiler_dLexer_dlexChars dtb__65) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__66) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__66))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__67) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok ((C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__64)), p)), dtb__67))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected character"))))))))))

let v_Vuna_dCompiler_dLexer_dlexSource = (fun source -> (v_Vuna_dCompiler_dLexer_dlexChars (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((dtp_unpack source), (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))))

let v_Vuna_dCompiler_dLexer_dcommentKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment (dtb__68, dtb__69, dtb__70) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLexer_dcommentText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment (dtb__71, dtb__72, dtb__73) -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment (dtb__74, dtb__75, dtb__76) -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (if (if ((bi_eq_int dtb__77) 32) then true else ((bi_eq_int dtb__77) 9)) then true else ((bi_eq_int dtb__77) 13)) then (v_Vuna_dCompiler_dLexer_ddropTrailingSpace dtb__78) else (C_Base_dList_dList_Cons (dtb__77, dtb__78)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLexer_dtrimTrailingSpace = (fun s -> (dtp_pack (v_Base_dList_dreverse (v_Vuna_dCompiler_dLexer_ddropTrailingSpace (v_Base_dList_dreverse (dtp_unpack s))))))

let rec v_Vuna_dCompiler_dLexer_dskipStringBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if ((bi_eq_int dtb__81) 34) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__82, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__81) dtb__80))))) else (if ((bi_eq_int dtb__81) 92) then (match dtb__82 with
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (v_Vuna_dCompiler_dLexer_dskipStringBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__84, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__83) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__81) dtb__80)))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated string literal"))
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dLexer_dskipStringBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__82, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__81) dtb__80))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated string literal"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLexer_dcollectLineBody = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if ((bi_eq_int dtb__87) 10) then (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((C_Base_dList_dList_Cons (dtb__87, dtb__88)), dtb__86)), mc2)))) else (((v_Vuna_dCompiler_dLexer_dcollectLineBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__88, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__87) dtb__86)))) (C_Base_dList_dList_Cons (dtb__87, mc1))) dtb__86))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (C_Base_dList_dList_Nil, dtb__86)), mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLexer_dcollectBlockBody = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__92 with
  | C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (if (if ((bi_eq_int dtb__91) 123) then ((bi_eq_int dtb__93) 45) else false) then ((((v_Vuna_dCompiler_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__94, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__91) dtb__90))))) ((bi_add mc1) 1)) (C_Base_dList_dList_Cons (dtb__93, (C_Base_dList_dList_Cons (dtb__91, mc2))))) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) dtb__90)) else (if (if ((bi_eq_int dtb__91) 45) then ((bi_eq_int dtb__93) 125) else false) then (if ((bi_eq_int mc1) 1) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc2)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__94, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__91) dtb__90)))), ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) dtb__90))))))) else ((((v_Vuna_dCompiler_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__94, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__91) dtb__90))))) ((bi_sub mc1) 1)) (C_Base_dList_dList_Cons (dtb__93, (C_Base_dList_dList_Cons (dtb__91, mc2))))) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__93) dtb__90))) else ((((v_Vuna_dCompiler_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__92, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__91) dtb__90)))) mc1) (C_Base_dList_dList_Cons (dtb__91, mc2))) dtb__90)))
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__92, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__91) dtb__90)))) mc1) (C_Base_dList_dList_Cons (dtb__91, mc2))) dtb__90)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("unterminated block comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLexer_dcommentSpanOf = (fun startP -> (fun endP -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", (v_Vuna_dCompiler_dCommon_dposLine startP), (v_Vuna_dCompiler_dCommon_dposCol startP), (v_Vuna_dCompiler_dCommon_dposLine endP), (v_Vuna_dCompiler_dCommon_dposCol endP)))))

let rec v_Vuna_dCompiler_dLexer_dscanComments = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__95, dtb__96) -> (match dtb__95 with
  | C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if ((bi_eq_int dtb__97) 34) then (match (v_Vuna_dCompiler_dLexer_dskipStringBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__98, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__97) dtb__96)))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__99) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__99))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__100) -> ((v_Vuna_dCompiler_dLexer_dscanComments dtb__100) mc1)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__98 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (if ((bi_eq_int dtb__97) 45) then ((bi_eq_int dtb__101) 45) else false) then (match (((v_Vuna_dCompiler_dLexer_dcollectLineBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__102, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__101) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__97) dtb__96))))) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__101) dtb__96)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((v_Vuna_dCompiler_dLexer_dscanComments dtb__105) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment (C_Vuna_dCompiler_dLexer_dCKind_Vuna_dCompiler_dLexer_dCLine, (v_Vuna_dCompiler_dLexer_dtrimTrailingSpace dtb__103), ((v_Vuna_dCompiler_dLexer_dcommentSpanOf dtb__96) dtb__106))), mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (if ((bi_eq_int dtb__97) 123) then ((bi_eq_int dtb__101) 45) else false) then (match ((((v_Vuna_dCompiler_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__102, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__101) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__97) dtb__96))))) 1) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__101) dtb__96)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__107) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__107))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__108) -> (match dtb__108 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> ((v_Vuna_dCompiler_dLexer_dscanComments dtb__111) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLexer_dComment_Vuna_dCompiler_dLexer_dComment (C_Vuna_dCompiler_dLexer_dCKind_Vuna_dCompiler_dLexer_dCBlock, dtb__109, ((v_Vuna_dCompiler_dLexer_dcommentSpanOf dtb__96) dtb__112))), mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dLexer_dscanComments (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars (dtb__98, ((v_Vuna_dCompiler_dLexer_dadvanceChar dtb__97) dtb__96)))) mc1)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc1)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLexer_dlexComments = (fun source -> ((v_Vuna_dCompiler_dLexer_dscanComments (C_Vuna_dCompiler_dLexer_dChars_Vuna_dCompiler_dLexer_dChars ((dtp_unpack source), (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))) C_Base_dList_dList_Nil))
