if (!instance_exists(obj_fadeoutTransition))
{
    with (other)
    {
        if (state != UnknownEnum.Value_101 && (other.state == UnknownEnum.Value_1 || other.state == UnknownEnum.Value_2))
        {
            scr_hurtplayer();
            image_index = 0;
            
            if (state == UnknownEnum.Value_100)
            {
                instance_create(x, y, obj_bombExplosionHarmless);
                
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
                        image_index = i;
                }
            }
            
            state = UnknownEnum.Value_101;
            sprite_index = spr_player_PZ_squished;
            image_speed = 0.35;
        }
    }
}
