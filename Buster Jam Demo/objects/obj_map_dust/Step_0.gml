if (scr_map_exit_freeze())
    exit;

hspd = easy_smooth(hspd, 0, 5);
vspd = easy_smooth(vspd, 0, 5);
zspd = easy_smooth(zspd, 0, 5);
image_alpha -= 0.035;

if (image_alpha <= 0)
    instance_destroy();

x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
z += (zspd * global.delta_game_factor);
anim_logic();
