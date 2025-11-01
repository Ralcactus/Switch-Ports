if (scr_map_exit_freeze())
    exit;

dir += (rotate_spd * global.delta_game_factor);

if (dir > 360)
    dir -= 360;

x = spawner_x + (dsin(dir) * len);
y = spawner_y + (dcos(dir) * len);
