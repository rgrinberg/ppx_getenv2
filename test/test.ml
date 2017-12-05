
let () =
  match [%getenv "PPX_GETENV2"] with
  | None -> ()
  | Some _ -> ()

let () = assert ([%getenv "DOES_NOT_EXIST"] = None)
