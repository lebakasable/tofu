# Description:Duplicate imports
# Exit code:7
# Stdout:
# Stderr:

import tests.fixtures.importee
import tests.fixtures.importee

to start: int argc, ptr argv -> int
    foo 4 +
