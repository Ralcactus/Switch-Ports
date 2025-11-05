for (var i = 0; i < sprite_get_number(spr_checkpointdebris); i++)
{
    var _wall = wall_behind(x + (sprite_width / 2), y + (sprite_height / 2), z);
    scr_createparticle(false, irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), z + 16, spr_checkpointdebris, image_xscale, image_yscale, i, 0, irandom(360), 0.5, irandom_range(-4, 4), irandom_range(-6, -2), irandom_range(-2, 2 * !_wall));
}

instance_destroy(obj_checkpointgot);
instance_create_depth(x + (sprite_width / 2), y + (sprite_width / 2), z, obj_checkpointgot);
scr_fmod_soundeffectONESHOT("event:/sfx/misc/checkpointgot", x + (sprite_width / 2), y);
scr_fmod_soundeffectONESHOT("event:/sfx/misc/checkpointbreak", x + (sprite_width / 2), y);

if (!in_saveroom())
    combo();

set_player_checkpoint();
