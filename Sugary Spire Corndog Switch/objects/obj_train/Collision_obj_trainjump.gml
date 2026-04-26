if (sprite_index != spr_sprayjump)
{
    movespeed = 12;
    vsp = -13;
    event_play_oneshot("event:/SFX/enemies/train", x, y);
    sprite_index = spr_sprayjump;
    image_index = 0;
}
