if (keyboard_check_pressed(vk_tab) && in_debug_mode())
    outlineDebug = !outlineDebug;

if (!global.outlines)
    outlineDebug = false;

if (game_paused())
{
    if (alarm[1] != -1)
        alarm[1]++;
    
    exit;
}

var _pandir = input_check_opposing("up", "down") * (obj_player.grounded && obj_player.vsp >= 0);

if (sign(campan) != _pandir)
    campan = 0;

campan += _pandir;
campan = clamp(campan, -60, 60);
var _dir = floor(abs(campan / 60)) * sign(campan);
camVerticalPan = approach(camVerticalPan, _dir * 80, 2.5);

if ((obj_player.hovering || obj_player.hovertime >= obj_player.hovermaxtime) && !obj_player.grounded)
    showhovertimer = true;
else if (showhovertimer && alarm[1] == -1)
    alarm[1] = 60;

hovertimerflash = max(hovertimerflash - 0.05, 0);
hovertimerfade = approach(hovertimerfade, showhovertimer, 0.05);
