open Cmdliner

module Let_syntax = struct
  let ( let+ ) t f = Term.(const f $ t)

  let ( and+ ) a b = Term.(const (fun x y -> x, y) $ a $ b)
end

open Let_syntax

let envs =
  [ Term.env_info
      "STORK_CACHE_DIR"
      ~doc:"The directory where the application data is stored."
  ; Term.env_info
      "STORK_CONFIG_DIR"
      ~doc:"The directory where the configuration files are stored."
  ]

let term =
  let+ log_level =
    let env = Arg.env_var "STORK_VERBOSITY" in
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
  | `Git_error _ ->
    12

let handle_errors = function
  | Ok () ->
    if Logs.err_count () > 0 then 3 else 0
  | Error err ->
    Logs.err (fun m -> m "%s" (Stork.Stork_error.to_string err));
    error_to_code err

let exits =
  Term.exit_info 3 ~doc:"on indiscriminate errors reported on stderr."
  ::
  Term.exit_info 4 ~doc:"on missing required environment variable."
  ::
  Term.exit_info 5 ~doc:"on invalid path given as argument."
  ::
  Term.exit_info 6 ~doc:"on empty file list given as argument."
  ::
  Term.exit_info 7 ~doc:"on invalid atd file given as argument."
  ::
  Term.exit_info
    8
    ~doc:"on file not having a correct version number given as argument."
  ::
  Term.exit_info 9 ~doc:"on files with different prefixes given as argument."
  ::
  Term.exit_info 10 ~doc:"on ATD error when generating serializers"
  ::
  Term.exit_info 11 ~doc:"on using different main types"
  :: Term.exit_info 12 ~doc:"on failed `git show` call" :: Term.default_exits
