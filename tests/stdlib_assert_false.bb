# Description:Standard library - Assert false
# Exit code:1
# Stdout:
# Stderr:OK\nTraceback:\nlib/std/linux.bb, line 68 in assert\ntests/stdlib_assert_false.bb, line 9 in start

import lib.std

to start: ptr argv, int argc -> int
    false "OK" assert
    "This should not be printed." puts
    0
