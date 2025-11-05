if (instance_exists(obj_player))
{
    if (obj_player.sprite_index != spr_player_groundpound)
        instance_destroy();
    
    x = obj_player.x;
    y = obj_player.y - 15;
}
