import lib.std


const WIDTH   256
const HEIGHT  256


to draw_pixel: int x, int y -> void
    # Red
    x itos puts " " puts

    # Green
    y itos puts " " puts

    # Blue
    "64 " puts


to start: ptr argv, int argc -> int
    # Print PPM metadata
    "P3 " puts
    WIDTH itos puts " " puts
    HEIGHT itos puts " " puts
    "256\n" puts

    # Render image
    0
    while dup HEIGHT <
        0
        while dup WIDTH <
            over over swap draw_pixel
            1 +
        drop
        1 +

        "\n" puts
    0
