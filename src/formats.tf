import lib.std


## Constants

const FORMAT_LINUX_X86_64 0


to format_to_str: int format -> ptr
    # Returns the string representation of a given format
    format
    dup FORMAT_LINUX_X86_64 = if
        "Linux x86-64"
    else
        "Unknown format" raise "UNKNOWN"


to str_to_format: ptr s -> int
    # Converts a string to a format
    s
    dup "linux_x86_64" streq if
        FORMAT_LINUX_X86_64
    else
        "Unknown format: " s concat raise 0
