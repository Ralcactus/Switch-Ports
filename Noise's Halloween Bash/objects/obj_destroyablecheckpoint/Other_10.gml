var _squishh = 1 + (1 - squish);
var _squishv = squish;
lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel);
draw_model("Checkpoint" + ((obj_player.currcheckpoint.id == id) ? "DESTROYED" : ""), x + (sprite_width / 2), y + (sprite_height / 2), z + 16, -(sprite_height / 2) * _squishh, -(sprite_height / 2) * _squishv, (sprite_width + sprite_height) / 8, 0, 180, 0);
lighting_end();
