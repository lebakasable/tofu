import lib.std


to start: ptr argv, int argc -> int
    "tests/fixtures/small.txt" read_file puts
    0
