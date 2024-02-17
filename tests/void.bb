# Description:Return void
# Exit code:2
# Stdout:
# Stderr:

to foo: int n -> void
    n

to start: ptr argv, int argc -> int
    1 2 3 foo
