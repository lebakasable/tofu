# Description:Get/set character
# Exit code:42
# Stdout:
# Stderr:

buffer foo 1

to start: int argc, ptr argv -> char
    42 castc foo setc
    foo derefc
