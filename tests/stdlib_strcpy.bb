import lib.std

buffer a 20
buffer b 20

to start: ptr argv, int argc -> int
    "Hello, world!" a strcpy
    a b strcpy
    '!' a 5 + setc
    a puts
    b puts
    0
