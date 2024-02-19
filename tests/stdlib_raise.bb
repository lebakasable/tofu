# Description:Standard library - raise
# Exit code:1
# Stdout:
# Stderr:Foo bar baz\nTraceback:\nlib/std/linux.bb, line 73 in raise\ntests/stdlib_raise.bb, line 9 in start

import lib.std

to start: ptr argv, int argc -> int
    "Foo bar baz" raise 0
