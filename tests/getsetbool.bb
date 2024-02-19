buffer foo 1

to start: int argc, ptr argv -> int
    true foo setb
    foo derefb if
        1
    else
        2
