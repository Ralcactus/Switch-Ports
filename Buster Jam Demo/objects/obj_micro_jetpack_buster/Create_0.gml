event_inherited();
ready = false;
physics_init_2d_micro();
anim_init();
my_solid = obj_micro_jetpack_buster_solid;
facing = sign(image_xscale);
alarm[0] = 1;
acc = 2.2;
movespd = 16;
dash_spd = 0;
dash_spd_boost = 14;
grav = 0;
spinning = false;
spin_time = 24;
spin_bounce = false;
timer[0] = -1;

timer_func[0] = function()
{
    spinning = false;
    spin_bounce = false;
};

event_animend = function()
{
    if (anim_sprite == spr_micro_jetpack_buster_spin)
        anim_index = sprite_get_number(anim_sprite) - 3;
};

event_wall = function()
{
    var _spinning = spinning;
    
    if (_spinning)
    {
        var _array = instance_place_array(x + sign(hspd), y, obj_micro_jetpack_block);
        
        for (var i = 0; i < array_length(_array); i++)
        {
            if (_array[i].ID != ID)
                continue;
            
            with (_array[i])
                event_user(0);
            
            controller.screenshake[0] = 13;
            controller.screenshake[1] = 13;
            hspd = -hspd;
            spinning = false;
            spin_bounce = true;
        }
        
        dash_spd = 0;
    }
    else
    {
        hspd = 0;
    }
};
