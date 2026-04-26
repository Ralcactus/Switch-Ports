if (sprite_index == spr_grabbiehand_fall)
{
    grav = 0;
    vsp = 0;
    grabbing = true;
    sprite_index = spr_grabbiehand_catch;
    other.image_index = 0;
    obj_parent_player.sprite_index = spr_player_PZ_caught;
    other.state = UnknownEnum.Value_72;
    other.x = x;
    other.y = y;
    other.vsp = 0;
    other.hsp = 0;
}

if (sprite_index == spr_grabbiehand_catch)
{
    other.vsp = 0;
    other.hsp = 0;
    other.state = UnknownEnum.Value_72;
    obj_parent_player.sprite_index = spr_player_PZ_caught;
    other.x = x;
    other.y = y;
}

if (obj_parent_player.state == UnknownEnum.Value_21)
{
    if (thumbingup == 0 && (x <= (xstarte + 5) && x >= (xstarte - 5) && y <= (ystarte + 5) && y >= (ystarte - 5)) && !grabbing)
    {
        event_play_multiple("event:/SFX/general/breakblock", x, y);
        delay = 5;
        image_xscale = -obj_parent_player.xscale;
        thumbingup = 1;
        create_particle(x, y, spr_bangEffect);
        sprite_index = spr_grabbiehand_hifive;
        image_index = 0;
    }
}
