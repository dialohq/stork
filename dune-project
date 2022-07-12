(lang dune 2.9)

(name stork)

(source
 (github dialohq/stork))

(license MIT)

(authors "Paul Tsnobiladz\195\169")

(maintainers "Paul Tsnobiladz\195\169")

(generate_opam_files true)

(cram enable)

(package
 (name stork)
 (synopsis "A JSON migrator CLI for ATD")
 (description "A JSON migrator CLI for ATD\n")
 (depends
  (ocaml
   (>= 4.08.0))
  (ocaml-base-compiler
   (and
    :dev
    (= 4.14.0)))
  dune
  cmdliner
  logs
  fmt
  atd
  atdgen
  biniou
  logs
  ppx_deriving
  (ppx_string_interpolation :build)
  yojson
  (ocaml-lsp-server :dev)
  (ocamlformat :dev)
  (patdiff :dev)
  (utop :dev)
  (odoc :with-doc)))
