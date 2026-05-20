if (time >= 1160)
{
    image_alpha += 0.016666666666666666;
    ext(sPixel, 0, -100, -100, 999, 999, undefined, 0, image_alpha);
    
    if (time == 1310)
        room_goto(rCliffScroll);
}
