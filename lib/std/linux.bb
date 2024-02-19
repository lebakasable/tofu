const STDIN  0
const STDOUT 1
const STDERR 2

const SYS_READ          0
const SYS_WRITE         1
const SYS_OPEN          2
const SYS_CLOSE         3
const SYS_MMAP          9
const SYS_MUNMAP        11
const SYS_RT_SIGACTION  13
const SYS_RT_SIGRETURN  15
const SYS_DUP2          33
const SYS_SETITIMER     38
const SYS_SOCKET        41
const SYS_ACCEPT        43
const SYS_BIND          49
const SYS_LISTEN        50
const SYS_FORK          57
const SYS_EXECVE        59
const SYS_EXIT          60
const SYS_WAIT4         61

const O_RDONLY      0
const O_WRONLY      1
const O_CREAT       64
const PROT_READ     1
const PROT_WRITE    2
const MAP_PRIVATE   2
const MAP_ANONYMOUS 32

const PORT          6969
const AF_INET       2
const SOCK_STREAM   1
const INADDR_LOCAL  16777343

const ITIMER_REAL   0
const SIGALRM       14
const SA_SIGINFO    4
const SA_RESTORER   67108864  # 0x04000000


to write: int fd, ptr s -> void
    # Prints a string to fd and returns the write syscall exit-code
    fd         # File descriptor
    s          # Pointer to string
    s strlen   # String length
    SYS_WRITE
    syscall 3


to puts: ptr s -> void
    # Prints a string and returns the write syscall exit-code
    STDOUT     # File descriptor
    s          # Pointer to string
    write


to error: ptr s -> void
    # Prints an error and returns the write syscall exit-code
    STDERR     # File descriptor
    s          # Pointer to string
    write


to exit: int code -> void
    # Exits using a given exit code
    code SYS_EXIT syscall 1


to raise: ptr message -> void
    # Prints a given error message and exits with exitcode 1
    message traceback


to assert: bool assertion, ptr message -> void
    # Raises when assertion is false
    assertion false = if
        message traceback


to open: ptr filename, char mode -> int
    # Opens a given file in (r)ead or (w)rite mode and returns a file descriptor.
    filename
    0

    mode 'r' = if
        O_RDONLY or
    mode 'w' = if
        O_WRONLY or O_CREAT or

    511
    SYS_OPEN
    syscall 3

    dup 0 < if
        "Could not open file\n" raise

to close: int fd -> void
    fd SYS_CLOSE syscall 1 drop

to read: int fd, ptr buf, int count -> int
    # Reads from a file descriptor and returns the number of bytes read or zero if EOF
    fd buf count SYS_READ syscall 3
    dup 0 < if
        "Could not read file\n" raise


to rt_sigaction: int signum, ptr act, ptr oldact, int sigsetsize -> int
    # Changes the action taken on a certain signal
    signum act oldact sigsetsize SYS_RT_SIGACTION syscall 4
    dup 0 != if
        "Could not change signal action\n" raise


inline rt_sigreturn: -> void
    # Return from signal handler and cleanup stack frame
    SYS_RT_SIGRETURN syscall 0
    "RT_SIGRETURN should not return\n" raise


const sigaction.handler   0   # ptr
const sigaction.flags     8   # int
const sigaction.restorer  16  # ptr
const sigaction.mask      24  # int
const SIGACTION_SIZE      32


to setitimer: int which, ptr new_val, ptr old_val -> int
    # Set the value of an interval timer
    which new_val old_val SYS_SETITIMER syscall 3
    dup 0 != if
        "Could not set the timer\n" raise


const itimerval.interval  0   # timeval
const itimerval.value     16  # timeval
const ITIMERVAL_SIZE      32

const timeval.sec   0   # int
const timeval.usec  8   # int
const TIMEVAL_SIZE  16


buffer _sigaction 32

to setup_signal_handler: int signal, ptr handler, ptr restorer -> int
    # Setup a signal handler for a certain signal
    handler     _sigaction sigaction.handler + setp
    0           _sigaction sigaction.mask + seti

    restorer 0 castp = if
        0       _sigaction sigaction.flags + seti
        0 castp _sigaction sigaction.restorer + setp
    else
        SA_SIGINFO SA_RESTORER or \
                    _sigaction sigaction.flags + seti
        restorer    _sigaction sigaction.restorer + setp

    signal _sigaction 0 castp 8 rt_sigaction


buffer _itimerval 32

to set_timer: int inter_secs, int inter_usecs, int val_secs, int val_usecs -> int
    # Sets the values of the internal timer
    inter_secs  _itimerval itimerval.interval + timeval.sec + seti
    inter_usecs _itimerval itimerval.interval + timeval.usec + seti
    inter_secs  _itimerval itimerval.value + timeval.sec + seti
    inter_usecs _itimerval itimerval.value + timeval.usec + seti

    ITIMER_REAL _itimerval 0 castp setitimer


to exec: ptr file, ptr args -> void
    SYS_FORK syscall 0

    dup 0 = if
        file
        args
        0 castp
        SYS_EXECVE
        syscall 3 drop
    elif dup 0 >
        dup 0 castp 0 0 castp SYS_WAIT4 syscall 4 drop


to exec_silent: ptr file, ptr args -> void
    SYS_FORK syscall 0

    dup 0 = if
        "/dev/null" 'r' open
        STDOUT
        SYS_DUP2 syscall 2
        drop

        file
        args
        0 castp
        SYS_EXECVE
        syscall 3 drop
    elif dup 0 >
        dup 0 castp 0 0 castp SYS_WAIT4 syscall 4 drop


const sockaddr_in.sin_family 0
const sockaddr_in.sin_port 2
const sockaddr_in.sin_addr 4
const SOCKADDR_SIZE 16

to socket: int domain, int type, int protocol -> int
    domain type protocol SYS_SOCKET syscall 3

to accept: int fd, ptr addr, ptr addr_len -> int
    fd addr addr_len SYS_ACCEPT syscall 3

to bind: int fd, ptr addr, int addr_len -> int
    fd addr addr_len SYS_BIND syscall 3

to listen: int fd, int backlog -> int
    fd backlog SYS_LISTEN syscall 2

to htons: int x -> int
    x       255 and 8 shl
    x 8 shr 255 and
    or
