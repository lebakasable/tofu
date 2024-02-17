# Description:Standard library - exit
# Exit code:42
# Stdout:
# Stderr:

import lib.std

to start: ptr argv, int argc -> int
    42 exit
    "This should not happen" puts 0
