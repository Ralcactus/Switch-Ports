if (open > 0)
{
    if (open == 1)
    {
        if (!place_meeting(x, y, obj_jegplayer))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/doorclose", x + (sprite_width / 2), -25, y);
            open--;
        }
    }
    else
        open--;
}

image_alpha = (open > 0) ? 0.5 : 1;
