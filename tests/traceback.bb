to baz: -> void
    "Something went wrong" traceback

to bar: -> void
    baz

to foo: -> void
    bar

to start: int argc, ptr argv -> int
    foo
    0
