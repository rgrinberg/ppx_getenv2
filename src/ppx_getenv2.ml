open Ppx_core

let name = "getenv"

let expand ~loc ~path:_ (env : string) =
  let env = Ast_builder.Default.estring env ~loc in
  [%expr
    match Sys.getenv [%e env] with
    | s -> Some s
    | exception Not_found -> None
  ]

let ext =
  Extension.declare
    name
    Extension.Context.expression
    Ast_pattern.(single_expr_payload (estring __))
    expand

let () = Ppx_driver.register_transformation name ~extensions:[ext]
