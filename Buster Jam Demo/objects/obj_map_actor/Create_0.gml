event_inherited();
anim_init();
facing = 1;
draw_me = true;
xto = x;
yto = y;
movespd = 0;
shift_override = undefined;
finished = true;
cutscene_move = false;
unpause_when_done = false;
move_lerp = false;
move_lerp_lag = 2;
move_jump = false;
auto = -4;
physics_init_3d();
my_shadow = scr_create_shadow();
grav = 1.2;
alarm[0] = 1;
shake = 0;
shake_strength = 6;
squish = 0;

event_squish = function()
{
    squish = 1;
};
