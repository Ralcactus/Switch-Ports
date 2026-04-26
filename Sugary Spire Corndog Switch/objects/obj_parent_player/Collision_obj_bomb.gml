if (state == UnknownEnum.Value_16)
{
    bombPepTimer = 100;
    global.ComboFreeze = 30;
    state = UnknownEnum.Value_20;
    image_index = 0;
    sprite_index = spr_player_PZ_bomb_intro;
    
    with (instance_nearest(x, y, obj_bomb))
        instance_deactivate_object(obj_bomb);
}
