# Description:Get/set boolean
# Exit code:1
# Stdout:
# Stderr:

buffer foo 1

to start: int argc, ptr argv -> int
    true foo setb
    foo derefb if
        1
    else
        2
