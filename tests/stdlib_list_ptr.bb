# Description:Standard library - list, ptr
# Exit code:0
# Stdout:
# Stderr:

import lib.std.list

to start: ptr argv, int argc -> int
    PTR_SIZE new_list
    "a" swap list_append_ptr
    "b" swap list_append_ptr
    "c" swap list_append_ptr
    "d" swap list_append_ptr

    dup 3 swap list_fetch_ptr "d" streq "Fourth element should be d" assert
    dup 2 swap list_fetch_ptr "c" streq "Third element should be c" assert
    dup 1 swap list_fetch_ptr "b" streq "Second element should be b" assert
    dup 0 swap list_fetch_ptr "a" streq "First element should be a" assert

    dup list_pop_ptr "d" streq "Popping should give 7" assert
    dup list_pop_ptr "c" streq "Popping should give 3" assert
    dup list_peek_ptr "b" streq "Peeking should give 3" assert
    dup list_peek_ptr "b" streq "Peeking should still give 3" assert
    dup list_pop_ptr drop
    dup list_pop_ptr drop
    free
    0
