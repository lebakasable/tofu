# Description:Standard library - vectors
# Exit code:0
# Stdout:
# Stderr:

import lib.std.math

buffer vec_a 24
buffer vec_b 24
buffer vec_c 24

to start: ptr argv, int argc -> int
    # vec_add
    3 vec_a vec.x + seti
    6 vec_a vec.y + seti
    9 vec_a vec.z + seti

    2 vec_b vec.x + seti
    4 vec_b vec.y + seti
    6 vec_b vec.z + seti

    vec_a vec_b vec_c vec_add

    vec_c vec.x + derefi 5 = "c.x = 5" assert
    vec_c vec.y + derefi 10 = "c.y = 10" assert
    vec_c vec.z + derefi 15 = "c.z = 15" assert

    # vec_sub
    vec_a vec_b vec_c vec_sub

    vec_c vec.x + derefi 1 = "c.x = 1" assert
    vec_c vec.y + derefi 2 = "c.y = 2" assert
    vec_c vec.z + derefi 3 = "c.z = 3" assert

    # vec_negate
    vec_a vec_c vec_negate

    vec_c vec.x + derefi 0 3 - = "c.x = -3" assert
    vec_c vec.y + derefi 0 6 - = "c.y = -6" assert
    vec_c vec.z + derefi 0 9 - = "c.z = -9" assert

    # vec_mul
    vec_a 10 vec_c vec_mul

    vec_c vec.x + derefi 30 = "c.x = 30" assert
    vec_c vec.y + derefi 60 = "c.y = 60" assert
    vec_c vec.z + derefi 90 = "c.z = 90" assert

    # vec_div
    vec_a 3 vec_c vec_div

    vec_c vec.x + derefi 1 = "c.x = 1" assert
    vec_c vec.y + derefi 2 = "c.y = 2" assert
    vec_c vec.z + derefi 3 = "c.z = 3" assert

    # vec_len_squared
    vec_a vec_len_squared 126 = "Squared length = 126" assert

    # vec_len
    vec_a vec_len 11 = "Length = 11" assert

    # vec_unit
    vec_a vec_c vec_unit

    vec_c vec.x + derefi 272 = "u.x = 272" assert
    vec_c vec.y + derefi 545 = "u.y = 545" assert
    vec_c vec.z + derefi 818 = "u.z = 818" assert

    # vec_dot
    vec_a vec_b vec_dot 84 = "a dot b = 84" assert

    0
