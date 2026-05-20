if (text != -1)
{
    if (place_meeting(x, y - 80, oPlayer) || place_meeting(x, y - 40, oPlayer) || place_meeting(x, y + 40, oPlayer) || place_meeting(x, y + 80, oPlayer))
    {
        ext(sPixel, 0, 0, 0, 999, 32, undefined, 0, 1);
        print(text, 320, 4, undefined, undefined, ["prop", "mid", "bc3", "force_ENG"]);
    }
}
