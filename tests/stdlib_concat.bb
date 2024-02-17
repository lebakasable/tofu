# Description:Standard library - concat
# Exit code:0
# Stdout:Hi, Bob!
# Stderr:

import lib.std

to start: ptr argv, int argc -> int
    "Hi, " "Bob!" concat puts
    0
