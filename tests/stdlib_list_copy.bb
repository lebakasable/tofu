import lib.std.list

to start: ptr argv, int argc -> int
    INT_SIZE new_list
    1 swap list_append_int
    3 swap list_append_int
    3 swap list_append_int
    7 swap list_append_int

    dup list_copy
    over over != "Copy should differ from original" assert
    swap free

    dup 3 swap list_fetch_int 7 = "Fourth element should be 7" assert
    dup 2 swap list_fetch_int 3 = "Third element should be 3" assert
    dup 1 swap list_fetch_int 3 = "Second element should be 3" assert
    dup 0 swap list_fetch_int 1 = "First element should be 1" assert

    dup list_pop_int  7 = "Popping should give 7" assert
    dup list_pop_int  3 = "Popping should give 3" assert
    dup list_peek_int 3 = "Peeking should give 3" assert
    dup list_peek_int 3 = "Peeking should still give 3" assert
    dup list_pop_int  drop
    dup list_pop_int  drop
    free
    0
