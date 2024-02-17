# Description:If/elif/else-statement B
# Exit code:0
# Stdout:B
# Stderr:

to start: -> int
    false if
      1 "A" 1 1 syscall 3
    elif true
      1 "B" 1 1 syscall 3
    elif false
      1 "C" 1 1 syscall 3
    else
      1 "D" 1 1 syscall 3
    0
