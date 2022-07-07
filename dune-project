(lang dune 3.3)

(name stork)

(source
 (github dialohq/stork))

(license MIT)

(authors "Paul Tsnobiladz\195\169")

(maintainers "Paul Tsnobiladz\195\169")

(generate_opam_files true)

(package
 (name stork)
 (synopsis "A JSON migrator CLI for ATD")
 (description "A JSON migrator CLI for ATD\n")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  cmdliner
  logs
  fmt
  (atd
   (= 2.4.1))
  (atdgen
   (= 2.4.1))
  biniou
  logs
  ppx_deriving
  (ppx_string_interpolation :build)
  yojson
  (ocaml-lsp-server :dev)
  (ocamlformat
   (and
    :dev
    (= 0.21.0)))
  (patdiff :dev)
  (utop :dev)))
