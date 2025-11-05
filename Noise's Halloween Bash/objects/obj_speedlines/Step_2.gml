if (instance_exists(obj_player))
{
    if (obj_player.movespeed <= 11 || obj_player.sprite_index == spr_player_downslide)
    {
        obj_player.speedlinesobj = noone;
        instance_destroy();
    }
    
    x = obj_player.x;
    y = obj_player.y;
}
