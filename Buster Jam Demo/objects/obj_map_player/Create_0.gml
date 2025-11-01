event_inherited();
room_started_delay = 15;
record_max = 22;
physics_init_3d();
hspd = 0;
vspd = 0;
movespd = 10;
runspd = 10.5;
grav = 1.2;
jump_strength = 18.5;
vspd_max = 24;
boostspd = 0;
jumping = false;
running = false;
z = 0;
z_view = 0;
height = 176;
grounded = instance_place_3d(x, y, z + 1, obj_solid);
record_this_jump = false;
opening = true;
xAxis_open = 0;
yAxis_open = 0;
anim_init();
facing = 1;
dir = 270;
scr_player_actions_init();
scr_player_load_sprites();
deac = false;
xAxis = 0;
yAxis = 0;
scr_create_shadow();
swap_x = x;
swap_y = y;
swap_z = z;
array_record = [];
cutscene_move = false;
cutscene_move_xto = undefined;
cutscene_move_yto = undefined;
draw_me = true;

event_floor = function()
{
    if (zspd > 0 && draw_me && state != state_climb)
    {
        audio_play_sound(snd_land, 0, 0);
        var _len = 30;
        var _spd = 11;
        var _count = irandom_range(2, 4);
        var _angle = random_range(0, 360);
        
        for (var i = 0; i < _count; i++)
        {
            _angle += (360 / _count);
            var _inst = instance_create_layer(x, y, layer, obj_map_dust);
            _inst.x += lengthdir_x(_len, _angle);
            _inst.y += lengthdir_y(_len * 0.45, _angle);
            _inst.hspd = dsin(_angle + 90) * _spd;
            _inst.vspd = dcos(_angle + 90) * _spd * 0.6;
            _inst.z = z;
        }
    }
    
    zspd = 0;
};

event_ceiling = function()
{
    var _block = instance_place_3d(x, y, z - 1, par_map_block);
    
    if (_block)
    {
        with (_block)
            event_hit();
    }
    
    zspd = 0;
    z++;
};
