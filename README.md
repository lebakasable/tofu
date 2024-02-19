<div align="center">
  <img src="assets/logo.svg" width="200" />

  <h1><p>boba</p></h1>

  A low-level concatenative programming language.
</div>

> [!WARNING]
> This language is a work in progress. Anything can change at any moment without any notice. Use it at your own risk!

## Quick Start

### Bootstrapping

Since Boba is self-hosted, you need to bootstrap it first. There are some pre-compiled assembly files in [bootstrap](./bootstrap/)] folder that you can use for that.

First, you will need to install [FASM](https://flatassembler.net/) and make sure it's available in `$PATH`.

```bash
$ fasm bootstrap/boba.asm boba
$ ./boba boba.bb
$ ./boba boba.bb
$ ./boba boba.bb
...
```

## Compilation

Compilation generates assembly code and compiles it with [FASM](https://flatassembler.net/). So make sure you have it available in your `$PATH`.

```bash
$ cat hello.bb
import lib.std

to start: int argc, ptr argv -> int
  "Hello, World!\n" puts
$ ./boba hello.bb
...
... compilation logs ...
...
$ ./hello
Hello, World!
```

### Testing

Test cases are located in [tests](./tests/) folder. The `.txt` files contain inputs (command line arguments, stdin) and expected outputs (exit code, stdout, stderr) of the corresponding programs.

Run [test.py](./test.py) script to execute the programs and assert their outputs:

```bash
$ ./test.py run
```

To updated expected outputs of the programs run the `update` subcommand:

```bash
$ ./test.py update
```

To update expected command line arguments and stdin of a specific program run the `update input <path/to/program.bb>` subcommand:

```bash
$ ./test.py update input ./tests/argv.bb new cmd args
[INFO] Provide the stdin for the test case. Press ^D when you are done...
Hello, World
^D
[INFO] Saving input to ./tests/argv.txt
```

For more info see `./test.py help`
