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
        (fun output_prefix -> output_prefix ^ "_" ^ string_of_int version)
        original_prefix
    in
    (match
       atdgen_t ?output_prefix file, atdgen_j ?output_prefix ~rescript file
     with
    | 0, 0 ->
      atdgen ~rescript ?output_prefix:original_prefix tail
    | 0, i | i, _ ->
      Error (`Atd_error (i, file)))

let rec checkout ~git_file = function
  | [] ->
    Ok []
  | file :: tail ->
    let open Letops.Result in
    let* version, commit = Generator.split_commit file in
    let* filename, _extension = Generator.split_filename git_file in
    (* This checks out the commit of the versioned file in the same location as the file.
     * Dangerous?! Should it be in output_prefix, or in a temporary directory?
     *)
    let temp_file = filename ^ "_" ^ string_of_int version ^ ".atd" in
    let commit = match commit with None -> "HEAD" | Some commit -> commit in
    let cmd = "git show " ^ commit ^ ":" ^ git_file ^ " > " ^ temp_file in
    (match Sys.command cmd with
    | 0 ->
      let* tail = checkout ~git_file tail in
      Ok (temp_file :: tail)
    | retval ->
      Error (`Git_error retval))

let run ?output_prefix ?(rescript = false) ?(git = None) files =
  let open Letops.Result in
  let* files =
    match git with
    | None ->
      Ok files
    | Some git_file ->
      checkout ~git_file files
  in
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
    let doc =
      "The ATD files to generate migrators for, e.g. foo_*.atd, or in \
       conjunction with --git, the commit hashes and versions, e.g. \
       <version>:<git_sha>"
    in
    let docv = "FILE" in
    Arg.(non_empty & pos_all string [] & info [] ~doc ~docv)
  and+ output_prefix =
    let doc =
      "Use this prefix for the generated files, e.g. 'foo/bar' for foo/bar.ml \
       and foo/bar.mli"
    in
    let docv = "PREFIX" in
    Arg.(value & opt (some string) None & info [ "o" ] ~doc ~docv)
  and+ git =
    let doc = "Use this ATD file under version control" in
    let docv = "GIT" in
    Arg.(value & opt (some string) None & info [ "git" ] ~doc ~docv)
  and+ rescript =
    let doc =
      "Produce files example_bs.mli and example_bs.ml containing OCaml \
       serializers and deserializers for the JSON data format from the \
       specifications in example.atd using rescript's json api."
    in
    let docv = "RESCRIPT" in
    Arg.(value & flag & info [ "rescript" ] ~doc ~docv)
  in
  run ?output_prefix ~rescript ~git files |> Common.handle_errors

let cmd = term, info
