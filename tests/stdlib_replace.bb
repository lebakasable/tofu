import lib.std

to start: ptr argv, int argc -> int
    "foo" 'a' 'b' replace "foo" streq "foo -> foo" assert
    "bar" 'a' 'b' replace "bbr" streq "bar -> bbr" assert
    "aaa" 'a' 'b' replace "bbb" streq "aaa -> bbb" assert
    0
