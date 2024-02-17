# Description:boba.parser - Parse, stack manipulation
# Exit code:0
# Stdout:Stack: INT INT INT CHAR BOOL INT CHAR INT INT CHAR INT 
# Stderr:

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
