var _squishh = 1 + (1 - squish);
var _squishv = squish;
lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel, c_white, 0, curpalette - 1, undefined, 1);
draw_model("CrateNITRO", x + (sprite_width / 2), y + (sprite_height / 2), z, -(sprite_height / 2) * _squishh, -(sprite_height / 2) * _squishv, (sprite_width + sprite_height) / 8, 0, 180, 0);
lighting_end();
