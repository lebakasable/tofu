import lib.std

to start: ptr argv, int argc -> int
    "foobar" "foobar" streq         "Expression 1 should be true" assert
    "foobar" "foo"    streq false = "Expression 2 should be false" assert
    "foo" "foobar"    streq false = "Expression 3 should be false" assert
    0
