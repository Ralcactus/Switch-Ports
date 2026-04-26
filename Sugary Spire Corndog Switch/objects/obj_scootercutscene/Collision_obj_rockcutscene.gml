if (sprite_index != spr_player_outofcontrolfall)
{
    hit = true;
    vsp = -20;
    hsp = 8;
    event_play_oneshot("event:/SFX/player/bumpwall");
    event_play_oneshot("event:/SFX/player/groundpound");
    instance_create(x, y, obj_bangEffect);
    sprite_index = spr_player_outofcontrolfall;
    
    for (var i = 0; i < (sprite_get_number(spr_introdebris) - 1); i++)
    {
        with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_introdebris))
            image_index = i;
    }
}
