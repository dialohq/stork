open Stork

let atdgen ?output_prefix ~options ~type_attr ?(atdgen_opt = "") file =
  let prefix_option =
    match output_prefix with
    | Some prefix -> [%string "-o $prefix "]
    | None -> ""
  in
  let type_attr =
    List.fold_left ~init:"" type_attr ~f:(fun s type_attr ->
        [%string "$(s) -type-attr $(type_attr)"])
  in
  Sys.command
    [%string
      "atdgen $options $(prefix_option) $(type_attr) $(atdgen_opt) $(file)"]

let atdgen_j ?atdgen_opt ?(rescript = false) ?(atdgen_j_opt = "") =
  let main_opt = if rescript then " -bs" else "-j -j-std" in
  atdgen ?atdgen_opt ~options:[%string "$(main_opt) $(atdgen_j_opt)"]

let atdgen_t ?atdgen_opt ?(atdgen_t_opt = "") =
  atdgen ?atdgen_opt ~options:[%string "-t $(atdgen_t_opt)"]

let rec atdgen
    ?(rescript = false)
    ?output_prefix:original_prefix
    ~type_attr
    ?atdgen_opt
    ?atdgen_t_opt
    ?atdgen_j_opt
  = function
  | [] -> Ok ()
  | file :: tail ->
    let open Letops.Result in
    let* _, _, version = Generator.split_elements file in
    let output_prefix =
      Option.map
        (fun output_prefix -> [%string "$(output_prefix)_$(version)"])
        original_prefix
    in
    (match
       ( atdgen_t ?output_prefix ~type_attr ?atdgen_opt ?atdgen_t_opt file,
         atdgen_j ?output_prefix ~type_attr ?atdgen_opt ?atdgen_j_opt ~rescript
           file )
     with
    | 0, 0 -> atdgen ~rescript ~type_attr ?output_prefix:original_prefix tail
    | 0, i | i, _ -> Error (`Atd_error (i, file)))

let rec checkout ~git_file ~temp_dir = function
  | [] -> Ok []
  | head :: tail ->
    let open Letops.Result in
    let* version, commit = Generator.split_commit head in
    let* _folder, filename, _extension = Generator.split_filename git_file in
    let temp_file =
      Filename.concat temp_dir (filename ^ "_" ^ string_of_int version ^ ".atd")
    in
    (* When no commit hash is given, take what's in the working directory *)
    let cmd =
      match commit with
      | Some commit -> "git show " ^ commit ^ ":" ^ git_file ^ " > " ^ temp_file
      | None -> "cp " ^ git_file ^ " " ^ temp_file
    in
    (match Sys.command cmd with
    | 0 ->
      let* tail = checkout ~git_file ~temp_dir tail in
      Ok (temp_file :: tail)
    | retval -> Error (`System_error (cmd, retval)))

let run
    ?output_prefix
    ?(rescript = false)
    ?(git = None)
    ~type_attr
    ?atdgen_opt
    ?atdgen_t_opt
    ?atdgen_j_opt
    ~no_gen
    files
  =
  let open Letops.Result in
  let* files =
    match git with
    | None -> Ok files
    | Some git_file ->
      let* cache_dir = Config.cache_dir in
      (* We need to create the cache dir if it doesn't exist.
       * Should this rather be in config.ml?
       *)
      let* _ =
        let cmd = "mkdir -p " ^ cache_dir in
        match Sys.command cmd with
        | 0 -> Ok ()
        | retval -> Error (`System_error (cmd, retval))
      in
      checkout ~git_file ~temp_dir:cache_dir files
  in
  let impl_kind =
    match rescript with true -> Config.Rescript | false -> Config.Native
  in
  Result.bind
    (if no_gen then Ok ()
    else
      atdgen ?output_prefix ~rescript ~type_attr ?atdgen_opt ?atdgen_t_opt
        ?atdgen_j_opt files)
    (fun () -> Generator.main ~impl_kind ?output_prefix files)
  |> Result.map (fun _ -> ())

open Cmdliner

let doc = "Generate migrator files for the given ATD files"

let sdocs = Manpage.s_common_options

let exits = Common.exits

let envs = Common.envs

let man =
  [
    `S Manpage.s_description;
    `P "Generate migrator files for the given $(tfile) ATD files.";
  ]

let info = Cmd.info "gen" ~doc ~sdocs ~exits ~envs ~man

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
    let docv = "GIT_FILE" in
    Arg.(value & opt (some string) None & info [ "git" ] ~doc ~docv)
  and+ rescript =
    let doc =
      "Produce files example_bs.mli and example_bs.ml containing OCaml \
       serializers and deserializers for the JSON data format from the \
       specifications in example.atd using rescript's json api."
    in
    let docv = "RESCRIPT" in
    Arg.(value & flag & info [ "rescript" ] ~doc ~docv)
  and+ type_attr =
    let doc =
      "Insert '[@@ATTR]' after OCaml type definitions. Option can be used \
       multiple times to specify several attributes"
    in
    let docv = "ATTR" in
    Arg.(value & opt_all string [] & info [ "type-attr" ] ~doc ~docv)
  and+ atdgen_opt =
    let doc = "Forward OPTION to atdgen -t and atdgen -j" in
    let docv = "OPTION" in
    Arg.(value & opt (some string) None & info [ "atdgen-opt" ] ~doc ~docv)
  and+ atdgen_t_opt =
    let doc = "Forward OPTION to atdgen -t" in
    let docv = "OPTION" in
    Arg.(value & opt (some string) None & info [ "atdgen-t-opt" ] ~doc ~docv)
  and+ atdgen_j_opt =
    let doc = "Forward OPTION to atdgen -j" in
    let docv = "OPTION" in
    Arg.(value & opt (some string) None & info [ "atdgen-j-opt" ] ~doc ~docv)
  and+ no_gen =
    let doc =
      "Prevent Stork from calling atdgen. Use this if you want to generate the \
       `_t`, `_j`/`_bs` files yourself"
    in
    let docv = "FLAG" in
    Arg.(value & flag & info [ "no-gen" ] ~doc ~docv)
  in
  run ?output_prefix ~rescript ~git ~type_attr ?atdgen_opt ?atdgen_t_opt
    ?atdgen_j_opt ~no_gen files
  |> Common.handle_errors

let cmd = Cmd.v info term
