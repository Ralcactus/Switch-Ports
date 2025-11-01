anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

if (y < -128)
{
    if (!obj_bossfight_win.lose_hp)
    {
        global.boss_hp--;
        obj_bossfight_win.lose_hp = true;
    }
    
    obj_controller.wizard_flash = 1.4;
    obj_controller.wizard_sprite = spr_tv_wizard_ouch;
    obj_controller.timer[obj_controller.timer_win] = 150;
    screen_shake(26, 26, 0.5);
    audio_stop_play(snd_explosion, 0, 0);
    instance_destroy();
}
