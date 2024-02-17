# Description:Standard library - free, middle
# Exit code:0
# Stdout:
# Stderr:

import lib.std


const item.prev  0  # ptr
const item.next  8  # ptr
const ITEM_SIZE  16

buffer root 16

to create_node: ptr parent, ptr child -> void
    child parent item.next + setp
    parent child item.prev + setp
    NULL   child item.next + setp

to append: ptr root -> void
    root
    while dup item.next + derefp NULL !=
        item.next + derefp
    ITEM_SIZE malloc
    create_node

to delete: ptr root, int num -> void
    root  # current_node
    0     # index
    while dup num <
        swap item.next + derefp swap
        1 +
    drop
    dup item.prev + derefp swap dup rot swap item.next + derefp item.prev + setp
    dup item.next + derefp swap dup rot swap item.prev + derefp item.next + setp
    free

to fetch: ptr node, int n -> ptr
    node  # current_node
    0     # index
    while dup n <
        swap
        item.next + derefp
        swap
        1 +
    drop

to start: int argc, ptr argv -> int
    root append
    root append
    root append
    root append
    root 2 delete
    root append
    root append

    root 1 fetch root 3 fetch < "1 should be before 3 in memory" assert
    root 4 fetch root 3 fetch < "4 should be before 3 in memory" assert
    root 3 fetch root 5 fetch < "3 should be before 5 in memory" assert
    0
