# Rule 110 simulator written in Brainfuck, interpreted in Boba
# Rule 110 source code: https://github.com/nootr/rule110

import lib.std

buffer mem 1024  # Array of chars
buffer mp  8     # ptr
buffer pp  8     # ptr


to get_character: -> char
    1 malloc
    0  # characters read
    while dup 0 =
        drop
        dup STDIN swap 1 read
    drop
    dup derefc
    swap free


to start: -> int
    mem mp setp

    " ->>>+[->>>,----------]>>>-<<<<<<[>>++++ "
    "++[-<++++++>]<+[-<->]<<<<]>>>+[[-[->+>+<<" concat
    "]>>[-<<+>>]>[-<+<+>>>+<]<[->+<]<<[->>+>>+" concat
    "<<<<]>>[-<<+>>]<<<<<[->>>>>+>>+<<<<<<<]>>" concat
    ">>>[-<<<<<+>>>>>]>>---[<<<[>+<[-]]>>>[+]]" concat
    "<<<[-]>>+]>>-<<<[-]<<+[[-]<<<+]>>->>>>>>+" concat
    "[-[->+<]>>++++[->>++++<<]>>[-<<++>>]<<<[>" concat
    " +++<-<+>]>.[-]>+],[-]-<+[-<+]->>>>>>+=] " concat

    while dup derefc 0 castc !=
        dup derefc '+' = if
            mp derefp dup derefc casti 1 + castc
            swap setc
        elif dup derefc '-' =
            mp derefp dup derefc casti 1 - castc
            swap setc
        elif dup derefc '>' =
            mp derefp 1 + mp setp
        elif dup derefc '<' =
            mp derefp 1 - mp setp
        elif dup derefc ',' =
            get_character mp derefp setc
        elif dup derefc '.' =
            2 malloc
            dup mp derefp derefc swap setc
            dup 1 + 0 castc swap setc
            dup puts
            free
        elif dup derefc '[' =
            mp derefp derefc 0 castc = if
                1  # counter
                while dup 0 !=
                    swap 1 +
                    dup derefc '[' = if
                        swap 1 + swap
                    dup derefc ']' = if
                        swap 1 - swap
                    swap
                drop
        elif dup derefc ']' =
            mp derefp derefc 0 castc != if
                1  # counter
                while dup 0 !=
                    swap 1 -
                    dup derefc '[' = if
                        swap 1 - swap
                    dup derefc ']' = if
                        swap 1 + swap
                    swap
                drop
        1 +
    0
