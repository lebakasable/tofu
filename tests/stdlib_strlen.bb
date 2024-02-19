import lib.std

to start: ptr argv, int argc -> int
    "FooBarBaz" strlen 9 = "1" assert
    ""          strlen 0 = "2" assert
    0
