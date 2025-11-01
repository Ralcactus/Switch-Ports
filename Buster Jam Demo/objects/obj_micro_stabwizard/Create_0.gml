event_inherited();
global.game_music = "bgm_micro_sleepy";
global.game_music_loops = true;
alarm[0] = 1;
man_spr = spr_wizardstab_man_snore;
man_ind = 0;
man_animspd = 1;
bubble_spr = spr_wizardstab_bubble;
bubble_ind = 0;
knife_in = 0;
stabs = 0;
chars_ind = 0;
lose = false;
arrow_ind = 0;
stabs_needed = 9;
timer[0] = -1;

timer_func[0] = function()
{
    man_spr = spr_wizardstab_man_lose;
    man_ind = 0;
    audio_play_sound_on(controller.audio, snd_micro_stab_creak, false, 0);
};
