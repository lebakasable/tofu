import lib.std
import lib.boba.lexer
import lib.boba.parser


to start: int argc, ptr argv -> int
    "foo.bb"

    "_s_ 1 true 'c' debug" dup     '"' swap setc \
                           dup 2 + '"' swap setc

    tokenize
    parse
    0
