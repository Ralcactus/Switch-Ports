event_inherited();
texture_prefetch("map_buster");
texture_prefetch("map_bridget");
anim_init();
char = 0;
alarm[0] = 1;
my_bom = -4;

event_create_bom = function()
{
    anim_play(anim_aim_beat);
    var _yoff = 4;
    my_bom = instance_create_layer((x + -155) - 5, y + _yoff, layer, obj_frenzy_bom);
    my_bom.z = -72 - _yoff;
    my_bom.zspd = 0;
    my_bom.grav = 0;
    my_bom.my_player = id;
    my_bom.mult = mult;
    my_bom.anim_sprite = anim_bom_throw;
};

event_throw_bom = function()
{
    if (!instance_exists(my_bom))
        exit;
    
    timer[0] = 12;
};

event_win = function()
{
    timer[1] = 3;
};

event_win_final = function()
{
    anim_play(anim_spin);
    timer[1] = 45;
};

event_lose = function()
{
    var _inst = instance_create_layer(x - 24, y - 80, "FX", obj_map_fx);
    _inst.ignore_render = true;
    _inst.visible = true;
    var _array = [spr_fx_explosion, spr_fx_explosion_turq];
    _inst.anim_sprite = _array[char];
    audio_stop_play(snd_explosion, 0, false);
    timer[2] = (sprite_get_number(spr_fx_explosion) / sprite_get_speed(spr_fx_explosion)) * 4;
};

timer[0] = -1;

timer_func[0] = function()
{
    anim_play(anim_throw);
    
    with (my_bom)
    {
        zspd = -14.700000000000001;
        grav = 0.525;
        hspd = 22.5 * mult * 1.05;
        draw_me = true;
    }
};

timer[1] = -1;

timer_func[1] = function()
{
    anim_play(anim_win);
};

timer[2] = -1;

timer_func[2] = function()
{
    anim_play(anim_lose);
};

event_animend = function()
{
    var _spr = anim_sprite;
    
    if (_spr == anim_aim_beat)
        anim_play(anim_aim);
    else if (_spr == anim_throw)
        scr_dontloop_anim();
    else if (_spr == anim_win || _spr == anim_got_bom)
        scr_dontloop_anim();
};
