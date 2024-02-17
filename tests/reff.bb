# Description:Reference function
# Exit code:1
# Stdout:
# Stderr:

to foo: -> void
    0

to start: int argc, ptr argv -> int
    reff foo 0 castp != casti
