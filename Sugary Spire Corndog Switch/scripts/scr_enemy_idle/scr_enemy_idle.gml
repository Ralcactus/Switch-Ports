function scr_enemy_idle()
{
    if (vsp > 1 && grounded && object_index != obj_beeSoldier)
    {
        instance_create(x, y, obj_landcloud);
        image_index = 0;
    }
    
    if (grounded && vsp > 0)
        hsp = 0;
    else if (!grounded)
        hsp = approach(hsp, 0, 0.1);
    
    scr_conveyorBeltKinematics();
    
    if (object_index != obj_beeSoldier && object_index != obj_charCherry)
        sprite_index = baddieSpriteIdle;
    
    image_speed = 0.35;
    
    if (animation_end() && sprite_index == spr_beesoldier_intro)
    {
        state = UnknownEnum.Value_6;
        sprite_index = spr_throw;
        image_index = 0;
        exit;
    }
    
    if ((sprite_index == spr_charcherry_popout && animation_end()) || sprite_index == spr_charcherry_run)
    {
        state = UnknownEnum.Value_14;
        sprite_index = spr_charcherry_run;
        movespeed = 8;
        vsp = 0;
        exit;
    }
    
    if (floor(image_index) == (image_number - 1) && grounded)
    {
        state = UnknownEnum.Value_1;
        image_index = 0;
        exit;
    }
}
