to start: int argc, ptr argv -> int
    true if
      1             # File descriptor
      "It works!"   # String
      9             # String length
      1             # Syscall no. (write)
      syscall 3
      drop

    1               # File descriptor
    " Yay!"         # String
    5               # String length
    1               # Syscall no. (write)
    syscall 3

    0               # Exit code
