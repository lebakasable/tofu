import lib.std
import lib.boba.lexer
import lib.boba.parser


to start: int argc, ptr argv -> int
    "foo.bb"

    "1 dup "                  # INT INT
    "1 'c' drop "     concat  # INT
    "1 'c' true rot " concat  # CHAR BOOL INT
    "1 'c' swap "     concat  # CHAR INT
    "1 'c' over "     concat  # INT CHAR INT
    "debug"           concat

    tokenize
    parse

    0
