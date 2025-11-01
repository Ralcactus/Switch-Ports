vspd = random_range(-9, -14);
anim_init();
go = false;
done = false;
global.game_music = "bgm_micro_firework";

if (instance_exists(obj_boss_tutorial))
    y += irandom_range(500, 880);
else
    y += irandom_range(0, 880);

array_sparkles = [];
time_test = 0;
col = 0;
char = choose(0, 1);
alarm[0] = 1;
pen = true;
selected = -4;
firework_scale = 0;
firework_offset = 150;
firework_flash = 2.5;
firework_vspd = 0.2;
firework_y = 0;
state = 0;
firework_alpha = 1;
played_sound = false;
editor = false;
dir_add = irandom_range(0, 45);
timer[0] = -1;

timer_func[0] = function()
{
    event_user(10);
};
