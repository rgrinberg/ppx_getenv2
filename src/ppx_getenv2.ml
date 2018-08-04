open Ppxlib

let name = "getenv"

let expand ~loc ~path:_ (env : string) =
  match Caml.Sys.getenv env with
  | s -> [%expr Some ([%e Ast_builder.Default.estring s ~loc])]
  | exception Not_found -> [%expr None]

let ext =
  Extension.declare
    name
    Extension.Context.expression
    Ast_pattern.(single_expr_payload (estring __))
    expand

let () = Ppxlib.Driver.register_transformation name ~extensions:[ext]
