import lib.std.list

to start: ptr argv, int argc -> int
    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    list_eq "Similar lists should be equal" assert

    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    list_eq false = "Lists of different length should be unequal" assert

    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    3 swap list_append_int

    list_eq false = "Lists with different items should be unequal" assert

    INT_SIZE new_list
    INT_SIZE new_list
    list_eq "Empty lists should be equal" assert

    INT_SIZE new_list
    INT_SIZE 2 * new_list
    list_eq false = "Empty lists of different size should be unequal" assert

    0
