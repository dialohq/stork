(lang dune 2.9)

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
  (dune
   (>= 2.0))
  (odoc :with-doc)
  cmdliner
  logs
  fmt))

(cram enable)
