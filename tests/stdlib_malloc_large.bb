import lib.std

to start: ptr argv, int argc -> int
    500000 malloc
    dup     'H'     swap setc
    dup 1 + 'i'     swap setc
    dup 2 + '!'     swap setc
    dup 3 + 0 castc swap setc
    puts
    0
