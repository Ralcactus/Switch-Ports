audio_play_sound(snd_Bu_smash_brick, 0, false);
shake = 1;
var _array = [];

for (var i = 0; i < (sprite_get_number(spr_boomtown_wizardstatue_shards) - 1); i++)
    array_push(_array, i);

_array = array_shuffle(_array);
var _subimg = 0;
var _shards = irandom_range(9, 13);
var _positions = [];
_positions = array_concat(_positions, shard_positions);
_positions = array_shuffle(_positions);

for (var i = 0; i < _shards; i++)
{
    var _x = (x + _positions[i][0]) - 12;
    var _y = (y + _positions[i][1]) - 32;
    var _xcenter = x + 329;
    var _ycenter = y + 417.5;
    var _xdir;
    
    if (_x < _xcenter)
        _xdir = -1;
    else
        _xdir = 1;
    
    var _hspd = random_range(3, 6) * _xdir;
    var _vspd = random_range(-9, -14);
    var _grav = random_range(0.8, 1);
    var _zspd = 0;
    var _inst = instance_create_layer(_x, _y, "FX", obj_map_fx);
    _inst.anim_sprite = spr_boomtown_wizardstatue_shards;
    _inst.anim_speed = 0;
    _inst.die_outside_view = true;
    _inst.sprite_index = _inst.anim_sprite;
    _inst.anim_index = _subimg;
    _inst.image_index = _inst.anim_index;
    _inst.image_speed = 0;
    _inst.vspd = _vspd;
    _inst.hspd = _hspd;
    _inst.zspd = _zspd;
    _inst.grav = _grav;
    _inst.ignore_render = true;
    _inst.visible = true;
    _inst.rot_spd = -_inst.hspd * 0.7;
    _subimg++;
    
    if (_subimg > (array_length(_array) - 1))
        _subimg = 0;
}
