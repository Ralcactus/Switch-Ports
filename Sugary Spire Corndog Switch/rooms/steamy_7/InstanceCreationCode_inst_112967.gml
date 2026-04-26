flags.do_once_per_save = true;

condition = function()
{
    var _check = false;
    
    with (obj_parent_player)
    {
        if (place_meeting(roomStartX, roomStartY, other))
            _check = true;
    }
    
    return _check;
};

output = function()
{
    for (var i = 0; i < (sprite_get_number(spr_clocktowerexteriorDebris) - 1); i++)
    {
        with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_clocktowerexteriorDebris))
            image_index = i;
    }
    
    repeat (3)
        create_debris((x - sprite_xoffset) + (sprite_width / 2) + random_range(-10, 10), y + random_range(-10, 10), spr_clocktowerexteriorDebris);
    
    camera_shake_add(20, 40);
    event_play_oneshot("event:/SFX/general/breakmetal");
};
