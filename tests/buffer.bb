# Description:Buffer
# Exit code:1
# Stdout:
# Stderr:

buffer foo 8

to start: int argc, ptr argv -> int
    foo casti 0 != if
        1
    else
        2
