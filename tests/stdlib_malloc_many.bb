import lib.std


buffer root 24

const item.prev  0  # ptr
const item.next  8  # ptr
const item.value 16 # int


to create: ptr root, int num -> void
    root  # current_node
    1     # value
    while dup num <
        24 malloc
        rot dup rot dup rot swap item.prev + setp
        rot dup rot dup rot swap item.value + seti
        dup item.next + NULL swap setp
        rot dup rot dup rot item.next + setp
        swap drop swap
        1 +

to fetch: ptr node, int n -> int
    node  # current_node
    0     # index
    while dup n <
        swap item.next + derefp swap
        1 +
    drop item.value + derefi

to start: int argc, ptr argv -> int
    NULL  root item.prev  + setp
    NULL  root item.next  + setp
    0     root item.value + seti
    root 1000 create
    root 420 fetch
