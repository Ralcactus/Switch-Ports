dir = choose(-1, 1);
alarm[0] = 1;
global.game_music = "bgm_micro_techB";
anim_init();

if (dir == 1)
    anim_play(spr_Bu_dodge_LtoR);
else
    anim_play(spr_Bu_dodge_RtoL);

anim_index = sprite_get_number(anim_sprite) - 1;

event_animend = function()
{
    anim_index = sprite_get_number(anim_sprite) - 1;
};
