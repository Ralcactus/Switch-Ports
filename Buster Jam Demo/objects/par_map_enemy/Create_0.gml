event_inherited();
height = 48;
anim_init();
facing = 1;
scr_create_shadow();
grounded = true;
spun_sprite = spr_map_ball_spun;
spun_yoff = -62;

event_spun = function()
{
    var _angle = point_direction(x, y, obj_map_player.x, obj_map_player.y);
    var _hspd = -dsin(_angle + 90) * 6;
    var _vspd = -dcos(_angle + 90) * 6;
    var _inst = instance_create_layer(x, y, layer, obj_map_enemy_spun);
    _inst.z = z;
    _inst.zstart = _inst.z;
    _inst.facing = facing;
    _inst.mask_index = mask_index;
    _inst.spun_yoff = -62;
    
    with (_inst)
    {
        anim_play(other.spun_sprite);
        hspd = _hspd;
        vspd = _vspd;
    }
    
    scr_play_impact();
    screen_shake(8, 8);
    instance_destroy();
};

xradius = 672;
yradius = 672;
angle_move = -4;
state_free = 0;
state_spotted = 1;
state_chase = 2;
state = state_free;
chase_spd = 14;
chase_hspd = 0;
chase_vspd = 0;
physics_init_3d();

event_wall_x = function()
{
    hspd = 0;
};

event_wall_y = function()
{
    vspd = 0;
};

timer[0] = -1;

timer_func[0] = function()
{
    state = state_chase;
};

timer[1] = -1;

timer_func[1] = function()
{
    state = state_free;
};
