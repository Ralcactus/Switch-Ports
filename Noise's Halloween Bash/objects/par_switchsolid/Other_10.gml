var _squishh = 1 + (1 - squish);
var _squishv = squish;
var _state = global.switchstate ^^ reverse;

if (!_state)
    lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel, c_white, 0, 1);
else
{
    shader_set(shd_sadblock);
    shader_set_uniform_i(outlining, global.outlineDrawing);
}

draw_model(!_state ? "CrateHAPPY" : "CrateSAD", x + (sprite_width / 2), y + (sprite_height / 2), z, -(sprite_height / 2) * _squishh, -(sprite_height / 2) * _squishv, (sprite_width + sprite_height) / 8, 0, 180, 0);

if (!_state)
    lighting_end();
else
    shader_reset();
