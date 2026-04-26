function scribble_rgb_to_bgr(arg0)
{
    return (arg0 & 4278255360) | ((arg0 & 16711680) >> 16) | ((arg0 & 255) << 16);
}
