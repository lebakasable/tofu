# Description:Standard library - free, many
# Exit code:0
# Stdout:
# Stderr:

import lib.std

const N 10000

to start: int argc, ptr argv -> int
    true DUMP_MEMORY setb
    0
    while dup N <
        1000 malloc
        1000 malloc
        1000 malloc
        1000 malloc
        free swap free free free
        1 +
    0
