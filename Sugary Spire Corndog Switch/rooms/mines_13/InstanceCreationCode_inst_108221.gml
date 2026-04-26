has_won = false;
flags.do_once = false;
flags.do_save = false;

condition = function()
{
    return place_meeting(x, y, obj_train) && obj_train.sprite_index != spr_spraydie;
};

output = function()
{
    if (obj_parent_player.x >= obj_train.x)
    {
        with (obj_parent_player)
        {
            sprite_index = spr_player_mach3hitwall;
            hsp = 2.5 * -xscale;
            vsp = -3;
            machTwo = 0;
            image_index = 0;
            instance_create(x, y, obj_bombExplosionHarmless);
            
            if (state == UnknownEnum.Value_100)
            {
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
                    {
                        sprite_index = spr_minecartdebris;
                        image_index = i;
                        vsp = floor(random_range(-5, -9));
                        hsp = floor(random_range(-5, 7));
                    }
                }
            }
            
            state = UnknownEnum.Value_67;
        }
    }
    else
    {
        with (108220)
            alarm[1] = 1;
        
        with (108223)
            instance_destroy();
        
        has_won = true;
    }
    
    with (obj_train)
    {
        if (sprite_index != spr_spraydie)
        {
            camera_shake_add(40, 50);
            image_index = 0;
            sprite_index = spr_spraydie;
        }
    }
};
