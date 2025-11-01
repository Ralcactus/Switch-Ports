hspd = 0;
movespd = 9;
alarm[0] = 1;
anim_init();

event_animend = function()
{
    if (anim_sprite == spr_Bu_foodcatch_buster_yum)
        anim_play(spr_Bu_foodcatch_buster_fed);
};

timer[0] = -1;

timer_func[0] = function()
{
    anim_play(spr_Bu_foodcatch_buster_starving);
};

killed = false;
global.game_music = "bgm_micro_fun";
