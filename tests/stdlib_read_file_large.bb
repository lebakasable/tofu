import lib.std


to start: ptr argv, int argc -> int
    "tests/fixtures/large.txt" read_file
    strlen 12345 = "File should be 12345 bytes" assert
    0
