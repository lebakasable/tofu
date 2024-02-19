import lib.std


to start: int argc, ptr argv -> int
    10 malloc # A       | A
    10 malloc # A B     | A B
    10 malloc # A B C   | A B C
    10 malloc # A B C D | A B C D
    swap      # A B D C | A B C D
    free      # A B D   | A B _ D
    swap      # A D B   | A B _ D
    free      # A D     | A _ _ D
    20 malloc # A D E   | A E~~ D

    dup rot   # A E E D
    < "E should be before D" assert
    < "A should be before E" assert
    0
