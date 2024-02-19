import lib.std

to start: ptr argv, int argc -> int
    "0" stoi 0 =             "0 should be 0" assert
    "12" stoi 12 =           "12 should be 12" assert
    "9912391" stoi 9912391 = "9912391 should be 9912391" assert
    0
