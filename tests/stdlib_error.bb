# Description:Standard library - error
# Exit code:0
# Stdout:
# Stderr:foo

import lib.std

to start: ptr argv, int argc -> int
    "foo" error
    0
