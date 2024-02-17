# Description:Standard library - Argument parser, get_argument
# Exit code:4
# Args:foo bar baz
# Stdout:bar
# Stderr:

import lib.std.argparse

to start: ptr argv, int argc -> int
    argv 2 argc get_argument puts
    argc
