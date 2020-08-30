open Core

let do_hash file =
  Md5.digest_file_blocking file
  |> Md5.to_hex
  |> print_endlin

let filename_param =
  let open Command.Param in
  anon ("filename" %: string)
(* anon => anonymous argument *)
(* How does string come from Command.Param? Isn't it default? *)
(* utop   :: let fp = Command.Param.(anon ("filename" %: string));; *)
(* output :: val fp : string Command.Spec.param = <abstr> *)

let command =
  Command.basic
  ~summary:"Generate an MD5 hash of the input data"
  ~readme:(fun () -> "More detailed information") (* Optional Argument *)
  (Command.Param.map filename_param ~f:(fun filename ->
    (fun () -> do_hash filename)))
(* 
  #typeof "Command.basic" ;;
  val ( Core.Command.basic ) : Core_kernel__.Import.unit Core.Command.basic_command
  #show Command.basic;;
  val basic : unit Command.basic_command 
*)