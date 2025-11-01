testvariablenothing = false;
sprite_prefetch(spr_fx_explosion);

with (obj_transition_fade)
    instance_destroy();

event_inherited();
auto_draw_surface = false;
global.bgm_play = audio_play_sound(bgm_subwayboss_macro, 0, true);
global.speedup = 1;
zoom = 1.5;
shake = 1.5;
rot = 0;
timer[0] = 90;

timer_func[0] = function()
{
    out = true;
    room_goto(rm_boomtown_boss_macro_game);
    alarm[0] = 2;
};

out = false;
x = 0;
y = 0;
vspd = 0;
