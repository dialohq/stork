val config_dir : (string, Stork_error.t) Result.t

val cache_dir : (string, Stork_error.t) Result.t

type impl_kind =
  | Native
  | Rescript
