to start: int argc, ptr argv -> int
    1                   # File descriptor
    "Hello, world!\n"   # String
    14                  # String length
    1                   # Syscall no. (write)
    syscall 3

    11                  # Exit code
    60                  # Syscall no. (exit)
    syscall 1

    42                  # This exit code should be ignored
