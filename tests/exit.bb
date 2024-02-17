# Description:Exit early
# Exit code:1
# Stdout:
# Stderr:

to start: ptr argv, int argc -> int
    1          # Exit code
    60         # Syscall no. (exit)
    syscall 1

    2          # Exit code
