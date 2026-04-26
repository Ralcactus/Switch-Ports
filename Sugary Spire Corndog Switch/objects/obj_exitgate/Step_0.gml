if (global.panic && room != sucrose_1)
    sprite_index = spr_enterexitgate;

if (place_meeting(x, y, obj_parent_player) && obj_parent_player.state != UnknownEnum.Value_57 && sprite_index == spr_enterexitgate && (global.panic == 0 || room == sucrose_1) && obj_parent_player.sprite_index != obj_parent_player.spr_lookdoor && sprite_index != spr_exitgateclosed)
{
    ds_list_add(global.SaveRoom, id);
    sprite_index = spr_exitgateclosing;
    event_play_oneshot("event:/SFX/player/groundpound", (x - sprite_xoffset) + (sprite_width / 2), bbox_bottom);
    camera_shake_add(3, 3);
    global.playmiliseconds = 0;
    global.playseconds = 0;
    global.playminutes = 0;
    global.playhour = 0;
    obj_parent_player.state = UnknownEnum.Value_42;
    obj_parent_player.image_index = 0;
    obj_parent_player.sprite_index = obj_parent_player.spr_Timesup;
}

if (sprite_index == spr_exitgateclosing && floor(image_index) == (image_number - 1))
    sprite_index = spr_exitgateclosed;

if (drop && drop_state == 0)
{
    if (!scr_solid(x, y + sign(vsp)))
    {
        y += vsp;
        vsp += grav;
    }
    
    if (y >= drop_y)
    {
        y = drop_y;
        drop_state = 1;
        ds_list_add(global.doorsave, id);
        event_play_oneshot("event:/SFX/player/groundpound", (x - sprite_xoffset) + (sprite_width / 2), bbox_bottom);
        camera_shake_add(15, 30);
    }
}

if (global.StarMode)
    image_alpha -= 0.1;

if (image_alpha == 0)
{
    instance_destroy();
    ds_list_add(global.SaveRoom, id);
}
