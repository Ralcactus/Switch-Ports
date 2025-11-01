testvariablenothing = false;

if (scr_map_exit_freeze())
    exit;

event_inherited();
scr_player_animations_3d();

if (hspd < 0)
    facing = -1;

if (hspd > 0)
    facing = 1;

var _ind = anim_index;
anim_logic();

if (draw_me && anim_sprite == anim_walk && grounded && ((_ind < 3 && anim_index >= 3) || (_ind < 8 && anim_index >= 8)))
{
    var _index = choose(snd_footstep_concrete0, snd_footstep_concrete1, snd_footstep_concrete2, snd_footstep_concrete3, snd_footstep_concrete4);
    var _snd = audio_play_sound(_index, 0, 0);
    audio_sound_gain(_snd, 0.5, 0);
    
    if (x != xprevious || y != yprevious)
    {
        var _yoff;
        
        if (vspd > 0)
            _yoff = -4;
        else
            _yoff = 0;
        
        var _inst = instance_create_layer(x - (20 * facing), y + _yoff, layer, obj_map_dust);
        _inst.hspd = -facing * 5;
        _inst.vspd = 0;
        _inst.zspd = -10;
        _inst.z = z;
    }
}

depth_pos = -bbox_bottom;
var _ignore_fade = instance_place_3d(x, y, z, obj_map_ignorefade);
var _xradius = 960;
var _yradius = 960;
var _enemy = collision_rectangle_3d(x - _xradius, y - _yradius, x + _xradius, y + _yradius, z + 480, 1440, par_map_enemy, true, true);
_xradius = 384;
_yradius = 480;
var _crossing = collision_rectangle_3d(x - _xradius, y - _yradius, x + _xradius, y + _yradius, z + 480, 1440, obj_enemy_crossing, true, true);

if (!_ignore_fade && (_enemy || _crossing))
{
    with (obj_map_player_follower)
        image_alpha = approach(image_alpha, 0.4, 0.1);
}
else
{
    with (obj_map_player_follower)
        image_alpha = approach(image_alpha, 1, 0.1);
}
