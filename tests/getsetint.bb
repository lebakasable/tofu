# Description:Get/set integer
# Exit code:1
# Stdout:
# Stderr:

buffer foo 8

to start: int argc, ptr argv -> int
    420 foo seti
    foo derefi 420 = if
        1
    else
        2
