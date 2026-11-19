open Vuna_runtime
type t_Vuna_dCompiler_dBase_dSource_dPos = { f_Vuna_dCompiler_dBase_dSource_dPos_posLine : int; f_Vuna_dCompiler_dBase_dSource_dPos_posCol : int; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset : int; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset : int }
and t_Vuna_dCompiler_dBase_dSource_dSpan = { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile : string; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset : int }

# 46 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposLine = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dPos) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__0; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__1; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__2; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposCol = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dPos) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__4; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__5; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__6; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposOffset = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dPos) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__8; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__9; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__10; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposEndOffset = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dPos) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__12; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__13; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__14; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartLine = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__16; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__17; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__18; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__19; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__20; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__21; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__22 } -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartCol = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__23; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__24; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__25; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__26; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__27; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__28; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__29 } -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndLine = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__30; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__31; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__32; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__33; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__34; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__35; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__36 } -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndCol = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__37; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__38; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__39; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__40; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__41; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__42; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__43 } -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartOffset = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__44; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__45; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__46; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__47; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__48; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__49; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__50 } -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndOffset = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__51; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__52; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__53; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__54; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__55; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__56; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__57 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanFile = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__58; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__59; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__60; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__61; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__62; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__63; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__64 } -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dshowSpanLoc = (fun (mc0 : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__65; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__66; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__67; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__68; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__69; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__70; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__71 } -> (String.concat "" [dtb__65; ":"; (bi_strFromInt dtb__66); ":"; (bi_strFromInt dtb__67)])
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEmpty = { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }

# 98 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_disSpanEmpty = (fun (sp : t_Vuna_dCompiler_dBase_dSource_dSpan) -> ((v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp) = 0))

# 105 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanAtName = (fun (name : string) (sp : t_Vuna_dCompiler_dBase_dSource_dSpan) -> (if (v_Vuna_dCompiler_dBase_dSource_disSpanEmpty sp) then sp else (if ((v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) <> (v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp)) then v_Vuna_dCompiler_dBase_dSource_dspanEmpty else { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dBase_dSource_dspanFile sp); f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp); f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) + (bi_strLength name)); f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp); f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) + (bi_strLength name)) })))

# 122 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dmemChar = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if (dtb__72 = mc0) then true else ((v_Vuna_dCompiler_dBase_dSource_dmemChar mc0) dtb__73))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dscanFor = (fun (c : int) (s : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then false else (if (i >= n) then false else (if (((dtp_strAt s) i) = c) then true else (((((v_Vuna_dCompiler_dBase_dSource_dscanFor c) s) (i + 1)) n) (fuel - 1))))))

# 135 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dcontainsDot = (fun (s : string) -> (((((v_Vuna_dCompiler_dBase_dSource_dscanFor 46) s) 0) (bi_strLength s)) (bi_strLength s)))

# 148 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitOnCharGo = (fun (sep : int) (s : string) (start : int) (i : int) (n : int) (fuel : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((dtp_substring start) (n - start)) s), acc))) else (if (i >= n) then (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (if (((dtp_strAt s) i) = sep) then (((((((v_Vuna_dCompiler_dBase_dSource_dsplitOnCharGo sep) s) (i + 1)) (i + 1)) n) (fuel - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (((((((v_Vuna_dCompiler_dBase_dSource_dsplitOnCharGo sep) s) start) (i + 1)) n) (fuel - 1)) acc)))))

# 143 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnChar = (fun (sep : int) (s : string) -> (((((((v_Vuna_dCompiler_dBase_dSource_dsplitOnCharGo sep) s) 0) 0) (bi_strLength s)) ((bi_strLength s) + 1)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 139 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnDot = (fun (s : string) -> ((v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 46) s))

# 161 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitLastDot = (fun (parts : string Base_dData_dList.t_Base_dData_dList_dList) -> (match (Base_dData_dList.v_Base_dData_dList_dreverse parts) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = "" }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse dtb__75); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_ddotsRest = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, (v_Vuna_dCompiler_dBase_dSource_ddotsRest dtb__77)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_djoinDotsParts = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, (v_Vuna_dCompiler_dBase_dSource_ddotsRest dtb__79)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_djoinDots = (fun (xs : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.dtp_concatMany (v_Vuna_dCompiler_dBase_dSource_djoinDotsParts xs)))

# 187 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dlastSegGo = (fun (name : string) (i : int) (fuel : int) -> (if (fuel <= 0) then (((dtp_substring (i + 1)) (((bi_strLength name) - i) - 1)) name) else (if (i < 0) then name else (if (((dtp_strAt name) i) = 46) then (((dtp_substring (i + 1)) (((bi_strLength name) - i) - 1)) name) else (((v_Vuna_dCompiler_dBase_dSource_dlastSegGo name) (i - 1)) (fuel - 1))))))

# 184 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlastSeg = (fun (name : string) -> (((v_Vuna_dCompiler_dBase_dSource_dlastSegGo name) ((bi_strLength name) - 1)) ((bi_strLength name) + 1)))

# 199 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dprefixOfName = (fun (name : string) -> (match (v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 } -> (v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinSlashes = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__82
  | _ -> (String.concat "" [dtb__82; "/"; (v_Vuna_dCompiler_dBase_dSource_djoinSlashes dtb__83)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinArrows = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__84
  | _ -> (String.concat "" [dtb__84; " -> "; (v_Vuna_dCompiler_dBase_dSource_djoinArrows dtb__85)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitPathChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (if (dtb__86 = 47) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.dtp_pack dtb__87) } else ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars dtb__87) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__86, mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun chars -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ""; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.dtp_pack chars) }) (Base_dData_dList.v_Base_dData_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitPath = (fun (path : string) -> ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars (Base_dData_dList.dtp_unpack path)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 231 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dbaseName = (fun (path : string) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (v_Vuna_dCompiler_dBase_dSource_dsplitPath path)))

# 249 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_ddropPastSlash = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (if (dtb__88 = 47) then dtb__89 else (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash dtb__89))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dparentOfPath = (fun (path : string) -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dData_dList.v_Base_dData_dList_dlength after) = (Base_dData_dList.v_Base_dData_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse after))))) (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash rev))) (Base_dData_dList.v_Base_dData_dList_dreverse chars))) (Base_dData_dList.dtp_unpack path)))

# 277 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dprefixLen2 = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (if (dtb__90 = dtb__92) then (1 + ((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 dtb__91) dtb__93)) else 0)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE = (fun (la : int) (lb : int) (n : int) -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 261 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_d_usimilarName = (fun (a : string) (b : string) -> (if (a = b) then false else (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith a) b) then true else (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE (Base_dData_dList.v_Base_dData_dList_dlength la)) (Base_dData_dList.v_Base_dData_dList_dlength lb)) 2) then (((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 la) lb) >= 2) else false)) (Base_dData_dList.dtp_unpack b))) (Base_dData_dList.dtp_unpack a))))))

# 254 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsuggest = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (if ((v_Vuna_dCompiler_dBase_dSource_d_usimilarName mc0) dtb__94) then (String.concat "" [" (did you mean "; dtb__94; "?)"]) else ((v_Vuna_dCompiler_dBase_dSource_dsuggest mc0) dtb__95))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
