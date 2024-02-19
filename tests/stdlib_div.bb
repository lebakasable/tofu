import lib.std.math

to start: ptr argv, int argc -> int
    0 30 - 0 6 - div 5 = "-30 / -6 = 5" assert
    30 0 6 - div 0 5 - = "30 / -6 = -5" assert
    0 30 - 6 div 0 5 - = "-30 / 6 = -5" assert
    30 6 div 5 = "30 / 6 = 5" assert
    0
