# Description:Standard library - substring
# Exit code:0
# Stdout:Hello
# Stderr:

import lib.std

to start: ptr argv, int argc -> int
    "Hello, world!" 5 substring
    dup puts
    free
    0
