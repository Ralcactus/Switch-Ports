var _modelid = "CrateTNT";

if (active)
{
    _modelid += "TIMER";
    _modelid += string(min(explodesteps, 3));
}

var _squishh = 1 + (1 - squish);
var _squishv = squish;
lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel, 255, stepflash, 1 - stepflash);
draw_model(_modelid, x + (sprite_width / 2), y + (sprite_height / 2), z, -(sprite_height / 2) * _squishh, -(sprite_height / 2) * _squishv, (sprite_width + sprite_height) / 8, 0, 180, 0);
lighting_end();
