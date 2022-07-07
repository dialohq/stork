# Contributing

## Setup your development environment

You need Opam, you can install it by following [Opam's documentation](https://opam.ocaml.org/doc/Install.html).

With Opam installed, you can install the dependencies in a new local switch with:

```bash
opam switch . --locked
```

Then, build the project with:

```bash
dune build
```

### Updating a dependency

If you update the dependencies in `dune-project` run

```bash
dune build
```

to update the opam file, then

```bash
opam reinstall --working-dir .
```

to sync the dependencies with your switch and finally

```bash
opam lock .
```

to update the lock file.

### Running Binary

After building the project, you can run the main binary that is produced.

```bash
dune exec stork
```

### Running Tests

You can run the test compiled executable:

```bash
dune test
```

### Updating Tests

You can then accept the correction of the cram tests with:

```bash
dune promote
```

### Repository Structure

The following snippet describes Stork's repository structure.

```text
.
├── .github/
|   Contains GitHub specific files such as actions definitions and issue templates.
│
├── bin/
|   Source for Stork's binary. This links to the library defined in `lib/`.
│
├── lib/
|   Source for Stork's library. Contains Stork's core functionalities.
│
├── test/
|   Unit tests and integration tests for Stork.
│
├── dune-project
|   Dune file used to mark the root of the project and define project-wide parameters.
|   For the documentation of the syntax, see https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
│
├── LICENSE
│
├── README.md
|
├── stork.opam
|   Opam package definition.
|   To know more about creating and publishing opam packages, see https://opam.ocaml.org/doc/Packaging.html
|
└── stork.opam.locked
    Opam lock file.
```
