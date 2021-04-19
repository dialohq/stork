open Stork

let atdgen ?output_prefix ~options file =
  let prefix_option =
    match output_prefix with Some prefix -> "-o " ^ prefix ^ " " | None -> ""
  in
  Sys.command ("atdgen " ^ options ^ " " ^ prefix_option ^ file)

let atdgen_j = atdgen ~options:"-j -j-std"

let atdgen_t = atdgen ~options:"-t"

let rec atdgen ?output_prefix:original_prefix = function
  | [] ->
    Ok ()
  | file :: tail ->
    let open Letops.Result in
    let* _, _, version = Generator.split_elements file in
    let output_prefix =
      Option.map
        (fun output_prefix -> output_prefix ^ "_" ^ string_of_int version)
        original_prefix
    in
    (match atdgen_t ?output_prefix file, atdgen_j ?output_prefix file with
    | 0, 0 ->
      atdgen ?output_prefix:original_prefix tail
    | 0, i | i, _ ->
      Error (`Atd_error (i, file)))

let run ?output_prefix files =
  Result.bind (atdgen ?output_prefix files) (fun () ->
      Generator.main ?output_prefix files)
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
  and+ output_prefix =
    let doc =
      "Use this prefix for the generated files, e.g. 'foo/bar' for foo/bar.ml \
       and foo/bar.mli"
    in
    let docv = "PREFIX" in
    Arg.(value & opt (some string) None & info [ "o" ] ~doc ~docv)
  in
  run ?output_prefix files |> Common.handle_errors

let cmd = term, info
