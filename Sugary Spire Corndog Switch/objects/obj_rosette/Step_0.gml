if (sign(x - obj_parent_player.x) != 0)
    image_xscale = -sign(x - obj_parent_player.x);

if (!instance_exists(obj_cutsceneManager))
{
    if (global.Donutfollow)
    {
        if (sprite_index != spr_rosettegavetreat)
            sprite_index = spr_rosettegavetreatIDLE;
    }
    else
    {
        sprite_index = spr_rosette;
    }
}

if (animation_end() && sprite_index == spr_rosettegavetreat)
    sprite_index = spr_rosettegavetreatIDLE;
