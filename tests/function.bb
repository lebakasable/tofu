# Description:Function call
# Exit code:42
# Stdout:
# Stderr:

to foo: int x, int y -> int
    x y +

to start: int argc, ptr argv -> int
    11 31 foo
