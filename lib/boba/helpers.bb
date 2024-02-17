import lib.std


to syntax_error: int line_no, ptr message -> void
    # Raises a syntax error and exits with 1
    "Syntax error at line " error
    line_no                 errori
    message NULL != if
        ": "                error
        message             error
    "\n"                    error
    1 exit


to is_int: char c -> bool
    # Returns true if given character is a number
    '0' c <= c '9' <= and


to is_alphabet: char c -> bool
    # Returns true if given character is in the alphabet or `-`, `_` or `.`
    'A' c <= c 'Z' <= and
    'a' c <= c 'z' <= and or
    c '-' =               or
    c '_' =               or
    c '.' =               or


to is_alphanumeric: char c -> bool
    # Returns true if given character is alphanumeric
    c is_int c is_alphabet or


to count_indent: ptr s -> int
    # Takes a string and returns the number of leading spaces and/or tabs
    0
    s
    while dup derefc ' ' = over derefc 9 castc = or
        1 + swap
        1 + swap
    drop


to is_word: ptr s, ptr q -> bool
    # Returns true if str s starts with substring q, followed by a non-alphabet char
    0
    while dup s + derefc over q + derefc = over q + derefc 0 castc != and
        1 +
    dup q + derefc 0 castc =
    swap s + derefc is_alphanumeric false = and
