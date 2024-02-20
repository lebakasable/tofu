import lib.std
import lib.std.dict
import lib.std.list
import src.functions
import src.helpers
import src.lexer
import src.opcodes
import src.tokens
import src.types


buffer functions            8  # ptr
buffer _if_index            8  # int
buffer _while_index         8  # int
buffer _type_stack          8  # ptr
buffer _buffers             8  # ptr
buffer _constants           8  # ptr
buffer _opcodes             8  # ptr
buffer _files               8  # ptr
buffer _current_function    8  # ptr
buffer _is_inline           1  # bool


to _current_function_contains_arg: ptr name -> bool
    # Returns true if there is a current function and it contains a given argument
    _current_function derefp NULL = if
        false
    else
        name _current_function derefp function_get_arg NULL !=


to _peek_next_token: ptr tokens, ptr index -> ptr
    # Returns the next token without increasing the token index
    index derefi tokens list.len + derefi < if
        index derefi tokens list_fetch
    else
        NULL


to _get_next_token: ptr tokens, ptr index -> ptr
    # Returns the next token while increasing the token index
    index derefi tokens list.len + derefi < if
        index derefi dup tokens list_fetch
        swap 1 + index seti
    else
        NULL


to _push_type: int type -> void
    # Pushes a given type to the type stack
    type _type_stack derefp list_append_int _type_stack setp


to _pop_type: int line -> int
    # Pops and returns a type from the type stack
    _type_stack derefp list.len + derefi 0 = if
        line "Not enough values on the stack" syntax_error
    _type_stack derefp list_pop_int


to _pop_args: int line, ptr args -> void
    # Pops a list of arguments (in reversed order)
    args list.len + derefi 1 -  # index
    while dup 0 >=
        dup args list_fetch argument.type + derefi line _pop_type != if
            dup args list_fetch
            "Expected "
            over argument.type + derefi type_to_str concat
            " as argument for "                     concatfl
            over argument.name + derefp             concatfl
            line swap syntax_error
            drop
        1 -


const buffer_operand_buffer_name  0   # ptr
const buffer_operand_buffer_size  8   # ptr
const BUFFER_OPERAND_SIZE         16

to _create_buffer_operand: ptr buf_name, ptr buf_size -> ptr
    # Creates a tuple with is used as the buffer operand
    BUFFER_OPERAND_SIZE malloc
    buf_name over buffer_operand_buffer_name + setp
    buf_size over buffer_operand_buffer_size + setp


