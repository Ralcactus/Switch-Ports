draw_set_font(fnt_adlib);
draw_set_alpha(0.15);

if (global.debug)
    draw_text(5, 5, "debug");

draw_set_alpha(1);

if (keyboard_check_pressed(ord("D")) && keyboard_check(vk_alt) && global.debug)
    debug_event("ResourceCounts");
