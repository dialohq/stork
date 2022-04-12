  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version_upgrader_t.mli | ocamlformat --enable-outside-detected-project --intf -
