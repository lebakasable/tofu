<div align="center">
  <img src="assets/logo.svg" width="200" />

# boba

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

to start: -> void
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

For more info see `./test.py help`.

## Language Reference

This is what the language supports so far. **Since the language is a work in progress everything in this section is the subject to change.**

### Literals

#### Integer

Currently, an integer is a sequence of decimal digits. When an integer is encountered, it is pushed onto the data stack for processing by the relevant operations.

Example:
```c
10 20 +
```

The code above pushes 10 and 20 onto the data stack and sums them up with `+` operation.

#### String

Currently, a string is any sequence of bytes between two `"`. No newlines inside of the strings are allowed. No special support for Unicode is provided right now. You can escape only these things for now:
- `\n` - new line
- `\r` - carriage return
- `\\` - back slash
- `\"` - double quote
- `\0` - null terminator

When the compiler encounters a string:
1. the bytes of the string are copied somewhere into the memory (the exact location is implementation specific),
2. the pointer to the beginning of the string is pushed onto the data stack.

Example:
```c
import lib.std

to start: -> void
  "Hello, World!\n" puts
```

The `puts` procedure from `lib.std` module expects the pointer to the beginning of the buffer it needs to print.

#### Character

Currently a character is a single byte sandwiched between two `'`. Escaping is not supported for now.

Example:
```c
import lib.std

to start: -> void
  'E' casti puti
```

This program pushes a character onto the stack and converts it into the integer `69` (since the ASCII code of letter `E` is 69) and prints it with the `puti` operation.

### Intrinsics (Built-in Words)

#### Stack Manipulation

| Name    | Signature         | Description                                  |
| ----    | ----------------- | -------------------------------------------- |
| `dup `  |  `a -> a a`       | duplicate an element on top of the stack.    |
| `over`  |  `a b -> a b a`   | copy the element below the top of the stack. |
| `swap`  |  `a b -> b a`     | swap 2 elements on the top of the stack.     |
| `rot `  |  `a b c -> c b a` | rotate the top three stack elements.         |
| `drop`  |  `a ->`           | drops the top element of the stack.          |

#### Comparison

| Name | Signature     | Description                                                 |
| ---- | ------------- | ----------------------------------------------------------- |
| `=`  | `a b -> bool` | checks if two elements on top of the stack are equal.       |
| `!=` | `a b -> bool` | checks if two elements on top of the stack are not equal.   |
| `>`  | `a b -> bool` | applies the greater comparison on top two elements.         |
| `<`  | `a b -> bool` | applies the less comparison on top two elements.            |
| `>=` | `a b -> bool` | applies the greater or equal comparison on top two elements |
| `<=` | `a b -> bool` | applies the less or equal comparison on top two elements.   |

#### Arithmetic

| Name | Signature        | Description                                                                                                                    |
| ---- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `+`  | `a b -> int` | sums up two elements on the top of the stack.                                                                                      |
| `-`  | `a b -> int` | subtracts two elements on the top of the stack.                                                                                    |
| `*`  | `a b -> int` | times two elements on the top of the stack.                                                                                        |
| `/`  | `int int -> int` | performs [Eucledian Division](https://en.wikipedia.org/wiki/Euclidean_division/) between two elements on the top of the stack. |
| `%`  | `int int -> int` | performs [Modulo operation](https://en.wikipedia.org/wiki/Modulo/) between two elements on the top of the stack.               |

#### Bitwise

| Name  | Signature        | Description      |
| ----- | ---------------- | ---------------- |
| `shr` | `int int -> int` | right bit shift. |
| `shl` | `int int -> int` | left bit shift.  |
| `or`  | `int int -> int` | bit `or`         |
| `and` | `int int -> int` | bit `and`        |

#### Memory

| Name     | Signature     | Description                                          |
| -------- | ------------- | ---------------------------------------------------- |
| `seti`   | `int ptr ->`  | store a given integer at the address on the stack.   |
| `setb`   | `bool ptr ->` | store a given boolean at the address on the stack.   |
| `setc`   | `char ptr ->` | store a given character at the address on the stack. |
| `setp`   | `ptr ptr ->`  | store a given pointer at the address on the stack.   |
| `derefi` | `ptr -> int`  | load an integer from the address on the stack.       |
| `derefb` | `ptr -> bool` | load a boolean from the address on the stack.        |
| `derefc` | `ptr -> char` | load a character from the address on the stack.      |
| `derefp` | `ptr -> ptr`  | load a pointer from the address on the stack.        |
| `casti`  | `a -> int`    | cast the element on top of the stack to `integer`.   |
| `castb`  | `a -> bool`   | cast the element on top of the stack to `boolean`.   |
| `castc`  | `a -> char`   | cast the element on top of the stack to `character`. |
| `castp`  | `a -> ptr`    | cast the element on top of the stack to `pointer`.   |

#### System

- `syscall n` - perform a syscall with n arguments.
```python
syscall_number = pop()
<move syscall_number to the corresponding register>
for i in range(n):
    arg = pop()
    <move arg to i-th register according to the call convention>
<perform the syscall>
```

### Control Flow

#### If Condition

```python
<condition> if
  <body>
elif <condition>
  <body>
elif <condition>
  <body>
else
  <body>
```

#### While Loop

```python
while <condition>
  <body>
```

#### Import

Include tokens of file `dir/files.bb`.

```python
import dir.file
```

#### Functions

```perl
import lib.std

to seq: int n -> void
  n while dup 0 >
    dup puts
    1 -
  drop
```

#### Inline Functions

You can use keyword `inline` instead of `to` to make inline function.

#### Constants

```c
const N 69
```

#### Memory

```c
import lib.std

buffer buf 26

to start: -> void
  0 while dup 26 <
    dup 'a' casti +
    over buffer +
    seti

    1 +
  drop

  buffer puts "\n" puts
end
```

### Types

- `int`  - integer
- `bool` - boolean
- `char` - character
- `ptr`  - pointer
