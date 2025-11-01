timer_logic(0);
anim_logic();
xAxis = input_check("right", player) - input_check("left", player);

if (controller.win || controller.ended)
    xAxis = 0;

hspd = easy_smooth(hspd, xAxis * movespd, 3);
x += (global.delta_game_factor * hspd);

if (x < (0 + (sprite_get_width(anim_sprite) / 2)))
    x = 0 + (sprite_get_width(anim_sprite) / 2);

if (x > (controller.game_width - (sprite_get_width(anim_sprite) / 2)))
    x = controller.game_width - (sprite_get_width(anim_sprite) / 2);

if (controller.ended && !controller.win && !killed)
{
    killed = true;
    anim_play(spr_Bu_foodcatch_buster_starving);
    audio_play_sound_on(controller.audio, snd_button_badending, 0, 0);
    scr_micro_stop_music();
}
