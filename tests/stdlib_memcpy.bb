import lib.std

buffer foo 5

to start: ptr argv, int argc -> int
    "walo lili" foo 4 memcpy
    foo puts
    0
