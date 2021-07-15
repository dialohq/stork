# Stork

[![Actions Status](https://github.com/dialohq/stork/workflows/CI/badge.svg)](https://github.com/dialohq/stork/actions)

A JSON migrator CLI for [ATD](https://github.com/ahrefs/atd)

## Installation

### Using Esy

Add this to your `esy.json` or `package.json` file:

```json
  ...
  {
    "stork": "*"
  },
  "resolutions": {
    "stork": "dialohq/stork#<COMMIT_SHA>"
  }
  ...
```

## Usage

```sh
stork gen -o 'dir/file' [ --rescript ]
```

Will generate `dir/file.ml` and `dir/file.mli`. Use `--rescript` to generate ReScript files.

TODO: explain whole workflow.

## Contributing

Take a look at our [Contributing Guide](CONTRIBUTING.md).
`