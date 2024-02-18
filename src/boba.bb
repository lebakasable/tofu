import lib.std
import lib.std.argparse
import lib.std.profiler
import lib.boba.formats
import lib.boba.generator
import lib.boba.lexer
import lib.boba.parser


buffer DUMP_TOKENS      1  # bool
buffer DUMP_OPCODES     1  # bool
buffer ENABLE_PROFILER  1  # bool
buffer FORMAT           8  # int


to parse_arguments: ptr argv, int argc -> ptr
    # Returns an args object
    argparse_init

    "--format" ARG_TYPE_OPTIONAL "Set the output format (default: linux_x86_64)"
    argparse_add_argument
    "--profiler" ARG_TYPE_FLAG "Enable the profiler"
    argparse_add_argument
    "--verify-memory" ARG_TYPE_FLAG "Verify the dynamically allocated memory"
    argparse_add_argument
    "--dump-memory" ARG_TYPE_FLAG "Print the dynamically allocated memory"
    argparse_add_argument
    "--dump-tokens" ARG_TYPE_FLAG "Print the tokens"
    argparse_add_argument
    "--dump-opcodes" ARG_TYPE_FLAG "Print the opcodes"
    argparse_add_argument
    "filename" ARG_TYPE_POSITIONAL "Source code filename"
    argparse_add_argument

    argv argc argparse_parse_args


to start: ptr argv, int argc -> int
    # Parse arguments
    argv argc parse_arguments

    "--format" over args.kwargs + derefp dict_fetch arg.value + derefp
    dup NULL = if
        drop FORMAT_LINUX_X86_64 FORMAT seti
    else
        str_to_format FORMAT seti

    "--profiler" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        ENABLE_PROFILER setb
    "--verify-memory" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        VERIFY_MEMORY setb
    "--dump-memory" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_MEMORY setb
    "--dump-tokens" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_TOKENS setb
    "--dump-opcodes" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_OPCODES setb

    ENABLE_PROFILER derefb if
        # Initialize profiler
        profiler_init

    # Get filename
    0 over args.posargs + derefp list_fetch_ptr

    # Free args object
    swap free

    # Tokenize file
    dup read_file
    tokenize

    DUMP_TOKENS derefb if
        dup dump_tokens

    # Parse tokens
    parse

    DUMP_OPCODES derefb if
        dup dump_opcodes

    ENABLE_PROFILER derefb if
        # Dump profiler samples
        drop
        profiler_dump
    elif FORMAT derefi FORMAT_LINUX_X86_64 =
        # Generate code
        generate_code_x86_64_linux
    else
        drop "Unknown format\n" raise

    0
