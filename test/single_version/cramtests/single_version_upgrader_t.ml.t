  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version_upgrader_t.ml | ocamlformat --enable-outside-detected-project --impl -
