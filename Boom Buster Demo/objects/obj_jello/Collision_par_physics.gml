if (object_get_parent(other.object_index) == par_carry)
{
    if (other.inPipe || other.vspd < 0 || other.carried != -4 || y < other.tossY || !other.landed)
        exit;
    
    with (other)
    {
        tossed = false;
        thrown = false;
        landY = -999;
        has_gravity = false;
    }
}
else if (!other.has_collision || other.vspd < 0)
{
    exit;
}

anim_sprite = spr_jello_bounce;
anim_index = 0;
audio_play_sound(snd_jello, 0, 0);
var _depth = layer_get_depth(layer_get_id("GUI")) + 1;
var _w = other.sprite_width;

for (var i = 0; i < irandom_range(6, 9); i++)
{
    var _x = other.x + irandom_range(-_w / 2, _w / 2);
    var _y = y + irandom_range(-64, -72);
    var _fx = instance_create_depth(_x, _y, _depth, obj_fx);
    _fx.anim_sprite = spr_jello_juice;
    
    if (onoff != -1)
    {
        _fx.pal_sprite = pal_jello;
        _fx.pal_sub = global.colorblind;
        
        if (onoff != -4)
            _fx.pal_ind = onoff + 1;
        else
            _fx.pal_ind = 0;
    }
    
    var _dir = -1;
    
    if (_fx.x > x)
        _dir = 1;
    
    _fx.hspd = 0.8 * _dir;
    _fx.vspd = random_range(-1, -1.5);
    _fx.grav = 0.08;
}

var _hold;

if (bounce_height_hold != -4)
    _hold = true;
else
    _hold = false;

with (other)
{
    bounce_blocks = other.bounce_height;
    
    if (_hold)
        bounce_blocks_hold = other.bounce_height_hold;
    else
        bounce_blocks_hold = other.bounce_height;
    
    event_bounce();
}
