mask_index = spr_player_mask;

if (scr_solid(x + sign(image_xscale), y, true) && !place_meeting(x + sign(image_xscale), y, obj_destructibles) && !place_meeting(x + sign(image_xscale), y, obj_metalblock) && !place_meeting(x + sign(image_xscale), y, obj_chocofrog))
{
    for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
    {
        with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
            image_index = i;
    }
    
    instance_destroy(id, false);
}

mask_index = spr_minecart;

if (bbox_top >= (room_height + 100))
    instance_destroy(id, false);
