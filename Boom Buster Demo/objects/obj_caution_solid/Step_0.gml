if (exit_freeze())
    exit;

if (buzzer)
    buzzer--;
else
    blink = false;

if ((buzzer % 4) == 0)
    blink = !blink;

if (blink)
    sprite_index = spr_caution_solid;
else
    sprite_index = spr_caution_red_solid;