to _parse:
ptr filename,
ptr tokens,
ptr token_index,
ptr type_stack_before,
ptr type_stack_after,
int return_on -> ptr
    # Parses a given tokenlist and returns a list of opcodes
    while tokens token_index _peek_next_token token.type + derefi return_on !=
        tokens token_index _get_next_token

        dup token.type + derefi TOKEN_BOOL = if
            OPCODE_PUSH_BOOL
            over dup token.value + derefp
            swap token.line + derefi
            _opcodes derefp create_opcode _opcodes setp

            TYPE_BOOL _push_type
        elif dup token.type + derefi TOKEN_CHAR =
            OPCODE_PUSH_CHAR
            over dup token.value + derefp
            swap token.line + derefi
            _opcodes derefp create_opcode _opcodes setp

            TYPE_CHAR _push_type
        elif dup token.type + derefi TOKEN_INT =
            OPCODE_PUSH_INT
            over dup token.value + derefp
            swap token.line + derefi
            _opcodes derefp create_opcode _opcodes setp

            TYPE_INT _push_type
        elif dup token.type + derefi TOKEN_STRING =
            OPCODE_PUSH_STRING
            over dup token.value + derefp
            swap token.line + derefi
            _opcodes derefp create_opcode _opcodes setp

            TYPE_PTR _push_type
        elif dup token.type + derefi TOKEN_ARITHMETIC =
            dup token.value + derefp "+" streq if
                OPCODE_ADD
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                dup TYPE_INT != over TYPE_PTR != and if
                    over token.line + derefi
                    "Only integers and pointers could be added" syntax_error

                over token.line + derefi _pop_type
                dup TYPE_INT != over TYPE_PTR != and if
                    rot token.line + derefi
                    "Only integers and pointers could be added" syntax_error
                    NULL rot rot

                TYPE_PTR = swap TYPE_PTR = or if
                    TYPE_PTR _push_type
                else
                    TYPE_INT _push_type
            elif dup token.value + derefp "-" streq
                OPCODE_SUBTRACT
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_INT != if
                    dup token.line + derefi
                    "Second type in subtract must be an integer" syntax_error

                dup token.line + derefi _pop_type
                dup dup TYPE_INT != swap TYPE_PTR != and if
                    over token.line + derefi
                    "Only integers and pointers can be subtracted" syntax_error

                _push_type
            elif dup token.value + derefp "*" streq
                OPCODE_MULTIPLY
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup  token.line + derefi _pop_type TYPE_INT !=
                over token.line + derefi _pop_type TYPE_INT != or if
                    dup token.line + derefi
                    "Can't multiply non-integer" syntax_error

                TYPE_INT _push_type
            elif dup token.value + derefp "/" streq
                OPCODE_DIVIDE
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup  token.line + derefi _pop_type TYPE_INT !=
                over token.line + derefi _pop_type TYPE_INT != or if
                    dup token.line + derefi
                    "Can't divide non-integer" syntax_error

                TYPE_INT _push_type
            elif dup token.value + derefp "%" streq
                OPCODE_MOD
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup  token.line + derefi _pop_type TYPE_INT !=
                over token.line + derefi _pop_type TYPE_INT != or if
                    dup token.line + derefi
                    "Can't mod non-integer" syntax_error

                TYPE_INT _push_type
            elif dup token.value + derefp "and" streq
                OPCODE_BITWISE_AND
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                dup TYPE_INT != over TYPE_BOOL != and if
                    over token.line + derefi
                    "Need integers or booleans for bitwise and" syntax_error
                over token.line + derefi _pop_type dup rot != if
                    over token.line + derefi
                    "Bitwise and needs two similar types as input" syntax_error

                _push_type
            elif dup token.value + derefp "or" streq
                OPCODE_BITWISE_OR
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                dup TYPE_INT != over TYPE_BOOL != and if
                    over token.line + derefi
                    "Need integers or booleans for bitwise or" syntax_error
                over token.line + derefi _pop_type dup rot != if
                    over token.line + derefi
                    "Bitwise or needs two similar types as input" syntax_error

                _push_type
            elif dup token.value + derefp "shr" streq
                OPCODE_SHIFT_RIGHT
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup  token.line + derefi _pop_type TYPE_INT !=
                over token.line + derefi _pop_type TYPE_INT != or if
                    dup token.line + derefi
                    "Can't shift non-integer" syntax_error

                TYPE_INT _push_type
            elif dup token.value + derefp "shl" streq
                OPCODE_SHIFT_LEFT
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup  token.line + derefi _pop_type TYPE_INT !=
                over token.line + derefi _pop_type TYPE_INT != or if
                    dup token.line + derefi
                    "Can't shift non-integer" syntax_error

                TYPE_INT _push_type
            else
                "Unknown value for arithmetic token: "
                over token.value + derefp concat "\n" concatfl
                raise
        elif dup token.type + derefi TOKEN_COMPARISON =
            dup token.value + derefp "=" streq if
                OPCODE_IS_EQUAL
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "!=" streq
                OPCODE_IS_NOT_EQUAL
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp ">=" streq
                OPCODE_IS_GREATER_OR_EQUAL
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "<=" streq
                OPCODE_IS_LESS_OR_EQUAL
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp ">" streq
                OPCODE_IS_GREATER
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "<" streq
                OPCODE_IS_LESS
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            else
                "Unknown comparison token: "
                over token.value + derefp concat "\n" concatfl
                raise

            dup token.line + derefi _pop_type
            over token.line + derefi _pop_type != if
                dup token.line + derefi
                "Comparison between different types" syntax_error

            TYPE_BOOL _push_type
        elif dup token.type + derefi TOKEN_KEYWORD =
            dup token.value + derefp "debug" streq if
                "Stack: " puts
                0  # index
                while dup _type_stack derefp list.len + derefi <
                    dup _type_stack derefp list_fetch_int type_to_str puts
                    " " puts
                    1 +
                drop
                "\n" puts
                0 exit
            elif dup token.value + derefp "import" streq
                drop tokens token_index _get_next_token
                dup token.type + derefi TOKEN_IDENTIFIER != if
                    dup token.line + derefi
                    "Expected identifier after import keyword" syntax_error

                dup token.value + derefp '.' '/' replace ".bb" concat
                dup _files derefp list_contains_string false = if
                    dup _files derefp list_append_ptr _files setp
                    # TODO: The malloc below is a memory leak, it could be fixed when we
                    # are able to reference `parse` instead of `_parse`, but we need
                    # function declarations to do that.
                    dup dup
                    read_file
                    tokenize
                    8 malloc dup 0 swap seti
                    8 malloc
                    8 malloc
                    return_on _parse
                    drop
                drop
            elif dup token.value + derefp "location" streq
                # TODO: Implement this as soon as we've got a better int to str function
                "The location keyword is not implemented yet\n" raise
            elif dup token.value + derefp "castb" streq
                dup token.line + derefi _pop_type drop
                TYPE_BOOL _push_type
            elif dup token.value + derefp "castc" streq
                dup token.line + derefi _pop_type drop
                TYPE_CHAR _push_type
            elif dup token.value + derefp "casti" streq
                dup token.line + derefi _pop_type drop
                TYPE_INT _push_type
            elif dup token.value + derefp "castp" streq
                dup token.line + derefi _pop_type drop
                TYPE_PTR _push_type
            elif dup token.value + derefp "buffer" streq
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_IDENTIFIER != if
                    dup token.line + derefi
                    "Expected identifier as buffer name" syntax_error
                token.value + derefp

                dup "" _buffers derefp dict_insert _buffers setp

                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_INT != if
                    dup token.line + derefi
                    "Expected integer as buffer size" syntax_error
                token.value + derefp

                _create_buffer_operand
                over token.line + derefi
                OPCODE_CREATE_BUFFER swap
                rot swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "const" streq
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_IDENTIFIER != if
                    dup token.line + derefi
                    "Expected identifier as const key" syntax_error
                token.value + derefp

                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_INT != if
                    dup token.line + derefi
                    "Expected integer as const value" syntax_error
                token.value + derefp

                _constants derefp dict_insert _constants setp
            elif dup token.value + derefp "derefb" streq
                OPCODE_DEREF_B
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to dereference" syntax_error

                TYPE_BOOL _push_type
            elif dup token.value + derefp "derefc" streq
                OPCODE_DEREF_C
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to dereference" syntax_error

                TYPE_CHAR _push_type
            elif dup token.value + derefp "derefi" streq
                OPCODE_DEREF_I
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to dereference" syntax_error

                TYPE_INT _push_type
            elif dup token.value + derefp "derefp" streq
                OPCODE_DEREF_P
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to dereference" syntax_error

                TYPE_PTR _push_type
            elif dup token.value + derefp "setb" streq
                OPCODE_SET_B
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to set" syntax_error

                dup token.line + derefi _pop_type TYPE_BOOL != if
                    dup token.line + derefi "Need boolean to set" syntax_error
            elif dup token.value + derefp "setc" streq
                OPCODE_SET_C
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to set" syntax_error

                dup token.line + derefi _pop_type TYPE_CHAR != if
                    dup token.line + derefi "Need character to set" syntax_error
            elif dup token.value + derefp "seti" streq
                OPCODE_SET_I
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to set" syntax_error

                dup token.line + derefi _pop_type TYPE_INT != if
                    dup token.line + derefi "Need integer to set" syntax_error
            elif dup token.value + derefp "setp" streq
                OPCODE_SET_P
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to set" syntax_error

                dup token.line + derefi _pop_type TYPE_PTR != if
                    dup token.line + derefi "Need pointer to set" syntax_error
            elif dup token.value + derefp "dup" streq
                OPCODE_DUP
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                dup _push_type _push_type
            elif dup token.value + derefp "drop" streq
                OPCODE_DROP
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type drop
            elif dup token.value + derefp "rot" streq
                OPCODE_ROT
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                swap dup token.line + derefi _pop_type
                swap dup token.line + derefi _pop_type
                rot _push_type rot _push_type _push_type
            elif dup token.value + derefp "swap" streq
                OPCODE_SWAP
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                over token.line + derefi _pop_type
                swap _push_type _push_type
            elif dup token.value + derefp "over" streq
                OPCODE_OVER
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi _pop_type
                over token.line + derefi _pop_type
                dup _push_type swap _push_type _push_type
            elif dup token.value + derefp "__get_arg" streq
                drop
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_INT != if
                    dup token.line + derefi
                    "__get_arg is missing position"
                    syntax_error

                dup token.value + derefp
                over token.line + derefi
                OPCODE_GET_ARG rot rot
                _opcodes derefp create_opcode _opcodes setp

                drop
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_TYPE != if
                    dup token.line + derefi
                    "__get_arg is missing type"
                    syntax_error

                dup token.value + derefp "bool" streq if
                    TYPE_BOOL _push_type
                elif dup token.value + derefp "char" streq
                    TYPE_CHAR _push_type
                elif dup token.value + derefp "int" streq
                    TYPE_INT _push_type
                elif dup token.value + derefp "ptr" streq
                    TYPE_PTR _push_type
                else
                    "Unknown type for __get_arg\n" raise
            elif dup token.value + derefp "__restore_frame" streq
                OPCODE_RESTORE_FRAME
                over token.line + derefi
                NULL swap
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "syscall" streq
                drop
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_INT != if
                    dup token.line + derefi
                    "Syscall is missing argument count"
                    syntax_error

                dup dup token.value + derefp
                swap token.line + derefi
                OPCODE_SYSCALL
                rot rot
                _opcodes derefp create_opcode _opcodes setp

                dup token.value + derefp stoi 1 +
                while dup 0 >
                    over token.line + derefi _pop_type drop
                    1 -
                drop
                TYPE_INT _push_type
            elif dup token.value + derefp "reff" streq
                drop
                tokens token_index _get_next_token
                dup token.type + derefi TOKEN_IDENTIFIER != if
                    dup token.line + derefi
                    "reff is missing function identifier"
                    syntax_error

                dup token.value + derefp
                dup functions derefp dict_fetch NULL = if
                    "Unknown function: " over concat raise

                over token.line + derefi
                OPCODE_REF_F
                rot rot
                _opcodes derefp create_opcode _opcodes setp

                TYPE_PTR _push_type
            elif dup token.value + derefp "while" streq
                # Create while label
                25 malloc
                "while_" over 6 memcpy
                _while_index derefi over 6 + itohex
                _while_index derefi 1 + _while_index seti

                # Create LABEL opcode
                dup
                rot swap
                over token.line + derefi
                OPCODE_LABEL rot rot

                _opcodes derefp create_opcode _opcodes setp swap

                # Parse while condition
                filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_START _parse
                drop
                over token.line + derefi _pop_type TYPE_BOOL != if
                    over token.line + derefi
                    "Expected boolean result" syntax_error

                # Create copy of type stack
                _type_stack derefp list_copy

                # Create WHILE_START opcode
                rot rot dup rot
                dup token.line + derefi
                rot OPCODE_WHILE_START swap rot
                _opcodes derefp create_opcode _opcodes setp

                # Parse while body
                filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_END _parse
                drop

                # Compare type stacks before and after while body
                rot dup _type_stack derefp list_eq false = if
                    over token.line + derefi
                    "While body should not change types" syntax_error
                free

                # Create WHILE_END opcode
                dup token.line + derefi
                rot OPCODE_WHILE_END swap rot
                _opcodes derefp create_opcode _opcodes setp
            elif dup token.value + derefp "if" streq
                # Type check
                dup token.line + derefi _pop_type TYPE_BOOL != if
                    dup token.line + derefi
                    "Expected boolean result" syntax_error

                # Create copy of type stack
                _type_stack derefp list_copy type_stack_before setp

                # Create end label
                23 malloc
                "end_" over 4 memcpy
                _if_index derefi over 4 + itohex

                # Create if label
                22 malloc
                "if_" over 3 memcpy
                _if_index derefi over 3 + itohex

                _if_index derefi 1 + _if_index seti

                # Create IF opcode
                rot over over token.line + derefi
                OPCODE_IF rot rot
                _opcodes derefp create_opcode _opcodes setp

                # Parse body
                drop tokens token_index _get_next_token
                dup token.type + derefi TOKEN_BLOCK_START != if
                    dup token.line + derefi
                    "Expected code block after if keyword" syntax_error

                filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_END _parse
                drop

                # Create JUMP and LABEL opcodes
                rot over token.line + derefi over swap
                OPCODE_JUMP rot rot
                _opcodes derefp create_opcode _opcodes setp

                rot rot dup token.line + derefi rot
                OPCODE_LABEL swap rot
                _opcodes derefp create_opcode _opcodes setp

                # Restore stack to before if-body and keep copy of stack after if-body
                _type_stack derefp type_stack_after setp
                type_stack_before derefp list_copy _type_stack setp

                # Parse `elif` statements
                while tokens token_index _peek_next_token \
                        token.value + derefp "elif" streq
                    drop tokens token_index _get_next_token

                    # Create elif label
                    24 malloc
                    "elif_" over 5 memcpy
                    _if_index derefi over 5 + itohex
                    _if_index derefi 1 + _if_index seti

                    # Parse elif condition
                    filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_START
                    _parse drop

                    # Type check
                    dup token.line + derefi _pop_type TYPE_BOOL != if
                        dup token.line + derefi
                        "Expected boolean result" syntax_error

                    # Compare type stacks before and after elif condition
                    _type_stack derefp type_stack_before derefp list_eq false = if
                        over token.line + derefi
                        "elif-condition should not change types" syntax_error

                    # Create IF opcode
                    over token.line + derefi
                    over
                    OPCODE_IF swap rot
                    _opcodes derefp create_opcode _opcodes setp

                    # Parse elif body
                    filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_END _parse
                    drop

                    # Compare type stack after elif body with after if body
                    _type_stack derefp type_stack_after derefp list_eq false = if
                        over token.line + derefi
                        "elif-body has different stack than if" syntax_error

                    # Create JUMP and LABEL opcodes
                    rot rot
                    over over token.line + derefi
                    OPCODE_JUMP rot rot
                    _opcodes derefp create_opcode _opcodes setp

                    rot over token.line + derefi
                    OPCODE_LABEL rot rot
                    _opcodes derefp create_opcode _opcodes setp

                    # Restore type stack from before if-body
                    _type_stack derefp free
                    type_stack_before derefp list_copy _type_stack setp

                tokens token_index _peek_next_token token.value + derefp "else" streq if
                    drop tokens token_index _get_next_token

                    # Parse else-body
                    drop tokens token_index _get_next_token
                    dup token.type + derefi TOKEN_BLOCK_START != if
                        dup token.line + derefi
                        "Expected code block after else keyword" syntax_error

                    filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_END _parse
                    drop

                    # Compare type stack after else body with after if body
                    _type_stack derefp type_stack_after derefp list_eq false = if
                        _type_stack derefp list.len + derefi puti " vs " puts
                        type_stack_after derefp list.len + derefi puti "\n" puts
                        dup token.line + derefi
                        "else-body has different stack than if" syntax_error
                else
                    # Check type stack after if body
                    type_stack_before derefp
                    type_stack_after  derefp list_eq false = if
                        dup token.line + derefi
                        "If block without else should not alter types" syntax_error

                # Create LABEL opcode
                dup token.line + derefi rot
                OPCODE_LABEL swap rot
                _opcodes derefp create_opcode _opcodes setp

                # Clean up stacks
                _type_stack derefp free
                type_stack_before derefp free
                type_stack_after derefp _type_stack setp
            elif dup token.value + derefp "to" streq \
                    over token.value + derefp "inline" streq or
                dup token.value + derefp "inline" streq _is_inline setb
                # Verify function definition is global
                _current_function derefp NULL != if
                    "Can't define function within function" raise

                # Get function name
                drop tokens token_index _get_next_token
                dup token.type + derefi TOKEN_IDENTIFIER != if
                    dup token.line + derefi
                    "Expected identifier as function name" syntax_error

                # Create function signature and save pointer to current function
                dup token.value + derefp
                dup create_function dup
                rot swap
                functions derefp dict_insert functions setp

                _current_function setp

                # Parse colon
                drop tokens token_index _get_next_token
                dup token.type + derefi TOKEN_COLON != if
                    dup token.line + derefi
                    "Expected colon after function name" syntax_error

                # Create FUNCTION or LABEL opcode
                _is_inline derefb if
                    dup token.line + derefi
                    OPCODE_LABEL
                    "fn_"
                    _current_function derefp function.name + derefp
                    concat
                    rot
                    _opcodes derefp create_opcode _opcodes setp
                else
                    dup token.line + derefi
                    OPCODE_FUNCTION
                    _current_function derefp function.name + derefp
                    rot
                    _opcodes derefp create_opcode _opcodes setp

                drop tokens token_index _get_next_token

                while dup token.type + derefi TOKEN_ARROW !=
                    # Get argument type
                    dup token.type + derefi TOKEN_TYPE != if
                        dup token.line + derefi
                        "Expected argument type in function definition" syntax_error

                    token.value + derefp str_to_type

                    # Get argument name
                    tokens token_index _get_next_token

                    dup token.type + derefi TOKEN_IDENTIFIER != if
                        dup token.line + derefi
                        "Expected identifier after type" syntax_error

                    token.value + derefp

                    # Add argument to function
                    _current_function derefp function_add_argument

                    # Parse comma if it exists
                    tokens token_index _get_next_token
                    dup token.type + derefi TOKEN_COMMA = if
                        drop tokens token_index _get_next_token
                    elif dup token.type + derefi TOKEN_ARROW !=
                        dup token.line + derefi
                        "Expected comma or arrow after argument(s)" syntax_error

                # Parse return type
                drop tokens token_index _get_next_token

                dup token.type + derefi TOKEN_TYPE != if
                    dup token.line + derefi
                    "Expected return type in function definition" syntax_error

                token.value + derefp str_to_type
                _current_function derefp function_set_return_type

                # Parse code block
                tokens token_index _get_next_token

                dup token.type + derefi TOKEN_BLOCK_START != if
                    dup token.line + derefi
                    "Expected code block after function definition" syntax_error

                filename tokens token_index 8 malloc 8 malloc TOKEN_BLOCK_END _parse
                drop

                # Create RESTORE_FRAME and RETURN opcodes
                _is_inline derefb false = if
                    dup token.line + derefi
                    OPCODE_RESTORE_FRAME
                    NULL
                    rot
                    _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi
                OPCODE_RETURN
                NULL
                rot
                _opcodes derefp create_opcode _opcodes setp

                # Type check returned type
                _current_function derefp function.return_type + derefi
                dup TYPE_VOID != if
                    over token.line + derefi _pop_type over != if
                        over token.line + derefi
                        "Function "
                        _current_function derefp function.name + derefp concat
                        " returned incorrect type" concatfl
                        syntax_error
                drop

                # Empty type stack
                0 _type_stack derefp list.len + seti

                # Set current function to NULL
                NULL _current_function setp
            else
                "Unknown keyword: " over token.value + derefp concat "\n" concatfl raise
        elif dup token.type + derefi TOKEN_TYPE =
            dup token.line + derefi "Unexpected type" syntax_error
        elif dup token.type + derefi TOKEN_IDENTIFIER =
            dup token.value + derefp _constants derefp dict_fetch NULL != if
                OPCODE_PUSH_INT
                over dup token.value + derefp _constants derefp dict_fetch
                swap token.line + derefi
                _opcodes derefp create_opcode _opcodes setp

                TYPE_INT _push_type
            elif dup token.value + derefp _buffers derefp dict_fetch NULL !=
                OPCODE_GET_BUFFER
                over dup token.value + derefp
                swap token.line + derefi
                _opcodes derefp create_opcode _opcodes setp

                TYPE_PTR _push_type
            elif dup token.value + derefp _current_function_contains_arg
                dup token.value + derefp
                _current_function derefp function_get_arg_offset itos
                dup strlen 1 + malloc strcpy
                over token.line + derefi
                OPCODE_GET_ARG rot rot
                _opcodes derefp create_opcode _opcodes setp

                dup token.value + derefp
                _current_function derefp function_get_arg argument.type + derefi
                _push_type
            elif dup token.value + derefp functions derefp dict_fetch NULL !=
                # Check if function call is global
                _current_function derefp NULL = if
                    dup token.line + derefi
                    "Global function calls are not supported" syntax_error

                # Create frame data and CALL opcodes
                filename
                over token.line + derefi
                OPCODE_PUSH_STRING rot rot
                _opcodes derefp create_opcode _opcodes setp

                dup token.line + derefi dup itos swap
                OPCODE_PUSH_INT rot rot
                _opcodes derefp create_opcode _opcodes setp

                _current_function derefp function.name + derefp
                over token.line + derefi
                OPCODE_PUSH_STRING rot rot
                _opcodes derefp create_opcode _opcodes setp

                "1" over token.line + derefi OPCODE_PUSH_BOOL rot rot
                _opcodes derefp create_opcode _opcodes setp

                dup token.value + derefp
                over token.line + derefi
                OPCODE_CALL rot rot
                _opcodes derefp create_opcode _opcodes setp

                # Type check input arguments
                dup token.line + derefi
                over token.value + derefp functions derefp dict_fetch
                swap over function.args + derefp
                _pop_args

                # Append return type to type stack (when not void)
                function.return_type + derefi
                dup TYPE_VOID != if
                    _push_type
                else
                    drop
            else
                dup token.line + derefi over token.value + derefp
                "Unknown identifier: " swap concat syntax_error
        else
            "Unknown token type: "
            over token.type + derefi token_to_str concat
            raise

        drop

        tokens token_index _peek_next_token NULL = if
            "Unexpected end of file" raise

    tokens token_index _get_next_token token.type + derefi return_on = \
        "Last token should be return_on" assert

    type_stack_before free
    type_stack_after free

    _opcodes derefp


to _parse_core_functions: -> void
    # Parse the core functions
    "lib/core.bb" dup
    read_file
    tokenize
    8 malloc dup 0 swap seti
    8 malloc
    8 malloc
    TOKEN_END _parse


to parse: ptr filename, ptr tokens -> ptr
    # Wrapper for _parse to initialize values and set default arguments
    _if_index derefi 0 = if
        1 _if_index seti

    _while_index derefi 0 = if
        1 _while_index seti

    _type_stack derefp NULL = if
        INT_SIZE new_list _type_stack setp

    _buffers derefp NULL = if
        new_dict _buffers setp

    _constants derefp NULL = if
        new_dict _constants setp

    _opcodes derefp NULL = if
        1024 OPCODE_SIZE list_create _opcodes setp

    functions derefp NULL = if
        new_dict functions setp

    _files derefp NULL = if
        PTR_SIZE new_list _files setp
        filename casti _files derefp list_append_int _files setp

    _parse_core_functions

    8 malloc
    dup 0 swap seti
    dup filename tokens rot
    8 malloc
    8 malloc
    TOKEN_END _parse
    swap free

    "start" functions derefp dict_fetch NULL = if
        "Compilation error: Program requires `start` function\n" error
        1 exit
