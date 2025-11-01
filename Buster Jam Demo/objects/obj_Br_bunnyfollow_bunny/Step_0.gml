if (controller.ended)
{
    if (controller.win)
        anim_play(spr_Br_bunnyfollow_bunny_win);
    
    exit;
}

timer_logic(0);
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);

if (hspd == 0 && vspd == 0)
    anim_index = 0;

anim_logic();
