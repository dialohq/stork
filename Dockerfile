FROM ubuntu:jammy
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential \
  curl git rsync sudo unzip nano libcap-dev libx11-dev bubblewrap \ 
  pkg-config libpcre3-dev
RUN apt-get -y install opam
RUN opam init --disable-sandboxing -y
RUN opam repo set-url default https://opam.ocaml.org

RUN opam switch create 4.14 --packages=ocaml-base-compiler.4.14.0
RUN opam pin add -k version ocaml-base-compiler 4.14.0
RUN opam install -y opam-depext

WORKDIR /app

COPY stork.opam stork.opam.locked ./
RUN opam update -y

COPY . ./

ENTRYPOINT ["opam", "exec", "--"]
