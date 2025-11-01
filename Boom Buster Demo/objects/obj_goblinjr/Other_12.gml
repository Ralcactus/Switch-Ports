var _spear = has_spear;

if (_spear)
{
    has_spear = false;
    var _fx = instance_create_depth(x + (6 * facing), y - 46, layer_get_depth(layer_get_id("Pipes")) - 5, obj_fx);
    _fx.anim_sprite = spr_goblinjr_spear;
    _fx.rotate_spd = facing * 6;
    _fx.grav = 0.8;
    _fx.vspd = -12;
    _fx.image_xscale = facing;
    _fx.destroy = 2;
    
    if (hitBy.x >= x)
        facing = -1;
    else
        facing = 1;
    
    hspd = 0;
    hspd_bounce = 7.5 * facing;
    
    if (!stomped)
        vspd = -7;
    
    anim_sprite = spr_goblinjr_framed;
    timer[0] = 30;
    can_die_spin = true;
    can_die_stomp = true;
    mask_hurt = -4;
}
else
{
    instance_destroy();
}

event_inherited();
