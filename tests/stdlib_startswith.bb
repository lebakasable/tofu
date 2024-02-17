# Description:Standard library - startswith
# Exit code:0
# Stdout:
# Stderr:

import lib.std

to start: ptr argv, int argc -> int
    "foobar" "foobar" startswith      "1" assert
    "foobar" "foo" startswith         "2" assert
    "foo" "foobar" startswith false = "3" assert
    0
