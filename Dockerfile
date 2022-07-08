FROM ocaml/opam:ubuntu-22.04-ocaml-4.14 as app

WORKDIR /app

RUN sudo apt -y install pkg-config libpcre3-dev

COPY stork.opam stork.opam.locked ./
RUN opam repo set-url default https://opam.ocaml.org
RUN opam update
RUN opam install . --deps-only --locked --with-test

COPY . ./

RUN opam install . --locked --with-test

ENTRYPOINT ["opam", "exec", "--"]
