import lib.std
import lib.std.textbuffer

to start: ptr argv, int argc -> int
    1 textbuffer_create

    "Hello, " swap textbuffer_append
    dup textbuffer.capacity + derefi 8 = "Buffer should have cap. 8" assert
    dup textbuffer.len +      derefi 7 = "Buffer should have len 7" assert

    "world!"  swap textbuffer_append
    dup textbuffer.capacity + derefi 16 = "Buffer should have cap. 16" assert
    dup textbuffer.len +      derefi 13 = "Buffer should have len 13" assert

    dup textbuffer.content + puts
    free
    0
