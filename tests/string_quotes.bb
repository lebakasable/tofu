# Description:String literal with escaped quotes
# Exit code:28
# Stdout:Yeah.. "sure"
# Stderr:

to start: int argc, ptr argv -> int
    1                   # File descriptor
    "Yeah.. \"sure\""   # String
    13                  # String length
    1                   # Syscall no. (write)
    syscall 3

    28                  # Exit code
