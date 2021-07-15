open Stork

let atdgen ?output_prefix ~options file =
  let prefix_option =
    match output_prefix with Some prefix -> "-o " ^ prefix ^ " " | None -> ""
  in
  Sys.command ("atdgen " ^ options ^ " " ^ prefix_option ^ file)

let atdgen_j ?(rescript = false) =
  atdgen ~options:(if rescript then " -bs" else "-j -j-std")

let atdgen_t = atdgen ~options:"-t"

let rec atdgen ?(rescript = false) ?output_prefix:original_prefix = function
  | [] ->
    Ok ()
  | file :: tail ->
    let open Letops.Result in
    let* _, _, version = Generator.split_elements file in
    let output_prefix =
      Option.map
        (fun output_prefix -> output_prefix ^ "_" ^ version)
        original_prefix
    in
    (match
       atdgen_t ?output_prefix file, atdgen_j ?output_prefix ~rescript file
     with
    | 0, 0 ->
      atdgen ~rescript ?output_prefix:original_prefix tail
    | 0, i | i, _ ->
      Error (`Atd_error (i, file)))

let run ?output_prefix ?(rescript = false) files =
  let impl_kind =
    match rescript with true -> Config.Rescript | false -> Config.Native
  in
  Result.bind (atdgen ?output_prefix ~rescript files) (fun () ->
      Generator.main ~impl_kind ?output_prefix files)
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
  and+ rescript =
    let doc =
      "Produce files example_bs.mli and example_bs.ml containing OCaml \
       serializers and deserializers for the JSON data format from the \
       specifications in example.atd using rescript's json api."
    in
    let docv = "RESCRIPT" in
    Arg.(value & flag & info [ "rescript" ] ~doc ~docv)
  in
  run ?output_prefix ~rescript files |> Common.handle_errors

let cmd = term, info
