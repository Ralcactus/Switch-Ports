global.game_music = "bgm_micro_bec";
global.game_music_loops = true;
zoom = 1;

event_zoom = function()
{
    controller.zoom = 0.95;
};

alarm[0] = 1;
order = 0;
draw_order = [];
land_order = [136, 173, 157, 248];
spr_order = [spr_micro_bec_bacon, spr_micro_bec_egg, spr_micro_bec_cheese, spr_micro_bec_top];
movespd = 11;
runspd = 14;
hspd = 0;
stacks = 0;
timer[0] = -1;

timer_func[0] = function()
{
    audio_play_sound_on(controller.audio, snd_belltree, 0, 0);
    scr_micro_win();
};

timer_in = false;
