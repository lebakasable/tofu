to fib: int n -> int
    n 2 < if
        1
    else
        n 1 - fib
        n 2 - fib +

to start: ptr argv, int argc -> int
    8 fib
