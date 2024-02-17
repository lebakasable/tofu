# Description:Standard library - list contains string
# Exit code:0
# Stdout:
# Stderr:

import lib.std.list


to start: ptr argv, int argc -> int
    PTR_SIZE new_list

    "foo" swap list_append_ptr
    "bar" swap list_append_ptr

    "foo" over list_contains_string "List should contain foo" assert
    "bar" over list_contains_string "List should contain bar" assert
    "baz" over list_contains_string false = "List should not contain baz" assert

    free
    0
