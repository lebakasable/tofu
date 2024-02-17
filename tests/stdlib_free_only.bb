# Description:Standard library - free, only
# Exit code:0
# Stdout:
# Stderr:

import lib.std

to start: int argc, ptr argv -> int
    1 malloc free
    100000 malloc free
    0
