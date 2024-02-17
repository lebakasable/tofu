# Description:Print traceback
# Exit code:1
# Stdout:
# Stderr:Something went wrong\nTraceback:\ntests/traceback.bb, line 7 in baz\ntests/traceback.bb, line 10 in bar\ntests/traceback.bb, line 13 in foo\ntests/traceback.bb, line 16 in start

to baz: -> void
    "Something went wrong" traceback

to bar: -> void
    baz

to foo: -> void
    bar

to start: int argc, ptr argv -> int
    foo
    0
