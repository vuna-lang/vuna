(** 外部编译器 vunax（用 OCaml 实现）的公共入口。

    vunax 负责把 vuna 源码编译成 OCaml，供自举阶段使用；它本身不是 自举种子。目前是占位实现：后续在这里加入
    lexer、parser、typecheck、 codegen_ocaml 等模块，对外暴露把 vuna 源码编译成 OCaml 的接口。 *)

let version = "0.1.0"
let banner = "vunax: external vuna compiler (written in OCaml)"
