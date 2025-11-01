function anim_init()
{
    anim_sprite = sprite_index;
    anim_index = 0;
    anim_speed = 1;
    anim_dir = 1;
    override_sprite = -4;
    
    event_animend = function()
    {
        if (override_sprite != -4)
            override_sprite = -4;
        
        exit;
    };
    
    image_speed = 0;
}
