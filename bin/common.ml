open Cmdliner

module Let_syntax = struct
  let ( let+ ) t f = Term.(const f $ t)

  let ( and+ ) a b = Term.(const (fun x y -> x, y) $ a $ b)
end

open Let_syntax

let envs =
  [ Cmd.Env.info
      "STORK_CACHE_DIR"
      ~doc:"The directory where the application data is stored."
  ]

let term =
  let+ log_level =
    let env = Cmd.Env.info "STORK_VERBOSITY" in
    Logs_cli.level ~docs:Manpage.s_common_options ~env ()
  in
  Fmt_tty.setup_std_outputs ();
  Logs.set_level log_level;
  Logs.set_reporter (Logs_fmt.reporter ~app:Fmt.stdout ());
  0

let error_to_code = function
  | `Missing_env_var _ ->
    4
  | `Invalid_path _ ->
    5
  | `Empty_list ->
    6
  | `Invalid_atd_file _ ->
    7
  | `Invalid_version _ ->
    8
  | `Different_prefix _ ->
    9
  | `Atd_error _ ->
    10
  | `Different_main_type _ ->
    11
  | `System_error _ ->
    12
  | `Empty_atd_file _ ->
    13
  | `No_version_field _ ->
    14
  | `Incoherent_version_field _ ->
    15

let handle_errors = function
  | Ok () ->
    if Logs.err_count () > 0 then 3 else 0
  | Error err ->
    Logs.err (fun m -> m "%s" (Stork.Stork_error.to_string err));
    error_to_code err

let exits =
  Cmd.Exit.info 3 ~doc:"on indiscriminate errors reported on stderr."
  :: Cmd.Exit.info 4 ~doc:"on missing required environment variable."
  :: Cmd.Exit.info 5 ~doc:"on invalid path given as argument."
  :: Cmd.Exit.info 6 ~doc:"on empty file list given as argument."
  :: Cmd.Exit.info 7 ~doc:"on invalid atd file given as argument."
  :: Cmd.Exit.info
       8
       ~doc:"on file not having a correct version number given as argument."
  :: Cmd.Exit.info 9 ~doc:"on files with different prefixes given as argument."
  :: Cmd.Exit.info 10 ~doc:"on ATD error when generating serializers"
  :: Cmd.Exit.info 11 ~doc:"on using different main types"
  :: Cmd.Exit.info 12 ~doc:"on failed system call"
  :: Cmd.Exit.info 13 ~doc:"on running on an empty ATD file"
  :: Cmd.Exit.info 14 ~doc:"when main type is not a record with a version field"
  :: Cmd.Exit.info
       15
       ~doc:
         "when the version field is an int but the version cannot be converted \
          to an int"
  :: Cmd.Exit.defaults
