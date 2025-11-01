anim_init();
timer[0] = -1;

timer_func[0] = function()
{
    anim_play(spr_Bu_ape_idle);
};

global.game_music = "bgm_micro_ape";

event_animend = function()
{
    if (anim_sprite == spr_Bu_ape_lol_trans)
        anim_play(spr_Bu_ape_lol);
};
