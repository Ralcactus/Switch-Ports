event_inherited();
my_shadow = instance_create_layer(x, y, "Instances_Behind", obj_shadow_manual);
my_shadow.sprite_index = spr_map_block_shadow;
alarm[0] = 1;
grounded = false;
anim_init();
time = 0;
height = 288;
broken = false;
zstart = z;
z_hit = 0;
z_hit_grav = 0;
z_hit_spd = 0;
hit = false;

event_hit = function()
{
    var _snd = audio_play_sound(snd_block_bonk, 0, false);
    audio_sound_gain(_snd, 0.3, 0);
    z_hit = 0;
    z_hit_spd = -7;
    z_hit_grav = 0.7;
    hit = true;
    timer[0] = 5;
};

timer[0] = -1;

timer_func[0] = function()
{
    event_user(0);
};

event_poof = function()
{
    var _inst = instance_create_layer(x, (y + z + z_hit) - 60, "FX", obj_map_fx);
    _inst.anim_sprite = spr_map_poof_144;
    _inst.ignore_render = true;
    _inst.visible = true;
};

event_shards = function()
{
    var _snd = audio_play_sound(snd_crate, 0, 0);
    audio_sound_pitch(_snd, choose(0.95, 1, 1.05));
    var _count = irandom_range(9, 11);
    
    for (var i = 0; i < _count; i++)
    {
        var _subimg = irandom_range(0, sprite_get_number(spr_map_crateshards) - 1);
        var _x = x + irandom_range(-40, 40);
        var _y = y + z + irandom_range(-40, 40);
        var _xcenter = x;
        var _xdir = choose(1, -1);
        var _hspd = random_range(3, 6) * _xdir;
        var _vspd = random_range(-9, -14);
        var _grav = random_range(0.8, 1);
        var _zspd = 0;
        var _inst = instance_create_layer(_x, _y - 40, "FX", obj_map_fx);
        _inst.anim_sprite = spr_map_crateshards;
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
        _inst.rot_spd = -_inst.hspd;
        _inst.fade_spd = 0.08;
        _inst.fadeout = true;
        _inst.image_alpha = 2.5;
    }
    
    event_poof();
};
