open Stork

let run ~path =
  Generator.main path
  |> Result.map (fun res ->
         let () = Logs.app (fun m -> m "%s" res) in
         ())

open Cmdliner

let doc = "Generate migrator files for the ATD files that are on the given path"

let sdocs = Manpage.s_common_options

let exits = Common.exits

let envs = Common.envs

let man =
  [ `S Manpage.s_description
  ; `P "Generate migrator files for the ATD files that are on path $(tpath)."
  ]

let info = Term.info "gen" ~doc ~sdocs ~exits ~envs ~man

let term =
  let open Common.Let_syntax in
  let+ _term = Common.term
  and+ path =
    let doc = "The path to the ATD files to generate migrators for." in
    let docv = "PATH" in
    Arg.(required & pos 0 (some string) None & info [] ~doc ~docv)
  in
  run ~path |> Common.handle_errors

let cmd = term, info
