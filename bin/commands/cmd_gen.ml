open Stork

let atdgen_j file = Sys.command ("atdgen -j -j-std " ^ file)

let atdgen_t file = Sys.command ("atdgen -t " ^ file)

let rec atdgen = function
  | [] ->
    Ok ()
  | file :: tail ->
    (match atdgen_t file, atdgen_j file with
    | 0, 0 ->
      atdgen tail
    | 0, i | i, _ ->
      Error (`Atd_error (i, file)))

let run ~files =
  Result.bind (atdgen files) (fun () -> Generator.main files)
  |> Result.map (fun _ -> ())

open Cmdliner

let doc = "Generate migrator files for the given ATD files"

let sdocs = Manpage.s_common_options

let exits = Common.exits

let envs = Common.envs

let man =
  [ `S Manpage.s_description
  ; `P "Generate migrator files for the given $(tfile) ATD files."
  ]

let info = Term.info "gen" ~doc ~sdocs ~exits ~envs ~man

let term =
  let open Common.Let_syntax in
  let+ _term = Common.term
  and+ files =
    let doc = "The ATD files to generate migrators for, eg. foo_*.atd" in
    let docv = "FILE" in
    Arg.(non_empty & pos_all file [] & info [] ~doc ~docv)
  in
  run ~files |> Common.handle_errors

let cmd = term, info
