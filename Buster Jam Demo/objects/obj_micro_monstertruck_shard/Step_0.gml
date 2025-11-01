angle -= hspd;
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
vspd += (grav * global.delta_game_factor);

if (place_meeting_micro(x, y + vspd, obj_solid_micro))
    event_floor();
