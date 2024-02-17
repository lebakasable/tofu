# Description:Standard library - free, refill
# Exit code:0
# Stdout:
# Stderr:

import lib.std

to start: int argc, ptr argv -> int
    1 malloc
    1 malloc dup free
    1 malloc = "Allocated block should replace freed block" assert
    0
