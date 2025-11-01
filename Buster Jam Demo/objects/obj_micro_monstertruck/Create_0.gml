global.game_music = "bgm_micro_derby";
global.game_music_loops = true;
event_inherited();
anim_init();
physics_init_2d_micro();
hspd = 0;
acc = 0.6;
movespd = 20;
wheel_angle = 0;
alarm[0] = 1;
time = 0;
timer[0] = 40;

timer_func[0] = function()
{
    var _x = irandom_range(250, controller.game_width - 250);
    var _inst = instance_create_micro(_x, -20, "Middle", obj_micro_monstertruck_evilblock);
    timer[0] = 60;
};

shoot_delay = 0;
shoot_yoff = 0;
truck_yoff = 0;
sprite_index = spr_micro_monstertruck;
deac = false;
my_drive_snd = -4;
