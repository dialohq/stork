let home =
  try Ok (Sys.getenv "HOME") with
  | Not_found ->
    (try Ok (Unix.getpwuid (Unix.getuid ())).Unix.pw_dir with
    | Unix.Unix_error _ | Not_found ->
      if Sys.win32 then
        try Ok (Sys.getenv "AppData") with
        | Not_found ->
          Error (Stork_error.missing_env "AppData")
      else
        Error (Stork_error.missing_env "HOME"))

let default_cache_dir =
  Result.map
    (fun home -> "stork" |> Filename.concat ".cache" |> Filename.concat home)
    home

let cache_dir =
  Sys.getenv_opt "STORK_CACHE_DIR"
  |> Option.map Result.ok
  |> Option.value ~default:default_cache_dir

type impl_kind =
  | Native
  | Rescript
