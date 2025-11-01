shake = approach(shake, 0, 0.038461538461538464);
hit_delay = approach(hit_delay, 0, 1);
timer_logic(0);
timer_logic(1);
timer_logic(2);

if (room != rm_wizard_test)
    exit;

if (keyboard_check_pressed(vk_shift))
{
    event_user(0);
    event_user(1);
}

if (mouse_check_button_pressed(mb_left))
{
    array_push(explosion_positions, [mouse_x, mouse_y]);
    audio_play_sound(snd_pop, 0, 0);
}

if (keyboard_check_pressed(vk_space))
{
    clipboard_set_text(explosion_positions);
    print(explosion_positions);
}
