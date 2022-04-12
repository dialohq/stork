open Cmdliner

let cmds = [ Cmd_gen.cmd ]

(* Command line interface *)

let doc = "A JSON migrator CLI for ATD"
let sdocs = Manpage.s_common_options
let exits = Common.exits
let envs = Common.envs

let man =
  [
    `S Manpage.s_description;
    `P "A JSON migrator CLI for ATD";
    `S Manpage.s_commands;
    `S Manpage.s_common_options;
    `S Manpage.s_exit_status;
    `P "These environment variables affect the execution of $(mname):";
    `S Manpage.s_environment;
    `S Manpage.s_bugs;
    `P "File bug reports at $(i,https://github.com/dialohq/stork/issues)";
    `S Manpage.s_authors;
    `P "Paul Tsnobiladze, $(i,https://github.com/tsnobip)";
  ]

let default =
  let open Common.Let_syntax in
  Term.ret
  @@ let+ _ = Common.term in
     `Help (`Pager, None)

let default_cmd_info =
  Cmd.info "stork" ~version:"%%VERSION%%" ~doc ~sdocs ~exits ~man ~envs

(* let () = Term.(exit_status @@ eval_choice default_cmd cmds) *)

let () = Cmd.group ~default default_cmd_info cmds |> Cmd.eval' |> exit
