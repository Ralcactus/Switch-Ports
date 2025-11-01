if (global.texfilter)
    gpu_set_texfilter(true);

draw_set_font(fnt_debug);
script_execute(tv_script[channel]);
draw_sprite_gui(spr_ui_border, 0, 1408, 0);
draw_dollars();
draw_bombcounter();
draw_hp();
draw_foodbar();
draw_bossui();
draw_combometer();

if (wizard_sprite == spr_tv_wizard_freak && channel == 2)
    draw_sprite_gui(wizard_sprite, wizard_sub, 1408, 0);

part_system_drawit(global.part_gui);

if (goodnight)
{
    gpu_set_texfilter(true);
    draw_set_color(c_black);
    draw_set_alpha(0.3);
    draw_rectangle(-256, 0, 1664, 1080, false);
    draw_sprite_ext(spr_goodnight, 0, 704 - (global.screenshake[0] * 3), 540 - (global.screenshake[1] * 3), 1, 1, 0, c_white, 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
    gpu_set_texfilter(false);
}

draw_set_alpha(flash_overlay);
draw_rectangle(-256, 0, 1664, 1080, false);
draw_set_alpha(1);

if (global.texfilter)
    gpu_set_texfilter(false);
