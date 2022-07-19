FROM ocaml/opam:ubuntu-22.04-ocaml-4.14 as app

WORKDIR /app

RUN sudo apt -y install pkg-config libpcre3-dev opam

COPY stork.opam stork.opam.dev.locked ./
RUN opam repo set-url default https://opam.ocaml.org
RUN opam update

RUN opam install . --deps-only --locked --lock-suffix=dev.locked --with-test

COPY . ./

ENTRYPOINT ["opam", "exec", "--"]