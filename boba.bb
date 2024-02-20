import lib.std
import lib.std.argparse
import lib.std.profiler
import src.formats
import src.generator
import src.lexer
import src.parser


buffer SHOULD_RUN       1  # bool
buffer DUMP_TOKENS      1  # bool
buffer DUMP_OPCODES     1  # bool
buffer ENABLE_PROFILER  1  # bool
buffer FORMAT           8  # int
buffer KEEP_ASSEMBLY    1  # bool
buffer SILENT           1  # bool

buffer input_file 8 # ptr


to parse_arguments: ptr argv, int argc -> ptr
    # Returns an args object
    argparse_init

    "--run" ARG_TYPE_FLAG "Run the generated executable"
    argparse_add_argument
    "--format" ARG_TYPE_OPTIONAL "Set the output format (default: linux_x86_64)"
    argparse_add_argument
    "--profiler" ARG_TYPE_FLAG "Enable the profiler"
    argparse_add_argument
    "--silent" ARG_TYPE_FLAG "Do not print information logs"
    argparse_add_argument
    "--verify-memory" ARG_TYPE_FLAG "Verify the dynamically allocated memory"
    argparse_add_argument
    "--dump-memory" ARG_TYPE_FLAG "Print the dynamically allocated memory"
    argparse_add_argument
    "--dump-tokens" ARG_TYPE_FLAG "Print the tokens"
    argparse_add_argument
    "--dump-opcodes" ARG_TYPE_FLAG "Print the opcodes"
    argparse_add_argument
    "--keep-assembly" ARG_TYPE_FLAG "Keep the generated assembly code"
    argparse_add_argument
    "filename" ARG_TYPE_POSITIONAL "Source code filename"
    argparse_add_argument

    argv argc argparse_parse_args


to log_cmd: ptr args -> ptr
    SILENT derefb true != if
        "[CMD] " puts
        0 while dup args list.len + derefi 1 - <
            dup 0 > if
                " " puts
            dup args list_fetch_ptr puts
            1 +
        drop "\n" puts args
    else
        args


to start: ptr argv, int argc -> int
    # Parse arguments
    argv argc parse_arguments

    "--format" over args.kwargs + derefp dict_fetch arg.value + derefp
    dup NULL = if
        drop FORMAT_LINUX_X86_64 FORMAT seti
    else
        str_to_format FORMAT seti

    "--run" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        SHOULD_RUN setb
    "--profiler" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        ENABLE_PROFILER setb
    "--silent" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        SILENT setb
    "--verify-memory" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        VERIFY_MEMORY setb
    "--dump-memory" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_MEMORY setb
    "--dump-tokens" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_TOKENS setb
    "--dump-opcodes" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        DUMP_OPCODES setb
    "--keep-assembly" over args.kwargs + derefp dict_fetch arg.value + derefp NULL != \
        KEEP_ASSEMBLY setb

    ENABLE_PROFILER derefb if
        # Initialize profiler
        profiler_init

    # Get filename
    0 over args.posargs + derefp list_fetch_ptr

    # Free args object
    swap free

    SILENT derefb true != if
        "[INFO] Compiling " puts dup puts "\n" puts

    # Tokenize file
    dup read_file
    tokenize

    DUMP_TOKENS derefb if
        dup dump_tokens

    # Parse tokens
    over swap parse

    swap
    dup strlen 3 - substring
    input_file setp

    DUMP_OPCODES derefb if
        dup dump_opcodes

    ENABLE_PROFILER derefb if
        # Dump profiler samples
        drop
        profiler_dump
    elif FORMAT derefi FORMAT_LINUX_X86_64 =
        # Generate code
        input_file derefp ".asm" concat
        SILENT derefb true != if
            "[INFO] Generating " puts dup puts "\n" puts

        'w' open
        generate_code_x86_64_linux

        "/usr/bin/rm"
        8 new_list
        "rm"              swap list_append_ptr
        "-f"              swap list_append_ptr
        input_file derefp swap list_append_ptr
        NULL swap list_append_ptr
        list.items + exec_silent

        "/usr/bin/fasm"
        8 new_list
        "fasm"                          swap list_append_ptr
        input_file derefp ".asm" concat swap list_append_ptr
        NULL swap list_append_ptr
        log_cmd list.items + exec_silent

        SHOULD_RUN derefb if
            input_file derefp
            8 new_list
            "./" input_file derefp concat swap list_append_ptr
            NULL swap list_append_ptr
            log_cmd list.items + exec

        KEEP_ASSEMBLY derefb false = if
            "/usr/bin/rm"
            8 new_list
            "rm"                            swap list_append_ptr
            input_file derefp ".asm" concat swap list_append_ptr
            NULL swap list_append_ptr
            list.items + exec
    else
        drop "Unknown format\n" raise

    0
