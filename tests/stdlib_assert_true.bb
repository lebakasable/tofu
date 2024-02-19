import lib.std

to start: ptr argv, int argc -> int
    true "This should not be printed." assert
    "OK" puts
    0
