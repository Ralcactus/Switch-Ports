for (var i = 0; i < 2; i++)
{
    move[i] = 0;
    move_sub[i] = 0;
}

movespd = 8;
alarm[0] = 1;
global.game_music = "bgm_micro_techA";
anim_init();
anim_play(spr_Bu_avoid_ball);
time = 0;
