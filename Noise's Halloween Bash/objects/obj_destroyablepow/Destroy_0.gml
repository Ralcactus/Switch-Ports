event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));

repeat (5)
{
    var _wall = wall_behind(x + (sprite_width / 2), y + (sprite_height / 2), z);
    
    with (scr_createparticle(false, irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), z + 16, spr_cratedebris, image_xscale / 2, image_yscale / 2, irandom(4), 0, irandom(360), 0.5, irandom_range(-4, 4), irandom_range(-6, -2), irandom_range(-2, 2 * !_wall)))
        image_blend = #B03000;
}

with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z, obj_explosion))
    pow = true;

combo();
