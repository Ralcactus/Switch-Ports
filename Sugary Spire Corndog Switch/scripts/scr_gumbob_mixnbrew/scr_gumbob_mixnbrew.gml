function scr_gumbob_mixnbrew()
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_GB_shakingBrew_intro)
        sprite_index = spr_player_GB_shakingBrew;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_GB_shakingBrew)
        state = UnknownEnum.Value_1;
    
    if (sprite_index == spr_player_GB_shakingBrew && key_up)
    {
        sprite_index = spr_player_GB_brewUp;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_GB_brewUp && floor(image_index) == (image_number - 8))
    {
        if (!instance_exists(obj_gumbobprojectile))
        {
            with (instance_create_depth(x + 5, y - 100, -2, obj_gumbobprojectile))
                hsp = 2;
            
            with (instance_create_depth(x - 5, y - 100, -2, obj_gumbobprojectile))
                hsp = -2;
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_GB_brewUp)
    {
        state = UnknownEnum.Value_1;
        sprite_index = spr_player_GB_idle;
    }
}
