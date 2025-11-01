event_inherited();
already_got = false;
grounded = false;
collected = false;
timer[0] = -1;

timer_func[0] = function()
{
    var _x = x;
    var _y = y;
    
    if (collected)
    {
        var _rotoffset = irandom_range(0, 360);
        var _len = 48;
        _len = 0;
        
        for (var i = 0; i < star_count; i++)
        {
            var _angle = ((360 / star_count) * i) + _rotoffset;
            _x = x + lengthdir_x(_len, _angle);
            _y = y + lengthdir_y(_len, _angle);
            var _fx = instance_create_layer(_x, _y + z, "FX", obj_map_fx);
            _fx.anim_sprite = spr_fx_sparkle;
            _fx.spd = 5.5;
            _fx.anim_end_die = true;
            _fx.spd_dir = _angle;
        }
    }
    
    instance_destroy();
};

star_count = 5;
z = 0;
height = 96;
alarm[0] = 1;
alarm[1] = 4;
vspd = 0;
grav = 0;
anim_init();
my_shadow = -4;
