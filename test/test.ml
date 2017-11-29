
let () =
  match [%getenv "PATH"] with
  | None -> assert false
  | Some _ -> ()

let () = assert ([%getenv "DOES_NOT_EXIST"] = None)
