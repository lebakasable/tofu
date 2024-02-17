# Description:Standard library - Assert true
# Exit code:0
# Stdout:OK
# Stderr:

import lib.std

to start: ptr argv, int argc -> int
    true "This should not be printed." assert
    "OK" puts
    0
