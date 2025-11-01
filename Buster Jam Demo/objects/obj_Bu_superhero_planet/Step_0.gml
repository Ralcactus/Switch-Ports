if (!ready)
    exit;

if (!hit)
    hspd = controller.microgame_hspd;

x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);

if (hit)
    vspd += grav;

if (controller.microgame_hspd != 0 || hit)
    image_angle += angle_spd;
