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

### Building documentation

Documentation for the libraries in the project can be generated with:

```bash
dune build @doc
```

### Releasing

To create a release and publish it on Opam, first update the `CHANGES.md` file with the last changes and the version that you want to release.
The, you can run the script `script/release.sh`. The script will perform the following actions:

- Create a tag with the version found in `stork.opam`, and push it to your repository.
- Create the distribution archive.
- Publish the distribution archive to a GitHub Release.
- Submit a PR on Opam's repository.

When the release is published on GitHub, the CI/CD will trigger the `Release` workflow which will compile binaries for all supported platforms and add them to the GitHub Release as assets.

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
