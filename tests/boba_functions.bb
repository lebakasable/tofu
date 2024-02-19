import lib.std
import lib.std.list
import lib.boba.functions
import lib.boba.types


buffer _function 8  # ptr


to start: int argc, ptr argv -> int
    "foo" create_function _function setp

    TYPE_INT "arg1" _function derefp function_add_argument
    TYPE_PTR "arg2" _function derefp function_add_argument

    TYPE_BOOL _function derefp function_set_return_type

    _function derefp function.name + derefp "foo" streq \
        "Function should be named foo" assert
    _function derefp function.args + derefp list.len + derefi 2 = \
        "Function should have 2 arguments" assert
    _function derefp function.return_type + derefi TYPE_BOOL = \
        "Function should return bool" assert

    0 _function derefp function.args + derefp list_fetch
    dup argument.name + derefp "arg1" streq "First argument should be arg1" assert
    dup argument.type + derefi TYPE_INT = "First argument should be int" assert
    drop

    1 _function derefp function.args + derefp list_fetch
    dup argument.name + derefp "arg2" streq "Second argument should be arg2" assert
    dup argument.type + derefi TYPE_PTR = "Second argument should be ptr" assert
    drop

    "arg1" _function derefp function_get_arg_offset 56 = \
        "First argument should have a memory offset of 56" assert
    "arg2" _function derefp function_get_arg_offset 48 = \
        "Second argument should have a memory offset of 48" assert
    "arg3" _function derefp function_get_arg_offset 0 1 - = \
        "Unknown argument should return offset -1" assert
    0
